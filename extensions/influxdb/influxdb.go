package main

/*
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
*/
import "C"

import (
	"fmt"
	"path/filepath"
	"strconv"
	"strings"
	"time"

	"github.com/MultiTheFranky/rtf-42nd/extensions/internal/logger"
	"github.com/indig0fox/a3go/a3interface"
	"github.com/indig0fox/a3go/assemblyfinder"
	influxdb2 "github.com/influxdata/influxdb-client-go/v2"
	"github.com/influxdata/influxdb-client-go/v2/api"
)

var ADDON_NAME = "RTF42"
var EXTENSION_NAME = "influxdb"

var (
	EXTENSION_VERSION string = "1.0"

	modulePath    string
	modulePathDir string
)

func init() {
	a3interface.SetVersion(EXTENSION_VERSION)

	a3interface.NewRegistration("start").SetRunInBackground(true).SetArgsFunction(onStart).Register()
	a3interface.NewRegistration("data").SetRunInBackground(true).SetArgsFunction(onData).Register()

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

var writeAPI api.WriteAPI

type Data struct {
	key         string
	description string
	value       float64
}

func onStart(ctx a3interface.ArmaExtensionContext,
	command string,
	args []string) (string, error) {
	logger.Log.Debug().Msg("onStart")
	if len(args) != 4 {
		return fmt.Sprintf("ERROR: Invalid number of parameters for start. Expected 4 <endpoint> <token> <org> <bucket>, got %d", len(args)), nil
	}
	client := influxdb2.NewClient(a3interface.RemoveEscapeQuotes(args[0]), a3interface.RemoveEscapeQuotes(args[1]))
	writeAPI = client.WriteAPI(a3interface.RemoveEscapeQuotes(args[2]), a3interface.RemoveEscapeQuotes(args[3]))
	return fmt.Sprintf("INFO: Created connection to InfluxDB on %s", args[0]), nil
}

func onData(ctx a3interface.ArmaExtensionContext,
	command string,
	args []string) (string, error) {
	logger.Log.Debug().Msg("onData")
	// Check if the writeAPI is initialized
	if writeAPI == nil {
		return "ERROR: InfluxDB is not initialized. Please call start first", nil
	}
	data, err := parseData(args)
	if err != nil {
		return fmt.Sprintf("ERROR: %s", err), nil
	}
	// Loop through data and create points
	for _, d := range data {
		// Write point
		writeAPI.WritePoint(
			influxdb2.NewPoint(d.key, nil, map[string]interface{}{"value": d.value, "description": d.description}, time.Now()),
		)
	}
	return fmt.Sprintf("INFO: Added data %s", strings.Join(args, ", ")), nil
}

func parseData(params []string) (data []Data, err error) {
	// Every parameter is a string splited by :
	data = make([]Data, len(params))
	for i, param := range params {
		// Split the string by :
		splited := strings.Split(param, ":")
		if len(splited) != 3 {
			return data, fmt.Errorf("invalid number of parameters for data. Expected 3 <key> <description> <value>, got %d", len(splited))
		}
		data[i].key = a3interface.RemoveEscapeQuotes(splited[0])
		data[i].description = a3interface.RemoveEscapeQuotes(splited[1])
		data[i].value, err = strconv.ParseFloat(a3interface.RemoveEscapeQuotes(splited[2]), 64)
		if err != nil {
			return data, fmt.Errorf("invalid value for data. Expected float64, got %s", splited[2])
		}
	}
	return data, nil
}

func main() {}
