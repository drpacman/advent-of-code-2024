Learn some Dyalog APL...

Examples executed with Dyalog RIDE IDE

# Commands 
* ```]file.Edit 'day1.dyalog'``` - edit the file
* ```]LINK.Create # <dirname>``` - create a link between default namespace and a directory
* ```]box on -f=on``` - turn on rich box display including in functions
* ```⎕PP←nnn``` - set precision for display to nnn decimal places
* ```⎕PW←nnn``` - set line length for display to nnn chars

Set the environment variable MAXWS before launching to change the max workspace size, e.g. ```MAXWS=4G```

# Useful Links
* [RIDE user manual](https://docs.dyalog.com/17.0/RIDE%20User%20Guide.pdf)
* [Learn APL](https://xpqz.github.io/learnapl/) - a book/tutorial
* [Adventures in APL](https://www.youtube.com/watch?v=sx7LU3oicFY) - a walk through of 
some solutions of AoC from 2023 by domain experts
* [Dyalog course](https://course.dyalog.com/)
* Jay Foad's AoC solutions from previous years
    * [2018](https://github.com/jayfoad/aoc2018apl)
    * [2019](https://github.com/jayfoad/aoc2019apl)
    * [2020](https://github.com/jayfoad/aoc2020apl)
    * [2021](https://github.com/jayfoad/aoc2021apl)
    * [2022](https://github.com/jayfoad/aoc2022apl)
    * [2023](https://github.com/jayfoad/aoc2023apl)
* [Expert level solutions to learn from](https://github.com/pitr/aoc/tree/main/2024)

# Notes
* Reduce (/) consumes from right to left of the input e.g. 
```
{⎕←⍺ ⍵ ⋄ ⍺+⍵}/⍳3
2 3
1 5
6
```
* Monadic ≠ creates a mask of the first occurance of each unqiue value in an array
* n{f}/m will create an n window application of f over m e.g.
  ```
  m←1 2 3
  2+/m
  ```
  prints out ```3 5``` 
