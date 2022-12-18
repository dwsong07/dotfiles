#!/bin/bash

# Closebox73
# This script is to get weather data from openweathermap.com in the form of a json file
# so that conky will still display the weather when offline even though it doesn't up to date

source ~/.config/env

url="api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${OPENWEATHERMAP_KEY}&cnt=5&units=metric&lang=en"
curl ${url} -s -o ~/.cache/weather.json
