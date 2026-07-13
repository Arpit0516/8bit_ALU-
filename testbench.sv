
module alu_tb;

  reg [7:0] A;
  reg [7:0] B;
reg [2:0] opcode;
reg enb;

  wire [7:0] Result;
wire Carry;
wire Zero;

reg [3:0] i;

alu_32bit dut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .enb(enb),
    .Result(Result),
    .Carry(Carry),
    .Zero(Zero)
);

initial begin
    
    $dumpfile("alu_wave.vcd");
    $dumpvars(0, alu_tb);


    enb = 1;
    i = 0;

  while(i < 8) begin

        A = 8'd7;
        B = 8'd4;

        opcode = $random % 8; // generates opcode 0 to 5

         // wait for ALU response
        #10;

        $display("A=%d B=%d opcode=%b Result=%d", 
                  A, B, opcode, Result);

        i = i + 1;

    end

    $finish;

end

endmodule