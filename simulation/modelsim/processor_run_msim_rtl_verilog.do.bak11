transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/Bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/DataPath.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/subtract.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/MDR.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/multiplication.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/encoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/PC_Register.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/register64.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/register32.v}
vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/division.v}

vlog -vlog01compat -work work +incdir+C:/Users/itsma/OneDrive/Desktop/Queens/3rd\ year/Winter/374/374 {C:/Users/itsma/OneDrive/Desktop/Queens/3rd year/Winter/374/374/datapath_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  datapath_tb

add wave *
view structure
view signals
run 500 ns
