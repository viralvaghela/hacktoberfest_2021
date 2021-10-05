import time
from plyer import notification

while True:
    notification.notify(
        title="Hey there!",
        message="This is a pop-up reminder, take a break. Bye!",
 		# app_icon = "<path of the icon-image>",
        timeout=10

    	)
    time.sleep(1500) # time is seconds