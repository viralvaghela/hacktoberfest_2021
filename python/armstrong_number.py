def check_armstrong(n):
    # Coverts the passed number into an array of integers
    num_arr = [int(num) for num in list(str(n))]

    # Gets the length of array to calculate the power of each individual number in the array
    length = len(num_arr)

    # Using the list comprehension and sum function we
    # do a simple mathematical operation of raising each 
    # of its digits to the power of length obtained in previous 
    # line, and then totalling the sum .
    sum_raised_to_power = sum([num**length for num in num_arr])

    # Returning the result, wheteher its an armstrong number or not.
    return print("Its an Armstrong number" if sum_raised_to_power == n else "Not an Armstrong number")

num = int(input("Enter a number to check: "))
check_armstrong(num)