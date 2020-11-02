%{
#include "scanner.h"
%}

%option nounput yylineno

%%



"start"|"stop"|"iter"|"void"|"int"|"exit"|"scanf"|"printf"|"main"|"if"|"let"|"data"|"func"		return KEYWORD;
"//"	return COMMENT; printf("\n");
"="|"<="|">="|":"|"+"|"-"|"*"|"/"|"%"|"."|"("|")"|","|"{"|"}"|";"|"["|"]"	return DELOP;
[a-zA-Z][_a-zA-Z0-9]*	return IDENTIFIER;
[1-9][0-9]*		return INTEGER;
[ _\t\r\s\n]			;
^"#".+$			return COMMENT;

.			    {yyerror("ERROR: Invalid Character ");}
<<EOF>>         { printf("EOF\n"); yyterminate(); }
%%

int yywrap(void){
	return 1;
}

void yyerror(char *s) {
    fprintf(stderr, "line %d: %s\n", yylineno, s);
}
