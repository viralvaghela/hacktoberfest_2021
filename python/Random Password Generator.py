import string
import random

def randompassword():
    chars = string.ascii_letters + string.digits
    size = 3
    return ''.join(random.choice(chars) for x in range(size,27))

n = 0
while n < 50:
    print(randompassword())
    n=n+1   
