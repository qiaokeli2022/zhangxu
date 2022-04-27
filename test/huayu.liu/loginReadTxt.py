#!/usr/bin/python
#_*_coding:UTF-8_*_
loginFilePath = "File/login.txt"
messageUserName = "userName : "
messagePassword = "password : "
inputUserName = raw_input(messageUserName)
inputPassword = raw_input(messagePassword)

loginFile = open(loginFilePath,"r")
content = loginFile.readlines()
flg = False
for readLineContent in content:
    if (readLineContent.split(",")[0] == inputUserName and readLineContent.split(",")[1] == inputPassword) :
        flg = True
loginFile.close()


if (flg) :
    print("ìoò^... ...")
else :
    print("é∏îsÅB")



