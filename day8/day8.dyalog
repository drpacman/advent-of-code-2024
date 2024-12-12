p←↑⊃⎕NGET'input'1
f←{
     y←⍸⍵=⍺
     m←≢(1⌷⍺)
     mask←,~(⍳≢y)∘.≤⍳≢y
     pairs←mask/,{2 2⍴⍵}¨y∘.,y
     diff←-⌿¨pairs
     nodes←⊃,/{{⊂⍵}⍤1⊢⍵}¨⊃,/,/{n←⍵ ⋄ pairs+{2 2⍴(n×⍵),(¯1×n×⍵)}¨diff}¨q
     nodes/⍨{∧/(0<⍵∧m≥⍵)}¨nodes
 }
q←1
≢∪⊃,/{p f ⍵}¨(∪,p)~'.' '#' ⍝ Part 1
q←¯1+⍳≢(1⌷p)
≢∪⊃,/{p f ⍵}¨(∪,p)~'.' '#' ⍝ Part 2
