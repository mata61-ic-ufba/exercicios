%{ 
void yyerror (char *msg);
int yylex (void);

#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

%}

%token TOKEN_INT
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_MUL
%token TOKEN_DIV
%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_SEMI
%token TOKEN_ERROR


%% 

prog : expr TOKEN_SEMI { $$ = $1; printf("Valor Final: %d \n", $$); }
;

expr : expr TOKEN_PLUS term { $$ = $1 + $3;}
| expr TOKEN_MINUS term { $$ = $1 - $3; }
| term { $$ = $1; }
;

term : term TOKEN_MUL factor { $$ = $1 * $3; }
| term TOKEN_DIV factor { $$ = $1 / $3; }
| factor { $$ = $1; }
;

factor
: TOKEN_MINUS factor { $$ = -$2;  }
| TOKEN_LPAREN expr TOKEN_RPAREN { $$ = $2; }
| TOKEN_INT { $$ = $1; printf("Valor Reconhecido: %d \n", $$);}
;

%%


void yyerror( char* msg) {
    printf( "Erro: %s\n", msg);
}

int main(void){
    yyparse();
    return 0;
}

