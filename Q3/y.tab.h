/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    num = 258,                     /* num  */
    num_int = 259,                 /* num_int  */
    SIN = 260,                     /* SIN  */
    COS = 261,                     /* COS  */
    TAN = 262,                     /* TAN  */
    LOG = 263,                     /* LOG  */
    SQRT = 264,                    /* SQRT  */
    AND = 265,                     /* AND  */
    OR = 266,                      /* OR  */
    XOR = 267,                     /* XOR  */
    PLUS = 268,                    /* PLUS  */
    MINUS = 269,                   /* MINUS  */
    MULT = 270,                    /* MULT  */
    DIV = 271,                     /* DIV  */
    NUMBER = 272,                  /* NUMBER  */
    LEFT_PAREN = 273,              /* LEFT_PAREN  */
    RIGHT_PAREN = 274,             /* RIGHT_PAREN  */
    END = 275,                     /* END  */
    EXP = 276,                     /* EXP  */
    MOD = 277,                     /* MOD  */
    uminus = 278                   /* uminus  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define num 258
#define num_int 259
#define SIN 260
#define COS 261
#define TAN 262
#define LOG 263
#define SQRT 264
#define AND 265
#define OR 266
#define XOR 267
#define PLUS 268
#define MINUS 269
#define MULT 270
#define DIV 271
#define NUMBER 272
#define LEFT_PAREN 273
#define RIGHT_PAREN 274
#define END 275
#define EXP 276
#define MOD 277
#define uminus 278

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "parser8.y"

    double p;

#line 117 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
