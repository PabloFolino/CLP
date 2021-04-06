ghdl -a ../fuentes/mux.vhd ../fuentes/mux_tb.vhd 
ghdl -s ../fuentes/mux.vhd ../fuentes/mux_tb.vhd 
ghdl -e mux_tb
ghdl -r mux_tb --vcd=mux_tb.vcd --stop-time=140ns
gtkwave mux_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

