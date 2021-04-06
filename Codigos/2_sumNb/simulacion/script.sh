ghdl -a ../fuentes/sum1b.vhd ../fuentes/sumNb.vhd ../fuentes/sumNb_tb.vhd
ghdl -s ../fuentes/sum1b.vhd ../fuentes/sumNb.vhd ../fuentes/sumNb_tb.vhd
ghdl -e sumNb_tb
ghdl -r sumNb_tb --vcd=sumNb_tb.vcd --stop-time=1us
gtkwave sumNb_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

