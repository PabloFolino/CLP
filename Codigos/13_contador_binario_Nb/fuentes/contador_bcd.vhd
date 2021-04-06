library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador_bcd is
	generic (
		N: natural := 6
	);
	port(
		clk: 	in std_logic;
		rst: 	in std_logic;
		ena: 	in std_logic;
		Q: 		out std_logic_vector(N-1 downto 0)
	);
end;

architecture contador_bcd_arq of contador_bcd is

	--Inicializo salidas
	signal Q_aux: std_logic_vector(N-1 downto 0):=std_logic_vector(to_unsigned(0,N));
	
	begin
    proceso_contador: process (ena, clk,rst) is
    	variable count: integer range 0 to 512:=0;
		begin
        if rst = '1' then
            Q_aux <= std_logic_vector(to_unsigned(0,N));
            count:=0;
			elsif rising_edge(clk) and ena='1' then
				count:= to_integer(unsigned(Q_aux));
				count:= count+1;
				Q_aux <= std_logic_vector(to_unsigned(count,N));
		end if;
    end process  proceso_contador;
    Q <= Q_aux;
end;
