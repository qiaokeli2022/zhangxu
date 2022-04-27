#!/usr/bin/python
#_*_coding:UTF-8_*_
import json
fileName = "File/login.json"
dics = {"userName": "lhy", "password": "123"}
print(json.dumps(dics))

# with open(fileName, "r") as f:
#     content = json.load(f)
#     print(content)
    
#     print(content)


with open(fileName, "a") as r:
        r.write(json.dumps(dics))
        print("success")
