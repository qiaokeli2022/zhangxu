#!/usr/bin/python
#_*_coding:UTF-8_*_
def makeArray(x):
    a = [[0 for i in range(x)] for i in range(x)]
    num = 0
    t = 0
    l = 0
    b = x-1
    r = x-1

    while (num < x*x):
        # top : left ====> right
        for i in range(r+1)[l:]:
            num += 1
            a[t][i] = num
        t += 1

        # right : top ====> bottom
        for i in range(b+1)[t:]:
            num += 1
            a[i][r] = num
        r -= 1
        
        # bottom : right ====> left
        for i in range(r,l-1,-1):
            num += 1
            a[b][i] = num
        b -= 1

        # left : bottom ====> top
        for i in range(b,t-1,-1):
            num += 1
            a[i][l] = num
        l += 1
    for row in a:
        print(row)


if __name__ == '__main__':
    makeArray(30)
