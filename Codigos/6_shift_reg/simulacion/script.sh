ghdl -a ../fuentes/ffd.vhd ../fuentes/shift_reg.vhd ../fuentes/shift_reg_tb.vhd
ghdl -s ../fuentes/ffd.vhd ../fuentes/shift_reg.vhd ../fuentes/shift_reg_tb.vhd
ghdl -e shift_reg_tb
ghdl -r shift_reg_tb --vcd=shift_reg_tb.vcd --stop-time=500ns
gtkwave shift_reg_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

