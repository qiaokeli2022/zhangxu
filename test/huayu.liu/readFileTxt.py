#!/usr/bin/python
#_*_coding:UTF-8_*_
# �S��?��
print("#######�S�Ă̎捞��#######")
file0 = open("File/test.txt","r")
content1 = file0.read()
print(content1)

# ??����?��
file0.close()
# �Ǝ�?��?��
print("#######Byte�ɂ���āA�捞��#######")
file1 = open("File/test.txt","r")
content2 = file1.read(3)
print(content2)
# ��������?���I���e?��
content3 = file1.read()
print(content3)
# ??����?��
file1.close()
# �s?��
print("#######�S�Ă̎捞��(�s�ڂɂ����(readlines))#######")
file2 = open("File/test.txt","r")
content4 = file2.readlines()
print(content4)
i = 1 
for temp in content4:
    print(temp)
    i += 1
file2.close()
# �s?��
print("#######�S�Ă̎捞��(��̍s�ڂ̂݁i��readline�j)#######")
file3 = open("File/test.txt","r")
content5 = file3.readline()
print("1:%s" % content5)
content5 = file3.readline()
print("2:%s" % content5)
file3.close()
