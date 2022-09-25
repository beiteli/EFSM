#!/usr/bin/python

from uiautomator import Device
import sys
import random

# get the target device
d = Device(sys.argv[1])

# edit text
if d(resourceId=sys.argv[2]).exists:
	element = d(resourceId=sys.argv[2])
	try:
		element.set_text(sys.argv[3])
	except Exception:
		pass









