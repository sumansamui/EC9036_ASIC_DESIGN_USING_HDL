`timescale 1ns / 1ps
module sequence_detector_mealy(x,clk,reset,detector_out);
input clk; // clock signal
input reset; // reset input
input x; // binary input
output reg detector_out; // output of the sequence detector
parameter  s0=2'b00, // "Zero" State
           s1=2'b01, // "One" State
           s2=2'b10; // "OneZero" State
reg [1:0] present_state, next_state; // current state and next state
// sequential memory of the Moore FSM
always @(posedge clk, posedge reset)
begin
 if(reset==1'b1) 
 present_state <= s0;// when reset=1, reset the state of the FSM to "Zero" State
 else
 present_state <= next_state; // otherwise, next state
end             


// combinational logic of the Mealy FSM
// to determine next state 
always @(present_state,x)
begin
case(present_state) 
s0:begin
  if(x==1'b1)  // if (x)
   next_state = s1;
  else
   next_state = s0;
end
s1:begin
  if(x==1'b1)
   next_state = s1;
  else
   next_state = s2;
end
s2:begin
  if(x==1'b1)
   next_state = s1;
  else
   next_state = s0;
end 
default:next_state = s0;
endcase
end    
// combinational logic to determine the output
// of the Mealy FSM, output depends on current state and external input
always @(present_state,x)
begin 
case(present_state) 
 s0:   detector_out = 1'b0;
 s1:   detector_out = 1'b0;
 s2:  begin 
	   if (x==1'b1)
			detector_out = 1'b1;
		else
			detector_out = 1'b0;
		end
default:  detector_out = 1'b0;
endcase
end                     
// detector_out = (present_state==s2) & (x);
endmodule
