`timescale 1ns / 1ps

module sr_latch_nand(
    input S,        // Active-Low Set input
    input R,        // Active-Low Reset input
    output Q,       // Normal output
    output Qbar     // Complement output
    );
    
    
    // Cross-coupled NAND gates
    nand (Q, S, Qbar);
    nand (Qbar, R, Q);
    
endmodule
