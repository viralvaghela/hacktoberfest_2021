a=[]
total_data=0
print("Enter the bucket size: ")
bs=input()

print("Enter no of packets: ")
np=input()

i=0
for i in range(int(np)):
    if (i<int(bs)):
        a.append(int(input()))
        total_data=total_data+a[i];

    else:
        print("Bucket is full. Further packets will overflow")

print("Enter bits of data that will be leaked::")

dl=int(input())
new_dl=dl;
total_data_trans=0;
j=0
for j in range(int(bs)):

    if(new_dl>a[j]):
        print("Data leaked = ",a[j])
        print("Remaining Data release capacity of the bucket =",new_dl,"-",a[j],"=",(new_dl-a[j]))
        new_dl=new_dl-a[j];
        total_data_trans=total_data_trans+a[j];

print("Total data that is leaked from the bucket in this unit of time/cycle is ",total_data_trans)
print("Total data that is remaining to leaked from the bucket in next unit of time/cycle is ",(total_data-total_data_trans))
