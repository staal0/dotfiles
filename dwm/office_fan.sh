#!/bin/bash
#mosquitto_pub -h IP -p 1883 -u USERNAME -P PASSWORD -t cmnd/sonoff0/POWER -m "TOGGLE"
curl -X POST http://HOMEASSISTANT:8123/api/webhook/office_fan
exit 0
