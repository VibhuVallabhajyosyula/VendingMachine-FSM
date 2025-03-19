module vending_machine(clk,rst,a,b,change);
  input clk,rst;
  input [1:0] a; //00= 0rs, 01=5rs, 10=10rs
  output reg b;
  output reg [1:0] change; //01 = 5 rupee change , 10 = 10 rupee change
  parameter s0 = 2'b00;   // reset
  parameter s1 = 2'b01;   // 5rs state
  parameter s2 = 2'b10;   // 10rs state
  
  reg [1:0] present_state,next_state;
  
  always@(posedge clk)
    begin
      if(rst == 1)
        begin
          present_state <= 0;
          next_state <= 0;
        end
      else
        begin
          present_state <= next_state;
          
          case(present_state)
            s0: if(a==0)
              begin
                next_state <= s0;
                b <= 0;
                change <= 2'b00;
              end
            else if(a == 2'b01)
              begin
                next_state <= s1;
                b<=0;
                change <= 2'b00;
              end
            else if(a == 2'b10)
              begin
                next_state <= s2;
                b<=0;
                change <= 2'b00;
              end
            
            s1: if(a==0)
              begin
                next_state <= s0;
                b<=0;
                change <= 2'b01;
              end
            else if(a == 2'b01)
              begin
                next_state <= s2;
                b<=0;
                change <= 2'b00;
              end
            else if(a == 2'b10)
              begin
                next_state <= s0;
                b<=1;
                change <= 2'b00;
              end
            
            s2: if(a==0)
              begin
                next_state <= s0;
               change <= 2'b10;
              end
            else if(a == 2'b01)
              begin
                next_state <= s0;
                b<=1;
                change <= 2'b00;
              end
            else if(a == 2'b10)
              begin
                next_state <= s0;
                b<=1;
                change <= 2'b01;
              end
             default: next_state = s0;
          endcase
        end
    end
endmodule
