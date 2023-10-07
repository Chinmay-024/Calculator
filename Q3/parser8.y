%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yyerror(char *s);
#include "y.tab.h"
#include "lex.yy.c"
%}

%union
{
    double p;
}

%token<p> num
%token<p> num_int
%token SIN COS TAN LOG SQRT AND OR XOR PLUS MINUS MULT DIV NUMBER LEFT_PAREN RIGHT_PAREN END EXP MOD

/* Define the Precedence and Associativity */
%left AND
%left XOR
%left OR
%left PLUS MINUS
%left MULT DIV MOD
%nonassoc uminus
%right EXP  
%type<p> exp

%%

ss : exp { printf("Answer = %g\n", $1); }

exp : exp PLUS exp { $$ = $1 + $3; }
    | exp MINUS exp { $$ = $1 - $3; }
    | exp MULT exp { $$ = $1 * $3; }
    | exp EXP exp { $$ = pow($1, $3); }
    | exp DIV exp { if ($3 == 0) { yyerror("Divide By Zero"); } else $$ = $1 / $3; }
    | exp MOD exp { if ($3 == 0) { yyerror("Modulus By Zero"); } else $$ = fmod($1, $3); }
    | MINUS exp %prec uminus { $$ = -$2; }
    | SIN LEFT_PAREN exp RIGHT_PAREN { $$ = sin($3); }
    | COS LEFT_PAREN exp RIGHT_PAREN { $$ = cos($3); }
    | TAN LEFT_PAREN exp RIGHT_PAREN { $$ = tan($3); }
    | LOG LEFT_PAREN exp RIGHT_PAREN { $$ = log($3); }
    | SQRT LEFT_PAREN exp RIGHT_PAREN { $$ = sqrt($3); }
    | num
    | num_int
    | LEFT_PAREN exp RIGHT_PAREN { $$ = $2; }
    | exp AND exp { if ($1 == (int)$1 && $3 == (int)$3) $$ = (int)$1 & (int)$3; else yyerror("Bitwise operation on decimal number"); }
    | exp OR exp { if ($1 == (int)$1 && $3 == (int)$3) $$ = (int)$1 | (int)$3; else yyerror("Bitwise operation on decimal number"); }
    | exp XOR exp { if ($1 == (int)$1 && $3 == (int)$3) $$ = (int)$1 ^ (int)$3; else yyerror("Bitwise operation on decimal number"); }
    ;

%%

extern int yylex(), yyparse();

int yyerror(char *s)
{
    fprintf(stderr, "%s in line no: %d => '%s'\n", s, yylineno, yytext);
    exit(-1);
}

int main()
{
#if YYDEBUG
    yydebug = 1;
#endif

    extern FILE *yyin;
    yyin = fopen("input.txt", "r");

    if (yyin == NULL)
    {
        printf("Could not open 'input.txt'\n");
        return -1;
    }

    yyparse();

    return 0;
}
