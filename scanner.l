%{
#include "scanner.h"
#include <stdio.h>
#include <stdlib.h>
%}

%option nounput yylineno

%%



"start"|"stop"|"iter"|"void"|"int"|"exit"|"scanf"|"printf"|"main"|"if"|"let"|"data"|"func"		return KEYWORD;
"//"	return COMMENT; printf("\n");
"="|"<="|">="|":"|"+"|"-"|"*"|"/"|"%"|"."|"("|")"|","|"{"|"}"|";"|"["|"]"|"=="	return DELOP;
[A-Z][a-z]*              {yyerror("SYNTAX ERROR: Identifiers must start with lower case. ");}
[a-zA-Z][_a-zA-Z0-9]*	return IDENTIFIER;
[1-9][0-9]*		        return INTEGER;
[ _\t\r\s\n]			;
^"#".+$			        return COMMENT;

.			            {yyerror("ERROR: Invalid Character ");}
<<EOF>>                 { printf("EOF: line %d\n", yylineno); yyterminate(); }
%%

// used to wrap all the lexical rules

int yywrap(void){
	return 1;
}

// Error for characters not contained in the rule set

void yyerror(char *s) {
    fprintf(stderr, "%s line: %d \n", s, yylineno);
}
