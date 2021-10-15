#This module is free to use as-is, and may also be imported freely into other projects
#Comments are provided for those who are new to Python and modular program design

import random

#The dice() function prompts the user for the number of dice and number of faces, then generates and displays the results
def dice():
    print("Select the number of dice and number of faces")
    nodie = int(input("How many dice do you wish to roll?"))
    nofaces = int(input("How many faces should the dice have?"))
    for x in range(nodie):
        die = random.randint(1,nofaces)
        print(f"Roll {x + 1}: {die}")

#This if/else block checks to see if the script is running directly or if it has been imported into another program
#If it is running directly, the internal variable __name__ will be set to __main__
#If it is imported, the __name__ variable will be set to dice_roller
#When __name__ is set to __main__ it runs without any other notice
#When imported, the function still runs but also prints a statement at the point that it runs
#This functionality prevents the script from running immediately upon import
#It also allows you to create scripts that function differently when run directly or when imported to make them more modular
if __name__ == '__main__':
    dice()
else:
    print("Basic Dice Roller module")
    dice()