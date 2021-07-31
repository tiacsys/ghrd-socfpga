#**************************************************************
# Create Clock
#**************************************************************

derive_pll_clocks

# JTAG Signal Constraints constrain the TCK port, assuming a 10MHz JTAG clock and 3ns delays
create_clock -name {altera_reserved_tck} -period 41.667 [get_ports { altera_reserved_tck }]
set_input_delay -clock altera_reserved_tck -clock_fall -max 5 [get_ports altera_reserved_tdi]
set_input_delay -clock altera_reserved_tck -clock_fall -max 5 [get_ports altera_reserved_tms]
set_output_delay -clock altera_reserved_tck 5 [get_ports altera_reserved_tdo]

create_clock -name {CLK_50_MAX10} -period 20.000 {CLK_50_MAX10}

set_false_path -to [get_ports {USER_LED[*]}]
set_false_path -to [get_ports {CPU_RESETn}]
set_false_path -from [get_ports {CPU_RESETn}]

derive_clock_uncertainty

# QSPI interface
set_output_delay -clock {CLK_50_MAX10 } -rise -min 11 [get_ports {QSPI_CSn}]
set_output_delay -clock {CLK_50_MAX10 } -rise -min 11 [get_ports {QSPI_CLK}]
set_output_delay -clock {CLK_50_MAX10 } -rise -min 11 [get_ports {QSPI_IO[*]}]
set_input_delay  -clock {CLK_50_MAX10 } -rise -min 10 [get_ports {QSPI_IO[*]}]

# UART
set_false_path -from * -to [get_ports {UART_TX}]
