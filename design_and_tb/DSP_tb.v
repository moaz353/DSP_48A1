module DSP48A1_tb ; 

reg [17:0] A , B , BCIN , D ;  
reg [47:0] C , PCIN ; 
reg [7:0] opmode ; 
reg CLK , CARRYIN ;   
reg CEA , CEB , CEC , CED , CECARRYIN , CEOPMODE , CEM , CEP ; 
reg RSTA , RSTB , RSTC , RSTD , RSTCARRYIN , RSTOPMODE , RSTM , RSTP ; 

wire [35:0] M ; 
wire [47:0] P , PCOUT ; 
wire CARRYOUT , CARRYOUTF ; 
wire [17:0] BCOUT ;

DSP48A1 DUT ( .A(A) , .B(B)    , .C(C) , .D(D) , .BCIN(BCIN) , .PCIN(PCIN) , .opmode(opmode) ,
                    .CLK(CLK)  , .CARRYIN(CARRYIN) ,.CEA(CEA)  , .CEB(CEB) , .CEC(CEC)       ,  
                    .CED(CED)  , .CECARRYIN(CECARRYIN)  , .CEOPMODE(CEOPMODE)  , .CEM(CEM)   , 
                    .CEP(CEP)  , .RSTA(RSTA) , .RSTB(RSTB) , .RSTC(RSTC) , .RSTD(RSTD)       ,
                    .RSTCARRYIN(RSTCARRYIN)  , .RSTOPMODE(RSTOPMODE) , .RSTM (RSTM)          , 
                    .RSTP(RSTP) , .M(M) , .P(P) , .PCOUT(PCOUT) , .CARRYOUT(CARRYOUT)        , 
                    .CARRYOUTF(CARRYOUTF) , .BCOUT(BCOUT)) ;

initial begin 
    CLK=0 ;
    forever #1 CLK=~CLK ; 
end

initial begin 
    repeat(50) begin 
        RSTA        =  1 ;
        RSTB        =  1 ;
        RSTC        =  1 ;
        RSTD        =  1 ;
        RSTCARRYIN  =  1 ;
        RSTOPMODE   =  1 ;
        RSTM        =  1 ;
        RSTP        =  1 ;
        CEA        = 1 ;
        CEB        = 1 ;
        CEC        = 1 ;
        CED        = 1 ;
        CECARRYIN  = 1 ;
        CEOPMODE   = 1 ;
        CEM        = 1 ;
        CEP        = 1 ;
        A       = 0 ;   
        B       = 0 ; 
        BCIN    = 0 ;  
        D       = 0 ;  
        C       = 0 ; 
        PCIN    = 0 ; 
        opmode  = 0 ; 
        CARRYIN = 0 ; 
        @(negedge CLK) ; 
    end
    repeat(50) begin 
        RSTA        =  0 ;
        RSTB        =  0 ;
        RSTC        =  0 ;
        RSTD        =  0 ;
        RSTCARRYIN  =  0 ;
        RSTOPMODE   =  0 ;
        RSTM        =  0 ;
        RSTP        =  0 ;
        CEA        = 0 ;
        CEB        = 0 ;
        CEC        = 0 ;
        CED        = 0 ;
        CECARRYIN  = 0 ;
        CEOPMODE   = 0 ;
        CEM        = 0 ;
        CEP        = 0 ;
        @(negedge CLK) ; 
    end 
        RSTA        =  0 ;
        RSTB        =  0 ;
        RSTC        =  0 ;
        RSTD        =  0 ;
        RSTCARRYIN  =  0 ;
        RSTOPMODE   =  0 ;
        RSTM        =  0 ;
        RSTP        =  0 ;
        CEA        = 1 ;
        CEB        = 1 ;
        CEC        = 1 ;
        CED        = 1 ;
        CECARRYIN  = 1 ;
        CEOPMODE   = 1 ;
        CEM        = 1 ;
        CEP        = 1 ;
    repeat (3000) begin 
        A       = $random ;   
        B       = $random ; 
        BCIN    = $random ;  
        D       = $random ;  
        C       = $random ; 
        PCIN    = $random ; 
        opmode  = $random ; 
        CARRYIN = $random ;   
        @(negedge CLK) ;           
    end 
    repeat (500) begin 
        A       = $random ;   
        B       = $random ; 
        BCIN    = $random ;  
        D       = $random ;  
        C       = $random ; 
        PCIN    = $random ; 
        opmode  = $random ; 
        CARRYIN = $random ; 
        RSTA        =  $random ;
        RSTB        =  $random ;
        RSTC        =  $random ;
        RSTD        =  $random ;
        RSTCARRYIN  =  $random ;
        RSTOPMODE   =  $random ;
        RSTM        =  $random ;
        RSTP        =  $random ;
        @(negedge CLK) ;     
    end 
    repeat (500) begin 
        A       = $random ;   
        B       = $random ; 
        BCIN    = $random ;  
        D       = $random ;  
        C       = $random ; 
        PCIN    = $random ; 
        opmode  = $random ; 
        CARRYIN = $random ; 
        RSTA          =  0    ;
        RSTB          =  0    ;
        RSTC          =  0    ;
        RSTD          =  0    ;
        RSTCARRYIN    =  0    ;
        RSTOPMODE     =  0    ;
        RSTM          =  0    ;
        RSTP          =  0    ;
        CEA       = $random ;
        CEB       = $random ;
        CEC       = $random ;
        CED       = $random ;
        CECARRYIN = $random ;
        CEOPMODE  = $random ;
        CEM       = $random ;
        CEP       = $random ;    
        @(negedge CLK) ;     
    end 
    repeat (200) begin 
        A       = $random ;   
        B       = $random ; 
        BCIN    = $random ;  
        D       = $random ;  
        C       = $random ; 
        PCIN    = $random ; 
        opmode  = $random ; 
        CARRYIN = $random ; 
        RSTA       =  $random  ;
        RSTB       =  $random  ;
        RSTC       =  $random  ;
        RSTD       =  $random  ;
        RSTCARRYIN =  $random  ;
        RSTOPMODE  =  $random  ;
        RSTM       =  $random  ;
        RSTP       =  $random  ;
        CEA       = $random ;
        CEB       = $random ;
        CEC       = $random ;
        CED       = $random ;
        CECARRYIN = $random ;
        CEOPMODE  = $random ;
        CEM       = $random ;
        CEP       = $random ;    
        @(negedge CLK) ; 
    end 
    $stop ; 
end 
endmodule     


