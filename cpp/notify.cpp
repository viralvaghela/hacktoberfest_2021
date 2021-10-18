// IMPORTING REQUIRED LIBRARIES
#include<libnotify/notify.h>
#include<iostream>
#include <string>
#include <chrono>
#include <thread>
#include <functional>

using namespace std;

// PLACE FOR USER CONFIGURABLE VARIABLES
// 
// MESSAGE VARIABLE: THE MESSAGE CONTENT TO BE DISPLAYED
char message[] = "Drink some water now !!";
//
// INTERVAL VARIABLE: THE FREQUENCY OF THE NOTIFICATION (IN MINUTES)
int interval = 60;

// FUNCTION FOR HANDLING THE TIMER 
void timer_start(std::function<void(void)> func, unsigned int interval)
{
    std::thread([func, interval]() {
        while (true)
        {
            func();
            std::this_thread::sleep_for(std::chrono::milliseconds(interval));
        }
    }).detach();
}

// FUNCTION TO NOTIFY THE USER
void action()
{
      notify_init("Message");
      NotifyNotification* n = notify_notification_new("Notifier",message,0);
      notify_notification_set_timeout(n,0);
      if(!notify_notification_show(n,0))
      {
          cerr<<"Show failed"<<endl;
      }
}

// MAIN FUNCTION
int main(int argc, char * argv[])
{
    interval = interval*60*1000;
    timer_start(action, interval);    
    while(true);
}
