#!/usr/bin/python
#_*_coding:UTF-8_*_
# 全部?取
print("#######全ての取込む#######")
file0 = open("File/test.txt","r")
content1 = file0.read()
print(content1)

# ??文件?取
file0.close()
# 按照字?数?取
print("#######Byteによって、取込む#######")
file1 = open("File/test.txt","r")
content2 = file1.read(3)
print(content2)
# 剩下直到?尾的内容?取
content3 = file1.read()
print(content3)
# ??文件?取
file1.close()
# 按行?取
print("#######全ての取込む(行目によって(readlines))#######")
file2 = open("File/test.txt","r")
content4 = file2.readlines()
print(content4)
i = 1 
for temp in content4:
    print(temp)
    i += 1
file2.close()
# 按行?取
print("#######全ての取込む(一つの行目のみ（毎readline）)#######")
file3 = open("File/test.txt","r")
content5 = file3.readline()
print("1:%s" % content5)
content5 = file3.readline()
print("2:%s" % content5)
file3.close()
