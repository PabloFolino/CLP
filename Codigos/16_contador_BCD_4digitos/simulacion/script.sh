ghdl -a ../fuentes/contador_bcd.vhd ../fuentes/contador_bcd_4d.vhd  ../fuentes/contador_bcd_4d_tb.vhd
ghdl -s ../fuentes/contador_bcd.vhd ../fuentes/contador_bcd_4d.vhd  ../fuentes/contador_bcd_4d_tb.vhd
ghdl -e contador_bcd_4d_tb
ghdl -r contador_bcd_4d_tb --vcd=contador_bcd_4d_tb.vcd --stop-time=1us
gtkwave contador_bcd_4d_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

