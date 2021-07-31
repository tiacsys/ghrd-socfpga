`timescale 1 ps / 1 ps
`define USER_PINS
`define USB
`define ETHERNET_A
`define ETHERNET_B
`define UART
`define HSMC
`define HDMI
`define PMOD
`define QSPI
`define DAC
`define GPIO
`define JTAG
//`define DDR3
`define SYSRUNSIG
//`define SYSZEPHYR
//`define SYSLINUX

module ghrd_10m50daf484c6ges_top (

`ifdef USER_PINS
	// LED, Push-Button, DIP-SWitches
	output	wire [4:0]	USER_LED,	// 1.5 V
	input	wire [3:0]	USER_PB,	// 1.5 V
	input	wire [4:0]	USER_DIPSW,	// 1.5 V
`endif

`ifdef USB
	// USB interface
	input	wire		USB_RESETn,	// 3.3-V LVCMOS
	input	wire		USB_WRn,	// 3.3-V LVCMOS
	input	wire		USB_RDn,	// 3.3-V LVCMOS
	input	wire		USB_OEn,	// 3.3-V LVCMOS
	inout	wire [1:0]	USB_ADDR,	// 3.3-V LVCMOS
	inout	wire [7:0]	USB_DATA,	// 3.3-V LVCMOS
	output	wire		USB_FULL,	// 3.3-V LVCMOS
	output	wire		USB_EMPTY,	// 3.3-V LVCMOS
	input	wire		USB_SCL,	// 3.3-V LVCMOS
	inout	wire		USB_SDA,	// 3.3-V LVCMOS
	input	wire		USB_CLK,	// 3.3-V LVCMOS
`endif

`ifdef ETHERNET_A
	// Ethernet interface A
	output	wire		ENETA_GTX_CLK,	// 2.5 V
	input	wire		ENETA_TX_CLK,	// 3.3-V LVCMOS
	output	wire [3:0]	ENETA_TX_D,	// 2.5 V
	output	wire		ENETA_TX_EN,	// 2.5 V
	output	wire		ENETA_TX_ER,	// 2.5 V
	input	wire		ENETA_RX_CLK,	// 2.5 V
	input	wire [3:0]	ENETA_RX_D,	// 2.5 V
	input	wire		ENETA_RX_DV,	// 2.5 V
	input	wire		ENETA_RX_ER,	// 2.5 V
	output	wire		ENETA_RESETn,	// 2.5 V
	input	wire		ENETA_RX_CRS,	// 2.5 V
	input	wire		ENETA_RX_COL,	// 2.5 V
	output	wire		ENETA_LED_LINK100,// 2.5 V
	input	wire		ENETA_INTn,	// 2.5 V
	output	wire		ENET_MDC,	// 2.5 V
	inout	wire		ENET_MDIO,	// 2.5 V
`endif

`ifdef ETHERNET_B
	// Ethernet interface B
	output	wire		ENETB_GTX_CLK,	// 2.5 V
	input	wire		ENETB_TX_CLK,	// 3.3-V LVCMOS
	output	wire [3:0]	ENETB_TX_D,	// 2.5 V
	output	wire		ENETB_TX_EN,	// 2.5 V
	output	wire		ENETB_TX_ER,	// 2.5 V
	input	wire		ENETB_RX_CLK,	// 2.5 V
	input	wire [3:0]	ENETB_RX_D,	// 2.5 V
	input	wire		ENETB_RX_DV,	// 2.5 V
	input	wire		ENETB_RX_ER,	// 2.5 V
	output	wire		ENETB_RESETn,	// 2.5 V
	input	wire		ENETB_RX_CRS,	// 2.5 V
	input	wire		ENETB_RX_COL,	// 2.5 V
	output	wire		ENETB_LED_LINK100,// 2.5 V
	input	wire		ENETB_INTn,	// 2.5 V
`endif

`ifdef UART
	// 16550 UART interface
	output	wire		UART_TX,	// 2.5 V
	input	wire		UART_RX,	// 2.5 V
`endif

`ifdef HSMC
	// HSMC connector interface
	input	wire [2:1]	HSMC_CLK_IN_p,	// LVDS (2.5 V)
	input	wire		HSMC_CLK_IN0,	// 2.5 V
	output	wire [2:1]	HSMC_CLK_OUT_p,	// LVDS (2.5 V)
	output	wire		HSMC_CLK_OUT0,	// 2.5 V
	input	wire [16:0]	HSMC_RX_D_p,	// 2.5 V
	output	wire [16:0]	HSMC_TX_D_p,	// LVDS / 2.5 V
	inout	wire [3:0]	HSMC_D,		// LVDS / 2.5 V
	inout	wire		HSMC_SDA,	// 2.5 V
	output	wire		HSMC_SCL,	// 2.5 V
	input	wire		HSMC_PRSNTn,	// 2.5 V
`endif

`ifdef HDMI
	// HDMI Tranceiver interface
	output	wire [23:0]	HDMI_TX_D,	// 3.3-V LVCMOS
	output	wire		HDMI_TX_CLK,	// 3.3-V LVCMOS
	output	wire		HDMI_TX_DE,	// 3.3-V LVCMOS
	output	wire		HDMI_TX_HS,	// 3.3-V LVCMOS
	output	wire		HDMI_TX_VS,	// 3.3-V LVCMOS
	input	wire		HDMI_TX_INT,	// 3.3-V LVCMOS
	inout	wire		HDMI_SCL,	// 3.3-V LVCMOS
	inout	wire		HDMI_SDA,	// 3.3-V LVCMOS
`endif

`ifdef PMOD
	// Digilent Peripheral Modules (Pmod) interface A and B
	inout	wire [7:0]	PMODA_IO,	// 3.3-V LVCMOS
	inout	wire [7:0]	PMODB_IO,	// 3.3-V LVCMOS
`endif

`ifdef QSPI
	// QSPI Serial Flash interface (1x512Mb)
	output	wire		QSPI_CSn,	// 3.3-V LVCMOS
	output	wire		QSPI_CLK,	// 3.3-V LVCMOS
	output	wire [3:0]	QSPI_IO,	// 3.3-V LVCMOS
`endif

`ifdef DAC
	// 16-bit DAC interface
	output	wire		DAC_SYNC,	// 3.3-V LVCMOS
	output	wire		DAC_SCLK,	// 3.3-V LVCMOS
	output	wire		DAC_DIN,	// 3.3-V LVCMOS
`endif

`ifdef GPIO
	// 8-bit ADC interface 1 and 2
	input	wire [8:1]	ADC1IN,		// 2.5 V
	input	wire [8:1]	ADC2IN,		// 2.5 V
`endif

`ifdef JTAG
	inout	wire		IP_SECURITY,	// 3.3-V LVCMOS
	output	wire		JTAG_SAFE,	// 3.3-V LVCMOS
`endif

`ifdef DDR3
	// DDR3 memory interface (1x64Mx16, 1x128Mx8)
	output	wire [9:0]	DDR3_A,		// SSTL-15 CLASS I
	output	wire [2:0]	DDR3_BA,	// SSTL-15 CLASS I
	output	wire		DDR3_CASn,	// SSTL-15 CLASS I
	output	wire		DDR3_CKE,	// SSTL-15 CLASS I
	output	wire		DDR3_CLK_p,	// DIFFERENTIAL 1.5-V SSTL-15 CLASS I (50 Ω)
	output	wire		DDR3_CSn,	// SSTL-15 CLASS I
	output	wire [2:0]	DDR3_DM,	// SSTL-15 CLASS I (50 Ω)
	inout	wire [23:0]	DDR3_DQ,	// SSTL-15 CLASS I (50 Ω)
	inout	wire [2:0]	DDR3_DQS_p,	// DIFFERENTIAL 1.5-V SSTL-15 CLASS I (50 Ω)
	output	wire		DDR3_ODT,	// SSTL-15 CLASS I
	output 	wire		DDR3_RASn,	// 1.5 V
	output	wire		DDR3_RESEtn,	// SSTL-15 CLASS I
	output	wire		DDR3_WEn,	// SSTL-15 CLASS I
`endif

	// Reset and Clocks from external PLL
	input	wire		CPU_RESETn,	// 3.3-V LVCMOS
`ifdef DDR3
	input	wire		CLK_DDR3_100_p,	// DIFFERENTIAL 1.5-V SSTL (100 MHz)
`endif
	input	wire		CLK_LVDS_125_p,	// LVDS / 2.5 V (125 MHz)
	input	wire		CLK_50_MAX10,	// 2.5 V (50 MHz)
	input	wire		CLK_25_MAX10,	// 2.5 V (25 MHz)
	input	wire		CLK_10_ADC	// 2.5 V (10 MHz)

);

