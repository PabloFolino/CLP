library IEEE;
use IEEE.std_logic_1164.all;

entity gen_hab_tb is
end;

architecture contador_bcd_tb_arq of gen_hab_tb is

	component gen_hab is
	generic (
		N: integer := 4
	);
	port(
		clk: 	in std_logic;
		rst: 	in std_logic;
		s: 		out std_logic
	);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal s_tb: std_logic := '0';

	
begin
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '1', '0' after 30 ns, '1' after 400 ns, '0' after 430 ns;

	DUT: gen_hab
		generic map(N => 9)
		port map(
			clk => 	clk_tb,
			rst => 	rst_tb,
			s => 	s_tb
		);
end;
