module controller(lda,ldb,ldp,clrp,decb,done,clk,eqz,start);
input clk,eqz,start;
output reg lda,ldb,ldp,clrp,decb,done;
reg[2:0] state;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
always@(posedge clk)
 begin
  case(state)
   s0: if(start) state<=s1;
	s1: state<=s2;
	s2: state<=s3;
	s3: #2 if(eqz) state <=s4;
	s4: state<=s4;
	default: state<=s0;
	endcase
 end
 
always@(state) begin
case(state)
 s0:begin #1 lda=0;ldb=0;ldp=0;clrp=0;decb=0;end
 s1:begin #1 lda=1;end
 s2:begin #1 lda=0;ldb=1;clrp=1;end
 s3:begin #1 ldb=0;ldp=1;clrp=0;decb=1;end
 s4:begin #1 done=1;ldb=0;ldp=0;decb=0;end
 default:begin #1 lda=0;ldb=0;ldp=0;clrp=0;decb=0;end
 endcase
 end
endmodule
