'''this is a programe that generates a random password using alphabets, symbols and numbers. 
it take input from user for the number of alphabets,symbol and numbers the user wants in the password 
and genterate the password accordingly  '''
import random
# List of all the letters and numbers and symbols
letters = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D',
    'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
    'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
]
numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
symbols = ['!', '#', '$', '%', '&', '(', ')', '*', '+']

print("Welcome to the PyPassword Generator!")
# taking input
nr_letters = int(input("How many letters would you like in your password?\n"))
nr_symbols = int(input(f"How many symbols would you like?\n"))
nr_numbers = int(input(f"How many numbers would you like?\n"))

# Declaring all the lists to be used 
list_letter=list()
list_symbol=list()
list_number=list()
passward=list()

# for picking random letter from letters list
for letter in range(0,nr_letters) :
    random_letter = letters[random.randint(0, len(letters)-1)]
    list_letter.append(random_letter)
# for picking random symbols from Syambols list
for symbol in range(0,nr_symbols):
  random_symbol=symbols[random.randint(0,len(symbols)-1)]
  list_symbol.append(random_symbol)
# for picking random numbers from numbers list
for number in range(0,nr_numbers):
  random_number=numbers[random.randint(0,len(numbers)-1)]
  list_number.append(random_number)

#   combining all the lists 
passward=list_letter+list_symbol+list_number
# shuffling the passward list 
random.shuffle(passward)
# declaring string
str1=str()
# joining the list into a string
str1=str1.join(passward)
print(str1)