`ifdef DDR3
	// DDR3 interface assignments
	wire			local_init_done;
	wire			local_cal_success;
	wire			local_cal_fail;

	// DDR3 Address Bit #13 is not available for DDR3 SDRAM A (64Mx16)
	assign DDR3_A[13] = 1'b0;

	// TODO / FIXME:
	// combine 'system_reset_n' with 'system_reset_debouncer.data_out_n'
	assign system_reset_n = CPU_RESETn & local_init_done;
`endif

	// Debounce and set correct polarity of reset input signal CPU_RESETn
	wire			system_reset_n;
	bit_syncin_debouncer system_reset_debouncer (
		.clk		(CLK_50_MAX10),
		.data_in_n	(CPU_RESETn),
		.data_out_n	(system_reset_n)
	);
	defparam system_reset_debouncer.WIDTH = 20;	// debounce 10ms@50MHz

	// Periphery power-on reset delay
	wire			periphery_reset_n;
	binary_delay periphery_reset_delay (
		.clk		(CLK_50_MAX10),
		.reset_n	(system_reset_n),
		.data_out_n	(periphery_reset_n)
	);
	defparam periphery_reset_delay.WIDTH = 20;	// debounce 10ms@50MHz

`ifdef ETHERNET_A
	// Ethernet PHY A power-on reset delay
	assign ENETA_RESETn = periphery_reset_n;
`endif

