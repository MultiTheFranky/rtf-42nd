package main

/*
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "extensionCallback.h"
*/
import "C"

import (
	"fmt"
	"io"
	"os"
	"path"
	"path/filepath"
	"strconv"
	"strings"
	"time"
	"unsafe"

	"github.com/gopxl/beep"
	"github.com/gopxl/beep/effects"
	"github.com/gopxl/beep/flac"
	"github.com/gopxl/beep/mp3"
	"github.com/gopxl/beep/speaker"
	"github.com/gopxl/beep/vorbis"
	"github.com/gopxl/beep/wav"
	"github.com/indig0fox/a3go/a3interface"
	"github.com/indig0fox/a3go/assemblyfinder"
	"rtf42-extensions.go/internal/logger"

	"github.com/kkdai/youtube/v2"
)

var ADDON_NAME = "RTF42"
var EXTENSION_NAME = "playmusic"

var (
	EXTENSION_VERSION string = "1.0"

	modulePath    string
	modulePathDir string
)

func init() {
	a3interface.SetVersion(EXTENSION_VERSION)

	a3interface.NewRegistration("play").SetRunInBackground(true).SetArgsFunction(onPlay).Register()
	a3interface.NewRegistration("stop").SetRunInBackground(true).SetArgsFunction(onStop).Register()

	go func() {
		modulePath = assemblyfinder.GetModulePath()
		modulePathDir = filepath.Dir(modulePath)

		logger.InitLoggers(&logger.LoggerOptionsType{
			Path: filepath.Join(
				modulePathDir,
				fmt.Sprintf(
					"%s_v%s.log",
					EXTENSION_NAME,
					EXTENSION_VERSION,
				)),
			AddonName:        ADDON_NAME,
			ExtensionName:    EXTENSION_NAME,
			ExtensionVersion: EXTENSION_VERSION,
			Debug:            true,
			Trace:            true,
		})
		logger.RotateLogs()
		logger.Log.Info().Msgf(`%s v%s started`, EXTENSION_NAME, EXTENSION_VERSION)
		logger.ArmaOnly.Info().Msgf(`Log path: %s`, logger.ActiveOptions.Path)
	}()
}

func onPlay(ctx a3interface.ArmaExtensionContext,
	command string,
	args []string) (string, error) {
	var volume int
	var loop bool
	switch len(args) {
	case 1: // start <file>
		volume = 0
		loop = false
	case 2: // start <file> <volume>
		var err error
		volume, err = strconv.Atoi(args[1])
		if err != nil {
			return fmt.Sprintf("ERROR: Invalid volume %s", args[1]), nil
		}
		loop = false
	case 3: // start <file> <volume> <loop>
		var err error
		volume, err = strconv.Atoi(args[1])
		if err != nil {
			return fmt.Sprintf("ERROR: Invalid volume %s", args[1]), nil
		}
		loop, err = strconv.ParseBool(args[2])
		if err != nil {
			return fmt.Sprintf("ERROR: Invalid loop %s", args[2]), nil
		}
	default:
		return fmt.Sprintf("ERROR: Invalid number of parameters %d", len(args)), nil
	}

	// If the file is a youtube link, download it
	if strings.Contains(args[0], "youtube.com") || strings.Contains(args[0], "youtu.be") {
		go downloadMusicAndPlay(parseStringParam(args[0]), volume, loop)
		return fmt.Sprintf("INFO: Downloading and playing music file %s", args[0]), nil
	}

	file := path.Join(modulePathDir, parseStringParam(args[0]))
	if _, err := os.Stat(file); os.IsNotExist(err) {
		return fmt.Sprintf("ERROR: File %s does not exist on the base path of the @rtf42 mod and is not a youtube link | Path: %s", args[0], file), nil
	}

	go playMusic(file, volume, loop)
	return fmt.Sprintf("INFO: Play music file %s", args[0]), nil
}

func onStop(ctx a3interface.ArmaExtensionContext,
	command string,
	args []string) (string, error) {
	if len(args) != 0 {
		return fmt.Sprintf("ERROR: Invalid number of parameters %d", len(args)), nil
	}
	err := stopMusic(0)
	if err != nil {
		return fmt.Sprintf("ERROR: %s", err), nil
	}
	return "INFO: Stop music", nil
}

