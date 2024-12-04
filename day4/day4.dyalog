⎕IO←0
p←⊃⎕NGET'input_test'1
findXmas←{+/{+/'XMAS'⍷⍵}¨⍵}
zipWithIndex←{↓⍉↑(⍳≢⍵) ⍵}
rot←{{{(⊃⍵)↓(⊃⌽⍵)}¨zipWithIndex ⍵}↓⍉↑{(⊃⍵)⌽(⊃⌽⍵)}¨zipWithIndex←↓⍉↑ ⍵}
+/findXmas ¨ (p) (↓⌽↑p) (↓⍉↑p) (↓⌽⍉↑p) (rot p) (rot ↓⌽↑p) (rot ↓⍉↑p) (rot ↓⌽⍉↑p)