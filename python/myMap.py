def my_map(func,arg_list):
    result=[]
   
    for i in arg_list:
        print(i)
        result.append(func(i))
        print(result)
        print(func(i))
    return result
     
def square(x):
    return x*x
def cube(x):
    return x*x*x
    
squares=my_map(cube,[1,2,3,4,5])

print(squares)
