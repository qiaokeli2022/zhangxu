#!/usr/bin/python
#_*_coding:UTF-8_*_
loginFilePath = "File/login.txt"
print("Add User")
messageUserName = "userName : "
messagePassword = "password : "
inputUserName = raw_input(messageUserName)
inputPassword = raw_input(messagePassword)
if ("," in inputUserName or "," in inputPassword) :
    print("The userName or password cannot contain [,].")
else:
    with open(loginFilePath,"a") as file_object:
        file_object.write("\n" + inputUserName + "," + inputPassword)
    file_object.close()
    print("success!")