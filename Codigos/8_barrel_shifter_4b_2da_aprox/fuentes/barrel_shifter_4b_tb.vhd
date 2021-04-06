library IEEE;
use IEEE.std_logic_1164.all;

entity barrel_shifter_4b_tb is
		generic (
			M_tb: natural :=2;
			N_tb: natural := 4
			);
end;

architecture barrel_shifter_4b_tb_arq of barrel_shifter_4b_tb is
	component barrel_shifter_4b is
		generic (
			N: natural := 4;
			M: natural :=2
		);
		port (
			s_i: in std_logic_vector(M-1 downto 0);
			d_i: in std_logic_vector(N-1 downto 0);
			y_o: out std_logic_vector(N-1 downto 0)
		);
	end component;

	signal s_tb: std_logic_vector(M_tb-1 downto 0);
	signal d_tb: std_logic_vector(N_tb-1 downto 0);
	signal y_tb: std_logic_vector(N_tb-1 downto 0);

	
begin
     
	s_tb <= "00", "01" after 40 ns,"10" after 80 ns,"11" after 120 ns,
		"00" after 160 ns;
	d_tb <= "0100";
	

	DUT: barrel_shifter_4b
		port map(
			s_i => 	s_tb,
			d_i => 	d_tb,
			y_o => 	y_tb
		);
end;
