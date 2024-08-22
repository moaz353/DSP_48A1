quit -sim 
vlib work 

vlog DSP_COMPLETE_PROJECT.v  DSP_tb.v  DSP_ASYNC_complete_design.v MUX_ASYNCrst_MODULE.v POST_ADD_SUB_ASYNCrst_MODULE.v  DSP_SYNC_complete_design.v  MUX_SYNCrst_MODULE.v  POST_ADD_SUB_SYNCrst_MODULE.v

vsim -voptargs=+acc DSP48A1_tb     

add wave * 

run -all 