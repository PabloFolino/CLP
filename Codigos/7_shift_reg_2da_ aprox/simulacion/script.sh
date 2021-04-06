ghdl -a ../fuentes/shift_reg.vhd ../fuentes/shift_reg_tb.vhd
ghdl -s ../fuentes/shift_reg.vhd ../fuentes/shift_reg_tb.vhd
ghdl -e shift_reg_tb
ghdl -r shift_reg_tb --vcd=shift_reg_tb.vcd --stop-time=400ns
gtkwave shift_reg_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

