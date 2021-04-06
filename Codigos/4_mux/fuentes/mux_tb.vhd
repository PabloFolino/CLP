library IEEE;
use IEEE.std_logic_1164.all;

entity mux_tb is
end;

architecture mux_tb_arq of mux_tb is

	-- Declaración del componente	
	component mux is
		port(
			a_i: 	in std_logic;
			b_i: 	in std_logic;
			sel_i: 	in std_logic;
			sal_o: 	out std_logic
		);
	end component;

	-- señales de prueba	
	signal a_tb:  std_logic;
	signal b_tb:  std_logic;
	signal sel_tb: std_logic;
	signal sal_tb: std_logic;
	
begin
	sel_tb <= '0', '1' after 30 ns, '0' after 60 ns,'1' after 90 ns, '0' after 120 ns;		
	a_tb <= '1', '0' after 10 ns, '1' after 50 ns;
	b_tb <= '0', '1' after 20 ns, '0' after 70 ns, '1' after 100 ns;

	-- Instancia del componente a probar	
	DUT: mux
		port map(
			a_i => a_tb,
			b_i => b_tb,
			sel_i => sel_tb,
			sal_o => sal_tb
		);

end;
