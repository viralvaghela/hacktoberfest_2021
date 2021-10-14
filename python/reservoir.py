import random

def printTheArray(stream,n):
    for i in range(n):
        print(stream[i],end=" ");
    print();

def selectItemsK(stream, n, k):
    i=0;

    reservoir = [0]*k;
    for i in range(k):
        reservoir[i] = stream[i];

    while(i < n):
        j = random.randrange(i+1);
        if(j < k):
            reservoir[j] = stream[i];
            i+=1;
    
    print("Random K selected items");
    printTheArray(reservoir, k);

#driver
if __name__ == "__main__":
     stream = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
     n = len(stream);
     k = 5; 
     selectItemsK(stream, n, k);