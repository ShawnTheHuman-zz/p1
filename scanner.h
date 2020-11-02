// definitions for each token type
// and functions used.

#define IDENTIFIER 1
#define KEYWORD 2
#define INTEGER 3	
#define DELOP 4
#define COMMENT 5
#define UNKNOWN 6
#define END_OF_FILE 7

extern FILE *yyin;
extern int yylex();

void yyerror(char *s);
void scanner();
void testScanner();