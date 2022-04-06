/* UNIVERSIDADE FEDERAL DA BAHIA */
/* MATA61 - COMPILADORES - 2022.1 */
/* Aluno: Saulo Ribeiro de Andrade */
/* Profa: Christina Von Flack Garcia Chavez */

/* just like Unix wc */
%option noyywrap
%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[^ \t\n\r\f\v]+ { words++; chars += strlen(yytext); } // Conta palavras igual ao WC do UNIX
\n              { chars++; lines++; }
.               { chars++; }

%%
int main(int argc, char **argv) {
    // Procure ler o arquivo
    // (Nao precisa "repassar" o arquivo usando "<")
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return 1;
        }
    }
    yylex();
    printf(" %d %d %d %s\n", lines, words, chars, argv[1]); // Liste o nome do arquivo na saida
}