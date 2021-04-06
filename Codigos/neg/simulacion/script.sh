ghdl -a ../fuentes/neg.vhd ../fuentes/neg_tb.vhd
ghdl -s ../fuentes/neg.vhd ../fuentes/neg_tb.vhd
ghdl -e neg_tb
ghdl -r neg_tb --vcd=neg_tb.vcd --stop-time=1us
gtkwave neg_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

