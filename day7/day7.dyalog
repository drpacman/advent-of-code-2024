p←⍎¨¨'\d+'⎕S'&'¨⊃⎕NGET'input'1

f←{
     1=≢⍵:⍺=⍵
     0=≢⍵:0
     v r←(¯1↑⍵) (¯1↓⍵)
     0=(v|⍺):((⍺÷v)∇r)+(⍺-v)∇r
     (⍺-v)∇r
 }

+/⊃¨p/⍨1≤{⊃(⊃⍵) f (1↓⍵)}¨p