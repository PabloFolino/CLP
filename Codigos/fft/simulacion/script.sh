ghdl -a ../fuentes/fft.vhd ../fuentes/fft_tb.vhd
ghdl -s ../fuentes/fft.vhd ../fuentes/fft_tb.vhd
ghdl -e fft_tb
ghdl -r fft_tb --vcd=fft_tb.vcd --stop-time=250ns
gtkwave fft_tb.vcd
# Se debe ejecutar --> sudo sh script.sh

