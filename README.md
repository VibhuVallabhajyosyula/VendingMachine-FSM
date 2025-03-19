The vending_machine module is a finite state machine (FSM) designed to simulate the behavior of a vending machine. It operates based on inputs representing coins of different denominations (5rs and 10rs) and produces outputs to vend an item or return change. The FSM consists of three states (s0, s1, s2), where each state corresponds to the total amount inserted. The module's behavior is controlled by a clock signal (clk) and can be reset using the reset signal (rst).The FSM transitions between its states based on the combination of coins inserted (a) and ensures correct vending and change management for seamless operation.

If 15rs is inserted (either as 5rs + 10rs, 10rs + 5rs, or 5rs + 5rs + 5rs), the machine vends the product (b = 1) and returns no change (change = 00).
If 20rs is inserted (10rs + 10rs or 10rs + 5rs + 5rs), the machine vends the product (b = 1) and returns 5rs as change (change = 01).
If less than 15rs is inserted, the machine does not vend the product (b = 0) and returns the inserted amount as change.

1. clk           : Clock signal that triggers FSM state transitions on its positive edge.  
2. rst           : Reset signal that initializes the FSM to the default s0 state when active.  
3. a             : A 2-bit input representing the coin inserted (00 = no coin, 01 = 5rs, 10 = 10rs).  
4. b             : A 1-bit output indicating if an item is vended (1 means item dispensed).  
5. change        : A 2-bit output specifying the change returned by the machine (01 = 5rs, 10 = 10rs).  
6. s0            : Parameter representing the initial/reset state of the FSM.  
7. s1            : Parameter representing the state where a total of 5rs is accumulated.  
8. s2            : Parameter representing the state where a total of 10rs or more is accumulated.  
9. present_state : A 2-bit register that holds the current state of the FSM.
10.next_state    : A 2-bit register that determines the FSM’s next state based on inputs.  
