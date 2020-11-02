#include <stdio.h>
#include "token.h"
#include "scanner.h"


extern int yylex();
extern void yyerror();
extern int yylineno;
extern char* yytext;
FILE *yyin;


// yylex reads each character, tokenizing according to the
// rules written in scanner.l
void scanner(){
    int token;
    token = yylex();
    while(token){
        printf("Token: %s, Data: %s, Line: %d\n",tokenNames[token], yytext, yylineno);
        token = yylex();
    }
}


void testScanner(){
    int token;
    token = yylex();
    while(token){
        printf("Token: %s, Data: %s, Line: %d\n",tokenNames[token], yytext, yylineno);
        token = yylex();
    }
}