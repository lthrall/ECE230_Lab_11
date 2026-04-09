module top(
    input btnC, btnU,
    output [6:0]led
    );
    //Ripple counter
    wire rStage1;
    wire rStage2;
    wire rStage3;
    reg reset;
    
    t_flipflop ripple1 (
        .T('b1),
        .Clock(btnC),
        .Q(rStage1)
    );
    
    t_flipflop ripple2 (
        .T('b1),
        .Clock(rStage1),
        .Q(rStage2)
    );
    
    t_flipflop ripple3 (
        .T('b1),
        .Clock(rStage2),
        .Q(rStage3)
    );
    
    assign led[0] = rStage1;
    assign led[1] = rStage2;
    assign led[2] = rStage3;
    
    //Modulo counter
    wire mBit0;
    wire mBit1;
    wire mBit2;
    
    wire yBit0;
    wire yBit1;
    wire yBit2;
    
    wire carry1;
    wire carry2;
    
    full_adder aBit0 (
        .B(1'b1),
        .A(mBit0),
        .Cin(0'b0),
        .Y(yBit0),
        .Cout(carry1)
    );
    
    full_adder aBit1 (
        .B(0'b0),
        .A(mBit1),
        .Cin(carry1),
        .Y(yBit1),
        .Cout(carry2)
    );
    
    full_adder aBit2 (
        .B(0'b0),
        .A(mBit2),
        .Cin(carry2),
        .Y(yBit2)
    );
    
    d_flipflop dBit0 (
        .rst(Reset),
        .D(yBit0),
        .Clock(btnC),
        .Q(mBit0)
    );
    
    d_flipflop dBit1 (
        .rst(Reset),
        .D(yBit1),
        .Clock(btnC),
        .Q(mBit1)
    );
    
    d_flipflop dBit2 (
        .rst(Reset),
        .D(yBit2),
        .Clock(btnC),
        .Q(mBit2)
    );
    
    wire outWire[2:0];
    assign outWire[0] = mBit0;
    assign outWire[1] = mBit1;
    assign outWire[2] = mBit2;
    
    reg out = 0;
    
    always @(outWire) begin
        if (outWire[0] && outWire[1] && ~outWire[2] && ~reset) begin
            out = ~out;
            reset = 1;
        end
        else if (reset)
            out = 0;
            reset = 0;

    end
    
    d_flipflop outFlop (
        .D(out),
        .rst(reset),
        .Clock(btnC),
        .Q(led[6])
    );
    
    assign led[3] = mBit0;
    assign led[4] = mBit1;
    assign led[5] = mBit2;
    
endmodule
