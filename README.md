# Spartan6 - DSP48A1 Project

## Overview

### This repository contains a project that utilizes the DSP48A1 block of the Spartan-6 FPGA. The project demonstrates the application of digital signal processing techniques using the DSP48A1 block to achieve efficient and high-performance signal processing.



## Project Description File
### The project description file provides an overview of the project's objectives, design details, and implementation guidelines. It is a crucial resource for understanding the scope and requirements of the project.
### You can find the project description in the following file:
### [`Spartan6 - DSP48A1.pdf`](Spartan6%20-%20DSP48A1.pdf): Contains detailed information about the design specifications and explains the ports of design .



## Design Files    -------- design_and_tb 



###  [`DSP_COMPLETE_PROJECT.v`](design_and_tb): Top-level module integrating the DSP48A1 block.

### design can be ASYNC or SYNC reset and we will explain that .
### we can choose ASYNC or SYNC by using  RSTTYPE parameter . 

## 1 -> ASYNC : 

### [`DSP_ASYNC_complete_design.v`](design_and_tb/ASYNC/DSP_ASYNC_complete_design.v): this is  complete ASYNC design .
### [`MUX_ASYNCrst_MODULE.v`](design_and_tb/ASYNC/MUX_ASYNCrst_MODULE.v) ->  ASYNC MUX module .
### [`POST_ADD_SUB_ASYNCrst_MODULE.v`](design_and_tb/ASYNC/POST_ADD_SUB_ASYNCrst_MODULE.v) ->  ASYNC post adder and substract module 


## 2 -> SYNC : 

### [`DSP_SYNC_complete_design.v`](design_and_tb/SYNC/DSP_SYNC_complete_design.v): this is  complete SYNC design .
### [`MUX_SYNCrst_MODULE.v`](design_and_tb/SYNC/MUX_SYNCrst_MODULE.v) ->  SYNC MUX module .
### [`POST_ADD_SUB_SYNCrst_MODULE.v`](design_and_tb/SYNC/POST_ADD_SUB_SYNCrst_MODULE.v) ->  SYNC post adder and substract module .

## Test Files

### These files are used to test and verify the functionality of the design :

### [`DSP_tb.v`](design_and_tb/DSP_tb.v): Testbench for the top-level module.

### [`f.do`](design_and_tb/f.do) use this file to compile and simulate in qesta sim tool .  


## simulation : 

### Using qesta sim tool . 

### Results of somulation are in  [`simulation`](vivado/snippets/simulation/) .





## synthesis and implementation : 

### Using vivado tool .

### [`elaboration`](vivado/snippets/elaboration/) > RTL elaboration  .

### [`Synthesis`](vivado/snippets/synthesis_vivado/) >  Synthesis results .

### [`Implementation`](vivado/snippets/impl_vivado/) > implementation results .

## Other files : 
### [`all snippets.pdf`](all%20snippets.pdf) : this file contains all snippets (codes , sim , syn , impl ) . 

## THX . 



## For any questions or further information, please feel free to contact me.
## Email : [`moazesmail52@gmail.com`](mailto:moazesmail52@gmail.com) .
## LinkedIn : [`Moaz Ismail`](https://www.linkedin.com/in/moaz-ismail-/) .
