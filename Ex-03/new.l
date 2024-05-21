%option noyywrap

letter [a-zA-Z]
digit [0-9]
id [_a-zA-Z]
AO [+|\-|/|%|*]
RO [<|>|<=|>=|==]
pp [#]

%{
#include <stdio.h>
int n = 0;
%}

%%
"void"                { printf("%s return type\n", yytext); }
{letter}*[(][)]       { printf("%s Function\n", yytext); }
"int"|"float"|"if"|"else"|"printf" { printf("%s keywords\n", yytext); }
{id}({id}|{digit})*   { printf("%s Identifier\n", yytext); }
{digit}+              { printf("%s Numbers\n", yytext); }
{AO}                  { printf("%s Arithmetic Operators\n", yytext); }
{RO}                  { printf("%s Relational Operators\n", yytext); }
{pp}{letter}[<]{letter}[.]{letter}[>] { printf("%s processor Directive\n", yytext); }
\n                    { n++; }
"."|","|"}"|"{"|";"   { printf("%s others\n", yytext); }
%%

int main() {
    yyin = fopen("sample.c", "r");
    if (!yyin) {
        perror("Failed to open file");
        return 1;
    }
    yylex();
    printf("No of Lines %d\n", n);
    fclose(yyin);
    return 0;
}
