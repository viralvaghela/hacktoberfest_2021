//hangman game
#include<iostream.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>

const int MAXLENGTH=80;
const int MAX_TRIES=5;
const int MAXROW=15;

int letterFill (char, char[], char[]);
void initUnknown (char[], char[]);
void main ()
{       clrscr();
	char unknown [MAXLENGTH];
	char letter;
	int num_of_wrong_guesses=0,flag=0;;
	char word[MAXLENGTH];
	char words[][MAXLENGTH] =
	{       "cambodia",
		"vietnam",
		"india",
		"belgium",
		"moscow",
		"malaysia",
		"philippines",
		"austria",
		"ethiopia",
		"oman",
		};
	randomize();
	int n=random(10);
	strcpy(word,words[n]);
	initUnknown(word, unknown);
	cout<<"\t\tWORD SCRABBLE-HANGMAN";
	cout << "\n\nGuess a country Name";
	cout << "\n\nEach letter is represented by a star.";
	cout << "\n\nYou have to type only one letter in one try";
	cout << "\nEnter your answers in lower case";
	cout << "\n\nYou have " << MAX_TRIES << " tries to try and guess the word.";
	cout << "\n Repeating any letter would decrease your chances.  ";
	cout << "\n \t \t Level 1";
	cout << "\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";

	while (num_of_wrong_guesses < MAX_TRIES)
	{
		cout << "\n\n" << unknown;
		cout << "\n\nGuess a letter: ";
		cin >> letter;

		if (letterFill(letter, word, unknown)==0)
		{
			cout << endl << "Whoops! That letter isn't in there!" << endl;
			num_of_wrong_guesses++;
		}
		else
			cout << endl << "You found a letter! Play on!" << endl;

		cout << "You have " << MAX_TRIES - num_of_wrong_guesses;
		cout << " guesses left." << endl;
		if (strcmpi(word, unknown) == 0)
		{
			cout << word << endl;
			cout << "Yeah! You got it!";     flag=1;
		       cout<<"\t Your score is 10000";
		       cout<<"\nPress any key to play level 2";
			break;
		}
	}
	if(num_of_wrong_guesses == MAX_TRIES)
	{
		cout << "\nSorry, you lose...you've been hanged." << endl;
		cout << "The word was : " << word << endl;
		cout <<  "Game over!!!";
		cout<<"\nThank You for playing....";}


	getch();
	if(flag==1)

	{   clrscr();
	 cout<<"\n \t Level 2 \n";
		char unknown [MAXLENGTH];
	char letter;
	int num_of_wrong_guesses=0;
	char word[MAXLENGTH];
	char words[][MAXLENGTH] =
	{   "diamond-cuts-diamond",      "charity-begins-at-home",
	    "no-pain-no-gain",           "tomorrow-never-comes",
	    "every-dog-has-its-day",     "practice-makes-man-perfect",
	    "tit-for-tat",               "look-before-you-leap",
	    "might-is-right",            "well-begun-is-half-done",

	};
	randomize();
	int n=random(10);
	strcpy(word,words[n]);
	initUnknown(word, unknown);
	cout <<"\n In this level names of countries or phrases can occur";
	cout << "\nEnter your answers in lower case";
	cout <<"\n Spaces for phrases shall be replaced by hyphen";
	cout << "\n\nYou have " << MAX_TRIES << " tries to try";
	cout << "\n Repeating any letter would decrease your chances.";
	cout << "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
	while (num_of_wrong_guesses < MAX_TRIES)
	{
		cout << "\n\n" << unknown;
		cout << "\n\nGuess a letter: ";
		cin >> letter;

		if (letterFill(letter, word, unknown)==0)
		{
			cout << endl << "Whoops! That letter isn't in there!" << endl;
			num_of_wrong_guesses++;
		}
		else
			cout << endl << "You found a letter! Play On!" << endl;
		cout << "You have " << MAX_TRIES - num_of_wrong_guesses;
		cout << " guesses left." << endl;
		if (strcmp(word, unknown) == 0)
		{ 	cout << word << endl;
			cout << "Yeah! You got it!";
			cout << "\tYour score=20000\n";
			 cout<<"Press any key to move to level 3";
			  flag=2;
			break;                                   		}
	}
	if(num_of_wrong_guesses == MAX_TRIES)
	{
		cout << "\nSorry, you lose...you've been hanged." << endl;
		cout << "The word was : " << word << endl;
		cout << "\t Your score=10000";
		cout <<  "\n Game over";
		cout<<"\nThank You for playing....";}     getch();

   if(flag==2)

	{   clrscr();
	 cout<<"\n \t Level 3 \n";
		char unknown [MAXLENGTH];
	char letter;
	int num_of_wrong_guesses=0;
	char word[MAXLENGTH];
	char words[][MAXLENGTH] =
	{       "thiruvananthapuram",    "bhubneshwar",
		"agartala",              "panaji",
		"shillong",              "dispur",
		"chandigarh",            "itanagar",
		"imphal",                "ranchi",

       };
	randomize();
	int n=random(10);
	strcpy(word,words[n]);

	initUnknown(word, unknown);

	cout <<"\n In this level names of countries or states or phrases  can occur";
	cout <<"\n Spaces for phrases shall be replaced by hyphen";
	cout << "\n\nYou have " << MAX_TRIES << " tries to try";
	cout << "\n Repeating any letter would decrease your chances.";
	cout << "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";

	while (num_of_wrong_guesses < MAX_TRIES)
	{
		cout << "\n\n" << unknown;
		cout << "\n\nGuess a letter: ";
		cin >> letter;
		if (letterFill(letter, word, unknown)==0)
		{
			cout << endl << "Whoops! That letter isn't in there!" << endl;
			num_of_wrong_guesses++;
		}
		else
			cout << endl << "You found the letter ! Play On!" << endl;
		cout << "You have " << MAX_TRIES - num_of_wrong_guesses;
		cout << " guesses left." << endl;

		if (strcmp(word, unknown) == 0)
		{ 	cout << word << endl;
			cout << "Yeah! You got it!";
			cout <<" \t Your score= 30000";
			cout<<"\n You completed game successfully";
			cout<<"\nThank You for playing....";
			break;                                   		}
	}                      }
	if(num_of_wrong_guesses == MAX_TRIES)
	{
		cout << "\nSorry, you lose...you've been hanged." << endl;
		cout << "The word was : " << word << endl;
		cout<< " Your score = 20000";
		cout<<"\n Game over";
		cout<<"\nThank You for playing...."; }     getch();
}

}

int letterFill (char guess, char secretword[], char guessword[])
{
	int i;
	int matches=0;
	for (i = 0; secretword[i]!='\0'; i++)
	{	if (guess == guessword[i])
			return 0;
		if (guess == secretword[i])
		{
			guessword[i] = guess;
			matches++;
		}
	}
	return matches;
}

void initUnknown (char word[], char unknown[])
{
	int i;
	int length = strlen(word);
	for (i = 0; i < length; i++)
		unknown[i]='*';
	unknown[i]='\0';
}
