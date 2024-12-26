f←{
     0=⍵:1
     s←⍕⍵
     1=2|≢s:2024×⍵
     m←(2÷⍨≢s)
     (⍎(m↑s)) (⍎(m↓s))
}

h←{ ⍺←1 ⋄ 26=⍺:≢⍵ ⋄ (⍺+1)∇(∊{f ⍵}¨⍵) }

⍝ Got stuck, this is unpacking the answer from https://github.com/pitr/aoc/blob/main/2024/11.apl
⍝ Learning how to use ⌸ from https://chat.stackexchange.com/rooms/52405/conversation/lesson-5-even-more-apl-operators--
⍝ Learning how to use ⍥ from https://xpqz.github.io/learnapl/over.html - X f⍥g Y → (g X)f(g Y)
g←{
     ⍝ generate new values for each of the numbers (the first column)
     updated←f¨⊣/⍵
     ⍝ generate a zero-ed array in the same shape as the newly generated numbers
     entry_shape←0×updated
     ⍝ populate that array with the counts of the input array (the second column)
     counts←(⊢/⍵)+entry_shape
     ⍝ flatten each of counts and updated (using ∊)
     ⍝ then for each unique value (left hand side of ⌸)
     ⍝ generate a row in the table with the corresponding values from counts
     ⍝ with the entry being the unique value (⍺) and the value being the sum of matched 
     ⍝ values (+/⍵)    
     updated{⍺,+/⍵}⌸⍥∊counts
 }

 +/⊢/g⍣75⊢(n,1)

