x=[3,1,2,4,3];
#for storing result 
aad={};
l=len(x)
for s in range(1,l-1):
    aad[s]=abs(sum(x[:s])-sum(x[s:l]))
# calculate min value from the dict.
drf=min(aad.values())
for s in aad:
    if(aad[s]==drf):
        print(str(x[s]) + " This is equilibrium point in the given list with diff. is " + str(aad[s]))
