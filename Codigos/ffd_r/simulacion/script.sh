ghdl -a ../fuentes/ffd_r.vhd ../fuentes/ffd_tb.vhd
ghdl -s ../fuentes/ffd_r.vhd ../fuentes/ffd_tb.vhd
ghdl -e ffd_tb
ghdl -r ffd_tb --vcd=ffd_r_tb.vcd --stop-time=140ns
gtkwave ffd_r_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

