ghdl -a ../fuentes/ffd.vhd ../fuentes/contador_bcd.vhd ../fuentes/contador_bcd_tb.vhd
ghdl -s ../fuentes/contador_bcd.vhd ../fuentes/contador_bcd_tb.vhd
ghdl -e contador_bcd_tb
ghdl -r contador_bcd_tb --vcd=contador_bcd_tb.vcd --stop-time=500ns
gtkwave contador_bcd_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

