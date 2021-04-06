ghdl -a ../fuentes/rest1b.vhd ../fuentes/rest1b_tb.vhd
ghdl -s ../fuentes/rest1b.vhd ../fuentes/rest1b_tb.vhd
ghdl -e sum1b_tb
ghdl -r rest1b_tb --vcd=rest1b_tb.vcd --stop-time=250ns
gtkwave rest1b_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

