%{
#include "scanner.h"
//#include "y.tab.h"
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

.			    {printf("ERROR: Unknown Character\n"); return UNKNOWN;}
<<EOF>>         { printf("EOF\n"); yyterminate(); }
%%

int yywrap(void){
	return 1;
}
