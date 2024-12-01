p←⍉↑⍎¨⊃⎕NGET'input'1
+/|-⌿{⍵[⍋⍵]}⍤1⊢p ⍝ part1
+/,{⍵×+/⍵=1⌷p}¨⍪0⌷p ⍝ part2