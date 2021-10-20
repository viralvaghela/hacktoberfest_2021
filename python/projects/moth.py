# month=int(input("Enter month in no."))
# days=0
# if (month==1 or month==3 or month==7 or month==5 or month==8 or month==10 or month==12):
#     days=31
# elif(month==2):
#     days=28
# else:
#     days = 30
#
# print(days)
#


mont= input("complex no.")
n=mont.split("+")
img=0
real=0
print(n)
for x in n:
    if("i" in x):
       img= x.split("i")
       img=int(img[0])
    else:
        if(int(x)>img):
            print("real part is bigger")
        else:
            print("imagenary part is bigger")