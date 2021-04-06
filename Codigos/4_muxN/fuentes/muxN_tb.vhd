library IEEE;
use IEEE.std_logic_1164.all;

entity muxN_tb is
		generic(
			N: integer := 4;  --N:=2**M;
			M: integer := 2
			);
end;

architecture muxN_tb_arq of muxN_tb is
	-- Declaración del componente	
	component muxN is
		generic(
			N: integer := 4;  --N:=2**M;
			M: integer := 2
			);
		port(
			ent_i: 	in std_logic_vector(N-1 downto 0);
			sel_i: 	in std_logic_vector(M-1 downto 0);
			sal_o: 	out std_logic
		);
	end component;

	-- señales de prueba	
	signal ent_tb:  std_logic_vector(N-1 downto 0);
	signal sel_tb: std_logic_vector(M-1 downto 0);
	signal sal_tb: std_logic;
	
begin
	
	ent_tb(0) <= '1', '0' after 10 ns, '1' after 50 ns;
	ent_tb(1) <= '0', '1' after 20 ns, '0' after 70 ns, '1' after 100 ns;
	ent_tb(2) <= '0', '1' after 125 ns, '0' after 165 ns, '1' after 185 ns;
	ent_tb(3) <= '1', '0' after 20 ns, '1' after 70 ns, '0' after 100 ns;
	sel_tb(0) <= '0','1' after 40 ns, '0' after 80 ns,'1' after 120 ns,
	'0' after 160 ns,'1' after 200 ns;	
	sel_tb(1) <= '0', '1' after 160 ns;	


	-- Instancia del componente a probar	
	DUT: muxN
		port map(
			ent_i => ent_tb,
			sel_i => sel_tb,
			sal_o => sal_tb
		);

end;
