ghdl -a ../fuentes/sum1b.vhd ../fuentes/sum1b_tb.vhd
ghdl -s ../fuentes/sum1b.vhd ../fuentes/sum1b_tb.vhd
ghdl -e sum1b_tb
ghdl -r sum1b_tb --vcd=sum1b_tb.vcd --stop-time=1us
gtkwave sum1b_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

