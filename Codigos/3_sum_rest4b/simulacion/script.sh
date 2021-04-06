ghdl -a ../fuentes/sum_rest1b.vhd ../fuentes/sum_rest4b.vhd ../fuentes/sum_rest4b_tb.vhd
ghdl -s ../fuentes/sum_rest1b.vhd ../fuentes/sum_rest4b.vhd ../fuentes/sum_rest4b_tb.vhd
ghdl -e sum_rest4b_tb
ghdl -r sum_rest4b_tb --vcd=sum_rest4b_tb.vcd --stop-time=1000ns
gtkwave sum_rest4b_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

