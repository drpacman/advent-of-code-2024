g←↑⊃⎕NGET'input_test'1
start←⍸'S'=g
end←⍸'E'=g
moves←(1 0) (¯1 0) (0 1) (0 ¯1)

gWithValues←(2,⍴g)⍴0
gWithValues[1;;]←(¯1×('#'=g))+1E6×('#'≠g)
gWithValues[2;;]←(⍴g)⍴0
gWithValues[;1⊃⊃start;2⊃⊃start]←0 (0 1)

update←{
    1=≢⍵: ⍬
    y x←⍵
    score dir←gWithValues[;y;x]    
    { 
        t←(y x)+⍺        
        value←score+1+1E3×(⍺≢dir)
        v←gWithValues[1;1⊃t;2⊃t]
        v<value:⍵        
        gWithValues[;1⊃t;2⊃t]←value ⍺
        ⍵,⊂t
    }/moves,⊂⍬
 }
 {∪⊃,/{⊃update ⍵}¨⍵}⍣≡⊢start
 ⊃gWithValues[;1⊃⊃end;2⊃⊃end]