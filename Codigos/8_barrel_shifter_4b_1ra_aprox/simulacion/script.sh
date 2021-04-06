ghdl -a ../fuentes/barrel_shifter_4b.vhd ../fuentes/barrel_shifter_4b_tb.vhd
ghdl -s ../fuentes/barrel_shifter_4b.vhd ../fuentes/barrel_shifter_4b_tb.vhd
ghdl -e barrel_shifter_4b_tb
ghdl -r barrel_shifter_4b_tb --vcd=barrel_shifter_4b_tb.vcd --stop-time=400ns
gtkwave barrel_shifter_4b_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

