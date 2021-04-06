library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg_tb is
		generic (
			N: natural := 4
		);
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
			sal: out std_logic_vector(N-1 downto 0)
		);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '0';
	signal ent_tb: std_logic := '0';
	signal sal_tb: std_logic_vector(N-1 downto 0);
	
begin
     
	clk_tb <= not clk_tb after 20 ns;
	rst_tb <= '1', '0' after 30 ns, '1' after 300 ns, '0' after 320 ns;
	ena_tb <= '0', '1' after 50 ns;
	ent_tb <= '1', '0' after 105 ns;
	

	DUT:shift_reg
		port map(
			clk => 	clk_tb,
			rst => 	rst_tb,
			ena => 	ena_tb,
			ent => 	ent_tb,
			sal =>	sal_tb
		);
end;
