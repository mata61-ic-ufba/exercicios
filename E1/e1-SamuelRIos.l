
%{
int chars = 0;
int words = 0;
int lines = 0;
%}
%option noyywrap
%%

[^ \t\n\r\f\v]+ { words++; chars += strlen(yytext); }
\n { lines++; }

%%
int main(int argc, char **argv) {
        yylex();
        printf("%8d%8d%8d\n", lines, words, chars);
}