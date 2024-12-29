room moves←p⊆⍨{0<≢⍵}¨p←⊃⎕NGET'input'1
room2←↑{∊{'#'=⍵:'##' ⋄ 'O'=⍵:'[]' ⋄ '.'=⍵: '..' ⋄ '@'=⍵: '@.'}¨⍵}¨room
room1←↑room
room←room1
m←⊃,/{'v'=⍵:⊂1 0 ⋄ '^'=⍵:⊂¯1 0 ⋄ '>'=⍵:⊂0 1 ⋄ '<'=⍵:⊂0 ¯1}¨¨moves
pos←⊂⍸'@'=room

update←{
     pos←⍵+⍺
     n←room[pos]
     '.'=n:{
         room[pos]←room[⍵]
         room[⍵]←'.'
         pos
     }⍵
     '#'=n:⍵
     t←⍺ update pos
     pos≡t:⍵
     n←room[pos]
     room[pos]←room[⍵]
     room[⍵]←n
     pos
 }
 {⍺ update ⍵}/⌽pos,m
 +/{100 1+.×⍵}¨¯1+⍸'O'=room ⍝ Part 1

room←room2
