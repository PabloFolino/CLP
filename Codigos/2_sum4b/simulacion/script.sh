ghdl -a ../fuentes/sum1b.vhd ../fuentes/sum4b.vhd ../fuentes/sum4b_tb.vhd
ghdl -s ../fuentes/sum4b.vhd ../fuentes/sum4b_tb.vhd
ghdl -e sum4b_tb
ghdl -r sum4b_tb --vcd=sum4b_tb.vcd --stop-time=1us
gtkwave sum4b_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

