#!/usr/bin/python

from uiautomator import Device
import sys

# get the target device
d = Device(sys.argv[1])

# check whether the resourceId exists
if d(resourceId=sys.argv[2]).exists:
	if sys.argv[3] == "false":
		compare = False
	else:
		compare = True
	if d(resourceId=sys.argv[2]).info.get("checked") ^ compare:
		d(resourceId=sys.argv[2]).click()







