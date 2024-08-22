
// rst >> ASYNC ;

module DSP48A1_ASYNC ( A , B , C , D , BCIN , PCIN , opmode , CLK , CARRYIN ,
                    CEA  , CEB , CEC   , CED  , CECARRYIN  , CEOPMODE  , CEM  , CEP  ,
                    RSTA , RSTB , RSTC , RSTD , RSTCARRYIN , RSTOPMODE , RSTM , RSTP , 
                    M , P , PCOUT , CARRYOUT , CARRYOUTF , BCOUT) ; 
parameter A0REG       = 0  ;
parameter B0REG       = 0  ; 
parameter A1REG       = 1  ; 
parameter B1REG       = 1  ;
parameter CREG        = 1  ;  
parameter DREG        = 1  ; 
parameter MREG        = 1  ;  
parameter PREG        = 1  ;  
parameter CARRYINREG  = 1  ; 
parameter CARRYOUTREG = 1  ; 
parameter OPMODEREG   = 1  ;  
parameter CARRYINSEL  = "OPMODE5" ; 
parameter B_INPUT     = "DIRECT"  ; 
parameter RSTTYPE     = "SYNC"    ; 

input [17:0] A , B , BCIN , D ;  
input [47:0] C , PCIN ; 
input [7:0] opmode ; 
input CLK , CARRYIN ;   
input CEA , CEB , CEC , CED , CECARRYIN , CEOPMODE , CEM , CEP ; 
input RSTA , RSTB , RSTC , RSTD , RSTCARRYIN , RSTOPMODE , RSTM , RSTP ; 

output [35:0] M ; 
output [47:0] P , PCOUT ; 
output CARRYOUT , CARRYOUTF ; 
output [17:0] BCOUT ; 
reg    [7:0] opmodereg ; 

wire   [17:0] B0_SEL ;  // out of mux that sel between B , BCIN ;  

// any signal that is output of MUX_ASYNCRST module will take suffix (_IN)
wire [17:0] A0_IN , A1_IN , B0_IN , D_IN , B1_IN;
wire [47:0] C_IN ; 
wire [17:0] pre_ADD_SUB_out ;
wire [17:0] B1 ; 
wire [47:0] DAB ; 
wire [35:0] multi_out , M ; 
wire [47:0] P , PCOUT , POST_OUT ;
reg  [47:0] X , Z  ; 
 // generate opmode_reg ;
always @(posedge CLK or  posedge RSTOPMODE ) begin
    if (RSTOPMODE) 
        opmodereg <= 8'b0 ; 
    else begin
        if(CEOPMODE)
            opmodereg <= opmode ;   
    end  
end
assign B0_SEL = (B_INPUT == "DIRECT")? B : BCIN ; 

//A_0
MUX_ASYNCRST #(.data_width(18),.sel(A0REG)) INS_A0  (.in(A),.out(A0_IN),.CLK(CLK),.rst_a(RSTA),.C_ENABLE(CEA)) ; 

//A_1 
MUX_ASYNCRST #(.data_width(18),.sel(A1REG)) INS_A1  (.in(A0_IN),.out(A1_IN),.CLK(CLK),.rst_a(RSTA),.C_ENABLE(CEA)) ; 

//B_0
MUX_ASYNCRST #(.data_width(18),.sel(B0REG)) INS_B0  (.in(B0_SEL),.out(B0_IN),.CLK(CLK),.rst_a(RSTB),.C_ENABLE(CEB)) ; 

//C 
MUX_ASYNCRST #(.data_width(48),.sel(CREG)) INS_C  (.in(C),.out(C_IN),.CLK(CLK),.rst_a(RSTC),.C_ENABLE(CEC)) ; 

//D 
MUX_ASYNCRST #(.data_width(18),.sel(DREG)) INS_D (.in(D),.out(D_IN),.CLK(CLK),.rst_a(RSTD),.C_ENABLE(CED)) ; 

// PRE-ADD_SUB ON B , D  ;
assign pre_ADD_SUB_out = (opmodereg[6])? (D_IN - B0_IN) : (D_IN + B0_IN) ;

// mux 
assign B1 = (opmodereg[4])? pre_ADD_SUB_out : B0_IN ; 

// B_1 
MUX_ASYNCRST #(.data_width(18),.sel(B1REG)) INS_B1  (.in(B1),.out(B1_IN),.CLK(CLK),.rst_a(RSTB),.C_ENABLE(CEB)) ; 

assign BCOUT = B1_IN ; 

assign DAB = { D_IN[11:0] , A1_IN[17:0] , B1_IN[17:0] } ;

assign multi_out = A1_IN * B1_IN ; 

//multiout ins 
MUX_ASYNCRST #(.data_width(36),.sel(MREG)) multiplier (.in(multi_out),.out(M),.CLK(CLK),.rst_a(RSTM),.C_ENABLE(CEM)) ;


always @(*) begin
    case (opmodereg[1:0]) 
    0 : X = 0   ; 
    1 : X = M   ; 
    2 : X = P   ; 
    3 : X = DAB ; 
    endcase
    case(opmodereg[3:2]) 
        0 : Z = 0    ; 
        1 : Z = PCIN ; 
        2 : Z = P    ; 
        3 : Z = C_IN ; 
    endcase 
end

POST_ADD_SUB_ASYNCrst #(.CARRYINREG(CARRYINREG),.CARRYOUTREG(CARRYOUTREG),.CARRYINSEL(CARRYINSEL))
                    POST_ADD_SUB (.X(X) , .Z(Z)  , .CARRYIN(CARRYIN) , .opmode_5(opmodereg[5]) , .opmode_7(opmodereg[7]) ,
                                    .CARRYOUT(CARRYOUT) , .CARRYOUTF(CARRYOUTF) , .P(POST_OUT) ,.CLK(CLK) , .rst_a(RSTCARRYIN),.C_ENABLE(CECARRYIN)) ;

MUX_ASYNCRST #(.data_width(48),.sel(PREG)) INS_P  (.in(POST_OUT),.out(P),.CLK(CLK),.rst_a(RSTP),.C_ENABLE(CEP)) ; 

assign PCOUT = P ; 

endmodule


