`default_nettype none

module tt_um_rain_alert (
    input  wire [7:0] ui_in,    // Dedicated inputs (Sensors)
    output wire [7:0] uo_out,   // Dedicated outputs (Alerts)
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (1=output, 0=input)
    input  wire       ena,      // always 1 when the design is powered
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // Unused IOs set to 0
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

    // Input Sensors from Farmers' Field:
    wire [3:0] humidity      = ui_in[3:0]; // Pins 3..0: Humidity (0 to 15)
    wire       low_pressure  = ui_in[4];   // Pin 4: Pressure drop sensor
    wire       rain_detected = ui_in[5];   // Pin 5: Raindrop sensor
    wire       dark_cloud    = ui_in[6];   // Pin 6: Dark cloud sensor

    reg rain_warning;
    reg heavy_rain_alarm;

    always @(posedge clk) begin
        if (!rst_n) begin
            rain_warning     <= 1'b0;
            heavy_rain_alarm <= 1'b0;
        end else if (ena) begin
            // 1. Rain warning logic
            if ((humidity >= 4'd10) && (low_pressure || dark_cloud)) begin
                rain_warning <= 1'b1;
            end else begin
                rain_warning <= 1'b0;
            end

            // 2. Heavy rain alarm logic
            if (rain_detected || ((humidity >= 4'd13) && low_pressure && dark_cloud)) begin
                heavy_rain_alarm <= 1'b1;
            end else begin
                heavy_rain_alarm <= 1'b0;
            end
        end
    end

    // Outputs to Farmers:
    assign uo_out[0]   = rain_warning;     // Pin 0: Yellow LED
    assign uo_out[1]   = heavy_rain_alarm; // Pin 1: Red LED / Buzzer
    assign uo_out[7:2] = 6'b000000;

    // List all unused inputs to prevent synthesis warnings
    wire _unused = &{ui_in[7], uio_in, 1'b0};

endmodule


 
