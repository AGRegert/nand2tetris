// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(MainLoop)
  // Reading the value from keyboard
  @KBD
  D=M
  
  // Are we filling the screen? We are if any key is pressed.
  @ClearScreen
  D;JEQ
  @ScreenValue
  M=-1
  @StartFilling
  0;JMP

(ClearScreen)
  @ScreenValue
  M=0
  
(StartFilling)
  // Taking the start address
  @SCREEN
  D=A
  @ScreenPosition
  M=D

  // The screen is 512x256 pixels wide, which 
  // gives us 8192 words of 16bit registers in memory
  @8191
  D=D+A
  
  @ScreenEnd
  M=D
  
(FillWord)
  // getting the selected screen value
  @ScreenValue
  D=M

  // Adjusting the screen position 
  @ScreenPosition
  A=M

  // Filling the screen
  M=D

  // Verifying if we reached the end of the screen
  D=A
  @ScreenEnd
  D=M-D
  @MainLoop // if so, we return to the main loop
  D;JEQ  
  
  // Selecting the next position to write
  @ScreenPosition
  M=M+1

  @FillWord
  0;JMP
