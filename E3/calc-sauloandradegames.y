/* UNIVERSIDADE FEDERAL DA BAHIA */
/* MATA61 - COMPILADORES - 2022.1 */
/* Aluno: Saulo Ribeiro de Andrade */
/* Profa: Christina Von Flack Garcia Chavez */

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