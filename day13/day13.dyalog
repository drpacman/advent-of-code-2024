p←⍎¨¨x/⍨0≠≢¨x←'\d+'⎕S'&'¨⊃⎕NGET'input'1

result←{
     x y z←⍵ 
     a←⍉2 2⍴x,y 
     r←(⍺+z)⌹a
     solved←^/⊢{(⍵-⌊⍵)<0.001}¨r
     0=solved:0
     ⌊r
}
f←{
    x←↓⍵ result⍤1⊢((3÷⍨≢p)3⍴p)
    +/{a b←⍵ ⋄ b+3×a}¨x
}
f 0 ⍝ Part 1
f 10000000000000 ⍝ Part 2