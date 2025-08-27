#  Greatest Common Divisor (GCD)

![GCD Illustration](https://github.com/user-attachments/assets/9edd5ec5-dbda-4a27-8e8d-c64976cb906a)

The **Greatest Common Divisor (GCD)** — also called **HCF (Highest Common Factor)** — of two integers *A* and *B* is the largest integer that divides both *A* and *B*.

---

##  The Euclidean Algorithm

The Euclidean Algorithm is an efficient method for computing GCD:

1. If **A = 0** → `GCD(A, B) = B`  
2. If **B = 0** → `GCD(A, B) = A`  
3. Otherwise, write `A = B⋅Q + R` (quotient-remainder form)  
   - Then `GCD(A, B) = GCD(B, R)`

![Euclidean Algorithm](https://github.com/user-attachments/assets/624679bd-b320-410c-a97c-4c913f1a6e20)

---

##  Hardware Design Overview

For complex digital systems, the design is split into two main parts:

1. **Datapath** – Performs computations  
2. **Control Path** – Directs the datapath using FSM (Finite State Machine)

---

### 🔹 Datapath Components

- **PIPO Register (16-bit):** Stores inputs *A* and *B* in parallel.  
- **Multiplexers (MUX):** Route appropriate operands to the subtractor.  
- **Comparator (16-bit):** Compares *A* and *B* → outputs signals `lt`, `gt`, `eq`.  
- **Subtractor (16-bit):** Computes `A - B` or `B - A`.  
- **Bus (16-bit):** Handles data flow between components.  

![Datapath Block Diagram](https://github.com/user-attachments/assets/8b646ed2-6557-45d1-ba76-72712ac8d6de)

---

### 🔹 Control Path (FSM)

The **FSM** generates control signals to orchestrate datapath operations:

- `ldA`, `ldB` → Load inputs into registers  
- `lt`, `gt`, `eq` → Comparator outputs  
- `sel1`, `sel2`, `sel_load` → Multiplexer controls  

**FSM Role:**  
- Continuously monitors comparator outputs  
- Decides subtraction sequence  
- Updates registers until final GCD is found  

![FSM Diagram](https://github.com/user-attachments/assets/6443fe65-8161-4c44-80c4-5d0c76a327a3)

---
**Datapath and Controller**
![image](https://github.com/user-attachments/assets/ac48f8b3-5c19-483f-8dce-a6270dfdd245)

##  Algorithm Proof (Why It Works)

- `GCD(A, 0) = A`  
- `GCD(0, B) = B`  
- If `A = B⋅Q + R` → `GCD(A, B) = GCD(B, R)`

This recursive reduction ensures the problem gets smaller at each step.

![Proof Illustration](https://github.com/user-attachments/assets/9f205de7-5f7a-47a7-8152-39367257a92c)

---

##  Simulation Output

| Console Output  | Simulation Waveform  |
|-----------------------|-----------------------|
| ![Wave1](https://github.com/user-attachments/assets/c963d054-590e-4a4c-89fe-f0487b849f5d) | ![Wave2](https://github.com/user-attachments/assets/446b4ad5-473f-495e-ae71-e2b013713dd1) |

---

##  Example: GCD(270, 192)

1. `270 = 192 × 1 + 78` → `GCD(270,192) = GCD(192,78)`  
2. `192 = 78 × 2 + 36` → `GCD(192,78) = GCD(78,36)`  
3. `78 = 36 × 2 + 6` → `GCD(78,36) = GCD(36,6)`  
4. `36 = 6 × 6 + 0` → `GCD(36,6) = GCD(6,0)`  
5. `GCD(6,0) = 6`  

 Final Answer:  
**GCD(270,192) = 6**

---

##  Least Common Multiple (LCM)

The **LCM** of two numbers is the smallest positive integer divisible by both.

**Formula:**  
\[
LCM(A, B) = \frac{A \times B}{GCD(A, B)}
\]

**Example:**  
- `LCM(270,192) = (270 × 192) / 6 = 8640`


---

##  Summary

- Implemented **Euclidean Algorithm** in hardware using Datapath + FSM.  
- Verified through **simulation waveforms**.  
- Demonstrated with real example: `GCD(270,192)=6`, `LCM(270,192)=8640`.  

---
