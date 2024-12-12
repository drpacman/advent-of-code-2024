p←↑⊃⎕NGET'input'1
f←{
     q t←⍵
     y←⍸q=⍺
     m←≢(1⌷⍺)
     mask←,~(⍳≢y)∘.≤⍳≢y
     pairs←mask/,{2 2⍴⍵}¨y∘.,y
     diff←-⌿¨pairs
     nodes←⊃,/{{⊂⍵}⍤1⊢⍵}¨⊃,/,/{n←⍵ ⋄ pairs+{2 2⍴(n×⍵),(¯1×n×⍵)}¨diff}¨t
     nodes/⍨{∧/(0<⍵∧m≥⍵)}¨nodes
}
g←{q←⍵ ⋄ ≢∪⊃,/{p f (⍵ q)}¨(∪,p)~'.' '#'}
g 1 ⍝ Part 1
g ¯1+⍳≢(1⌷p) ⍝ Part 2
