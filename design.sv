// Code your design here
module alu_32bit(
  input  [7:0] A,
    input enb,
  input  [7:0] B,
    input  [2:0] opcode, 
  output reg [7:0] Result,
    output reg Carry,
    output Zero
);

always @(*) begin 

    // Default values (avoid latch)
    Result = 8'b0;
    Carry = 1'b0;

    if(enb) begin

        case(opcode)

            3'b000: begin
                {Carry, Result} = A + B;       
            end

            3'b001: begin
                Result = A - B;                
            end

            3'b010: begin
                Result = A +1;               
            end

            3'b011: begin
                Result = A -1;                
            end

            3'b100: begin
                Result = A ;                
            end

            3'b101: begin
                Result = ~A;                  
            end
            
           3'b110: begin
               Result=A|B;
           end 
            3'b111:begin 
              Result=A&B;
            end

            default: begin
                Result = 8'b0;
            end

        endcase

    end

end

  assign Zero = (Result == 8'b0);

endmodule