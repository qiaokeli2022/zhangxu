#!/usr/bin/python
#_*_coding:UTF-8_*_
messageuser = "���[�U��:"
messagepsw = "�p�X���[�h:"
h1=raw_input(messageuser)
h2=raw_input(messagepsw)
filename = 'File/writeFile.txt'
# with open(filename,"w") as file_object:
    # file_object.write("first line .\n")
    # file_object.write("finally.")


with open(filename,"a") as file_object:
    file_object.write("���[�U��:" + h1 + "\n�p�X���[�h:" + h2 + "\n")
file_object.close()