module jk_flipflop(
    input J, K, Clock,
    output Q,
    output notQ
    );
    
    assign D = (J & notQ) | (~K & Q) ;
    
    d_flipflop outflop (
        .D(D),
        .Clock(Clock),
        .Q(Q),
        .notQ(notQ)
    );
    
    
endmodule
