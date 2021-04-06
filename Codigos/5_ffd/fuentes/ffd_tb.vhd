library IEEE;
use IEEE.std_logic_1164.all;

entity ffd_tb is
end;

architecture ffd_tb_arq of ffd_tb is

	component ffd is
		 port(
			clk: 	in std_logic;
			rst: 	in std_logic;
			ena: 	in std_logic;
			D: 	in std_logic;
			Q: 	out std_logic
		);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '0';
	signal D_tb: std_logic := '0';
	signal Q_tb: std_logic;
	
begin

	clk_tb <= '0','1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns, '1' after 100 ns,'0' after 120 ns;
	ena_tb <= '0', '1' after 50 ns;
	D_tb <= '1', '0' after 70 ns;
	rst_tb <= '1', '0' after 30 ns;

	DUT: entity work.ffd
		port map(
			clk => 	clk_tb,
			rst => 	rst_tb,
			ena => 	ena_tb,
			D => 	D_tb,
			Q =>	Q_tb
		);
end;
