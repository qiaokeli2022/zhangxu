#!/usr/bin/python
#_*_coding:UTF-8_*_
num=[];
i=2
for i in range(2,100):
    j=2
    for j in range(2,i):
        if(i%j==0):
            break;
        else:
            num.append(i)
            break;
print(num)
