p←↑⍎¨¨⊃⎕NGET'input_test'1
m←(0 1)(1 0)(0 ¯1)(¯1 0)
f←{ 
    ⍺←1 
    10=⍺:≢⍵ 
    y1←⍸⍺=p
    y2←,↑{⍵∘+¨m}¨⍵
    (⍺+1)∇(y1∩y2)
}
+/{f ⊂⍵}¨(⍸0=p) ⍝ Part 1

g←{
     ⍺←1
     10=⍺:⍵
     y1←⍸⍺=p
     z←∪↑,/{
        x←¯1↑⍵
        y2←y1∩⊢(⊃x)∘+¨m
        (⊂⍵){⍺,⊂⍵}¨y2
     }¨⍵
     (⍺+1)∇z
 }
 ≢⊃,/{g ⊂⊂⍵}¨(⍸0=p) ⍝ Part 2