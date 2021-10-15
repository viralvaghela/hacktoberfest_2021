# path module
from pathlib import Path

# SMTP server essentials
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
import smtplib
import ssl
import email

# Configuration section
import sys
import os
import re

try:

    # Login credentials
    userMailId = ""
    userPassword = ""

    # The mail recipient settings
    recipientMail = "sample@doe.com"
    mailSubject = "This is a sample mail"

    # The mailing port
    port = 587
    fromMail = userMailId


    # parsing the HTML file
    html = ""
    styleSheet = ""

    with open(os.path.join(Path.cwd(), "style.css"), "r") as template:
        styleSheet = template.readlines()

    with open(os.path.join(Path.cwd(), "index.html"), "r") as template:
        for line in template:
            regex = r"({.*})"

            # Checking the presence of the style element
            if ("{style}" in re.findall(regex, line)):
                line += "\n<style>\n"
                line += "".join(styleSheet)
                line += "\n</style>\n"

            # Creating the html
            html = html + line if(html != "") else line

    # Un comment the section below to see how your html file has rendered.
    
    # --------------------------------------------------
    # with open("template.html", "w") as template:
        # template.writelines(html)
    # --------------------------------------------------

    message = MIMEMultipart('alternative')
    message['Subject'] = mailSubject

    converted = MIMEText(html, 'html')
    message.attach(converted)
    server = smtplib.SMTP('smtp.gmail.com', port)
    server.starttls()

    try:
        server.login(userMailId, userPassword)
        server.sendmail(fromMail, [recipientMail], message.as_string())
        server.quit()

        print("success the mail has been sent successfully")
    except Exception as error:
        print(error)
        print("Server error :: unable to send mail / probably limit or auth error")

except Exception as error:
    print(error)
    print("Server error :: unable to send mail / probably main error")

finally:
    sys.exit(0)
