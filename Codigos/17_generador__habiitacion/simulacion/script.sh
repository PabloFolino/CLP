ghdl -a ../fuentes/gen_hab.vhd ../fuentes/gen_hab_tb.vhd
ghdl -s ../fuentes/gen_hab.vhd ../fuentes/gen_hab_tb.vhd
ghdl -e gen_hab_tb
ghdl -r gen_hab_tb --vcd=gen_hab_tb.vcd --stop-time=1us
gtkwave gen_hab_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

