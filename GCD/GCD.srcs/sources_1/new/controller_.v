`timescale 1ns / 1ps

module controller(
    output reg ldA, ldB, sel1, sel2, sel_load, done,
    input lt, gt, eq, clk, start
);

    reg [2:0] state;

    parameter IDLE = 3'b000,
              LOAD_A = 3'b001,
              LOAD_B = 3'b010,
              WORK   = 3'b011,
              DONE   = 3'b100;

    always @(posedge clk) begin
        case (state)
            IDLE:    if (start) state <= LOAD_A;
            LOAD_A:  state <= LOAD_B;
            LOAD_B:  state <= WORK;
            WORK:    if (eq) state <= DONE;
            DONE:    state <= DONE;
            default: state <= IDLE;
        endcase
    end

    always @(*) begin
        // Default everything
        ldA = 0; ldB = 0;
        sel1 = 0; sel2 = 0;
        sel_load = 0;
        done = 0;

        case (state)
            IDLE: begin
                ldA = 1; sel_load = 1;
            end

            LOAD_A: begin
                ldB = 1; sel_load = 1;
            end

            LOAD_B: ; // wait 1 cycle

            WORK: begin
                sel_load = 0;
                if (gt) begin
                    // A > B ? A = A - B
                    sel1 = 0; sel2 = 1;
                    ldA = 1;
                end else if (lt) begin
                    // B > A ? B = B - A
                    sel1 = 1; sel2 = 0;
                    ldB = 1;
                end else if (eq) begin
                    done = 1;
                end
            end

            DONE: done = 1;
        endcase
    end
endmodule
