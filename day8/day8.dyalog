      f←{
            y←⍸⍵=p
            max←((≢p)*(0.5))
            mask←,~(⍳≢y) ∘.≤ ⍳≢y
            pairs←mask/,{2 2⍴⍵}¨y∘.,y
            diff←-⌿¨pairs
            nodes←⊃,/{{⊂⍵}⍤1⊢⍵}¨pairs+{2 2⍴⍵,(¯1×⍵)}¨diff
            nodes/⍨{∧/(0<⍵ ^ max≥⍵)}¨nodes
      }

      f←{ y←⍸⍵=p ⋄ max←((≢p)*(0.5)) ⋄ mask←,~(⍳≢x1) ∘.≤ ⍳≢x1 ⋄ pairs←mask/,{2 2⍴⍵}¨y∘.,y ⋄ diff←-⌿¨pairs ⋄ nodes←⊃,/{{⊂⍵}⍤1⊢⍵}¨pairs+{2 2⍴⍵,(¯1×⍵)}¨diff ⋄ nodes/⍨{∧/max>⍵}¨nodes }

      m←(≢p)*(0.5)
      p←m m⍴p
      
      ∪p~'.' '#'