`ifdef ETHERNET_B
	// Ethernet PHY B power-on reset delay
	assign ENETB_RESETn = periphery_reset_n;
`endif

	// Debounce logic to clean out glitches within 1ms of user push buttons
	wire [3:0]		debounced_user_pb;
	binary_debouncer user_pb_debouncer (
		.clk		(CLK_50_MAX10),
		.reset_n	(system_reset_n),
		.data_in	(USER_PB),
		.data_out	(debounced_user_pb)
	);
	defparam user_pb_debouncer.WIDTH = 4;
	defparam user_pb_debouncer.POLARITY = "LOW";
	defparam user_pb_debouncer.TIMEOUT = 50000;	// debounce 1ms@50MHz
	defparam user_pb_debouncer.TIMEOUT_WIDTH = 16;	// ceil(log2(TIMEOUT))

	// Debounce logic to clean out glitches within 1ms of user dip switches
	wire [3:0]		debounced_user_dipsw;
	binary_debouncer user_dipsw_debouncer (
		.clk		(CLK_50_MAX10),
		.reset_n	(system_reset_n),
		.data_in	(USER_DIPSW),
		.data_out	(debounced_user_dipsw)
	);
	defparam user_dipsw_debouncer.WIDTH = 5;
	defparam user_dipsw_debouncer.POLARITY = "LOW";
	defparam user_dipsw_debouncer.TIMEOUT = 50000;	// debounce 1ms@50MHz
	defparam user_dipsw_debouncer.TIMEOUT_WIDTH = 16;// ceil(log2(TIMEOUT))

`ifdef SYSRUNSIG
	// System running signal by 50MHz clock over variable-bit count register
	binary_counter sysrunsig_cnt (
		.clk		(CLK_50_MAX10),
		.reset_n	(system_reset_n),
		.enable_n	(1'b0),
`ifdef USER_PINS
		.data_out_msb	(USER_LED[4])
`else
		.data_out_msb	()
`endif
	);
`ifdef SYSLINUX
	defparam sysrunsig_cnt.WIDTH = 26;
`elsif SYSZEPHYR
	defparam sysrunsig_cnt.WIDTH = 24;
`else
	defparam sysrunsig_cnt.WIDTH = 22;
`endif
`endif

`ifdef HDMI
	// I2C -- HDMI Tranceiver interface
	wire			i2c_serial_sda_in;
	wire			i2c_serial_scl_in;
	wire			i2c_serial_sda_oe;
	wire			i2c_serial_scl_oe;

	assign i2c_serial_scl_in = HDMI_SCL;
	assign HDMI_SCL = i2c_serial_scl_oe ? 1'b0 : 1'bz;

	assign i2c_serial_sda_in = HDMI_SDA;
	assign HDMI_SDA = i2c_serial_sda_oe ? 1'b0 : 1'bz;
