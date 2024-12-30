⎕IO←0
bin←{(32⍴2)⊤⍵}
a b c p←⍎¨¨m/⍨{~0=≢⍵}¨m←'\d+'⎕S'&'¨⊃⎕NGET'input' 1
reg←0 1 2 3, a, b, c, 0 0, (⍬)
      
ins←{
     in←p[reg[7]]
     op←p[reg[7]+1]
     _ ← {
         0=in: reg[4]←⌊reg[4]÷(2*reg[op])
         1=in: reg[5]←2⊥(bin reg[5])≠(bin op)
         2=in: reg[5]←8|reg[op]
         (3=in) ∧ (0=reg[4]):0  
         3=in: reg[7]←(op-2)
         4=in: reg[5]←2⊥(bin reg[5])≠(bin reg[6])
         5=in: reg[8],←8|reg[op]
         6=in: reg[5]←2⊥(bin reg[4])÷(2*reg[op])
         7=in: reg[6]←2⊥(bin reg[4])÷(2*reg[op])
     } ⍬
     reg[7]+←2
     reg[8]    
 }
 {ins ⍵}⍣{reg[7]≥≢p}⊢⍬