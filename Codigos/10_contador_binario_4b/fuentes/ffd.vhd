-- Es un FF D que no tiene habilitación
library IEEE;
use IEEE.std_logic_1164.all;

entity ffd is
	port(
		clk: 	in std_logic;
		rst: 	in std_logic;
		D: 		in std_logic;
		Q: 		out std_logic
	);
	end ffd;

architecture ffd_arq of ffd is
begin
	process(clk,rst)
		begin
		if rst='1' then
			Q<='0';
		elsif rising_edge(clk) then	
				Q <= D;	
		end if;
	end process;
end ffd_arq;

