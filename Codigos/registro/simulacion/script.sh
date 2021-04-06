ghdl -a ../fuentes/registro.vhd ../fuentes/contador.vhd ../fuentes/contador_tb.vhd
ghdl -s ../fuentes/registro.vhd ../fuentes/contador.vhd ../fuentes/contador_tb.vhd
ghdl -e contador_tb
ghdl -r contador_tb --vcd=contador_tb.vcd --stop-time=1000ns
gtkwave contador_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

