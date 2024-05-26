module singlecycle_tb;
    // inputs
    logic clk_i;
    logic rst_ni;
    logic [31:0] io_sw_i;
    //outputs
    logic [31:0] io_lcd_o;
    logic [31:0] io_ledg_o;
    logic [31:0] io_ledr_o;
    logic [31:0] io_hex0_o;
    logic [31:0] io_hex1_o;
    logic [31:0] io_hex2_o;
    logic [31:0] io_hex3_o;
    logic [31:0] io_hex4_o;
    logic [31:0] io_hex5_o;
    logic [31:0] io_hex6_o;
    logic [31:0] io_hex7_o;
    logic [31:0] pc_debug_o;


singlecycle dut(
    .clk_i          (clk_i),
    .rst_ni         (rst_ni),
    .io_sw_i        (io_sw_i),
    //outputs
    .io_lcd_o       (io_lcd_o),
    .io_ledg_o      (io_ledg_o),
    .io_ledr_o      (io_ledr_o),
    .io_hex0_o      (io_hex0_o),
    .io_hex1_o      (io_hex1_o),
    .io_hex2_o      (io_hex2_o),
    .io_hex3_o      (io_hex3_o),
    .io_hex4_o      (io_hex4_o),
    .io_hex5_o      (io_hex5_o),
    .io_hex6_o      (io_hex6_o),
    .io_hex7_o      (io_hex7_o),
    .pc_debug_o     (pc_debug_o)
);

localparam T = 5;       // clock cycle

// variable contain input of testcase
logic [31:0] test_case1_input[15:0];
logic [31:0] test_case2_input[15:0]; 
logic [31:0] test_case3_input[15:0]; 
logic [31:0] test_case4_input[15:0]; 
logic [31:0] test_case5_input[15:0]; 
logic [31:0] test_case6_input[15:0]; 
logic [31:0] test_case7_input[15:0]; 
logic [31:0] test_case8_input[15:0]; 
logic [31:0] test_case9_input[15:0]; 
logic [31:0] test_case10_input[15:0]; 

initial
begin
    $readmemh("../mem/Test_case1_input.txt", test_case1_input);
    $readmemh("../mem/Test_case2_input.txt", test_case2_input);
    $readmemh("../mem/Test_case3_input.txt", test_case3_input);
    $readmemh("../mem/Test_case4_input.txt", test_case4_input);
    $readmemh("../mem/Test_case5_input.txt", test_case5_input);
    $readmemh("../mem/Test_case6_input.txt", test_case6_input);
    $readmemh("../mem/Test_case7_input.txt", test_case7_input);
    $readmemh("../mem/Test_case8_input.txt", test_case8_input);
    $readmemh("../mem/Test_case9_input.txt", test_case9_input);
    $readmemh("../mem/Test_case10_input.txt", test_case10_input);
end

// variable contain result of Reference model
logic [31:0] test_case1_ref[15:0];
logic [31:0] test_case2_ref[15:0]; 
logic [31:0] test_case3_ref[15:0]; 
logic [31:0] test_case4_ref[15:0]; 
logic [31:0] test_case5_ref[15:0]; 
logic [31:0] test_case6_ref[15:0]; 
logic [31:0] test_case7_ref[15:0]; 
logic [31:0] test_case8_ref[15:0]; 
logic [31:0] test_case9_ref[15:0]; 
logic [31:0] test_case10_ref[15:0]; 

initial
begin
    $readmemh("../mem/Test_case1_ref.txt", test_case1_ref);
    $readmemh("../mem/Test_case2_ref.txt", test_case2_ref);
    $readmemh("../mem/Test_case3_ref.txt", test_case3_ref);
    $readmemh("../mem/Test_case4_ref.txt", test_case4_ref);
    $readmemh("../mem/Test_case5_ref.txt", test_case5_ref);
    $readmemh("../mem/Test_case6_ref.txt", test_case6_ref);
    $readmemh("../mem/Test_case7_ref.txt", test_case7_ref);
    $readmemh("../mem/Test_case8_ref.txt", test_case8_ref);
    $readmemh("../mem/Test_case9_ref.txt", test_case9_ref);
    $readmemh("../mem/Test_case10_ref.txt", test_case10_ref);
end

// variable contain result of Python program
logic [31:0] test_case1_resultpy[15:0];
logic [31:0] test_case2_resultpy[15:0];
logic [31:0] test_case3_resultpy[15:0];
logic [31:0] test_case4_resultpy[15:0];
logic [31:0] test_case5_resultpy[15:0];
logic [31:0] test_case6_resultpy[15:0];
logic [31:0] test_case7_resultpy[15:0];
logic [31:0] test_case8_resultpy[15:0];
logic [31:0] test_case9_resultpy[15:0];
logic [31:0] test_case10_resultpy[15:0];