func downloadMusicAndPlay(url string, volume int, loop bool) error {

	client := youtube.Client{}

	videoID, err := youtube.ExtractVideoID(url)
	if err != nil {
		return err
	}
	video, err := client.GetVideo(videoID)
	if err != nil {
		return err
	}

	formats := video.Formats.WithAudioChannels().FindByItag(140)
	stream, _, err := client.GetStream(video, formats)
	if err != nil {
		return err
	}
	defer stream.Close()

	// Check if the file already exists
	temp := os.TempDir()
	file := path.Join(temp, video.Title) + ".m4a"
	if _, err := os.Stat(file); os.IsNotExist(err) {

		// Create the file
		out, err := os.Create(file)
		if err != nil {
			return err
		}
		defer out.Close()

		// Write the body to file
		_, err = io.Copy(out, stream)
		if err != nil {
			return err
		}
	}

	// Check if the file is already converted
	fileTempConverted := path.Join(temp, video.Title) + ".mp3"
	if _, err := os.Stat(fileTempConverted); os.IsNotExist(err) {
		// Convert the file
		// Define ffmpeg executable path
		pwd, err := os.Getwd()

		if err != nil {
			return err
		}

		filePathFFMPEG := ""
		// Check os system
		if strings.Contains(strings.ToLower(os.Getenv("OS")), "windows") {
			filePathFFMPEG = pwd + path.Join("z", "rtf42", "ffmpeg.exe")
		} else {
			filePathFFMPEG = pwd + path.Join("z", "rtf42", "ffmpeg")
		}

		// Check if ffmpeg exists
		if _, err := os.Stat(filePathFFMPEG); os.IsNotExist(err) {
			return fmt.Errorf("ffmpeg executable not found")
		}

		err = convertM4AToMP3(file, fileTempConverted, filePathFFMPEG)
		if err != nil {
			return err
		}
	}

	// Play the mp3 file
	go playMusic(fileTempConverted, volume, loop)

	return nil
}

var ctrl *beep.Ctrl

func playMusic(file string, volume int, loop bool) error {
	f, err := os.Open(file)
	if err != nil {
		return err
	}

	var streamer beep.StreamSeekCloser
	var format beep.Format
	switch (strings.ToLower(file))[len(file)-3:] {
	case "mp3":
		var err error
		streamer, format, err = mp3.Decode(f)
		if err != nil {
			return err
		}
		defer streamer.Close()
	case "ogg":
		var err error
		streamer, format, err = vorbis.Decode(f)
		if err != nil {
			return err
		}
		defer streamer.Close()
	case "wav":
		var err error
		streamer, format, err = wav.Decode(f)
		if err != nil {
			return err
		}
		defer streamer.Close()
	case "flac":
		var err error
		streamer, format, err = flac.Decode(f)
		if err != nil {
			return err
		}
		defer streamer.Close()
	default:
		return fmt.Errorf("unsupported file format")
	}

	speaker.Init(format.SampleRate, format.SampleRate.N(time.Second/10))

	const base = 2

	if loop {
		ctrl = &beep.Ctrl{Streamer: beep.Loop(-1, streamer), Paused: false}
		volume := &effects.Volume{
			Streamer: ctrl,
			Base:     float64(base),
			Volume:   float64(volume),
			Silent:   false,
		}
		done := make(chan bool)
		speaker.Play(beep.Seq(volume, beep.Callback(func() {
			done <- true
		})))
		<-done
	} else {
		ctrl = &beep.Ctrl{Streamer: streamer, Paused: false}
		volume := &effects.Volume{
			Streamer: ctrl,
			Base:     float64(base),
			Volume:   float64(volume),
			Silent:   false,
		}
		done := make(chan bool)
		speaker.Play(beep.Seq(volume, beep.Callback(func() {
			done <- true
		})))
		<-done
	}

	return nil
}

func stopMusic(fadeout int) error {
	ctrl.Paused = true
	return nil
}

func parseStringParam(param string) string {
	return strings.ReplaceAll(param, "\"", "")
}

func returnString(output *C.char, outputsize C.size_t, result string) {
	temp := C.CString(result)
	defer C.free(unsafe.Pointer(temp))
	var size = C.strlen(temp) + 1
	if size > outputsize {
		size = outputsize
	}
	C.memmove(unsafe.Pointer(output), unsafe.Pointer(temp), size)
}

func main() {}
