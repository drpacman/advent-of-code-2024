p←⍎¨¨'-?\d+'⎕S'&'¨⊃⎕NGET'input'1

xmax←101
ymax←103      
r←100{xmax ymax|+⌿2 2⍴1 1 ⍺ ⍺ × ⍵}¨p
×/{≢⍵}⌸m/⍨0≠m←h¨r

draw←{'*'@(1+⍵)⊢(xmax ymax)⍴' '}
⍝ find max of continguous groups to use as an indicator of something worth drawing
count←{⌈/(1⊃¨⍵){+/1=¨|2-/⍵[⍋⍵]}⌸2⊃¨⍵}
test←{m←⍵{xmax ymax|+⌿2 2⍴1 1 ⍺ ⍺ × ⍵}¨p ⋄ n←count m⋄ n<20:0 ⋄ ⎕←'Result' ⍵ ⋄ ⎕←draw m}
{test ⍵}¨(⍳1E4)