initial 
begin
    $readmemh("../mem/Test_case1_resultpy.txt", test_case1_resultpy);
    $readmemh("../mem/Test_case2_resultpy.txt", test_case2_resultpy);
    $readmemh("../mem/Test_case3_resultpy.txt", test_case3_resultpy);
    $readmemh("../mem/Test_case4_resultpy.txt", test_case4_resultpy);
    $readmemh("../mem/Test_case5_resultpy.txt", test_case5_resultpy);
    $readmemh("../mem/Test_case6_resultpy.txt", test_case6_resultpy);
    $readmemh("../mem/Test_case7_resultpy.txt", test_case7_resultpy);
    $readmemh("../mem/Test_case8_resultpy.txt", test_case8_resultpy);
    $readmemh("../mem/Test_case9_resultpy.txt", test_case9_resultpy);
    $readmemh("../mem/Test_case10_resultpy.txt", test_case10_resultpy);
end

// variable for comparison 1 : design V1 with ChaCha20 protocol
logic test_case1_comparison1_pass;
logic test_case2_comparison1_pass;
logic test_case3_comparison1_pass;
logic test_case4_comparison1_pass;
logic test_case5_comparison1_pass;
logic test_case6_comparison1_pass;
logic test_case7_comparison1_pass;
logic test_case8_comparison1_pass;
logic test_case9_comparison1_pass;
logic test_case10_comparison1_pass;

/*
initial 
begin
    test_case1_comparison1_pass  = 1;
    test_case2_comparison1_pass  = 1;
    test_case3_comparison1_pass  = 1;
    test_case4_comparison1_pass  = 1;
    test_case5_comparison1_pass  = 1;
    test_case6_comparison1_pass  = 1;
    test_case7_comparison1_pass  = 1;
    test_case8_comparison1_pass  = 1;
    test_case9_comparison1_pass  = 1;
    test_case10_comparison1_pass = 1;
end
*/

// variable for comparison 2 : result Python with ChaCha20 protocol
logic test_case1_comparison2_pass;
logic test_case2_comparison2_pass;
logic test_case3_comparison2_pass;
logic test_case4_comparison2_pass;
logic test_case5_comparison2_pass;
logic test_case6_comparison2_pass;
logic test_case7_comparison2_pass;
logic test_case8_comparison2_pass;
logic test_case9_comparison2_pass;
logic test_case10_comparison2_pass;


initial 
begin
    test_case1_comparison2_pass  = 1;
    test_case2_comparison2_pass  = 1;
    test_case3_comparison2_pass  = 1;
    test_case4_comparison2_pass  = 1;
    test_case5_comparison2_pass  = 1;
    test_case6_comparison2_pass  = 1;
    test_case7_comparison2_pass  = 1;
    test_case8_comparison2_pass  = 1;
    test_case9_comparison2_pass  = 1;
    test_case10_comparison2_pass = 1;
end


// variable for comparison 3 : design V1 with result Python
logic test_case1_comparison3_pass;
logic test_case2_comparison3_pass;
logic test_case3_comparison3_pass;
logic test_case4_comparison3_pass;
logic test_case5_comparison3_pass;
logic test_case6_comparison3_pass;
logic test_case7_comparison3_pass;
logic test_case8_comparison3_pass;
logic test_case9_comparison3_pass;
logic test_case10_comparison3_pass;

/*
initial 
begin
    test_case1_comparison3_pass  = 1;
    test_case2_comparison3_pass  = 1;
    test_case3_comparison3_pass  = 1;
    test_case4_comparison3_pass  = 1;
    test_case5_comparison3_pass  = 1;
    test_case6_comparison3_pass  = 1;
    test_case7_comparison3_pass  = 1;
    test_case8_comparison3_pass  = 1;
    test_case9_comparison3_pass  = 1;
    test_case10_comparison3_pass = 1;
end
*/

