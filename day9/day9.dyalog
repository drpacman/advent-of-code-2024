⎕PP←20
p←⍎¨⊃⊃⎕NGET'input'1
n←⌈(≢p)÷2
ids←¯1↓,⍉↑(⍳n) (n⍴0)
f←{ n←⍵⍳0 ⋄ ⍺≤n:⍵ ⋄ b←⍵ ⋄ b[n]←b[⍺] ⋄ b[⍺]←0 ⋄ (⍺-1)∇ b}
q←p/ids
y←(≢q) f q
+/{0≥y[⍵]: 0 ⋄ (¯1+y[⍵])×(¯1+⍵)}¨⍳≢y ⍝ Part 1

q←↓⍉↑ids p
g←{
     1=⍺:⍵
     q←⍵
     a←⍺⍳⍨1⌷⍉↑q
     id n←⊃q[a]
     b←⊃⍸⊢{(⍵[1]=0)∧(⍵[2]≥n)}¨q
     (0=b)∨(b>a):(⍺-1)∇ q
     r←{⍵>n:q[a],⊂(0,⍵-n) ⋄ q[a]}⊢2⌷⊃q[b]
     q←(⊂(0 n))@a⊢q
     (⍺-1)∇((¯1+b)↑q),r,(b↓q)
}
x←n g q
y←(x⌷⍨¨2)/(x⌷⍨¨1)
+/{0≥y[⍵]: 0 ⋄ (¯1+y[⍵])×(¯1+⍵)}¨⍳≢y ⍝ Part 2