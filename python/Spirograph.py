import turtle
circle = turtle.Turtle()
circle.pensize(2)
circle.speed(0)

for i in range(5):
    for colors in ['red','green','blue','black','pink','yellow','white']:
        circle.color(colors)
        circle.circle(100)
        circle.right(10)
turtle.done()
