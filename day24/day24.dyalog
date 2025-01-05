⎕IO←0
w g←p⊆⍨0≠≢¨p←⊃⎕NGET'input'1
w←'[0-9xy]+'⎕S'&'¨w 
g←'[A-Za-z0-9]+'⎕S'&'¨g
W←m/⍨{~∨/⎕A∊⍵}¨m←∪,↑g ⋄ W←W[⍋W]
V←(≢W) ⍴ 0 ⋄ V[W⍳⊃¨w]←{⍎1⊃⍵}¨w

tick←{
     m←⍵
     _ ← {
         a X b c←⍵
         A B C←{W ⍳ ⊂ ⍵}¨ a b c 
         'XOR'≡X:m[C]←m[A] ≠ m[B]
         'OR'≡X:m[C]←m[A] ∨ m[B]
         'AND'≡X:m[C]←m[A] ∧ m[B]
     } ¨ g
     m
}

2⊥⌽({'z'∊⍵}¨W)/tick⍣≡⊢V

⍝ Full Adder circuit should look like this
⍝ x00 XOR y00 = z00
⍝  (xN XOR yN) XOR c(N-1) -> zN
⍝ ((xN XOR yN) AND c(N-1)) OR (xN AND yN) -> cN

⍝ Sort the gate inputs alphabetically
G←{a X b c←⍵ ⋄ m ← a b ⋄ a b ←m[⍋m] ⋄ a X b c }¨g
G←G[⍋G]

⎕IO←0
A_AND_B←g/⍨{a X b c ← ⍵ ⋄ (X≡'AND')∧'x'≡⊃a}¨g
A_XOR_B←g/⍨{a X b c ← ⍵ ⋄ (X≡'XOR')∧'x'≡⊃a}¨g

⍝ No AND gate outputs should be a Z output wire
E1←3⊃¨G/⍨{a X b c←⍵ ⋄ (X≡'AND')∧('z'=⊃c)}¨G
⍝ OR gate outputs are carry results, only the last one should be a Z output wire
E2←3⊃¨G/⍨{a X b c←⍵ ⋄ (X≡'OR')∧('z'=⊃c)∧('z45'≢c)}¨G
⍝ XOR gates which don't involve the initial input wires should all be a Z output wire
E3←3⊃¨G/⍨{a X b c←⍵ ⋄ (X≡'XOR')∧('x'≠⊃a)∧('z'≠⊃c)}¨G
⍝ No XOR outputs should appear in OR statements
E4←m/⍨0<≢¨m←{a X b c←⍵ ⋄ t←3⊃¨A_XOR_B ⋄ (X≡'OR')∧((⊂a)∊t):a ⋄ (X≡'OR')∧((⊂b)∊t):b ⋄ ⍬}¨G
⍝ No AND outputs should appear in XOR statements apart from the first
E5←m/⍨0<≢¨m←{a X b c←⍵ ⋄ t←3⊃¨A_AND_B/⍨{⊂'x00'≢⊃⍵}¨A_AND_B ⋄ (X≡'XOR')∧((⊂a)∊t):a ⋄ (X≡'XOR')∧((⊂b)∊t):b ⋄ ⍬}¨G

⎕←⊃{⍺,',',⍵}/E[⍋E] ⍝ Part 2

⍝ qrh swap with z38
⍝ jmq swap with z06
⍝ gmh swap with z13
⍝ cbd swap with rqf

