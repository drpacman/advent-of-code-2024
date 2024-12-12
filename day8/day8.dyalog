      p←↑⊃⎕NGET'input'1
      f←{
            y←⍸⍵=⍺
            m←≢(1⌷⍺)
            mask←,~(⍳≢y) ∘.≤ ⍳≢y
            pairs←mask/,{2 2⍴⍵}¨y∘.,y
            diff←-⌿¨pairs
            nodes←⊃,/{{⊂⍵}⍤1⊢⍵}¨pairs+{2 2⍴⍵,(¯1×⍵)}¨diff
            nodes/⍨{∧/(0<⍵ ^ m≥⍵)}¨nodes
      }

      ≢∪⊃,/{p f ⍵}¨(∪,p)~'.' '#'