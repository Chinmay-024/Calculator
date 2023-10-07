# Lex and Yacc for Arithmetic Operations

This is a Lex and Yacc (Bison) implementation for parsing and evaluating simple arithmetic expressions. It can handle addition, subtraction, multiplication, division, and parentheses. The provided grammar allows for the parsing of arithmetic expressions in infix notation and evaluates the result.

## Files

1. `lexer.l`: Lex specification file that defines the tokens and their corresponding actions.
2. `parser.y`: Yacc (Bison) specification file that defines the grammar and semantic actions.
3. `y.tab.h` and `y.tab.c`: Generated files from Yacc that contain the parser implementation.
4. `lex.yy.c`: Generated file from Lex that contains the lexer implementation.
5. `input.txt`: Sample input file containing arithmetic expressions.

## Grammar

The grammar for this arithmetic expression parser is defined as follows:

```
exp:        E
E:          E PLUS T
            | E MINUS T
            | T
T:          T MULT F
            | T DIV F
            | F
F:          LEFT_PAREN E RIGHT_PAREN
            | PLUS F
            | MINUS F
            | NUMBER
```

The non-terminals in the grammar are represented by `exp`, `E`, `T`, and `F`. Terminals are tokens such as `PLUS`, `MINUS`, `MULT`, `DIV`, `LEFT_PAREN`, `RIGHT_PAREN`, and `NUMBER`.

## Sample Input and Output

### Sample Input (`input.txt`):

```
2 + 3 * (4 - 1)
5.5 * (2 + 3)
12 / 4 - 1
```

### Sample Output:

```
11
27.5
2
```

## How to Use

1. Compile the Lex and Yacc files to generate the parser and lexer:
   ```
   lex lexer.l
   yacc -d parser.y
   gcc lex.yy.c y.tab.c -o calculator -lm
   ```

2. Create an input file (e.g., `input.txt`) with the arithmetic expressions you want to parse.

3. Run the parser:
   ```
   ./calculator
   ```

   The parser will read the expressions from the input file and print the results to the console.

4. You can modify the `input.txt` file to test different arithmetic expressions.

## Error Handling

If an invalid character is encountered in the input, the parser will report an error and exit. It will also display the line number and the problematic character.

## Notes

- The `%union` section in the Yacc file is used to specify the type of semantic values associated with the non-terminals and terminals. In this case, it uses `double` for the semantic value of `NUMBER`.
- The `yyerror` function is called when a syntax error is encountered during parsing. It displays an error message along with the line number and the problematic text.

Feel free to use this Lex and Yacc implementation as a starting point for more complex parsing and evaluation tasks involving arithmetic expressions.