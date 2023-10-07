%{
#include<stdio.h>
%}

digit           [0-9]
digits          {digit}+
number          {digits}(\.{digits})?
plus            \+
minus           \-
mult            \*
div             \/
left_paren      \(
right_paren     \)
exp             \^
whitespace      [ \t]
newline         [\n]

%%

{number}        {
                    yylval.val=atof(yytext);
                    return NUMBER;
                }
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