// comparion 1 : design V1 with ChaCha20 protocol
assign test_case1_comparison1_pass = (dut.RF.memory[8] == test_case1_ref[0]) | (dut.RF.memory[9] == test_case1_ref[1]) | (dut.RF.memory[18] == test_case1_ref[2]) | (dut.RF.memory[19] == test_case1_ref[3]) | (dut.RF.memory[20] == test_case1_ref[4]) | (dut.RF.memory[21] == test_case1_ref[5]) | (dut.RF.memory[22] == test_case1_ref[6]) | (dut.RF.memory[23] == test_case1_ref[7]) | (dut.RF.memory[24] == test_case1_ref[8]) | (dut.RF.memory[25] == test_case1_ref[9]) | (dut.RF.memory[26] == test_case1_ref[10]) | (dut.RF.memory[27] == test_case1_ref[11]) | (dut.RF.memory[5] == test_case1_ref[12]) | (dut.RF.memory[6] == test_case1_ref[13]) | (dut.RF.memory[7] == test_case1_ref[14]) | (dut.RF.memory[15] == test_case1_ref[15]);
assign test_case2_comparison1_pass = (dut.RF.memory[8] == test_case2_ref[0]) | (dut.RF.memory[9] == test_case2_ref[1]) | (dut.RF.memory[18] == test_case2_ref[2]) | (dut.RF.memory[19] == test_case2_ref[3]) | (dut.RF.memory[20] == test_case2_ref[4]) | (dut.RF.memory[21] == test_case2_ref[5]) | (dut.RF.memory[22] == test_case2_ref[6]) | (dut.RF.memory[23] == test_case2_ref[7]) | (dut.RF.memory[24] == test_case2_ref[8]) | (dut.RF.memory[25] == test_case2_ref[9]) | (dut.RF.memory[26] == test_case2_ref[10]) | (dut.RF.memory[27] == test_case2_ref[11]) | (dut.RF.memory[5] == test_case2_ref[12]) | (dut.RF.memory[6] == test_case2_ref[13]) | (dut.RF.memory[7] == test_case2_ref[14]) | (dut.RF.memory[15] == test_case2_ref[15]);
assign test_case3_comparison1_pass = (dut.RF.memory[8] == test_case3_ref[0]) | (dut.RF.memory[9] == test_case3_ref[1]) | (dut.RF.memory[18] == test_case3_ref[2]) | (dut.RF.memory[19] == test_case3_ref[3]) | (dut.RF.memory[20] == test_case3_ref[4]) | (dut.RF.memory[21] == test_case3_ref[5]) | (dut.RF.memory[22] == test_case3_ref[6]) | (dut.RF.memory[23] == test_case3_ref[7]) | (dut.RF.memory[24] == test_case3_ref[8]) | (dut.RF.memory[25] == test_case3_ref[9]) | (dut.RF.memory[26] == test_case3_ref[10]) | (dut.RF.memory[27] == test_case3_ref[11]) | (dut.RF.memory[5] == test_case3_ref[12]) | (dut.RF.memory[6] == test_case3_ref[13]) | (dut.RF.memory[7] == test_case3_ref[14]) | (dut.RF.memory[15] == test_case3_ref[15]);
assign test_case4_comparison1_pass = (dut.RF.memory[8] == test_case4_ref[0]) | (dut.RF.memory[9] == test_case4_ref[1]) | (dut.RF.memory[18] == test_case4_ref[2]) | (dut.RF.memory[19] == test_case4_ref[3]) | (dut.RF.memory[20] == test_case4_ref[4]) | (dut.RF.memory[21] == test_case4_ref[5]) | (dut.RF.memory[22] == test_case4_ref[6]) | (dut.RF.memory[23] == test_case4_ref[7]) | (dut.RF.memory[24] == test_case4_ref[8]) | (dut.RF.memory[25] == test_case4_ref[9]) | (dut.RF.memory[26] == test_case4_ref[10]) | (dut.RF.memory[27] == test_case4_ref[11]) | (dut.RF.memory[5] == test_case4_ref[12]) | (dut.RF.memory[6] == test_case4_ref[13]) | (dut.RF.memory[7] == test_case4_ref[14]) | (dut.RF.memory[15] == test_case4_ref[15]);
assign test_case5_comparison1_pass = (dut.RF.memory[8] == test_case5_ref[0]) | (dut.RF.memory[9] == test_case5_ref[1]) | (dut.RF.memory[18] == test_case5_ref[2]) | (dut.RF.memory[19] == test_case5_ref[3]) | (dut.RF.memory[20] == test_case5_ref[4]) | (dut.RF.memory[21] == test_case5_ref[5]) | (dut.RF.memory[22] == test_case5_ref[6]) | (dut.RF.memory[23] == test_case5_ref[7]) | (dut.RF.memory[24] == test_case5_ref[8]) | (dut.RF.memory[25] == test_case5_ref[9]) | (dut.RF.memory[26] == test_case5_ref[10]) | (dut.RF.memory[27] == test_case5_ref[11]) | (dut.RF.memory[5] == test_case5_ref[12]) | (dut.RF.memory[6] == test_case5_ref[13]) | (dut.RF.memory[7] == test_case5_ref[14]) | (dut.RF.memory[15] == test_case5_ref[15]);
assign test_case6_comparison1_pass = (dut.RF.memory[8] == test_case6_ref[0]) | (dut.RF.memory[9] == test_case6_ref[1]) | (dut.RF.memory[18] == test_case6_ref[2]) | (dut.RF.memory[19] == test_case6_ref[3]) | (dut.RF.memory[20] == test_case6_ref[4]) | (dut.RF.memory[21] == test_case6_ref[5]) | (dut.RF.memory[22] == test_case6_ref[6]) | (dut.RF.memory[23] == test_case6_ref[7]) | (dut.RF.memory[24] == test_case6_ref[8]) | (dut.RF.memory[25] == test_case6_ref[9]) | (dut.RF.memory[26] == test_case6_ref[10]) | (dut.RF.memory[27] == test_case6_ref[11]) | (dut.RF.memory[5] == test_case6_ref[12]) | (dut.RF.memory[6] == test_case6_ref[13]) | (dut.RF.memory[7] == test_case6_ref[14]) | (dut.RF.memory[15] == test_case6_ref[15]);
assign test_case7_comparison1_pass = (dut.RF.memory[8] == test_case7_ref[0]) | (dut.RF.memory[9] == test_case7_ref[1]) | (dut.RF.memory[18] == test_case7_ref[2]) | (dut.RF.memory[19] == test_case7_ref[3]) | (dut.RF.memory[20] == test_case7_ref[4]) | (dut.RF.memory[21] == test_case7_ref[5]) | (dut.RF.memory[22] == test_case7_ref[6]) | (dut.RF.memory[23] == test_case7_ref[7]) | (dut.RF.memory[24] == test_case7_ref[8]) | (dut.RF.memory[25] == test_case7_ref[9]) | (dut.RF.memory[26] == test_case7_ref[10]) | (dut.RF.memory[27] == test_case7_ref[11]) | (dut.RF.memory[5] == test_case7_ref[12]) | (dut.RF.memory[6] == test_case7_ref[13]) | (dut.RF.memory[7] == test_case7_ref[14]) | (dut.RF.memory[15] == test_case7_ref[15]);
assign test_case8_comparison1_pass = (dut.RF.memory[8] == test_case8_ref[0]) | (dut.RF.memory[9] == test_case8_ref[1]) | (dut.RF.memory[18] == test_case8_ref[2]) | (dut.RF.memory[19] == test_case8_ref[3]) | (dut.RF.memory[20] == test_case8_ref[4]) | (dut.RF.memory[21] == test_case8_ref[5]) | (dut.RF.memory[22] == test_case8_ref[6]) | (dut.RF.memory[23] == test_case8_ref[7]) | (dut.RF.memory[24] == test_case8_ref[8]) | (dut.RF.memory[25] == test_case8_ref[9]) | (dut.RF.memory[26] == test_case8_ref[10]) | (dut.RF.memory[27] == test_case8_ref[11]) | (dut.RF.memory[5] == test_case8_ref[12]) | (dut.RF.memory[6] == test_case8_ref[13]) | (dut.RF.memory[7] == test_case8_ref[14]) | (dut.RF.memory[15] == test_case8_ref[15]);
assign test_case9_comparison1_pass = (dut.RF.memory[8] == test_case9_ref[0]) | (dut.RF.memory[9] == test_case9_ref[1]) | (dut.RF.memory[18] == test_case9_ref[2]) | (dut.RF.memory[19] == test_case9_ref[3]) | (dut.RF.memory[20] == test_case9_ref[4]) | (dut.RF.memory[21] == test_case9_ref[5]) | (dut.RF.memory[22] == test_case9_ref[6]) | (dut.RF.memory[23] == test_case9_ref[7]) | (dut.RF.memory[24] == test_case9_ref[8]) | (dut.RF.memory[25] == test_case9_ref[9]) | (dut.RF.memory[26] == test_case9_ref[10]) | (dut.RF.memory[27] == test_case9_ref[11]) | (dut.RF.memory[5] == test_case9_ref[12]) | (dut.RF.memory[6] == test_case9_ref[13]) | (dut.RF.memory[7] == test_case9_ref[14]) | (dut.RF.memory[15] == test_case9_ref[15]);
assign test_case10_comparison1_pass = (dut.RF.memory[8] == test_case10_ref[0]) | (dut.RF.memory[9] == test_case10_ref[1]) | (dut.RF.memory[18] == test_case10_ref[2]) | (dut.RF.memory[19] == test_case10_ref[3]) | (dut.RF.memory[20] == test_case10_ref[4]) | (dut.RF.memory[21] == test_case10_ref[5]) | (dut.RF.memory[22] == test_case10_ref[6]) | (dut.RF.memory[23] == test_case10_ref[7]) | (dut.RF.memory[24] == test_case10_ref[8]) | (dut.RF.memory[25] == test_case10_ref[9]) | (dut.RF.memory[26] == test_case10_ref[10]) | (dut.RF.memory[27] == test_case10_ref[11]) | (dut.RF.memory[5] == test_case10_ref[12]) | (dut.RF.memory[6] == test_case10_ref[13]) | (dut.RF.memory[7] == test_case10_ref[14]) | (dut.RF.memory[15] == test_case10_ref[15]);

