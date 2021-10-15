# Python HTML Mailer

## This python file will help you mail HTML along with custom styles in mail.

## Step 1 : 
- Create a gmail account (a strong password recommended)
- Allow the less secure apps access for the account
    - [https://myaccount.google.com/lesssecureapps](https://myaccount.google.com/lesssecureapps)
- Once done the main setup is done.

## Step 2 :
- Add the necessary details in the [mailer.py](./mailer.py) file.
    ```python
    # Login credentials
    userMailId = "" # The main gmail ID, the account you created
    userPassword = "" # The password for the account

    # The mail recipient settings
    recipientMail = "sample@doe.com" # The recievers mail ID
    mailSubject = "This is a sample mail" # The subject of the mail
    ```
- Once done, you can start filling in your [html file](./index.html) along with the styles in the [css file](./style.css)

## Step 3 :
- Once done now you are all set, Now you can execute the [mailer.py](./mailer.py) from the root of the file. (...../python/mailer)
![image](https://user-images.githubusercontent.com/59312489/136668990-01bed47a-2319-4fb7-87ba-ee54f736c22e.png)


- And the mail will look as follows.

### Supports bootstrap and tailwind (tested)
## Happy Coding.
