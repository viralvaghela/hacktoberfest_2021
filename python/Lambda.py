def myfunc(n):
    return lambda a: a * n


mydoubler = myfunc(2)

print(mydoubler(11))

x = lambda a: a + 10
print(x(5))
