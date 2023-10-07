%{
#define YYDEBUG 0

#include <stdio.h>
#include <stdlib.h>
int yyerror(char *s);
#include "y.tab.h"
#include "lex.yy.c"
%}

%token PLUS MINUS MULT DIV NUMBER LEFT_PAREN RIGHT_PAREN END

%start exp

%union
{
    double val;
}

%%
exp:        E                           { printf("%g\n", $<val>1); }
E:          E PLUS T                    { $<val>$ = $<val>1 + $<val>3; }
            | E MINUS T                 { $<val>$ = $<val>1 - $<val>3; }
            | T                         { $<val>$ = $<val>1; }
T:          T MULT F                    { $<val>$ = $<val>1 * $<val>3; }
            | T DIV F                   { $<val>$ = $<val>1 / $<val>3; }
            | F                         { $<val>$ = $<val>1; }
F:          LEFT_PAREN E RIGHT_PAREN    { $<val>$ = $<val>2; }
            | PLUS F                    { $<val>$ = $<val>2; }
            | MINUS F                   { $<val>$ = $<val>2 * -1; }
            | NUMBER                    { $<val>$ = $<val>1; }
%%

extern int yylex(), yyparse();

int yyerror(char *s)
{
	fprintf(stderr, "%s in line no : %d => '%s'\n", s, yylineno, yytext);
	exit(-1);
}

int main()
{
#if YYDEBUG
    yydebug = 1;
#endif

    extern FILE *yyin;
    yyin = fopen("input.txt", "r");

    if(yyin==NULL)
    {
        printf("Could not open 'input.txt'\n");
        return -1;
    }

    yyparse();

    return 0;
}