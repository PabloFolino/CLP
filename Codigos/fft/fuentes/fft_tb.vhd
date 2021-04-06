library IEEE;
use IEEE.std_logic_1164.all;

entity fft_tb is
end;

architecture fft_tb_arq of fft_tb is

	component fft is
		 port(
			clk: 	in std_logic;
			rst: 	in std_logic;
			ena: 	in std_logic;
			T: 	in std_logic;
			Q: 	out std_logic
		);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '0';
	signal T_tb: std_logic := '0';
	signal Q_tb: std_logic;
	
begin
	clk_tb <= not clk_tb after 20 ns;
	ena_tb <= '0', '1' after 50 ns;
	T_tb <= '1', '0' after 70 ns,'1' after 100 ns, '0' after 500 ns;
	rst_tb <= '1', '0' after 30 ns;

	DUT:fft
		port map(
			clk => 	clk_tb,
			rst => 	rst_tb,
			ena => 	ena_tb,
			T => 	T_tb,
			Q =>	Q_tb
		);
end;
