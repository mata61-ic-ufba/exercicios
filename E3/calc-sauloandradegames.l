/* UNIVERSIDADE FEDERAL DA BAHIA */
/* MATA61 - COMPILADORES - 2022.1 */
/* Aluno: Saulo Ribeiro de Andrade */
/* Profa: Christina Von Flack Garcia Chavez */
/* 
 * Scanner recognizes tokens for the calculator and prints them out.
 * Entrada.
 * 96 + 1.3 * .5
 * Saída.
 * 258 = 96
 * 259
 * 258 = 1.3
 * 261
 * Mystery character .
 * 258 = 5 
 * 264 
 */
 
%option noyywrap
%{
#include "calc.tab.h"  
%}
%%

"+"                 { return ADD; }
"-"                 { return SUB; }
"*"                 { return MUL; }
"/"                 { return DIV; }
"|"                 { return ABS; }
([0-9]+)(\.[0-9]+)? { return NUMBER; } // Suporta inteiro e ponto flutuante
[ \t]               { /* ignore whitespace*/ }
\n                  { return EOL; }
.                   { printf("Mystery character %c\n", *yytext); }

%%
main(int argc, char **argv)
{
    int tok;
    while ((tok = yylex())) {
        printf ("%d", tok);
        if (tok == NUMBER) printf(" = %s\n", yytext);
        else printf("\n");
    }
}