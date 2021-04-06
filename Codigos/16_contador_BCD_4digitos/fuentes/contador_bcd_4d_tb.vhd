library IEEE;
use IEEE.std_logic_1164.all;

entity contador_bcd_4d_tb is
		generic (
			M: natural := 4
		);
end;

architecture contador_bcd_4d_tb_arq of contador_bcd_4d_tb is

	component contador_bcd_4d is
		generic (
			M: natural := 4
		);
		port(
			clk: 	in std_logic;
			rst: 	in std_logic;
			ena: 	in std_logic;
			co: 	out std_logic;
			bcd0,bcd1,bcd2,bcd3: out std_logic_vector(M-1 downto 0)
		);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '0';
	signal cy_tb: std_logic := '0';
	signal bcd0_tb,bcd1_tb,bcd2_tb,bcd3_tb: std_logic_vector(M-1 downto 0);
	
begin
	clk_tb <= not clk_tb after 10 ns;
	ena_tb <= '0', '1' after 50 ns,'0' after 900 ns,'1' after 1 us;
	rst_tb <= '1', '0' after 30 ns, '1' after 600 ns, '0' after 630 ns;

	DUT: contador_bcd_4d
		generic map (M => 4)
		port map(
			clk => 	clk_tb,
			rst => 	rst_tb,
			ena => 	ena_tb,
			co => 	cy_tb,
			bcd0 => 	bcd0_tb,
			bcd1 => 	bcd1_tb,
			bcd2 => 	bcd2_tb,
			bcd3 => 	bcd3_tb
			
		);
end;
