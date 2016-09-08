// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

  // reseting the answer
  @R2
  M=0

  // loading the first operator
  @R0
  D=M

  // if its zero, just go to the end
  @END
  D;JEQ

  // if not, it counts how many times we sum the second operator
  @times
  M=D
  
  // loading the second operator
  @R1
  D=M

  // if its zero, just go to the end
  @END
  D;JEQ

  // here we keep its value
  @value
  M=D

(LOOP)
  // adding value one time
  @value
  D=M
  @R2
  M=D+M
  
  // computing how many times we must add the value
  @times
  D=M-1
  M=D
  @LOOP
  D;JGT

(END)
  @END
  0;JMP