room moves←p⊆⍨{0<≢⍵}¨p←⊃⎕NGET'input'1
room←↑room
m←⊃,/{{'v'=⍵:(1 0) ⋄ '^'=⍵:(¯1 0) ⋄ '>'=⍵:(0 1) ⋄ '<'=⍵:(0 ¯1)}¨⍵}¨moves
pos←⍸'@'=room


 update←{
    pos←⍵+⍺
    n←room[⊂pos]
    '.'=n: {
        room[⊂pos]←room[⊂⍵]
        room[⊂⍵]←'.'
        pos
    }⍵
    '#'=n:⍬
    t←⍺ update pos
    0=≢t:⍬
    n←room[⊂pos]
    room[⊂pos]←room[⊂⍵]
    room[⊂⍵]←n
    pos 
 }
 {x←⍵ update ⊃pos ⋄ 0=≢x: ⍬ ⋄ pos⊢←⊂x}¨m
 +/{100 1+.×⍵}¨¯1+⍸'O'=room ⍝ Part 1