#include <stdio.h>
#include <string.h>
int main()
{
char str[100];
int counter;
printf("Enter a string: ");
gets(str);
for(counter=0; str[counter]!='\0';counter++)
{
if(str[counter]>='A' && str[counter]<='Z')
str[counter]=str[counter]+32;
else if(str[counter]>='a' && str[counter]<='z')
str[counter]=str[counter]-32;
}
printf("String after toggling the cases: %s",str);
return 0;
}

