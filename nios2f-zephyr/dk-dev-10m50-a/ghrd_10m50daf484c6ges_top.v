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

endmodule
