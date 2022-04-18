# E2

Implementar um analisador léxico para uma calculadora "avançada", que inclui valores em ponto flutuante.
Por exemplo, o analisador léxico aceita uma operação ```96 + 1.3``` mas não aceita ```96 + 1.3 * .5```
(considerar que formato 1.1 está ok, mas 1. ou .1 não estão ok).
Utilize como base programa flex abaixo (adaptado do livro do Levine, pag 7-8).

```
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
 * 258 = 5 * 264 
 */
 
%option noyywrap
%{
enum yytokentype {
   NUMBER = 258, 
   ADD = 259, 
   SUB = 260, 
   MUL = 261, 
   DIV = 262, 
   ABS = 263,  
   EOL = 264
};  
%}    

%%

"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { return NUMBER; }
[ \t]  { /* ignore whitespace */ }
\n     { return EOL; } 
.      { printf("Mystery character %c\n", *yytext); }

%%

main(int argc, char **argv)
{      
   int tok;
   while ((tok = yylex())) {
      printf("%d", tok);
      if (tok == NUMBER) printf(" = %s\n", yytext); 
      else printf("\n");                
   } 
}
```
