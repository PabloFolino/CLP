library IEEE;
use IEEE.std_logic_1164.all;

entity fft is
	port(
		clk: 	in std_logic;
		rst: 	in std_logic;
		ena: 	in std_logic;
		T:	in std_logic;
		Q:	out std_logic
	);
	end fft;

architecture fft_arq of fft is
signal q_aux: std_logic;
begin
	process(clk,rst)
		begin
		if rst='1' then
			Q<='0';
		elsif falling_edge(clk) then	
			if ena='1' and T='1' then	
				if  q_aux='1' then
				    q_aux<= '0';
					Q <= '0';
				else
				    q_aux<='1';
					Q <= '1';
				end if;
			end if;
		end if;
	end process;
Q <= q_aux;
end fft_arq;

