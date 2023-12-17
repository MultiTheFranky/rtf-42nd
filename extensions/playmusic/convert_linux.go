package main

import (
	"os"
	"syscall"
	"time"

	ffmpeg "github.com/u2takey/ffmpeg-go"
)

func convertM4AToMP3(in string, out string, ffmpegPath string) error {
	streamVar := ffmpeg.Input(in).Output(out, ffmpeg.KwArgs{
		"c:v": "copy",
		"c:a": "libmp3lame",
		"q:a": 4,
	}).SetFfmpegPath(ffmpegPath).OverWriteOutput()
	cmd := streamVar.Compile()
	cmd.SysProcAttr = &syscall.SysProcAttr{HideWindow: true}
	err := cmd.Run()

	if err != nil {
		return err
	}

	// Wait until the file is converted
	fileSize := 0
	for {
		// Check if the file size is the same as the last loop
		fileInfo, err := os.Stat(out)
		if err != nil {
			return err
		}
		if fileInfo.Size() > int64(fileSize) {
			fileSize = int(fileInfo.Size())
		} else {
			break
		}
		time.Sleep(1 * time.Second)
	}

	return nil
}
