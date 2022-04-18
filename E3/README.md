Modifique o código do exercício E2 (calc.l) para trabalhar com o bison. Criar um arquivo calc.y com as definições necessárias.

```
bison -d calc.y
flex calc.l
cc -o calc calc.tab.c lex.yy.c 
```
