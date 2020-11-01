#include <stdio.h>
#include "token.h"
#include "scanner.h"


extern int yylex();
extern int yylineno;
extern char* yytext;
FILE *yyin;


int main(int argc, char* argv[]){

    int ntoken, vtoken;
    if(argc < 2){
        printf("Entering data: \n");
        ntoken = yylex();
        while(ntoken){
            printf("Token: %s, Data: %s, Line: %d\n",tokenNames[ntoken], yytext, yylineno);
            ntoken = yylex();
        }

    }
    else if(argc == 2){

        yyin = fopen(argv[1], "r");
        if(yyin == NULL)
        {
            perror(argv[1]);
            printf("ERROR: file does not exist.");
            return 0;
        }
        else {
            ntoken = yylex();
            while (ntoken) {

                printf("Token: %s, Data: %s, Line: %d\n", tokenNames[ntoken], yytext, yylineno);
                ntoken = yylex();

            }
        }
    }
    return 0;
}