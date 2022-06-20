# Exercício 4

Leia o capítulo 5 do livro do Douglas Thain e reproduza os exemplos das seções 5.1, 5.2 e 5.3.
Coloque seu código nesta pasta (E5).

/* win_bison.exe -dy .\exemplo1.y 
para criar o tab.c e tab.h
posso testar com "echo "5+3+4" | .exemplo1" */
5.1
Exemplo 1

%{
#include <stdio.h>
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
program : expr TOKEN_SEMI;
expr : expr TOKEN_PLUS term
| expr TOKEN_MINUS term
| term
;
term : term TOKEN_MUL factor
| term TOKEN_DIV factor
| factor
;
factor: TOKEN_MINUS factor
| TOKEN_LPAREN expr TOKEN_RPAREN
| TOKEN_INT
;
%%
int yywrap() { return 0; }

_________________________________

Exemplo 2

#include <stdio.h>
extern int yyparse();
int main()
{
if(yyparse()==0) {
printf("Parse successful!\n");
} else {
printf("Parse failed.\n");
}
}

_________________________________
Não tem exemplo
_________________________________
Exemplo 5.3

prog : expr TOKEN_SEMI { parser_result = $1; }
;
expr : expr TOKEN_PLUS term { $$ = $1 + $3; }
| expr TOKEN_MINUS term { $$ = $1 - $3; }
| term { $$ = $1; }
;
term : term TOKEN_MUL factor { $$ = $1 * $3; }
| term TOKEN_DIV factor { $$ = $1 / $3; }
| factor { $$ = $1; }
;
factor
: TOKEN_MINUS factor { $$ = -$2; }
| TOKEN_LPAREN expr TOKEN_RPAREN { $$ = $2; }
| TOKEN_INT { $$ = atoi(yytext); }
;