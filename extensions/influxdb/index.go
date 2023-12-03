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
	"strconv"
	"strings"
	"time"
	"unsafe"

	influxdb2 "github.com/influxdata/influxdb-client-go/v2"
	"github.com/influxdata/influxdb-client-go/v2/api"
)

var extensionCallbackFnc C.extensionCallback

func runExtensionCallback(name *C.char, function *C.char, data *C.char) C.int {
	return C.runExtensionCallback(extensionCallbackFnc, name, function, data)
}

//export goRVExtensionVersion
func goRVExtensionVersion(output *C.char, outputsize C.size_t) {
	result := C.CString("RTF42 - InfluxDB - Version 1.0")
	defer C.free(unsafe.Pointer(result))
	var size = C.strlen(result) + 1
	if size > outputsize {
		size = outputsize
	}
	C.memmove(unsafe.Pointer(output), unsafe.Pointer(result), size)
}

// Save writeAPI as global variables to be used in goRVExtensionArgs data function
var writeAPI api.WriteAPI

type Data struct{
	key string
	description string
	value float64
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
	case "start": // start <endpoint> <token> <org> <bucket>
		if len(params) != 4 {
			returnString(output, outputsize, fmt.Sprintf("ERROR: Invalid number of parameters for start. Expected 4 <endpoint> <token> <org> <bucket>, got %d", len(params)))
			return
		}
		client := influxdb2.NewClient(parseStringParam(params[0]), parseStringParam(params[1]))
		writeAPI = client.WriteAPI(parseStringParam(params[2]), parseStringParam(params[3]))
		returnString(output, outputsize, fmt.Sprintf("INFO: Created connection to InfluxDB on %s", params[0]))
	case "data": // data <key> <value>
		// Check if the writeAPI is initialized
		if writeAPI == nil {
			returnString(output, outputsize, fmt.Sprintf("ERROR: InfluxDB is not initialized. Please call start first"))
			return
		}
		data, err := parseData(params)
		if err != nil {
			returnString(output, outputsize, fmt.Sprintf("ERROR: %s", err))
			return
		}
		// Loop through data and create points
		for _, d := range data {
			// Write point
			writeAPI.WritePoint(
				influxdb2.NewPoint(d.key, nil, map[string]interface{}{"value": d.value, "description": d.description}, time.Now()),
			)
		}
		returnString(output, outputsize, fmt.Sprintf("INFO: Added data %s", parseStringParam(strings.Join(params, ", "))))
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

func returnString(output *C.char, outputsize C.size_t, result string) {
	temp := C.CString(result)
	defer C.free(unsafe.Pointer(temp))
	var size = C.strlen(temp) + 1
	if size > outputsize {
		size = outputsize
	}
	C.memmove(unsafe.Pointer(output), unsafe.Pointer(temp), size)
}

//function to parse string parameters to remove all quotes
func parseStringParam(param string) string {
	return strings.ReplaceAll(param, "\"", "")
}

func parseData(params []string) (data []Data, err error) {
	// Every parameter is a string splited by :
	data = make([]Data, len(params))
	for i, param := range params {
		// Split the string by :
		splited := strings.Split(param, ":")
		if len(splited) != 3 {
			return data, fmt.Errorf("Invalid number of parameters for data. Expected 3 <key> <description> <value>, got %d", len(splited))
		}
		data[i].key = parseStringParam(splited[0])
		data[i].description = parseStringParam(splited[1])
		data[i].value, err = strconv.ParseFloat(parseStringParam(splited[2]), 64)
		if err != nil {
			return data, fmt.Errorf("Invalid value for data. Expected float64, got %s", splited[2])
		}
	}
	return data, nil
}

func main() {}