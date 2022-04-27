#!/usr/bin/python
#_*_coding:UTF-8_*_
import json
with open("File/login.json", "r") as r:
    data = json.load(r)
print(type(data))
print(len(data))
i = 0
while i < len(data):
    print(data[i]["userName"])
    print(data[i]["password"])
    i += 1
