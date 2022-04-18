%{
#include <stdio.h>

int yylex();

void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
}

%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist: /* nothing */

%%


