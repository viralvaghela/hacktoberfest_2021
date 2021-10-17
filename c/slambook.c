## Add your C codes here ... 
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
struct Slam
{
char phno[12],dob[10],aim[10],favfood[10];
char name[20],email[20],hob[20],favper[20],favmov[20],favcol[10];
char fname[20],nick[20],des[10],like[10],lng[10],adv[20],dislike[10];
struct Slam *next;
}* head;

typedef struct Slam slam;
FILE *fp,*ft;

void welcomeUser(){
   system("color 4F");
   printf("\n\n\n\n\n");
   printf("\t---------------------------------------------------------------------------------------------------------------------\n\n");
   printf("\t#################################### WELCOME TO C PROGRAM ONLINE SLAM BOOK ##############################################\n\n");
   printf("\t---------------------------------------------------------------------------------------------------------------------");
   printf("\n\n\n\t\t*******************************'FRIENDS ARE MADE, NOT BORN'******************************\n\n\n\n\n\n\n\n\n\t");
   system("pause");
}
//Insert Function
void insert(char* phno, char* dob, char* name, char* email, char* hob, char* favper, char* favmov, char* favcol, char* fname, char* des, char* nick, char* like, char* dislike, char* aim, char* favfood, char* adv, char* lng)
{
slam * node = (slam *) malloc(sizeof(slam));
strcpy(node->phno, phno);
strcpy(node->dob, dob);
strcpy(node->name, name);
strcpy(node->email, email);
strcpy(node->hob, hob);
strcpy(node->favper, favper);
strcpy(node->favmov, favmov);
strcpy(node->favcol, favcol);
strcpy(node->des, des);
strcpy(node->fname, fname);
strcpy(node->nick, nick);
strcpy(node->like, like);
strcpy(node->dislike, dislike);
strcpy(node->aim, aim);
strcpy(node->favfood, favfood);
strcpy(node->lng, lng);
strcpy(node->adv, adv);
node->next = NULL;
if(head==NULL){
head = node;
}
else{
node->next = head;
head = node;
}
}
//Search Function
void search(char* name)
{
slam *temp = head;
while(temp!=NULL){
if(strcmp(temp->name,name)==0){
  printf("\n\nAbout %s\n",temp->name);
  printf("I was named : %s\n", temp->name);
  printf("Ring me @ : %s\n", temp->phno);
  printf("Mail me @ : %s\n", temp->email);
  printf("My Birthday is on(dd-mm-yyyy) : %s\n", temp->dob);
  printf("I pass time by : %s\n", temp->hob);
  printf("One day, I'm gonna be : %s\n", temp->aim);
  printf("\n%s's Favorites\n",temp->name);
  printf("Colour I love : %s\n", temp->favcol);
  printf("Food I love : %s\n", temp->favfood);
  printf("Films to die for : %s\n", temp->favmov);
  printf("Celebrity I love : %s\n", temp->favper);
  printf("\n%s on his friend %s \n",temp->name,temp->fname);
  printf("Friend Name : %s\n", temp->fname);
  printf("How long you know %s : %s\n",temp->fname, temp->lng);
  printf("Nick Name for %s : %s\n",temp->fname, temp->nick);
  printf("Describe %s in one word : %s\n", temp->fname,temp->des);
  printf("One thing you like about %s : %s\n", temp->fname, temp->like);
  printf("One thing you dilike about %s : %s\n",temp->fname, temp->dislike);
  printf("One piece of advice for %s : %s\n",temp->adv, temp->dislike);
return;
}
temp = temp->next;
}
   printf("Response of %s is not found !!!\n",name);
}
//Update Function
void update(char* name)
{
  slam *temp = head;
while(temp!=NULL){
if(strcmp(temp->name,name)==0)
{
printf("\nResponse of %s is Found !!!\n", name);
printf("\nAbout You\n");
fflush(stdin);
printf("\nName : ");
scanf("%s",temp->name);
fflush(stdin);
printf("\nContact number : ");
scanf("%s",temp->phno);
fflush(stdin);
printf("\nE-mail ID : ");
scanf("%s",temp->email);
fflush(stdin);
printf("\nDate of Birth(ddmmyyyy) : ");
scanf("%s",temp->dob);
fflush(stdin);
printf("\nHobby : ");
scanf("%s",temp->hob);
fflush(stdin);
printf("\nAmbition : ");
scanf("%s",temp->aim);
fflush(stdin);
  printf("\nAbout your Favorites\n");
printf("\nFavorite Colour : ");
scanf("%s",temp->favcol);
fflush(stdin);
printf("\nFavorite Food : ");
scanf("%s",temp->favfood);
fflush(stdin);
printf("\nFavorite Celebrity : ");
scanf("%s",temp->favper);
fflush(stdin);
printf("\nFavorite Movie: ");
scanf("%s",temp->favmov);
fflush(stdin);
printf("\nAbout Your Friend\n");
printf("\nName of your friend you are going to tell about : ");
scanf("%s",temp->fname);
fflush(stdin);
printf("\nHow long you know %s : ",temp->fname);
scanf("%s",temp->lng);
fflush(stdin);
printf("\nNick Name for %s : ",temp->fname);
scanf("%s",temp->nick);
fflush(stdin);
printf("\nDescribe %s in one word : ",temp->fname);
scanf("%s",temp->des);
fflush(stdin);
printf("\nOne thing you like about %s : ",temp->fname);
scanf("%s",temp->like);
fflush(stdin);
printf("\nOne thing you dislike about %s : ",temp->fname);
scanf("%s",temp->dislike);
fflush(stdin);
printf("\nYour Advice to %s : ",temp->fname);
scanf("%s",temp->adv);
printf("\nUpdation Successful!!!\n");
return;
}
temp = temp->next;
}
 printf("\nResponse of %s is not found !!!\n", name);
}
//Delete Function
void Delete(char* name)
{
slam * temp1 = head;
slam * temp2 = head;
while(temp1!=NULL){
if(strcmp(temp1->name,name)==0){
  printf("Response of %s Found!!!\n",name);
  if(temp1 == temp2)
  {
    head = head->next;
    free(temp1);
  }
  else
  {
    temp2->next = temp1->next;
    free(temp1);
  }
  printf("Response of %s Successfully Deleted !!!\n",name);
  return;
}
temp2 = temp1;
temp1 = temp1->next;
}
  printf("Response of %s is not found !!!\n", name);
}
//Display Function
void display()
{
slam * temp = head;
fflush(stdin);
if(temp == NULL)
{
  printf("\n\nNo Response yet");
}
while(temp!=NULL){
  printf("\n\nAbout %s\n",temp->name);
  printf("I was named : %s\n", temp->name);
  printf("Ring me @ : %s\n", temp->phno);
  printf("Mail me @ : %s\n", temp->email);
  printf("My Birthday is on(dd-mm-yyyy) : %s\n", temp->dob);
  printf("I pass time by : %s\n", temp->hob);
  printf("One day, I'm gonna be : %s\n", temp->aim);
  printf("\n%s's Favorites\n",temp->name);
  printf("Colour I love : %s\n", temp->favcol);
  printf("Food I love : %s\n", temp->favfood);
  printf("Films to die for : %s\n", temp->favmov);
  printf("Celebrity I love : %s\n", temp->favper);
  printf("\n%s on his friend %s \n",temp->name,temp->fname);
  printf("Friend Name : %s\n", temp->fname);
  printf("How long you know %s : %s\n",temp->fname, temp->lng);
  printf("Nick Name for %s : %s\n",temp->fname, temp->nick);
  printf("Describe %s in one word : %s\n", temp->fname,temp->des);
  printf("One thing you like about %s : %s\n", temp->fname, temp->like);
  printf("One thing you dilike about %s : %s\n",temp->fname, temp->dislike);
  printf("One piece of advice for %s : %s\n",temp->adv, temp->dislike);
  printf("\n-------------------------------------------------------------\n");
temp = temp->next;
}
}
//Main Function
int main()
{
head = NULL;
char c;
int choice,ch;
char phno[12],dob[10],aim[10],favfood[10];
char name[20],email[20],hob[20],favper[20],favmov[20],favcol[10];
char fname[20],nick[20],des[10],like[10],lng[10],adv[20],dislike[10];
welcomeUser();
while(1)
{
  system("color 3F");
      system("cls");
      printf("\n---------------");
      printf("\n---MAIN MENU---");
      printf("\n---------------");
  printf("\n\n[1]NEW RESPONSE\n[2]SEARCH RESPONSE\n[3]DELETE RESPONSE\n[4]UPDATE RESPONSE\n[5]DISPLAY ALL RESPONSES\n[0]EXIT\n");
        fflush(stdin);
  printf("\nEnter your Choice : ");
  scanf("%d", &choice);
  switch (choice)
  {
    case 1:
    system("cls");
    printf("\nYour Details\n");
    fflush(stdin);
    printf("\nName : ");
    scanf("%s",name);
    fflush(stdin);
    printf("\nContact number : ");
    scanf("%s",phno);
    fflush(stdin);
    printf("\nE-mail ID : ");
    scanf("%s",email);
    fflush(stdin);
    printf("\nDate of Birth(dd-mm-yyyy) : ");
    scanf("%s",dob);
    fflush(stdin);
    printf("\nHobby : ");
    scanf("%s",hob);
    fflush(stdin);
    printf("\nAmbition : ");
    scanf("%s",aim);
    printf("\nAbout your Favorites\n");
        fflush(stdin);
    printf("\nFavorite Colour : ");
    scanf("%s",favcol);
    fflush(stdin);
    printf("\nFavorite Food : ");
    scanf("%s",favfood);
    fflush(stdin);
    printf("\nFavorite Celebrity : ");
    scanf("%s",favper);
    fflush(stdin);
    printf("\nFavorite Movie: ");
    scanf("%s",favmov);
    printf("\nYour Friend Details\n");
        fflush(stdin);
    printf("\nName of your friend you are going to tell about : ");
    scanf("%s",fname);
    fflush(stdin);
    printf("\nHow long you know %s : ",fname);
    scanf("%s",lng);
    fflush(stdin);
    printf("\nNick Name for your %s : ",fname);
    scanf("%s",nick);
    fflush(stdin);
    printf("\nDescribe %s in one word : ",fname);
    scanf("%s",des);
    fflush(stdin);
    printf("\nOne thing you like about %s : ",fname);
    scanf("%s",like);
    fflush(stdin);
    printf("\nOne thing you dislike about %s : ",fname);
    scanf("%s",dislike);
    fflush(stdin);
    printf("\nYour advice to %s : ",fname);
    scanf("%s",adv);
    insert(phno, dob, name, email, hob, favper, favmov, favcol, fname, des, nick, like, dislike, aim, lng, adv, favfood);
        printf("\n");
    system("pause");
    break;
    case 2:
    system("cls");
    printf("\n---------------");
    printf("\nSEARCH RESPONSE");
    printf("\n---------------");
    printf("\n\nEnter your name to search your response : ");
        fflush(stdin);
    scanf("%s", name);
    search(name);
        printf("\n");
       system("pause");
    break;
    case 3:
    system("cls");
    printf("\n---------------");
    printf("\nDELETE RESPONSE");
    printf("\n---------------");
    printf("\n\nEnter your name to delete your response : ");
            fflush(stdin);
    scanf("%s", name);
    Delete(name);
        printf("\n");
       system("pause");
    break;
    case 4:
    system("cls");
    printf("\n---------------");
    printf("\nUPDATE RESPONSE");
    printf("\n---------------");
    printf("\n\nEnter your name to update your response : ");
            fflush(stdin);
    scanf("%s", name);
    update(name);
        printf("\n");
       system("pause");
    break;
    case 5:
      system("cls");
      printf("\n----------------");
      printf("\nLIST OF RESPONSE");
      printf("\n----------------");
    display();
    printf("\n");
       system("pause");
    break;
    case 0:
    exit(0);
    default:
    printf("\nInvalid Choice");
        printf("\n");
       system("pause");
    break;
  }
}
return 0;
}

