⎕IO←0
p←⊃⎕NGET'input'1

 ⍝ part 1
findXmas←{+/+/¨{'XMAS'⍷⍵}¨(⍵,⌽¨⍵)}
diag←{ ⍺←⍬ ⋄ diag←0 0⍉⍵ ⋄ 3=≢⍵:⍺ ⋄ ⍺,(⊂diag)∇(1↓⍵) }
d←{(diag ⍉⍵),1↓(diag ⍵)}
+/findXmas ¨ (p) (↓⍉↑p) (d ↑p) (d ⌽↑p)

⍝ part 2
q←'*'@(0 1)(1 0)(1 2)(2 1)¨,({⊂⍵}⌺3 3)↑p
r←{(⍉∘⌽)⍣⍺⊢⍵}
+/(+/{(mask)≡⍵}¨q) (+/{(1 r mask)≡⍵}¨q) (+/{(2 r mask)≡⍵}¨q) (+/{(3 r mask)≡⍵}¨q)