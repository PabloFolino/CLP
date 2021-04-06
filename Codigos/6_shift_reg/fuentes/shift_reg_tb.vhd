library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg_tb is
end;

architecture shift_reg_tb_arq of shift_reg_tb is
	component shift_reg is
		generic (
			N: natural := 4
		);
		port (
			clk: in std_logic;
			rst: in std_logic;
			ena: in std_logic;
			ent: in std_logic;
			sal: out std_logic
		);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '0';
	signal D_tb: std_logic := '0';
	signal Q_tb: std_logic;
	
begin

	clk_tb <= not clk_tb after 20 ns;
	--clk_tb <= '0', '1' after 20 ns,'0' after 40 ns,'1' after 60 ns,'0' after 80 ns,'1' after 100 ns;
	ena_tb <= '0', '1' after 50 ns;
	D_tb <= '1', '0' after 70 ns;
	rst_tb <= '1', '0' after 30 ns;

	--DUT: entity work.ffd
	--DUT: entity work.shift_reg
	DUT:shift_reg
		port map(
			clk => 	clk_tb,
			rst => 	rst_tb,
			ena => 	ena_tb,
			ent => 	D_tb,
			sal =>	Q_tb
		);
end;
