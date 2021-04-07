library IEEE;
use IEEE.std_logic_1164.all;

entity contador_bcd_tb is

end;

architecture contador_bcd_tb_arq of contador_bcd_tb is

	component contador_bcd is
		generic (
			N: natural := 4
		);
		port(
			clk: 	in std_logic;
			rst: 	in std_logic;
			ena: 	in std_logic;
			Q: 		out std_logic_vector(N-1 downto 0)
		);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '0';
	signal Q_tb: std_logic_vector(N-1 downto 0);
	
begin
	clk_tb <= not clk_tb after 10 ns;
	ena_tb <= '0', '1' after 50 ns, '0' after 300 ns, '1' after 330 ns;
	rst_tb <= '1', '0' after 40 ns, '1' after 400 ns, '0' after 430 ns;

	DUT: contador_bcd
		generic map (N=>4)
		port map(
			clk => 	clk_tb,
			rst => 	rst_tb,
			ena => 	ena_tb,
			Q =>	Q_tb
		);
end;
