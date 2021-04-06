library IEEE;
use IEEE.std_logic_1164.all;

entity contador_tb is
end;

architecture contador_tb_arq of contador_tb is

	entity component contador is
		generic (
			N: natural := 4
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
	signal sal_tb: std_logic (N-1 downto 0):= '0000';	
	
begin

	clk_tb <= not clk_tb after 20ns;
	ena_tb <= '1' after 50 ns;
	rst_tb <= '1', '0' after 30 ns;
	
	DUT: entity work.contador
		port map(
			clk => clk_tb,
			rst => rst_tb,
			ena => ena,
			sal => sal_tb
		);

end;
