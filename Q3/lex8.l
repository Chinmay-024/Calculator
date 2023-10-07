%{
#include <math.h>
#include "y.tab.h"
%}

plus            \+
minus           \-
mult            \*
div             \/
left_paren      \(
right_paren     \)
exp             \^
mod             \%
whitespace      [ \t]
newline         [\n]
and             \&
or              \|
xor             X

%%

[0-9]+\.[0-9]+    {
                    yylval.p = atof(yytext);
                    return num;
                }
[0-9]+            {
                    yylval.p = atoi(yytext);
                    return num_int;
                }
{and}               { return AND; }
{or}                { return OR; }
{xor}               { return XOR; }
sin               { return SIN; }
cos               { return COS; }
tan               { return TAN; }
log               { return LOG; }
sqrt              { return SQRT; }
{mod}              { return MOD; }
{exp}           {return EXP; }
{plus}          { return PLUS; }
{minus}         { return MINUS; }
{mult}          { return MULT; }
{div}           { return DIV; }
{left_paren}    { return LEFT_PAREN; }
{right_paren}   { return RIGHT_PAREN; }
{whitespace}    { }
{newline}       { return END; }
.               {
                    yyerror("Invalid character encountered"); 
                    return -1;
                }

%%

int yywrap() {
    return 1;
}