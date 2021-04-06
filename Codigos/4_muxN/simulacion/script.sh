ghdl -a ../fuentes/muxN.vhd ../fuentes/muxN_tb.vhd 
ghdl -s ../fuentes/muxN.vhd ../fuentes/muxN_tb.vhd 
ghdl -e muxN_tb
ghdl -r muxN_tb --vcd=muxN_tb.vcd --stop-time=200ns
gtkwave muxN_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

