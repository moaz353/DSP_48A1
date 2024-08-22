module MUX_SYNCRST (in,out,CLK,rst,C_ENABLE) ; 

parameter data_width = 1 ; 
parameter sel=1 ; 
input CLK , rst , C_ENABLE ; 
input [data_width-1:0] in ;
output [data_width-1:0] out ; 

reg [data_width-1:0] in_reg ; 

always @(posedge CLK) begin
    if(rst) 
        in_reg <= 0 ; 
    else  begin
    if(C_ENABLE)
        in_reg <= in ; 
    end      
end

assign out = (sel)?in_reg:in ; 

endmodule 
