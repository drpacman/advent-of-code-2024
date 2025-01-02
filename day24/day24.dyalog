w g←p⊆⍨0≠≢¨p←⊃⎕NGET'input_test'1
w←'[0-9xy]+'⎕S'&'¨w 
g←'[A-Za-z0-9]+'⎕S'&'¨g
W←m/⍨{~∨/⎕A∊⍵}¨m←∪,↑g
W←W[⍋W]
V←(≢W) ⍴ 0
V[W⍳⊃¨w]←{⍎2⊃⍵}¨w
2⊥⌽({'z'∊⍵}¨W)/tick⍣≡⊢V

tick←{
     v←⍵
     _ ← {
         a X b c←⍵
         A B C←{W ⍳ ⊂ ⍵}¨ a b c 
         'XOR'≡X:v[C]←v[A]≠v[B]
         'OR'≡X:v[C]←v[A]∨v[B]
         'AND'≡X:v[C]←v[A]∧v[B]
     } ¨ g
     v
}