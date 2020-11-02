#include <stdio.h>
#include "token.h"
#include "scanner.c"


int main(int argc, char* argv[]){


    if(argc < 2){

        printf("Entering data: \n");
        scanner();

    }

    else if(argc == 2){

        yyin = fopen(argv[1], "r");

        if(yyin == NULL)
        {

            perror(argv[1]);
            printf("ERROR: file does not exist.\n");
            return 0;

        }
        else {
            scanner(yyin);
        }
    }
    return 0;
}