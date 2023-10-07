# Yacc (Bison) and Lex (Flex) for Arithmetic Expressions

This is a Yacc (Bison) and Lex (Flex) implementation for parsing and evaluating arithmetic expressions. It supports a variety of mathematical operations, including addition, subtraction, multiplication, division, exponentiation, modulus, trigonometric functions, logarithms, bitwise operations, and more. The code is designed to handle both integer and floating-point numbers.

## Files

1. `lexer.l`: Lex specification file that defines the tokens and their corresponding actions.
2. `parser.y`: Yacc (Bison) specification file that defines the grammar and semantic actions.
3. `y.tab.h` and `y.tab.c`: Generated files from Yacc that contain the parser implementation.
4. `lex.yy.c`: Generated file from Lex that contains the lexer implementation.
5. `input.txt`: Sample input file containing arithmetic expressions.

## Grammar

The grammar for this arithmetic expression parser is extensive, supporting a wide range of mathematical operations. Some key features include:

- Arithmetic operations: `+`, `-`, `*`, `/`, `^`, and `%` (exponentiation and modulus).
- Trigonometric functions: `SIN`, `COS`, `TAN`.
- Logarithmic function: `LOG`.
- Square root function: `SQRT`.
- Bitwise operations: `AND`, `OR`, `XOR`(X).

The grammar is defined in the Yacc file (`parser.y`) and uses precedence and associativity rules to handle operator precedence correctly.

## Attributes

- The `%union` section in the Yacc file specifies that the semantic values associated with tokens are of type `double`.
- Various attributes are assigned to tokens and non-terminals, allowing the parser to perform calculations and transformations as needed.

## Sample Input and Output

### Sample Input (`input.txt`):

```
5 + 3 * (4 - 2)
sin(0.5) * (2 + 3)
12 / 4 - 1
2 ^ 3
10 % 4
log(100)
sqrt(16)
15 & 7
5 | 3
6 X 3
```

### Sample Output:

```
Answer = 11
Answer = 2.39713
Answer = 2
Answer = 8
Answer = 2
Answer = 4.60517
Answer = 4
Answer = 7
Answer = 7
Answer = 5
```

## How to Use

1. Compile the Lex and Yacc files to generate the parser and lexer:

   ```
   flex lexer.l
   bison -d parser.y
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

The parser performs basic error checking, such as detecting division by zero and modulus by zero. It also handles invalid characters and reports syntax errors with line numbers and the problematic text.

## Additional Notes

- This implementation is designed for educational purposes and may require further refinement and validation for production use.
- The code supports both integer and floating-point numbers, and it automatically promotes the result to a floating-point number when necessary.
- It's important to note that bitwise operations (`AND`, `OR`, `XOR`) are only allowed on integer values.