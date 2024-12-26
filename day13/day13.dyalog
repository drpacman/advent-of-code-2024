p←⍎¨¨x/⍨0≠≢¨x←'\d+'⎕S'&'¨⊃⎕NGET'input'1

result←{
     x y z←⍵ 
     r←(⍺+z)⌹⍉2 2⍴x,y
     0=r≡⌊r:0
     ⌊r
}

f←{ +/{3 1+.×⍵}¨↓⍵ result⍤1⊢((3÷⍨≢p)3⍴p) }
f 0 ⍝ Part 1
f 10000000000000 ⍝ Part 2