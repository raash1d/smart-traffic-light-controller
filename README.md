# Smart Traffic Light System
- A Mealy Finite State Machine (FSM), developed in Verilog, designed to control traffic lights at a crossroad having a major road (main road) and a minor road (side road).
- The main road's lights are always green for the major traffic to pass.
- The main road's lights turn red only when there is a car on either side of the main road i.e. on the side road.
- The controller waits for a car to be present on the side road for a period of time, only then the lights of the side road turn from red->green while the main road's lights turn from green->yellow->red.
- Side road lights turn from green->yellow->red after a specified period of time, even if there are other cars on the side road, while the main road's lights turn from red->green.
- All the timings are controlled by a single custom built synchronous MOD16 timer.
- This timer is configurable and is capable of indicating the end of count at variable times.
- Configurability of the timer keeps the design smaller than other approaches that typically use several counters for different timing purposes in such a system.

## Modules and their functionalities
- `lightfsmj.v`: Contains the FSM i.e. the main controller of the traffic lights
- `timer.v`: Contains the configurable timer module
- `top.v`: Combines the FSM and the timer to build the smart traffic light system
- `testbench.v`: Contains the test cases that were vital to test the functionality of this system
- `top.sdf`: The constraints file extracted from Design Compiler after synthesis. This file contains delay information of each cell that is in the design
- `final_script.scr`: Contains commands to:
    - process the project from source code to synthesized netlist
    - extract .sdf file
    - create report for:
        - Timing of the system
        - Area of the synthesized system
        - Power utilization of the design
        - Cell information

## Language used
- ___Verilog:___ C like HDL is easier to comprehend and saves design time since the syntax is more concise that VHDL

## Tools used
- ___Cadence NCSim:___ To compile and check logic design
- ___Synopsys Design Compiler:___ To obtain the synthesized netlist from the design

## Group Members
1. Raashid Ansari - Timer Designer, Coder, Testbench coder
2. William Nitsch - Timer Designer, Coder, and Team Lead
3. Jonathan Frey - FSM Designer, coder

___NOTE:___ Refer to [report](group report smart traffic light controller.pdf "group report stepper motor fsm.pdf") for detailed explanation of the project.
