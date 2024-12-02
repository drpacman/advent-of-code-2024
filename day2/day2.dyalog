p ← ⍎¨⊃⎕NGET'input'1
pairs ← {-/¨2,/⍵}¨p
+/^/¨3≥|pairs/⍨{n←×⍵ ⋄ ∧/n=n[0]}¨pairs ⍝ Part 1

entries←{-/¨2,/⍵}¨¨{n←⍵ ⋄ {(⍵↑n),(⍵+1)↓n}¨⍳≢n}¨p
+/{q ← ⍵ ⋄ ∨/^/¨3≥|q/⍨{n←×⍵ ⋄ ∧/n=n[0]}¨q}¨entries ⍝ Part 2