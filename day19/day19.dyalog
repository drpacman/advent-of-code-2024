ts←x⊆⍨','≠x←' '⎕R''⊃⊃⎕NGET'input_test'1
xs←2↓⊃⎕NGET'input_test'1
solve←{ 
    x←∪⊃,/{ 
        n←⍵ 
        {(≢⍵)↓n}¨ts/⍨{1≡⊃⍵⍷n}¨ts
    }¨⍵
    0≡≢x:0
    0∊≢¨x:1
    ∇x 
}

 +/solve¨⊂¨xs ⍝ Part 1