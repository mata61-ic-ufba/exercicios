/* programa flex que conta linhas, palavras e caracteres em um arquivo texto. */

%option noyywrap
%{
int chars = 0;
int words = 0;
int lines = 0;
int charsTotal = 0;
int wordsTotal = 0;
int linesTotal = 0;
%}

%%

[[:^space:]]+ { words++; chars += strlen(yytext); }
\n { chars++; lines++; }
. { chars++; }


%%

int main(int argc, char **argv) {
	int nFiles = argc-1;
	for (int i = 1; i <= nFiles; i++)
	{
		yyin = fopen(argv[i], "r");
		yylex();
		fclose(yyin);
		printf("%d %d %d %s\n", lines, words, chars, argv[i]);
		
		charsTotal += chars;
		wordsTotal += words;
		linesTotal += lines;
		chars = 0;
		words = 0;
		lines = 0;
	}
	if (nFiles > 1)
		printf("%d %d %d total\n", linesTotal, wordsTotal, charsTotal);
	return 0;
}