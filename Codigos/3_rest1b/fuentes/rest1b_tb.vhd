library IEEE;
use IEEE.std_logic_1164.all;

entity rest1b_tb is
end;

architecture sum1b_tb_arq of rest1b_tb is

	-- Declaracion de componente
	component rest1b is
		port(
			a_i: in std_logic;
			b_i: in std_logic;
			c_i: in std_logic;
			r_o: out std_logic;
			c_o: out std_logic
		);
	end component;
	
	-- Declaracion de senales de prueba
	signal a_tb: std_logic := '0';
	signal b_tb: std_logic := '0';
	signal ci_tb: std_logic := '0';
	signal r_tb: std_logic;
	signal co_tb: std_logic;

begin

	a_tb <= not a_tb after 10 ns;
	b_tb <= not b_tb after 20 ns;
	ci_tb <= not ci_tb after 40 ns;

	DUT: rest1b
		port map(
			a_i	=> a_tb, 
			b_i	=> b_tb,
			c_i 	=> ci_tb,
			r_o	=> r_tb,
			c_o 	=> co_tb
		);
	
end;
