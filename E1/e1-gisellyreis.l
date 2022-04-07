/* programa flex que conta linhas, palavras e caracteres em um arquivo texto. */

%option noyywrap
%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[^ \t\n\r\f\v]+   { words++; chars += strlen(yytext); }

%%
int main(int argc, char **argv) {
        yylex();
        printf("%8d%8d%8d\n", lines, words, chars);
}