import turtle
pen = turtle.Turtle()
pen.pensize(2)
pen.speed(0)
for i in range(40):
    for colors in ['red','green','blue','magenta','cyan','yellow','white']:
        pen.color(colors)
        pen.forward(i*18)
        pen.right(144)
turtle.done()
