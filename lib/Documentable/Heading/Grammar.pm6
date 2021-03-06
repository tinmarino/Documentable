unit grammar Documentable::Heading::Grammar;

token operator    { infix  | prefix   | postfix  | circumfix | postcircumfix | listop }
token routine     { sub    | method   | term     | routine   | submethod     | trait  }
token syntax      { twigil | constant | variable | quote     | declarator             }
token subkind     { <routine> | <syntax> | <operator> }
token name        { .*  } # is rw
token single-name { \S* } # infix

rule the-foo-infix {^\s*[T|t]'he' <single-name> <subkind>\s*$}
rule infix-foo     {^\s*<subkind> <name>\s*$}

rule TOP { <the-foo-infix> | <infix-foo> }
