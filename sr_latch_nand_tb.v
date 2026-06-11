`timescale 1ns / 1ps

module sr_latch_nand_tb(

    );
    
    reg S;
    reg R;
    wire Q;
    wire Qbar;
    
    sr_latch_nand dut (.S(S), .R(R), .Q(Q), .Qbar(Qbar));
    initial begin
    
    $display("Time\tS\tR\tQ\tQbar");
        $monitor("%0t\t%b\t%b\t%b\t%b",
                 $time, S, R, Q, Qbar);
           
        S = 1; R = 1;
        #10;// Hold State

        S = 0; R = 1;
        #10;// Set Operation (Active-Low)
        
        S = 1; R = 1;
        #10;// Hold State
        
        S = 1; R = 0;
        #10;// Reset Operation (Active-Low)
       
        S = 1; R = 1;
        #10; // Hold State
        
        S = 0; R = 0;
        #10;// Invalid Condition
        
        S = 1; R = 1;
        #10;// Return to Hold

        $finish;
    end

endmodule
