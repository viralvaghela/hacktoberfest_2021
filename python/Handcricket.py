import random

def bat():
    n= True
    count = 0
    print("*************************************************")                                                         
    print("Welcome to Batting")
    while(n):
        value = random.randint(1,6)
        number = int(input("Enter the number From 1 to 6:"))
        print("!!!!!!!!!!Computer throws!!!!!!!!!!  :", value)
        if number == value:
            print("You're Out")
            print("!!!!!!!!Your total score is!!!!!!!!! :",count)
            print("************************************")
            return count
            n=False
            
        else:
            count =count+number
            print("YOU'RE SCORE IS ",count)
            print("Ready for Next Shot")
            print("-----------------------------------------------------------------------------------------")
            
def bowl():
    n=True
    count=0
    print("*******************************************")
    print("Welcome to Bowling")
    while(n):
        value= random.randint(1,6)
        number=int(input("Enter the number From 1 to 6:"))
        print("!!!!!Computer throws!!!!!!  :",value)
        if number == value:
            print("Computer is out")
            print("!!!!!!!!Computer total score is!!!!!!!  :",count)
            print("***************************************")
            n=False
            return count
        
        else:
            count = count + value
            print("COMPUTER SCORE IS",count)
            print("Ready for next throw")
            print("----------------------------------------------------------------------------------------------")


print("\n\n**************Welcome to HandCricket Desktop**************")
print("\n\n\nPress 7 to start")
ans=int(input())
if ans == 7:
    print("***Play with computer and computer is kumaran*****")
    print("1.Odd\n 2.Even\n")
    choice=int(input("Enter your choice in number : "))
    toss=int(input("Enter the number for toss from 1 to 6:"))
    valuec = random.randint(1,6)
    print("!!!!!!Computer tossed!!!!!!!  :",valuec)
    if (valuec+toss)% 2 == 0 and choice== 2:
        print("You won the toss")
        print("Enter your choice")
        print("1.Batting\n2.Bowling\n")
        chance=int(input())
        if chance == 1:
           playerscore=bat()
           computerscore=bowl()
           if playerscore>computerscore:
               print("*******You won the game********")
           else:
               print("********Computer won the game***********")
           
            
        else:
             computerscore1=bowl()
             playerscore1=bat()
             if playerscore1>computerscore1:
                 print("*******You won the game********")
             else:
                 print("********Computer won the game***********")
             
    else:
        print("Computer won the toss and choosed to bowl first")
        playerscore2=bat()
        computerscore2=bowl()
        if playerscore2>computerscore2:
            print("*******You won the game********")
        else:
            print("********Computer won the game***********")
else:
    print("You're not ready! BYE!")
    
        