// comparison 2 : result Python with ChaCha20 protocol
genvar i;
    generate
    for (i = 0;i < 16;i=i+1) 
        begin
            if(test_case1_resultpy[i] != test_case1_ref[i])
            begin
                test_case1_comparison2_pass <= 0;
            end
            else  
            begin
                test_case1_comparison2_pass <= 1;
            end

            if(test_case2_resultpy[i] != test_case2_ref[i])
            begin
                test_case2_comparison2_pass <= 0;
            end
            else  
            begin
                test_case2_comparison2_pass <= 1;
            end

            if(test_case3_resultpy[i] != test_case3_ref[i])
            begin
                test_case3_comparison2_pass <= 0;
            end
            else  
            begin
                test_case3_comparison2_pass <= 1;
            end

            if(test_case4_resultpy[i] != test_case4_ref[i])
            begin
                test_case4_comparison2_pass <= 0;
            end
            else  
            begin
                test_case4_comparison2_pass <= 1;
            end

            if(test_case5_resultpy[i] != test_case5_ref[i])
            begin
                test_case5_comparison2_pass <= 0;
            end
            else  
            begin
                test_case5_comparison2_pass <= 1;
            end

            if(test_case6_resultpy[i] != test_case6_ref[i])
            begin
                test_case6_comparison2_pass <= 0;
            end
            else  
            begin
                test_case6_comparison2_pass <= 1;
            end

            if(test_case7_resultpy[i] != test_case7_ref[i])
            begin
                test_case7_comparison2_pass <= 0;
            end
            else  
            begin
                test_case7_comparison2_pass <= 1;
            end

            if(test_case8_resultpy[i] != test_case8_ref[i])
            begin
                test_case8_comparison2_pass <= 0;
            end
            else  
            begin
                test_case8_comparison2_pass <= 1;
            end

            if(test_case9_resultpy[i] != test_case9_ref[i])
            begin
                test_case9_comparison2_pass <= 0;
            end
            else  
            begin
                test_case9_comparison2_pass <= 1;
            end

            if(test_case10_resultpy[i] != test_case10_ref[i])
            begin
                test_case10_comparison2_pass <= 0;
            end
            else  
            begin
                test_case10_comparison2_pass <= 1;
            end
        end
    endgenerate


