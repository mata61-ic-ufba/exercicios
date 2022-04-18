/* just like Unix wc */
/* elber cerqueira */
%option noyywrap
%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+   { words++; chars += strlen(yytext); }
\n               { chars++; lines++; }
.                 { chars++; }

%%
int main(int argc, char **argv) {
        yylex();
        printf("%d lines, %d words, %d characters\n", lines, words, chars);
}
