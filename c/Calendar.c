/*
* Calender in C By Shivant Pandey
*/
#include<stdio.h>
#include<time.h>
//Here is a formula for finding the day of the week for ANY date. 
//N = d + 2m + [3(m+1)/5] + y + [y/4] - [y/100] + [y/400] + 2
//Then evaluate N%7
//Sunuday=1, ... and Saturday=0

//Global function declarations...
int getDaysInMonth(int,int);
int isLeapYear(int);
void displayMonth(int,int);
int getDayOfMonth(int,int,int);

//Function definitions...
int isLeapYear(int year){
    if((year%100==0 && year%400==0) || (year%100!=0 && year%4==0)){
        return 1;
    }
    return 0;
}

int getDaysInMonth(int i, int isLeapYear){
    int days = 30;
    switch(i){
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            days = 31;
            break;
        case 2:
            if(isLeapYear){
                days=29;
            } else{
                days=28;
            }
            break;
    }
    return days;
}

void displayMonth(int month, int year){
    int days = getDaysInMonth(month,isLeapYear(year));
    int startingDay = getDayOfMonth(1,month,year);
    int n=1;
    printf("--------------------Month: %d, Year: %d--------------------\n",month,year);
    printf("Sun\tMon\tTue\tWed\tThu\tFri\tSat\n");
    for(int row=1;n<=days;row++){
        for(int col=1;col<=7 && n<=days;col++){
            while(startingDay > 1){
                printf("%3c\t",(char)32);
                startingDay--;
                col++;
            }
            printf("%3d\t",n++);
        }
        printf("\n");
    }
    printf("-------------------------------------------------------------\n");
}

int getDayOfMonth(int d, int m, int y){
    if(m == 1 || m== 2){
        m+= 12;
        y--;
    }
    int N = d + 2*m + (3*(m+1)/5) + y + (y/4) - (y/100) + (y/400) + 2;
    N %= 7;
    if(N == 0){
        N = 7;
    }
    return N; //Sunday = 1... Saturday = 7
}

int main(){
    time_t now;
    time(&now);
    struct tm *local = localtime(&now);
    int month = local->tm_mon + 1; 
    int day = local->tm_mday;
    int year = local->tm_year + 1900;
    displayMonth(month,year);

    while(1){
        if (getchar() == '\033') { // if the first value is esc
                getchar(); // skip the [
                switch(getchar()) { // the real value
                    case 'A':
                    // code for arrow up
                    month--;
                    if(month == 0){
                        month = 12;
                        year--;
                    }
                    break;
                case 'B':
                    // code for arrow down
                    month++;
                    if(month > 12){
                        month = 1;
                     year++;
                    }
                    break;
                case 'C':
                    // code for arrow right
                    year++;
                    break;
                case 'D':
                    // code for arrow left
                    year--;
                    break;
            }
            displayMonth(month,year);
    }
}
    return 0;
}
