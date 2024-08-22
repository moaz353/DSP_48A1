module DSP48A1 ( A , B , C , D , BCIN , PCIN , opmode , CLK , CARRYIN ,
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

generate
    case(RSTTYPE)
        "ASYNC" : begin 
            DSP48A1_ASYNC  #(.A0REG(A0REG),.B0REG(B0REG),.A1REG(A1REG),.B1REG(B1REG),.CREG(CREG),.DREG(DREG),.MREG(MREG),
                                .PREG(PREG),.CARRYINREG(CARRYINREG),.CARRYOUTREG(CARRYOUTREG),.OPMODEREG(OPMODEREG),
                                .CARRYINSEL(CARRYINSEL),.B_INPUT(B_INPUT),.RSTTYPE(RSTTYPE)  )
            DSP_ASYNC  ( .A(A) , .B(B) , .C(C) , .D(D) , .BCIN(BCIN) , .PCIN(PCIN) ,
                                                .opmode(opmode) , .CLK(CLK) , .CARRYIN(CARRYIN) , .CEA(CEA) ,
                                                .CEB(CEB) , .CEC(CEC) , .CED(CED) , .CECARRYIN(CECARRYIN)  ,
                                                .CEOPMODE(CEOPMODE) , .CEM(CEM) ,.CEP (CEP) , .RSTA(RSTA) , 
                                                .RSTB(RSTB) , .RSTC(RSTC) , .RSTD(RSTD) ,.RSTCARRYIN(RSTCARRYIN) , 
                                                .RSTOPMODE(RSTOPMODE) , .RSTM(RSTM) , .RSTP(RSTP) , .M(M) , .P(P) ,
                                                .PCOUT(PCOUT) , .CARRYOUT(CARRYOUT) , .CARRYOUTF(CARRYOUTF) ,
                                                .BCOUT(BCOUT)) ;  
        end                                            
        
        "SYNC" : begin 
            DSP48A1_SYNC #(.A0REG(A0REG),.B0REG(B0REG),.A1REG(A1REG),.B1REG(B1REG),.CREG(CREG),.DREG(DREG),.MREG(MREG),
                                .PREG(PREG),.CARRYINREG(CARRYINREG),.CARRYOUTREG(CARRYOUTREG),.OPMODEREG(OPMODEREG),
                                .CARRYINSEL(CARRYINSEL),.B_INPUT(B_INPUT),.RSTTYPE(RSTTYPE)  )
            DSP_ASYNC  ( .A(A) , .B(B) , .C(C) , .D(D) , .BCIN(BCIN) , .PCIN(PCIN) ,
                                                .opmode(opmode) , .CLK(CLK) , .CARRYIN(CARRYIN) , .CEA(CEA) ,
                                                .CEB(CEB) , .CEC(CEC) , .CED(CED) , .CECARRYIN(CECARRYIN)  ,
                                                .CEOPMODE(CEOPMODE) , .CEM(CEM) ,.CEP (CEP) , .RSTA(RSTA) , 
                                                .RSTB(RSTB) , .RSTC(RSTC) , .RSTD(RSTD) ,.RSTCARRYIN(RSTCARRYIN) , 
                                                .RSTOPMODE(RSTOPMODE) , .RSTM(RSTM) , .RSTP(RSTP) , .M(M) , .P(P) ,
                                                .PCOUT(PCOUT) , .CARRYOUT(CARRYOUT) , .CARRYOUTF(CARRYOUTF) ,
                                                .BCOUT(BCOUT)) ; 
        end               
    endcase
endgenerate
endmodule 