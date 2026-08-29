`timescale 1ns / 1ns
module Register_File_tb();

    reg [15:0] WrData;
	reg [2:0]  Address;  // 2^3 = 8  so Address = 3 bits 
	reg        WrEn;
	reg        RdEn;
	reg        CLK;
	reg        RST;
	
	wire [15:0] RdData;
	
	// DUT instalation
	Register_File dut(
    .WrData(WrData), 
	.Address(Address),
    .WrEn(WrEn), 
    .RdEn(RdEn),
    .CLK(CLK), 
	.RST(RST),
    .RdData(RdData)
	);
	
    // Clock Generation
	initial begin
	    CLK = 1'b0;
		forever #5 CLK = ~CLK;
	end
	
	// Testbench Logic
	initial begin
	    // Initialize & trigger Asynchronous Reset
        WrData = 16'b0; Address = 3'b0;
        WrEn = 1'b0; RdEn = 1'b0;
        RST = 1'b0; 
        #10; RST = 1'b1; 

        // Scenario 1: Write to Register 2
        Address = 3'd2; WrData = 16'hAAAA;
        WrEn = 1'b1; RdEn = 1'b0;
        #10;

        // Scenario 2: Write to Register 5
        Address = 3'd5; WrData = 16'h5555;
        WrEn = 1'b1; RdEn = 1'b0;
        #10;

        // Scenario 3: Read from Register 2 (Should output AAAA)
        Address = 3'd2;
        WrEn = 1'b0; RdEn = 1'b1;
        #10;

        // Scenario 4: Read from Register 5 (Should output 5555)
        Address = 3'd5;
        WrEn = 1'b0; RdEn = 1'b1;
        #10;
		
		$stop;
	end
	
endmodule