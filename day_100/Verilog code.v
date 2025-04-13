module pipe_mips32(
// generating the two phase clock

input clk1,
input clk2
);

// Internal Registers

reg [31:0] PC, IF_ID_IR, IF_ID_NPC;

reg [31:0] ID_EX_IR, ID_EX_NPC, ID_EX_A, ID_EX_B, ID_EX_Imm;

reg [2:0] ID_EX_type, EX_MEM_type, MEM_WB_type;

reg [31:0] EX_MEM_IR, EX_MEM_ALUOUT, EX_MEM_B;

reg EX_MEM_cond;

reg [31:0] MEM_WB_IR, MEM_WB_ALUOUT, MEM_WB_LMD;

reg [31:0] Reg [0:31];

reg [31:0] Mem [0:1023];

parameter ADD = 6'b000000,
          SUB = 6'b000001,
          AND = 6'b000010,
          OR  = 6'b000011,
          SLT = 6'b000100,
          MUL = 6'b000101,
          HLT = 6'b111111,
          LW  = 6'B001000,
          SW  = 6'b001001,
          ADDI= 6'b001010,
          SUBI= 6'b001011,
          SLTI= 6'b001100,
          BNEQZ=6'b001101,
          BEQZ =6'b001110;
          
parameter RR_ALU = 3'b000, RM_ALU = 3'b001,
          LOAD = 3'b010, STORE = 3'b011,
          BRANCH = 3'b100, HALT = 3'B101;
          
reg HALTED;

reg TAKEN_BRANCH;

//INFORMATION FETCHING STAGE (IF Stage)

always @ (posedge clk1)

if (HALTED == 0)

begin 

if (((EX_MEM_IR[31:26] == BEQZ) && (EX_MEM_cond == 1)) || ((EX_MEM_IR[31:26] == BNEQZ) && (EX_MEM_cond == 0)))

begin 

IF_ID_IR <= #2 Mem[EX_MEM_ALUOUT];

TAKEN_BRANCH <= #2 1'b1;

IF_ID_NPC <= #2 EX_MEM_ALUOUT + 1;

PC <= #2 EX_MEM_ALUOUT + 1;

end 

else begin 

IF_ID_IR <= #2 Mem[PC];

IF_ID_NPC <= #2 PC+1;

PC <= #2 PC+1;

end 
end 


//INFORMATION DECODE STAGE (ID Stage)

always @ (posedge clk2) 

if (HALTED == 0)

begin 

if (IF_ID_IR[25:21] == 5'B00000)

ID_EX_A <= 0;

else 

ID_EX_A <= #2 Reg[IF_ID_IR[25:21]];

if (IF_ID_IR[20:16] == 5'b00000) 

ID_EX_B <= 0;

else 

ID_EX_B <= #2 Reg[IF_ID_IR[20:16]];

ID_EX_NPC <= #2 IF_ID_NPC;

ID_EX_IR <= #2 IF_ID_IR;

ID_EX_Imm <= #2 {{16{IF_ID_IR[15]}},{IF_ID_IR[15:0]}};

case (IF_ID_IR[31:26])

ADD,SUB,AND,OR,SLT,MUL : ID_EX_type <= #2 RR_ALU;

ADDI,SUBI,SLTI : ID_EX_type <= #2 RM_ALU;

LW    : ID_EX_type <= #2 LOAD;

SW    : ID_EX_type <= #2 STORE;

BNEQZ,BEQZ : ID_EX_type <= #2 BRANCH;

HLT : ID_EX_type <= #2 HALT;

default  : ID_EX_type <= #2 HALT;

endcase

end

//EXECUTION STAGE (EX Stage)

always @ (posedge clk1)

if(HALTED == 0) 

begin 

EX_MEM_type <= #2 ID_EX_type;

EX_MEM_IR <= #2 ID_EX_IR;

TAKEN_BRANCH <= #2 0;

case (ID_EX_type) 

RR_ALU : begin 

case (ID_EX_IR[31:26])

ADD : EX_MEM_ALUOUT <= #2 ID_EX_A + ID_EX_B;

SUB : EX_MEM_ALUOUT <= #2 ID_EX_A - ID_EX_B;

AND : EX_MEM_ALUOUT <= #2 ID_EX_A & ID_EX_B;

OR : EX_MEM_ALUOUT <= #2 ID_EX_A | ID_EX_B;

SLT : EX_MEM_ALUOUT <= #2 ID_EX_A < ID_EX_B;

MUL : EX_MEM_ALUOUT <= #2 ID_EX_A * ID_EX_B;

default : EX_MEM_ALUOUT <= #2 32'hxxxxxxxx;

endcase

end 

RM_ALU : begin 

case (ID_EX_IR[31:26])

ADDI : EX_MEM_ALUOUT <= #2 ID_EX_A + ID_EX_Imm;

SUBI : EX_MEM_ALUOUT <= #2 ID_EX_A - ID_EX_Imm;

SLTI : EX_MEM_ALUOUT <= #2 ID_EX_A < ID_EX_Imm;

default : EX_MEM_ALUOUT <= #2 32'hxxxxxxxx;

endcase

end

LOAD,STORE : begin

EX_MEM_ALUOUT <= #2 ID_EX_A + ID_EX_Imm;

EX_MEM_B <= #2 ID_EX_B;

end  

BRANCH : begin 

EX_MEM_ALUOUT <= #2 ID_EX_NPC + ID_EX_Imm;

EX_MEM_cond <= #2 (ID_EX_A == 0); 

end 

endcase 

end

//MEMORY STAGE (MEM Stage)

always @ (posedge clk2)

if (HALTED == 0) 

begin 

MEM_WB_type <= #2 EX_MEM_type;

MEM_WB_IR <= #2 EX_MEM_IR; 

case(EX_MEM_type) 

RR_ALU,RM_ALU : MEM_WB_ALUOUT <= #2 EX_MEM_ALUOUT;

LOAD : MEM_WB_LMD <= #2 Mem[EX_MEM_ALUOUT];

STORE : if (TAKEN_BRANCH == 0) 

        Mem[EX_MEM_ALUOUT] <= #2 EX_MEM_B; 
        
endcase

end 

//WRITE BACK STAGE (WB Stage) 

always @ (posedge clk1) 

begin  

if (TAKEN_BRANCH == 0)

case(MEM_WB_type) 

RR_ALU : Reg[MEM_WB_IR[15:11]] <= #2 MEM_WB_ALUOUT; 

RM_ALU : Reg[MEM_WB_IR[20:16]] <= #2 MEM_WB_ALUOUT;

LOAD : Reg[MEM_WB_IR[20:16]] <= #2 MEM_WB_LMD;

HALT : HALTED <= #2 1'B1;

endcase

end 

endmodule
