/* just like Unix wc */
%option noyywrap
%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
([a-zA-Z0-9])*   { words++;} 
[a-zA-Z]+ {chars += strlen(yytext); }
\n               { chars++; lines++; }
.                 { chars++; }
%%
int main(int argc, char **argv) {
        yylex();
        printf("%8d%8d%8d\n", lines, words, chars);
} 