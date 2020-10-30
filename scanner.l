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
[_\n\t]			;
^"#".+$			return COMMENT;
.			;
%%

int yywrap(void){
	return 1;
}
