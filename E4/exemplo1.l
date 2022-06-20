%{
#include <stdio.h>

int yylex();

void yyerror(const char* msg) {
      fprintf(stderr, "%s\n", msg);
}

%}

%%

[0-9] + {
    yylval = atoi(yytext);
    return TOKEN_INT;
}
[+] {return TOKEN_PLUS;}
[-] {return TOKEN_MINUS;}
[*] {return TOKEN_MUL;}
[/] {return TOKEN_DIV;}
. {return TOKEN_ERROR}

%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_SEMI



%%

int yywrap(){
    return l;
}