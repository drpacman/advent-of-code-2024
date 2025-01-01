⎕PP←20
input←⍎¨⊃⎕NGET'input'1
bin←{(35⍴2)⊤⍵}
pr←{(11⍴0),(¯24)↑⍵}
sl←{⍵↓⍺,(⍵⍴0)}
sr←{(⍵⍴0),(¯1×⍵)↓⍺}
calc←{ 2⊥pr (b sl 11)≠b←pr (a sr 5)≠a←pr (s sl 6)≠s←bin ⍵ }
⎕←+/calc⍣2000¨input

calc2←{⍺←10|⍵ ⋄ 2001≡≢⍺:⍺ ⋄ n←calc ⍵ ⋄ (⍺,10|n)∇ n}
y←calc2 ¨input
seq←{4,/2-⍨/⍵}¨y
mask←∊≠¨seq
⌈/(⊃,/seq){+/⍵}⌸⍥(mask/⊢)(⊃,/4↓¨y)