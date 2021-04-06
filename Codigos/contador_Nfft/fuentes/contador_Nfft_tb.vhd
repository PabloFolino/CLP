library IEEE;
use IEEE.std_logic_1164.all;

entity contador_Nfft_tb is
--		generic (
 --  N: natural := 8
--);
end;

architecture contador_Nfft_tb_arq of contador_Nfft_tb is

	component contador_Nfft is
		generic (
			N: natural := 8
		);
		port (
			clk: in std_logic;
			rst: in std_logic;
			ena: in std_logic;
			sal: out std_logic
		);
	end component;
	

	signal rst_tb: std_logic := '0';
	signal clk_tb: std_logic := '0';
	signal ena_tb: std_logic := '0';
	signal sal_tb: std_logic;	
	
begin

	clk_tb <= not clk_tb after 20 ns;
	ena_tb <= '1' after 50 ns;
	rst_tb <= '1', '0' after 110 ns;
	
	DUT: contador_Nfft
		port map(
			clk => clk_tb,
			rst => rst_tb,
			ena => ena_tb,
			sal => sal_tb
		);

end;
