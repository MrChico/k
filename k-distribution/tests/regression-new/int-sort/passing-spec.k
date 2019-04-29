module PASSING-SPEC
    imports INT-SORT
    rule <k> KSDIV A #unsigned(B) => #sgnInterp(sgn(A) *Int sgn(#unsigned(B)), abs(A) /Int abs(#unsigned(B))) </k>
    requires B =/=Int 0
endmodule
