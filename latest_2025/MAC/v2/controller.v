module controller (
    input   clk,
    input   rst,     // asynchronous reset, active high
    input   go,      // start trigger
    input   stop,    // stop trigger
    input   tc,
    output reg  ld_a,
    output reg  ld_b,
    output reg  ld_acc,
    output reg  count_en,
    output reg idle,
    output reg  done,   
    output reg  busy,
    output reg  ld_out,
    output reg  ld_count
);

    // -----------------------------
    // State encoding
    // -----------------------------
    parameter S0 = 3'b000;   // reset/idle
    parameter S1 = 3'b001;   // active
    parameter S2 = 3'b010;   // finish 
    parameter S3 = 3'b011;  //display
    parameter S4 = 3'b100;

    reg [2:0] ps, ns;

    // -----------------------------
    // Next-state logic
    // -----------------------------
    always @(*) begin
        case (ps)
            S0:      ns = (go ? S1 : S0);
            S1:      ns = (stop|tc) ? S2 : S1;
            S2:      ns = S3;
            S3:		 ns = S4;	
            S4:      ns = S4;
            default: ns = 2'bxx;
        endcase
    end

    // -----------------------------
    // Output logic (Moore style)
    // -----------------------------
    always @(*) begin
        // defaults


        case (ps)
            S0: begin
                ld_a     = 1'b0;
        		ld_b     = 1'b0;
        		ld_acc   = 1'b0;
        		count_en = 1'b0;
        		idle     = 1'b1;   
        		busy 	 = 1'b0;
        		done     = 1'b0;
        		ld_out   = 1'b0;
        		ld_count = 1'b0;
        		end
            S1: begin
                ld_a     = 1'b1;
        		ld_b     = 1'b1;
        		ld_acc   = 1'b1;
        		count_en = 1'b1;
        		idle     = 1'b0;   
        		busy 	 = 1'b1;
        		done     = 1'b0;
        		ld_out   = 1'b0;
        		ld_count = 1'b0;
            end
            S2: begin
                ld_a     = 1'b0;
        		ld_b     = 1'b0;
        		ld_acc   = 1'b1;
        		count_en = 1'b0;  
        		idle     = 1'b0; 
        		busy 	 = 1'b1;
        		done     = 1'b0;
        		ld_out   = 1'b0;
        		ld_count = 1'b1;
            end    
            S3: begin
                ld_a     = 1'b0;
        		ld_b     = 1'b0;
        		ld_acc   = 1'b0;
        		count_en = 1'b0;  
        		idle     = 1'b0; 
        		busy 	 = 1'b1;
        		done     = 1'b0;
        		ld_out   = 1'b1;
        		ld_count = 1'b0;
        	end
        	S4: begin
                ld_a     = 1'b0;
        		ld_b     = 1'b0;
        		ld_acc   = 1'b0;
        		count_en = 1'b0;  
        		idle     = 1'b0; 
        		busy 	 = 1'b0;
        		done     = 1'b1;
        		ld_out   = 1'b0;
        		ld_count = 1'b0;
        	end
            default: begin
                ld_a     = 1'b0;
        		ld_b     = 1'b0;
        		ld_acc   = 1'b0;
        		count_en = 1'b0;
        		idle     = 1'b0;   
        		busy 	 = 1'b0;
        		done     = 1'b0;
        		ld_out   = 1'b0;
        		ld_count = 1'b0;
        	end
        		
        endcase
    end

    // -----------------------------
    // Sequential block (state update)
    // -----------------------------
    always @(posedge clk) begin
        if (rst)
            ps <= S0;
        else
            ps <= ns;
    end

endmodule
