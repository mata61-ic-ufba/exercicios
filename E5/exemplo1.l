%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

%}

%%

[0-9]+ {yylval = atoi(yytext); return TOKEN_INT;}
[+] {return TOKEN_PLUS;}
[-] {return TOKEN_MINUS;}
[*] {return TOKEN_MUL;}
[/] {return TOKEN_DIV;}
[(] {return TOKEN_LPAREN;}
[)] {return TOKEN_RPAREN;}
[;] {return TOKEN_SEMI;} 



%%

int yywrap(void){       //vai encapsular o programa em lex
    return 1;
}