`endif

	// SoC sub-system module
	ghrd_10m50daf484c6ges_nios2f socfpga_nios2f (

`ifdef USER_PINS
		// LED, Push-Button, DIP-SWitches
		.pio_avalon_led_external_connection_export	(USER_LED[3:0]),
`endif

`ifdef UART
		// 16550 UART interface
		.uart_16550_0_rs_232_serial_sout_oe		(),
		.uart_16550_0_rs_232_serial_sout		(UART_TX),
		.uart_16550_0_rs_232_serial_sin			(UART_RX),
		.uart_16550_0_rs_232_modem_out2_n		(),
		.uart_16550_0_rs_232_modem_out1_n		(),
		.uart_16550_0_rs_232_modem_dtr_n		(),
		.uart_16550_0_rs_232_modem_ri_n			(),
		.uart_16550_0_rs_232_modem_dcd_n		(),
		.uart_16550_0_rs_232_modem_dsr_n		(),
		.uart_16550_0_rs_232_modem_rts_n		(),
		.uart_16550_0_rs_232_modem_cts_n		(),
`endif

`ifdef HDMI
		// I2C -- HDMI Tranceiver interface
		.i2c_avalon_0_i2c_serial_scl_oe			(i2c_serial_scl_oe),
		.i2c_avalon_0_i2c_serial_scl_in			(i2c_serial_scl_in),
		.i2c_avalon_0_i2c_serial_sda_oe			(i2c_serial_sda_oe),
		.i2c_avalon_0_i2c_serial_sda_in			(i2c_serial_sda_in),
`endif

`ifdef PMOD
		// SPI -- Digilent Peripheral Modules (Pmod) interface A
		.spi_avalon_0_external_SCLK			(PMODA_IO[3]),
		.spi_avalon_0_external_MISO			(PMODA_IO[2]),
		.spi_avalon_0_external_MOSI			(PMODA_IO[1]),
		.spi_avalon_0_external_SS_n			(PMODA_IO[0]),
`endif

`ifdef QSPI
		// QSPI Serial Flash interface (1x512Mb)
		.ext_flash_0_qspi_pins_ncs			(QSPI_CSn),
		.ext_flash_0_qspi_pins_dclk			(QSPI_CLK),
		.ext_flash_0_qspi_pins_data			(QSPI_IO),
`endif

`ifdef DDR3
		// DDR3 memory interface (1x64Mx16, 1x128Mx8)
		.memory_mem_a					(DDR3_A[12:0]),
		.memory_mem_ba					(DDR3_BA),
		.memory_mem_cas_n				(DDR3_CASn),
		.memory_mem_cke					(DDR3_CKE),
		.memory_mem_ck					(DDR3_CLK_p),
		.memory_mem_ck_n				(DDR3_CLK_n),
		.memory_mem_cs_n				(DDR3_CSn),
		.memory_mem_dm					(DDR3_DM),
		.memory_mem_dq					(DDR3_DQ),
		.memory_mem_dqs					(DDR3_DQS_p),
		.memory_mem_dqs_n				(DDR3_DQS_n),
		.memory_mem_odt					(DDR3_ODT),
		.memory_mem_ras_n				(DDR3_RASn),
		.memory_mem_reset_n				(DDR3_RESETn),
		.memory_mem_we_n				(DDR3_WEn),
		.mem_if_ddr3_emif_0_status_local_init_done	(local_init_done),
		.mem_if_ddr3_emif_0_status_local_cal_success	(local_cal_success),
		.mem_if_ddr3_emif_0_status_local_cal_fail	(local_cal_fail),
		.mem_resetn_in_reset_reset_n			(CPU_RESETn),
`endif

		// Reset and Clocks from external PLL
		.reset_reset_n					(system_reset_n),
`ifdef DDR3
		.ref_clock_bridge_in_clk_clk			(CLK_DDR3_100_p),
`endif
		.clk_clk					(CLK_50_MAX10)

	);

endmodule
