module Register_File (
    input wire [15:0] WrData,
	input wire [2:0]  Address,  // 2^3 = 8  so Address = 3 bits 
	input wire        WrEn, RdEn,
	input wire        CLK,
	input wire        RST,
	
	output reg [15:0] RdData
);

    // 2D Array
    reg [15:0] Reg_File [7:0];

    // Reset and Write Logic
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            Reg_File[0] <= 16'b0;
            Reg_File[1] <= 16'b0;
            Reg_File[2] <= 16'b0;
            Reg_File[3] <= 16'b0;
            Reg_File[4] <= 16'b0;
            Reg_File[5] <= 16'b0;
            Reg_File[6] <= 16'b0;
            Reg_File[7] <= 16'b0;
            RdData      <= 16'b0;
		end else begin
		    if (WrEn) begin
			    Reg_File[Address] <= WrData; // Write data to the register file
			end else if (RdEn) begin
			    RdData <= Reg_File[Address]; // Read data from the register file
			end
		end
	end
	
endmodule