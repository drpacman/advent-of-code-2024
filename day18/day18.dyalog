n←(0 1)(0 ¯1)(1 0)(¯1 0)
max file steps←6 'input_test' 12
max file steps←70 'input' 1024
moves←⍎¨¨'\d+'⎕S'&'¨⊃⎕NGET file 1
prep←{ '#'@(⊂¨⍵↑moves)⊢0@(⊂0 0)⊢(1+(2⍴max))⍴'.' }

path←{
    n1←(⍸'.'=m)∩next/⍨∊{y x←⍵ ⋄ (x≥0)∧(x≤max)∧(y≥0)∧(y≤max)}¨next←,↑{n+⊂⍵}¨⍸⍵=m
    (⍵+1)@n1⊢m    
 }
m←prep steps
{m⊢←path ⍵}¨⍳1E3
⎕←m[max;max] ⍝ part 1

find←{
    ⍺←(0,≢moves)
    m1 m2←⍺
    (1+(0⊃⍺))=(1⊃⍺):⊃moves[⍵-1]
    m⊢←prep ⍵
    _←{m⊢←path ⍵}¨⍳5E2        
    m[max;max]≡'.': (m1,⍵)∇m1+(⌈2÷⍨(⍵-m1))
    (⍵,m2)∇⍵+(⌈2÷⍨m2-⍵)
}
⎕←find 1 ⍝ part 2