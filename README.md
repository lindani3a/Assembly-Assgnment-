# Assembly-Assgnment-

This assignment is about assembly language programming using the MIPS simulator
called SPIM. Open source versions of SPIM, e.g QtSpim, are available for Windows,
Linux, and Mac, and should be able to run on very basic computers. To learn the basics
of MIPS assembly language programming, read A.9 and A.10 in the appendix from
Patterson+Hennessy and a MIPS tutorial by Daniel J. Ellard (both available in >
Resources > Architecture > Additional resources), and watch the tutorial on
https://bit.ly/2ELYa43 .

Question 1 [30 marks]
Write a simple assembly program (question1.asm) that receives three separate lines of
input, in the order 0-1-2, and reorders them according to the following sequence: 2-0-1.
You should store each line in memory.
Sample input/output:
Enter a list of 3 lines:
One
Two
Three
The reordered list is:
Three
One
Two
Question 2 [30 marks]
Write an assembly program (question2.asm) to compute a simple integer sum.
Assume that the input sum has no whitespace and that it is suffixed with an equals sign
‘=’ and that each element of the sum is an integer in [-9..9].
Sample input/output:
Enter a sum: 1+4+5+6-9=
7
Question 3 [40 marks]
Write a program (question3.asm) to complete rotations (clockwise and anti-clockwise) of
a 3 x 3 character matrix. The program must the receive the character matrix line by line
(where each line is a 3 element row) followed by an integer for the number of rotations, 
2
where positive values correspond to clockwise rotations and negative values correspond to
anti-clockwise rotations. Your program must output the final rotated matrix.
Sample input/output:
Enter a 3x3 matrix:
abc
def
hij
-3
hda
ieb
jfc
