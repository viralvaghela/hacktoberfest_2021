import pyttsx3 
import datetime
import speech_recognition as sr 
import wikipedia 
import smtplib
import webbrowser as wb
import psutil 
import pyjokes 
import os
import pyautogui 
import pyshorteners
import pywhatkit as kit 

engine =pyttsx3.init()

def speak(audio):
    engine.say(audio)
    engine.runAndWait()
    

def time_():
    speak("The currect time is")
    Time=datetime.datetime.now().strftime("%I:%M:%S")
    speak(Time)
def date_():
    year=datetime.datetime.now().year
    month=datetime.datetime.now().month
    date=datetime.datetime.now().date
    speak("The current date is")
    speak(date)
    speak(month)
    speak(year)
def wishme():
    speak("welcome back Srinivas")
    time_()
    date_()
    hour=datetime.datetime.now().hour
    if hour>=6 and hour<=12:
        speak("Good morning sir")
    elif hour>12 and hour<=18:
        speak("good afternoon sir")
    elif hour>18 and hour<=24:
        speak("good evening sir")
    else:
        speak("good night sir")
    speak("The bhot is at your service!! how can i help you sir")

def Takecommand():
    r=sr.Recognizer()
    with sr.Microphone() as source:
        print("Listening...")
        r.pause_threshold=1
        audio=r.listen(source)
    try:
        print("recognising...")
        query=r.recognize_google(audio,language='en.US')
        print(query)
    except Exception as e:
        print(e)
        print(" Sorry for inconviniance please say it again")
        return "None"
    return query
def sendEmail(to,content):
    server=smtplib.SMTP('smtp.gamil.com',587)
    server.ehlo()
    server.starttls()
    server.login('useremail address','password')
    server.sendmail(to,content)
    server.close()

def cpu():
    usage = str(psutil.cpu_percent())
    speak('CPU is at'+usage)
    battery=psutil.sensors_battery()
    speak('battery is at')
    speak(battery.percent)

def whats_up():
    hr=datetime.datetime.now().strftime("%I")
    mi=datetime.datetime.now().strftime("%M")
    speak('Now you are ready to send a whatsup msg')
    num=input('enter sender  phone number ')
    speak('tell the text')
    msg=Takecommand()
    kit.sendwhatmsg("num","msg",hr ,mi)

def short_url():
    url = input("Enter your url")
    s = pyshorteners.Shortener().tinyurl.short(url)
    print("Your shorted is -->", s)

def joke():
    speak(pyjokes.get_joke())

def screenshot():
    img=pyautogui.screenshot()
    img.save('D:/screenshot.png')
if __name__ == "__main__":
    wishme()
    while 1:
        query = Takecommand().lower()
        if 'time' in query:
            time_()
        elif 'date' in query:
            date_()
        elif 'wikipedia' in query:
            speak("searching...")
            query=query.replace("wikipedia","")
            result=wikipedia.summary(query.sentences==5)
            speak("According to wikipedia")
            print(result)
            speak(result)
        elif 'send email' in query:
            try:
                speak("content")
                content=Takecommand()
                speak('who is the receiver')
                receiver=input("enter the email address:")
                to=receiver
                sendEmail(to,content)
                speak(content)
                speak("email has been sent")
            except Exception as e:
                print(e)
                speak("unable to send the mail..")  
        elif 'search in chrome' in query:
            speak("what should  i search?")
            chromepath='Downloads'#location of chrome installation in your pc
            search=Takecommand().lower()
            wb.get(chromepath).open_new_tab(search+'.com') #applicable for .com websites
        elif 'search in youtube' in query:
            speak('what to search?')
            search_term=Takecommand().lower()
            wb.open('https://www.youtube.com/results?search_query='+search_term)
        elif 'search in google' in query:
            speak('what to search?')
            search_term=Takecommand().lower()
            wb.open('https://www.google.com/search?q='+search_term)
        elif 'cpu' in query:
            cpu()
        elif 'joke' in query:
            joke()
        elif 'go offline' in query:
            speak('going offline sir')
            quit()
        elif 'word' in query:
            speak('opening ms word')
            try:
                ms_word=r'' #word path in your pc
                os.startfile(ms_word)
            except Exception as e:
                print(e)
                speak('could not open the file')
        elif 'write a note' in query:
            speak('what to write?')
            notes=Takecommand()
            file=open('notes.txt','w')
            speak('Sir should i include date and time')
            ans=Takecommand()
            if 'yes' in ans or 'sure' in ans:
                strTime=datetime.datetime.now().strftime("%I:%M:%S")
                file.write(strTime)
                file.write(':')
                file.write(notes)
                speak('Done taking notes sir!')
            else:
                file.write(notes)
        elif 'show note' in query:
            speak('showing notes')
            file=open('notes.txt','r')
            print(file.read())
            speak(file.read())
        elif 'screenshot' in query:
            screenshot()
        elif 'where is' in query:
            query=query.replace("where is ","")
            location=query
            speak('user asked to locate'+location)
            wb.open_new_tab("https://www.goggle.com/maps/place/"+location)       
        elif 'short the url' in query:
            short_url()
        elif 'send a whats up msg ' in query:
            whats_up()
