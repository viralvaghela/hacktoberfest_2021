from tkinter import *
window=Tk()
window.title("Todo List")

content=Listbox(window,font="Arial 20 bold")
task=StringVar()
e=Entry(window,textvariable=task,font="Arial 20")
add=Button(window,text="Add",padx=15,pady=5,command= lambda content=content,task=task:content.insert(END,task.get()))
dele=Button(window,text="Delete",padx=15,pady=5,command= lambda content=content:content.delete(ANCHOR))
content.grid(row=0,column=0,columnspan=2,padx=5,pady=10)
e.grid(row=1,column=0,columnspan=2,padx=10,pady=10)
add.grid(row=2,column=0,padx=5,pady=5)
dele.grid(row=2,column=1,padx=5,pady=5)

window.mainloop()