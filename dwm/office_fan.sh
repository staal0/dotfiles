#!/bin/bash
mosquitto_pub -h IP -p 1883 -u USERNAME -P PASSWORD -t cmnd/sonoff0/POWER -m "TOGGLE"
