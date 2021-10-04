// a simple calculator using tkinter

from tkinter import * 
exp=""
def clear():
    global exp
    exp=""
    eq.set(exp)
def display(s):
    global exp
    exp=exp+s
    eq.set(exp)
def cal():
    try:
        global exp
        t=str(eval(exp))
        eq.set(t)
        exp=t
    except:
        eq.set('Error')
        exp=""
def back():
    global exp
    x=list(exp)
    x.remove(x[len(x)-1])
    exp=''.join(x)
    eq.set(exp)
    
root=Tk()
root.geometry('300x300')
root.title('Calculator')
eq=StringVar()
Entry(root,textvariable=eq).grid(columnspan=4,row=1)
Button(root,text="C",command=clear,activebackground='yellow',bg="red",width=5).grid(row=1,column=4)
Button(root,text='7',command=lambda:display('7'),activebackground='yellow',width=5).grid(row=2,column=0)
Button(root,text='8',command=lambda:display('8'),activebackground='yellow',width=5).grid(row=2,column=1)
Button(root,text='9',command=lambda:display('9'),activebackground='yellow',width=5).grid(row=2,column=2)
Button(root,text='+',command=lambda:display('+'),activebackground='yellow',width=5).grid(row=2,column=3)
Button(root,text='^',command=lambda:display('**'),activebackground='yellow',width=5).grid(row=2,column=4)

Button(root,text='6',command=lambda:display('6'),activebackground='yellow',width=5).grid(row=3,column=0)
Button(root,text='5',command=lambda:display('5'),activebackground='yellow',width=5).grid(row=3,column=1)
Button(root,text='4',command=lambda:display('4'),activebackground='yellow',width=5).grid(row=3,column=2)
Button(root,text='-',command=lambda:display('-'),activebackground='yellow',width=5).grid(row=3,column=3)
Button(root,text='(',command=lambda:display('('),activebackground='yellow',width=5).grid(row=3,column=4)

Button(root,text='3',command=lambda:display('3'),activebackground='yellow',width=5).grid(row=4,column=0)
Button(root,text='2',command=lambda:display('2'),activebackground='yellow',width=5).grid(row=4,column=1)
Button(root,text='1',command=lambda:display('1'),activebackground='yellow',width=5).grid(row=4,column=2)
Button(root,text='*',command=lambda:display('*'),activebackground='yellow',width=5).grid(row=4,column=3)
Button(root,text=')',command=lambda:display(')'),activebackground='yellow',width=5).grid(row=4,column=4)

Button(root,text='.',command=lambda:display('.'),activebackground='yellow',width=5).grid(row=5,column=0)
Button(root,text='0',command=lambda:display('0'),activebackground='yellow',width=5).grid(row=5,column=1)
Button(root,text='=',command=lambda:cal(),activebackground='yellow',width=5).grid(row=5,column=2)
Button(root,text='/',command=lambda:display('/'),activebackground='yellow',width=5).grid(row=5,column=3)
Button(root,text='X',command=lambda:back(),activebackground='yellow',width=5).grid(row=5,column=4)

root.mainloop()
