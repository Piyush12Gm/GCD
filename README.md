![image](https://github.com/user-attachments/assets/9edd5ec5-dbda-4a27-8e8d-c64976cb906a)# GCD
Greatest Common Divisor (HCF or Highest Common Factor )

## The Euclidean Algorithm ##
the Greatest Common Divisor (GCD) of two integers A and B is the largest integer that divides both A and B.
![image](https://github.com/user-attachments/assets/624679bd-b320-410c-a97c-4c913f1a6e20)

## The Algorithm
The Euclidean Algorithm for finding GCD(A,B) is as follows:
If A = 0 then GCD(A,B)=B, since the GCD(0,B)=B, and we can stop.  
If B = 0 then GCD(A,B)=A, since the GCD(A,0)=A, and we can stop.  
Write A in quotient remainder form (A = B⋅Q + R)
Find GCD(B,R) using the Euclidean Algorithm since GCD(A,B) = GCD(B,R)

For complex digital systems we 
normally do not design the whole hardware in one piece. They are typically partitioned 
in to two parts -   1.Data Path        2.Control Path
## Data Path 
It consists of the functional units, where all the computations are carried out.
They will consist of typically some registers to store some data, multiplexers, 
BUS, the adders, subtractors, multipliers, counters and similar functional blocks. So, in a 
data path, there are a lot of hardware and things which are there, but we are not 
specifying or telling exactly what to do with those hardware. 
![image](https://github.com/user-attachments/assets/8b646ed2-6557-45d1-ba76-72712ac8d6de)


## PIPO Register (Parallel In Parallel Out 16-bit Register):
It is used to store the two 16-bit input numbers, A and B, simultaneously, allowing them to be processed in parallel throughout the algorithm.

## Multiplexers:
These are used to select and send the appropriate operands, either A or B, to the subtractor based on the comparison results, ensuring the correct value is subtracted.

## Comparator (16-bit 2-word Comparator):
This element compares the two numbers, A and B, and produces signals indicating whether A is less than, greater than, or equal to B, guiding the next operation in the datapath.

## Subtractor (16-bit Subtractor):
It subtracts the appropriate value, either A from B or B from A, based on the comparison, and the result is fed back to update the respective register.

## Bus (16-bit Data Bus):
This bus fetches input data and supplies it to the registers A and B, while also receiving the output from the subtractor to update the registers as needed, ensuring the data flow within the system.

In the Control Path Design, the finite state machine (FSM) is responsible for handling the control signals and orchestrating the operation of the datapath elements. Below is a breakdown of the key control signals and their roles, followed by the wire connections:

## Control Signals (Handled by FSM)
ldA and ldB (Load A and Load B): These are control signals used to load the input values into registers A and B, respectively. The FSM triggers these signals when new values are fetched from the bus.
lt, gt, and eq (Comparator Output Signals):
These are the output signals from the comparator.
lt (less than): Activated when A < B.
gt (greater than): Activated when A > B.
eq (equal): Activated when A = B.
The FSM uses these signals to determine the next steps in the algorithm, such as deciding which number should be subtracted from the other.
3. sel1, sel2, sel_load (Select Signals for Multiplexers):

## These control signals are used to manage the multiplexers:
sel1: Selects the input for MUX1, which is responsible for routing the value of register A or the result from the subtractor to the next step.
sel2: Selects the input for MUX2, which routes the value of register B or the subtractor output.
sel_load: Manages the selection for loading either new data from the bus or the subtractor output into registers A or B.
Wires (Data Path Connections)
Aout and Bout (16-bit wires from register A and B):
Aout: Carries the 16-bit data output from register A.
Bout: Carries the 16-bit data output from register B.
These wires feed into the multiplexers (MUX1 and MUX2), as well as the comparator.
2. x and y (16-bit wires from MUX1 and MUX2 to the Subtractor):

x: 16-bit wire from MUX1 to the subtractor, carrying either A or the appropriate value based on FSM control.
y: 16-bit wire from MUX2 to the subtractor, carrying either B or the required value based on FSM control.
3. BUS (16-bit common data bus):

A shared 16-bit bus used for transferring input data to the PIPO registers (A and B) and receiving results from the subtractor or external sources.
4. subout (16-bit result wire from Subtractor):

This wire carries the result from the subtractor and is fed into MUXes and the bus as needed for updating registers A or B, based on control signals.

## FSM Role in Control Signal Management:
The FSM continuously monitors the comparator’s outputs (lt, gt, eq) and accordingly sets the control signals (ldA, ldB, sel1, sel2, sel_load) to perform the subtraction and comparison operations in sequence. It ensures the correct data flows through the wires and triggers the appropriate registers to load or update, guiding the datapath toward the final result.

![image](https://github.com/user-attachments/assets/6443fe65-8161-4c44-80c4-5d0c76a327a3)

![image](https://github.com/user-attachments/assets/ac48f8b3-5c19-483f-8dce-a6270dfdd245)



## Understanding the Euclidean Algorithm
GCD(A,0) = A
GCD(0,B) = B
If A = B⋅Q + R and B≠0 then GCD(A,B) = GCD(B,R) where Q is an integer, R is an integer between 0 and B-1
The first two properties let us find the GCD if either number is 0. The third property lets us take a larger, more difficult to solve problem, and reduce it to a smaller, easier to solve problem.
The Euclidean Algorithm makes use of these properties by rapidly reducing the problem into easier and easier problems, using the third property,  until it is easily solved by using one of the first two properties.
We can understand why these properties work by proving them.
We can prove that GCD(A,0)=A is as follows:
The largest integer that can evenly divide A is A.
All integers evenly divide 0, since for any integer, C, we can write C ⋅ 0 = 0. So we can conclude that A must evenly divide 0.
The greatest number that divides both A and 0 is A.
The proof for GCD(0,B)=B is similar. (Same proof, but we replace A with B).
To prove that GCD(A,B)=GCD(B,R) we first need to show that GCD(A,B)=GCD(B,A-B).
![image](https://github.com/user-attachments/assets/9f205de7-5f7a-47a7-8152-39367257a92c)



## Simulation Output 
![image](https://github.com/user-attachments/assets/c963d054-590e-4a4c-89fe-f0487b849f5d)

![image](https://github.com/user-attachments/assets/60f42d66-a877-4709-82a7-961ed3bc977f)





## Example:
Find the GCD of 270 and 192
A=270, B=192
A ≠0
B ≠0
Use long division to find that 270/192 = 1 with a remainder of 78. We can write this as: 270 = 192 * 1 +78
Find GCD(192,78), since GCD(270,192)=GCD(192,78)
A=192, B=78
A ≠0
B ≠0
Use long division to find that 192/78 = 2 with a remainder of 36. We can write this as:
192 = 78 * 2 + 36
Find GCD(78,36), since GCD(192,78)=GCD(78,36)
A=78, B=36
A ≠0
B ≠0
Use long division to find that 78/36 = 2 with a remainder of 6. We can write this as:
78 = 36 * 2 + 6
Find GCD(36,6), since GCD(78,36)=GCD(36,6)
A=36, B=6
A ≠0
B ≠0
Use long division to find that 36/6 = 6 with a remainder of 0. We can write this as:
36 = 6 * 6 + 0
Find GCD(6,0), since GCD(36,6)=GCD(6,0)
A=6, B=0
A ≠0
B =0, GCD(6,0)=6
So we have shown:
GCD(270,192) = GCD(192,78) = GCD(78,36) = GCD(36,6) = GCD(6,0) = 6
## GCD(270,192) = 6


## LCM (Least Common Multiple)
The Least Common Multiple (LCM) of two numbers is the smallest positive number that is evenly divisible by both of them.

![image](https://github.com/user-attachments/assets/43c01262-3ead-4545-adda-38c1402eb025)
## Example
Find the GCD of 270 and 192
LCM(270,192)  = (270 * 192)/GCD(270,192)
LCM(270,192)  =  51,840 / 6 
## LCM(270,192)  =  8,640

