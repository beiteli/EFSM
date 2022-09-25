#!/usr/bin/python

from uiautomator import Device
import sys
import random

# get the target device
d = Device(sys.argv[1])

inputs = ["test", "12", "", "-#!"] 
# inputs = ["-10000", "-100", "-12", "-1.2", "0", "1.2", "12", "100", "10000"]
inputs_num = ["0", "1.2", "1200", "", "-#!"]

# edit text
if d(description=sys.argv[2]).exists:
	element = d(description=sys.argv[2])
	try:
		float(element.text)
		element.set_text(inputs_num[random.randint(0, len(inputs_num)-1)])
	except ValueError:
		element.set_text(inputs[random.randint(0, len(inputs)-1)])









