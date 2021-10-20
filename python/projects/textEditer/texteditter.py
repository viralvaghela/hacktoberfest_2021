from tkinter import *
from tkinter import filedialog


def saveFile():
    f = filedialog.asksaveasfile(mode="w", defaultextension=".txt")
    if f is None:
        return
    try:
        textUserWrote = str(content.get(1.0, END))
        f.write(textUserWrote)
    except:
        print("Cannot save the file")
    finally:
        f.close()


def openFile():
    try:
        t = filedialog.askopenfile(mode="r", title="Select File",
                                   filetypes=[("All Files", "*.*")])
        content.insert(END, t.read())
    except:
        print("Cannot load the file")
    finally:
        if t:
            t.close()


def closeWindow():
    window.destroy()


window = Tk()

mainMenu = Menu(window)
window.config(menu=mainMenu)

fileMenu = Menu(mainMenu)
mainMenu.add_cascade(label="File", menu=fileMenu)
fileMenu.add_command(label="Open", command=openFile)
fileMenu.add_command(label="Save", command=saveFile)
fileMenu.add_separator()
fileMenu.add_command(label="Close", command=closeWindow)
mainMenu.add_command(label="Help")

content = Text(window, width=100)

content.grid(row=0, column=0, padx=5, pady=5)

window.mainloop()