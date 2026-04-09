module d_flipflop(
    input D, Clock, rst,
    output reg Q,
    output notQ
    );
    
    always @(posedge Clock) begin
        if (rst)
            Q <=1'b0;
        else
            Q <= D;
    end
     
    initial begin
        Q <= 0;
    end
    
    always @(posedge Clock)
        Q <= D;
    
    assign notQ = ~Q;
    
endmodule
