// Copyright (c) 2019 K Team. All Rights Reserved.

module INT-SORT-SYNTAX
    imports INT
    imports K-EQUAL

    syntax Pgm ::= Instr
    syntax Instr ::= "SDIV"   Int Int
                   | "KSDIV"   Int Int 

    syntax Int ::= sgn ( Int ) [function]
                 | abs ( Int ) [function]

    syntax Int ::= #unsigned ( Int ) [function]

endmodule

module INT-SORT
    imports INT-SORT-SYNTAX

    configuration
      <k> $PGM:Pgm </k>

    rule <k> SDIV W0 W1 => W0 /sWord W1 </k>
    rule <k> KSDIV W0 W1 => W0 /sKWord W1 </k>

    syntax Int ::= Int "/sWord"  Int [function]
                 | Int "/Word"   Int [function]
                 | Int "/sKWord" Int [function]
                 | Int "/KWord"  Int [function]
                 | Int "-Word"  Int [function]

    rule W0 /sWord W1 => #sgnInterp(sgn(W0) *Int sgn(W1) , abs(W0) /Word abs(W1))
    rule W0 /Word W1 => W0 /Int W1   requires W1 =/=Int 0

    rule W0 /sKWord W1 => #sgnInterp(sgn(W0) *Int sgn(W1) , abs(W0) /KWord abs(W1))
    rule W0 /KWord W1 => W0 /Int W1   requires W1 =/=K 0

    syntax Int ::= #sgnInterp ( Int , Int ) [function]

    rule abs(B) =/=K 0 => B =/=K 0
    rule #unsigned(X) =/=K 0 => X =/=K 0

endmodule
