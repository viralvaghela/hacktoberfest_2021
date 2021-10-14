%{
    #include<stdio.h>
%}

%%

[0-9]* printf("NUMERIC CONSTANT: %s\n", yytext);

[0-9]+"."[0-9]+ printf("REAL CONSTANT: %s\n", yytext);

[+-]?[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)? printf("EXPONENTIAL CONSTANT: %s\n", yytext);

\'.\' printf("CHARACTER CONSTANT: %s\n", yytext);

\".*\" printf("STRING CONSTANT: %s\n", yytext);

if|else|switch|case|default printf("CONDITIONAL KEYWORD: %s\n", yytext);

for|do|while printf("ITERATION KEYWORD: %s\n",yytext);

char|double|float|int|long|short|signed|unsigned printf("DATA TYPE KEYWORD: %s\n", yytext);

break|continue|goto|return printf("JUMP KEYWORD: %s\n", yytext);

auto|extern|register|static printf("STORAGE SPECIFIER KEYWORD: %s\n", yytext);

const|volatile printf("TYPE QUALIFIER KEYWORD: %s\n", yytext);

enum|sizeof|struct|typedef|union|void printf("OTHER KEYWORD: %s\n", yytext);

#define|#include|#undef|#ifdef|#ifndef|#if|#else|#elif|#endif|#error|#pragma printf("PREPROCESSOR DIRECTIVE: %s\n", yytext);

\+|\*|\/|- printf("ARITHMETIC OPERATOR: %s\n", yytext);

\<|\>|==|\<=|\>=|\!= printf("RELATIONAL OPERATOR: %s\n", yytext);

=|\+=|-=|\*=|\/= printf("ASSIGNMENT OPERATOR: %s\n", yytext);

\^|~|&|>>|<<|\| printf("BITWISE OPERATOR: %s\n", yytext);

\&\&|\|\||\! printf("LOGICAL OPERATOR: %s\n", yytext);

\/\/.* printf("SINGLE LINE COMMENT: %s\n", yytext);

\/\*(.|\n)*?\*\/ printf("MULTI LINE COMMENT:\n%s\n", yytext);

\;|,|\. printf("SEPARATORS: %s\n", yytext);

\(|\{|\[ printf("SCOPE OPEN: %s\n", yytext);

\)|\}|\] printf("SCOPE CLOSE: %s\n", yytext);

[a-zA-Z_][a-zA-Z0-9_]* printf("IDENTIFIER: %s\n",yytext);

<<EOF>> return 0;

([ ])+ ;

%%

int main() {
    printf("This program analyzes the input code as a c language anaylzer:\n\n");
    extern FILE *yyin;
    yyin = fopen("check.c", "r");
    yylex();
    printf("Thanks for using lex.\n");
}

int yywrap(){}