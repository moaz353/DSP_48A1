
module POST_ADD_SUB_SYNCrst ( X , Z  , CARRYIN , opmode_5 ,  opmode_7 , CARRYOUT , CARRYOUTF , P ,
                                CLK , rst , C_ENABLE ) ; 

parameter  POST_ADD_SUB_width = 48 ; 
parameter  CARRYINREG         = 1 ;
parameter  CARRYOUTREG        = 1 ;
parameter  CARRYINSEL         = "OPMODE5" ; 

input  CLK , rst , C_ENABLE ; 
input  [POST_ADD_SUB_width-1:0] X , Z   ; 
input  CARRYIN   , opmode_5 , opmode_7  ;

output CARRYOUT , CARRYOUTF ; 
output reg [POST_ADD_SUB_width-1:0] P  ; 

// internal signals 
wire  CIN_POST_ADD_SUB   ; 
reg   COUT_POST_ADD_SUB  ;
wire  CARRY_CASCADE ; 

MUX_SYNCRST #( .data_width(1) , .sel(CARRYOUTREG)) CYI ( .in(CARRY_CASCADE) , .out(CIN_POST_ADD_SUB) , .CLK(CLK) , .rst(rst),.C_ENABLE(C_ENABLE)) ;

MUX_SYNCRST #( .data_width(1) , .sel(CARRYOUTREG)) CYO ( .in(COUT_POST_ADD_SUB) , .out(CARRYOUT) , .CLK(CLK) , .rst(rst),.C_ENABLE(C_ENABLE)) ;


assign CARRY_CASCADE  = (CARRYINSEL=="OPMODE5")? opmode_5 : (CARRYINSEL=="CARRYIN")? CARRYIN : 0 ;


always @( X , Z , CIN_POST_ADD_SUB , opmode_7  ) begin 
    if (~opmode_7)                                           // 0 > ADD
        {COUT_POST_ADD_SUB , P } = X + Z + CIN_POST_ADD_SUB ; 
    else 
        {COUT_POST_ADD_SUB , P } = Z-(X+CIN_POST_ADD_SUB) ; 
end         

assign CARRYOUTF = CARRYOUT ; 

endmodule