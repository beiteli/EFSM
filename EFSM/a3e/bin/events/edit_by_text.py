#!/usr/bin/python

from uiautomator import Device
import sys
import random


# get the target device
d = Device(sys.argv[1])

inputs = ["test", "12"] 
inputs_num = ["0", "1.2", "12", "120", "1200"]

# edit text
if d(text=sys.argv[2]).exists:
	element = d(text=sys.argv[2])
	try:
		float(element.text)
		element.set_text(inputs_num[random.randint(0, 5)])
	except ValueError:
		element.set_text(inputs[random.randint(0, 1)])









