import turtle
flag = turtle.Turtle()
flag.speed(3)
flag.pensize(5)
def draw(x,y):
    flag.penup()
    flag.goto(x,y)
    flag.pendown()


#Ashoka chakra
flag.color('#054187')
for i in range(24):
    flag.forward(50)
    flag.backward(50)
    flag.left(15)
draw(0,-50)
flag.circle(50,360)    

#Green Rectangle
flag.color('green')
flag.begin_fill()

flag.forward(250)
flag.backward(500)
flag.right(90)
flag.forward(150)
flag.left(90)
flag.forward(500)
flag.left(90)
flag.forward(150)
flag.left(90)

flag.end_fill()


#Orange Rectangle
flag.color('orange')
draw(-250,50)

flag.begin_fill()

flag.right(180)
flag.forward(500)
flag.left(90)
flag.forward(150)
flag.left(90)
flag.forward(500)
flag.left(90)
flag.forward(150)

flag.end_fill()
turtle.done()
