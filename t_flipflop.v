module t_flipflop(
    input T, Clock,
    output Q,
    output notQ
    );
    
    jk_flipflop jk_inst (
        .J(T),
        .K(T),
        .Clock(Clock),
        .Q(Q),
        .notQ(notQ)
    );
    
endmodule