// comparison 3 : design V1 with Python result
assign test_case1_comparison3_pass = (dut.RF.memory[8] == test_case1_resultpy[0]) | (dut.RF.memory[9] == test_case1_resultpy[1]) | (dut.RF.memory[18] == test_case1_resultpy[2]) | (dut.RF.memory[19] == test_case1_resultpy[3]) | (dut.RF.memory[20] == test_case1_resultpy[4]) | (dut.RF.memory[21] == test_case1_resultpy[5]) | (dut.RF.memory[22] == test_case1_resultpy[6]) | (dut.RF.memory[23] == test_case1_resultpy[7]) | (dut.RF.memory[24] == test_case1_resultpy[8]) | (dut.RF.memory[25] == test_case1_resultpy[9]) | (dut.RF.memory[26] == test_case1_resultpy[10]) | (dut.RF.memory[27] == test_case1_resultpy[11]) | (dut.RF.memory[5] == test_case1_resultpy[12]) | (dut.RF.memory[6] == test_case1_resultpy[13]) | (dut.RF.memory[7] == test_case1_resultpy[14]) | (dut.RF.memory[15] == test_case1_resultpy[15]);
assign test_case2_comparison3_pass = (dut.RF.memory[8] == test_case2_resultpy[0]) | (dut.RF.memory[9] == test_case2_resultpy[1]) | (dut.RF.memory[18] == test_case2_resultpy[2]) | (dut.RF.memory[19] == test_case2_resultpy[3]) | (dut.RF.memory[20] == test_case2_resultpy[4]) | (dut.RF.memory[21] == test_case2_resultpy[5]) | (dut.RF.memory[22] == test_case2_resultpy[6]) | (dut.RF.memory[23] == test_case2_resultpy[7]) | (dut.RF.memory[24] == test_case2_resultpy[8]) | (dut.RF.memory[25] == test_case2_resultpy[9]) | (dut.RF.memory[26] == test_case2_resultpy[10]) | (dut.RF.memory[27] == test_case2_resultpy[11]) | (dut.RF.memory[5] == test_case2_resultpy[12]) | (dut.RF.memory[6] == test_case2_resultpy[13]) | (dut.RF.memory[7] == test_case2_resultpy[14]) | (dut.RF.memory[15] == test_case2_resultpy[15]);
assign test_case3_comparison3_pass = (dut.RF.memory[8] == test_case3_resultpy[0]) | (dut.RF.memory[9] == test_case3_resultpy[1]) | (dut.RF.memory[18] == test_case3_resultpy[2]) | (dut.RF.memory[19] == test_case3_resultpy[3]) | (dut.RF.memory[20] == test_case3_resultpy[4]) | (dut.RF.memory[21] == test_case3_resultpy[5]) | (dut.RF.memory[22] == test_case3_resultpy[6]) | (dut.RF.memory[23] == test_case3_resultpy[7]) | (dut.RF.memory[24] == test_case3_resultpy[8]) | (dut.RF.memory[25] == test_case3_resultpy[9]) | (dut.RF.memory[26] == test_case3_resultpy[10]) | (dut.RF.memory[27] == test_case3_resultpy[11]) | (dut.RF.memory[5] == test_case3_resultpy[12]) | (dut.RF.memory[6] == test_case3_resultpy[13]) | (dut.RF.memory[7] == test_case3_resultpy[14]) | (dut.RF.memory[15] == test_case3_resultpy[15]);
assign test_case4_comparison3_pass = (dut.RF.memory[8] == test_case4_resultpy[0]) | (dut.RF.memory[9] == test_case4_resultpy[1]) | (dut.RF.memory[18] == test_case4_resultpy[2]) | (dut.RF.memory[19] == test_case4_resultpy[3]) | (dut.RF.memory[20] == test_case4_resultpy[4]) | (dut.RF.memory[21] == test_case4_resultpy[5]) | (dut.RF.memory[22] == test_case4_resultpy[6]) | (dut.RF.memory[23] == test_case4_resultpy[7]) | (dut.RF.memory[24] == test_case4_resultpy[8]) | (dut.RF.memory[25] == test_case4_resultpy[9]) | (dut.RF.memory[26] == test_case4_resultpy[10]) | (dut.RF.memory[27] == test_case4_resultpy[11]) | (dut.RF.memory[5] == test_case4_resultpy[12]) | (dut.RF.memory[6] == test_case4_resultpy[13]) | (dut.RF.memory[7] == test_case4_resultpy[14]) | (dut.RF.memory[15] == test_case4_resultpy[15]);
assign test_case5_comparison3_pass = (dut.RF.memory[8] == test_case5_resultpy[0]) | (dut.RF.memory[9] == test_case5_resultpy[1]) | (dut.RF.memory[18] == test_case5_resultpy[2]) | (dut.RF.memory[19] == test_case5_resultpy[3]) | (dut.RF.memory[20] == test_case5_resultpy[4]) | (dut.RF.memory[21] == test_case5_resultpy[5]) | (dut.RF.memory[22] == test_case5_resultpy[6]) | (dut.RF.memory[23] == test_case5_resultpy[7]) | (dut.RF.memory[24] == test_case5_resultpy[8]) | (dut.RF.memory[25] == test_case5_resultpy[9]) | (dut.RF.memory[26] == test_case5_resultpy[10]) | (dut.RF.memory[27] == test_case5_resultpy[11]) | (dut.RF.memory[5] == test_case5_resultpy[12]) | (dut.RF.memory[6] == test_case5_resultpy[13]) | (dut.RF.memory[7] == test_case5_resultpy[14]) | (dut.RF.memory[15] == test_case5_resultpy[15]);
assign test_case6_comparison3_pass = (dut.RF.memory[8] == test_case6_resultpy[0]) | (dut.RF.memory[9] == test_case6_resultpy[1]) | (dut.RF.memory[18] == test_case6_resultpy[2]) | (dut.RF.memory[19] == test_case6_resultpy[3]) | (dut.RF.memory[20] == test_case6_resultpy[4]) | (dut.RF.memory[21] == test_case6_resultpy[5]) | (dut.RF.memory[22] == test_case6_resultpy[6]) | (dut.RF.memory[23] == test_case6_resultpy[7]) | (dut.RF.memory[24] == test_case6_resultpy[8]) | (dut.RF.memory[25] == test_case6_resultpy[9]) | (dut.RF.memory[26] == test_case6_resultpy[10]) | (dut.RF.memory[27] == test_case6_resultpy[11]) | (dut.RF.memory[5] == test_case6_resultpy[12]) | (dut.RF.memory[6] == test_case6_resultpy[13]) | (dut.RF.memory[7] == test_case6_resultpy[14]) | (dut.RF.memory[15] == test_case6_resultpy[15]);
assign test_case7_comparison3_pass = (dut.RF.memory[8] == test_case7_resultpy[0]) | (dut.RF.memory[9] == test_case7_resultpy[1]) | (dut.RF.memory[18] == test_case7_resultpy[2]) | (dut.RF.memory[19] == test_case7_resultpy[3]) | (dut.RF.memory[20] == test_case7_resultpy[4]) | (dut.RF.memory[21] == test_case7_resultpy[5]) | (dut.RF.memory[22] == test_case7_resultpy[6]) | (dut.RF.memory[23] == test_case7_resultpy[7]) | (dut.RF.memory[24] == test_case7_resultpy[8]) | (dut.RF.memory[25] == test_case7_resultpy[9]) | (dut.RF.memory[26] == test_case7_resultpy[10]) | (dut.RF.memory[27] == test_case7_resultpy[11]) | (dut.RF.memory[5] == test_case7_resultpy[12]) | (dut.RF.memory[6] == test_case7_resultpy[13]) | (dut.RF.memory[7] == test_case7_resultpy[14]) | (dut.RF.memory[15] == test_case7_resultpy[15]);
assign test_case8_comparison3_pass = (dut.RF.memory[8] == test_case8_resultpy[0]) | (dut.RF.memory[9] == test_case8_resultpy[1]) | (dut.RF.memory[18] == test_case8_resultpy[2]) | (dut.RF.memory[19] == test_case8_resultpy[3]) | (dut.RF.memory[20] == test_case8_resultpy[4]) | (dut.RF.memory[21] == test_case8_resultpy[5]) | (dut.RF.memory[22] == test_case8_resultpy[6]) | (dut.RF.memory[23] == test_case8_resultpy[7]) | (dut.RF.memory[24] == test_case8_resultpy[8]) | (dut.RF.memory[25] == test_case8_resultpy[9]) | (dut.RF.memory[26] == test_case8_resultpy[10]) | (dut.RF.memory[27] == test_case8_resultpy[11]) | (dut.RF.memory[5] == test_case8_resultpy[12]) | (dut.RF.memory[6] == test_case8_resultpy[13]) | (dut.RF.memory[7] == test_case8_resultpy[14]) | (dut.RF.memory[15] == test_case8_resultpy[15]);
assign test_case9_comparison3_pass = (dut.RF.memory[8] == test_case9_resultpy[0]) | (dut.RF.memory[9] == test_case9_resultpy[1]) | (dut.RF.memory[18] == test_case9_resultpy[2]) | (dut.RF.memory[19] == test_case9_resultpy[3]) | (dut.RF.memory[20] == test_case9_resultpy[4]) | (dut.RF.memory[21] == test_case9_resultpy[5]) | (dut.RF.memory[22] == test_case9_resultpy[6]) | (dut.RF.memory[23] == test_case9_resultpy[7]) | (dut.RF.memory[24] == test_case9_resultpy[8]) | (dut.RF.memory[25] == test_case9_resultpy[9]) | (dut.RF.memory[26] == test_case9_resultpy[10]) | (dut.RF.memory[27] == test_case9_resultpy[11]) | (dut.RF.memory[5] == test_case9_resultpy[12]) | (dut.RF.memory[6] == test_case9_resultpy[13]) | (dut.RF.memory[7] == test_case9_resultpy[14]) | (dut.RF.memory[15] == test_case9_resultpy[15]);
assign test_case10_comparison3_pass = (dut.RF.memory[8] == test_case10_resultpy[0]) | (dut.RF.memory[9] == test_case10_resultpy[1]) | (dut.RF.memory[18] == test_case10_resultpy[2]) | (dut.RF.memory[19] == test_case10_resultpy[3]) | (dut.RF.memory[20] == test_case10_resultpy[4]) | (dut.RF.memory[21] == test_case10_resultpy[5]) | (dut.RF.memory[22] == test_case10_resultpy[6]) | (dut.RF.memory[23] == test_case10_resultpy[7]) | (dut.RF.memory[24] == test_case10_resultpy[8]) | (dut.RF.memory[25] == test_case10_resultpy[9]) | (dut.RF.memory[26] == test_case10_resultpy[10]) | (dut.RF.memory[27] == test_case10_resultpy[11]) | (dut.RF.memory[5] == test_case10_resultpy[12]) | (dut.RF.memory[6] == test_case10_resultpy[13]) | (dut.RF.memory[7] == test_case10_resultpy[14]) | (dut.RF.memory[15] == test_case10_resultpy[15]);


