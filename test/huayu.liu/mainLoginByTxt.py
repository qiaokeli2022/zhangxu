#!/usr/bin/python
#_*_coding:UTF-8_*_
loginFilePath = "File/login.txt"
menuFilePath = "File/menu.txt"
messageUserName = "userName : "
messagePassword = "password : "
def login():
    print("***********Login************")
    inputUserName = raw_input(messageUserName)
    inputPassword = raw_input(messagePassword)

    loginFile = open(loginFilePath,"r")
    content = loginFile.readlines()
    flg = False
    for readLineContent in content:
        if (readLineContent.split(",")[0] == inputUserName and readLineContent.split(",")[1].replace("\n","") == inputPassword) :
            flg = True
    loginFile.close()
    if (flg) :
        print(messageEdit(2,"Login... ..."))
    else :
        print(messageEdit(1,"fail!"))

def insertUser():
    print("***********Add User************")
    inputUserName = raw_input(messageUserName)
    inputPassword = raw_input(messagePassword)
    if (inputUserName == "" or inputPassword == "") :
        print(messageEdit(1,"The userName and password must input."))
    elif ("," in inputUserName or "," in inputPassword) :
        print(messageEdit(1,"The userName and password cannot contain [,]."))
    else:
        loginFileCheck = open(loginFilePath,"r")
        loginContent = loginFileCheck.readlines()
        for content in loginContent :
            if (content.split(",")[0] == inputUserName and content.split(",")[1].replace("\n","") == inputPassword) :
                print(messageEdit(1,"The userName and password existed."))
                return
        with open(loginFilePath,"a") as file_object:
            file_object.write("\n" + inputUserName + "," + inputPassword)
            file_object.close()
            print(messageEdit(2,"success!"))
        loginFileCheck.close()

def messageEdit(code, message) :
    messageContent = ""
    if (code == 1) :
        messageContent = "[Error]:" + message
    elif (code == 2) :
        messageContent = "[Info]:" + message
    else :
        messageContent = message
    return messageContent

def main() :
    print("***********WELCOME************")
    menuFile = open(menuFilePath, "r")
    messageMenu = menuFile.read()
    messageMenuCd = input(messageMenu + "\n")
    menuFile.close()
    if (messageMenuCd == 1) :
        login()
    elif (messageMenuCd == 2) :
        insertUser()
    elif (messageMenuCd == 0):
        print(messageEdit(2,"Bye Bye!"))
        return
    else :
        print(messageEdit(1,"Error, please re-enter!"))
    main()

if __name__ == '__main__':
    main()