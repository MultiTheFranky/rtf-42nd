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

	"github.com/kkdai/youtube/v2"
)

var extensionCallbackFnc C.extensionCallback

func runExtensionCallback(name *C.char, function *C.char, data *C.char) C.int {
	return C.runExtensionCallback(extensionCallbackFnc, name, function, data)
}

//export goRVExtensionVersion
func goRVExtensionVersion(output *C.char, outputsize C.size_t) {
	result := C.CString("RTF42 - PlayMusic - Version 1.0")
	defer C.free(unsafe.Pointer(result))
	var size = C.strlen(result) + 1
	if size > outputsize {
		size = outputsize
	}
	C.memmove(unsafe.Pointer(output), unsafe.Pointer(result), size)
}

//export goRVExtensionArgs
func goRVExtensionArgs(output *C.char, outputsize C.size_t, input *C.char, argv **C.char, argc C.int) {
	defer func() {
		if err := recover(); err != nil {
			returnString(output, outputsize, fmt.Sprintf("ERROR: %s", err))
			return
		}
	}()
	function := C.GoString(input)
	params := make([]string, argc)
	for i := 0; i < int(argc); i++ {
		params[i] = C.GoString(*argv)
		argv = (**C.char)(unsafe.Pointer(uintptr(unsafe.Pointer(argv)) + unsafe.Sizeof(uintptr(0))))
	}
	switch function {
	case "play": // start <file> <volume> (optional) <loop> (optional)
		var volume int
		var loop bool
		switch len(params) {
		case 1: // start <file>
			volume = 0
			loop = false
		case 2: // start <file> <volume>
			var err error
			volume, err = strconv.Atoi(params[1])
			if err != nil {
				returnString(output, outputsize, fmt.Sprintf("ERROR: Invalid volume %s", params[1]))
				return
			}
			loop = false
		case 3: // start <file> <volume> <loop>
			var err error
			volume, err = strconv.Atoi(params[1])
			if err != nil {
				returnString(output, outputsize, fmt.Sprintf("ERROR: Invalid volume %s", params[1]))
				return
			}
			loop, err = strconv.ParseBool(params[2])
			if err != nil {
				returnString(output, outputsize, fmt.Sprintf("ERROR: Invalid loop %s", params[2]))
				return
			}
		default:
			returnString(output, outputsize, fmt.Sprintf("ERROR: Invalid number of parameters %d", len(params)))
			return
		}

		// If the file is a youtube link, download it
		if strings.Contains(params[0], "youtube.com") || strings.Contains(params[0], "youtu.be") {
			go downloadMusicAndPlay(parseStringParam(params[0]), volume, loop)
			returnString(output, outputsize, fmt.Sprintf("INFO: Downloading and playing music file %s", params[0]))
			return
		}

		pwd, err := os.Getwd()

		if err != nil {
			returnString(output, outputsize, fmt.Sprintf("ERROR: %s", err))
			return
		}

		file := pwd + "\\z\\rtf42\\" + parseStringParam(params[0])

		// Check if file exists
		if _, err := os.Stat(file); os.IsNotExist(err) {
			file = pwd + "\\!Workshop\\@rtf42\\" + parseStringParam(params[0])
			if _, err := os.Stat(file); os.IsNotExist(err) {
				returnString(output, outputsize, fmt.Sprintf("ERROR: File %s does not exist on the base path of the @rtf42 mod and is not a youtube link", params[0]))
				return
			}
		}

		go playMusic(file, volume, loop)
		if err != nil {
			returnString(output, outputsize, fmt.Sprintf("ERROR: %s", err))
			return
		}
		returnString(output, outputsize, fmt.Sprintf("INFO: Play music file %s", params[0]))
	case "stop": // stop
		if len(params) != 0 {
			returnString(output, outputsize, fmt.Sprintf("ERROR: Invalid number of parameters %d", len(params)))
			return
		}
		err := stopMusic(0)
		if err != nil {
			returnString(output, outputsize, fmt.Sprintf("ERROR: %s", err))
			return
		}
		returnString(output, outputsize, fmt.Sprintf("INFO: Stop music"))
	default:
		returnString(output, outputsize, fmt.Sprintf("ERROR: Invalid function %s", function))
	}
}

//export goRVExtension
func goRVExtension(output *C.char, outputsize C.size_t, input *C.char) {
	// Not used
	returnString(output, outputsize, "WARNING: This method is unavailable. Please use CallExtensionArgs. More info: https://community.bistudio.com/wiki/callExtension")
}

//export goRVExtensionRegisterCallback
func goRVExtensionRegisterCallback(fnc C.extensionCallback) {
	extensionCallbackFnc = fnc
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
	file := temp + "\\" + video.Title + ".m4a"
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
	fileTempConverted := temp + "\\" + video.Title + ".mp3"
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

		convertM4AToMP3(file, fileTempConverted, filePathFFMPEG)
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
		return fmt.Errorf("Unsupported file format")
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