initial 
begin
    clk_i = 1'b0;
    rst_ni = 1'b0;

    #20 rst_ni = 1'b1;
    #500000 $finish;
end

always 
begin
    #(T/2) clk_i = ~clk_i;
end


always @(posedge clk_i)
begin
    // if(pc_debug_o == 32'h0000_012C) // Test case 1
    if(pc_debug_o == 32'h0000_0808) // Test case 2 3

    begin
        // Testcase 1
        $display("Testcase 1 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case1_input[0], test_case1_input[1], test_case1_input[2], test_case1_input[3], test_case1_input[4], test_case1_input[5], test_case1_input[6], test_case1_input[7], test_case1_input[8], test_case1_input[9], test_case1_input[10], test_case1_input[11], test_case1_input[12], test_case1_input[13], test_case1_input[14], test_case1_input[15]);
        
        if(test_case1_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case1_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case1_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Design V1 with Python program :: FAILED");
        end
        
        // Testcase 2
        $display("Testcase 2 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case2_input[0], test_case2_input[1], test_case2_input[2], test_case2_input[3], test_case2_input[4], test_case2_input[5], test_case2_input[6], test_case2_input[7], test_case2_input[8], test_case2_input[9], test_case2_input[10], test_case2_input[11], test_case2_input[12], test_case2_input[13], test_case2_input[14], test_case2_input[15]);
        
        if(test_case2_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case2_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case2_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end

        // Testcase 3
        $display("Testcase 3 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case3_input[0], test_case3_input[1], test_case3_input[2], test_case3_input[3], test_case3_input[4], test_case3_input[5], test_case3_input[6], test_case3_input[7], test_case3_input[8], test_case3_input[9], test_case3_input[10], test_case3_input[11], test_case3_input[12], test_case3_input[13], test_case3_input[14], test_case3_input[15]);
        
        if(test_case3_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case3_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case3_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end

        // Testcase 4
        $display("Testcase 4 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case4_input[0], test_case4_input[1], test_case4_input[2], test_case4_input[3], test_case4_input[4], test_case4_input[5], test_case4_input[6], test_case4_input[7], test_case4_input[8], test_case4_input[9], test_case4_input[10], test_case4_input[11], test_case4_input[12], test_case4_input[13], test_case4_input[14], test_case4_input[15]);
        
        if(test_case4_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case4_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case4_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end

        // Testcase 5
        $display("Testcase 5 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case5_input[0], test_case5_input[1], test_case5_input[2], test_case5_input[3], test_case5_input[4], test_case5_input[5], test_case5_input[6], test_case5_input[7], test_case5_input[8], test_case5_input[9], test_case5_input[10], test_case5_input[11], test_case5_input[12], test_case5_input[13], test_case5_input[14], test_case5_input[15]);
        
        if(test_case5_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case5_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case5_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end

        // Testcase 6
        $display("Testcase 6 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case6_input[0], test_case6_input[1], test_case6_input[2], test_case6_input[3], test_case6_input[4], test_case6_input[5], test_case6_input[6], test_case6_input[7], test_case6_input[8], test_case6_input[9], test_case6_input[10], test_case6_input[11], test_case6_input[12], test_case6_input[13], test_case6_input[14], test_case6_input[15]);
        
        if(test_case6_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case6_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case6_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end

        // Testcase 7
        $display("Testcase 7 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case7_input[0], test_case7_input[1], test_case7_input[2], test_case7_input[3], test_case7_input[4], test_case7_input[5], test_case7_input[6], test_case7_input[7], test_case7_input[8], test_case7_input[9], test_case7_input[10], test_case7_input[11], test_case7_input[12], test_case7_input[13], test_case7_input[14], test_case7_input[15]);
        
        if(test_case7_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case7_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case7_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end

        // Testcase 8
        $display("Testcase 8 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case8_input[0], test_case8_input[1], test_case8_input[2], test_case8_input[3], test_case8_input[4], test_case8_input[5], test_case8_input[6], test_case8_input[7], test_case8_input[8], test_case8_input[9], test_case8_input[10], test_case8_input[11], test_case8_input[12], test_case8_input[13], test_case8_input[14], test_case8_input[15]);
        
        if(test_case8_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case8_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case8_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end

        // Testcase 9
        $display("Testcase 9 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case9_input[0], test_case9_input[1], test_case9_input[2], test_case9_input[3], test_case9_input[4], test_case9_input[5], test_case9_input[6], test_case9_input[7], test_case9_input[8], test_case9_input[9], test_case9_input[10], test_case9_input[11], test_case9_input[12], test_case9_input[13], test_case9_input[14], test_case9_input[15]);
        
        if(test_case9_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case9_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case9_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end

        // Testcase 10
        $display("Testcase 10 : ");
        $display("[%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h]", test_case10_input[0], test_case10_input[1], test_case10_input[2], test_case10_input[3], test_case10_input[4], test_case10_input[5], test_case10_input[6], test_case10_input[7], test_case10_input[8], test_case10_input[9], test_case10_input[10], test_case10_input[11], test_case10_input[12], test_case10_input[13], test_case10_input[14], test_case10_input[15]);
        
        if(test_case10_comparison1_pass)
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: PASSED");
        end
        else 
        begin
            $display("Comparison 1 : Design V1 with ChaCha20 protocol :: FAILED");
        end

        if(test_case10_comparison2_pass)
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: PASSED");
        end
        else
        begin
            $display("Comparison 2 : Python program with ChaCha20 protocol :: FAILED");
        end

        if(test_case10_comparison3_pass)
        begin
            $display("Comparison 3 : Design V1 with Python program :: PASSED");
        end
        else
        begin
            $display("Comparison 3 : Design V1 with Python program :: FAILED");
        end
    end
end

endmodule