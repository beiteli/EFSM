#!/usr/bin/python

from uiautomator import Device
import sys


# get the target device
d = Device(sys.argv[1])

# click  
if d(className=sys.argv[2]).count > int(sys.argv[3]):
	if sys.argv[4] == "false":
		compare = False
	else:
		compare = True
	if d(className=sys.argv[2],instance=int(sys.argv[3])).info.get("checked") ^ compare:
		d(className=sys.argv[2],instance=int(sys.argv[3])).click()
		print "end"
