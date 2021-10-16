l1=[int(i) for i in input().split()]
s1=set(l1)
count=0
num=0
for i in s1:
    if l1.count(i)>count:
        count=l1.count(i)
        num=i
print(num)