library IEEE;
use IEEE.std_logic_1164.all;

entity sum_rest4b_tb is
end;

architecture sum_rest4b_tb_arq of sum_rest4b_tb is

	-- Declaracion de componente
	component sum_rest4b is
		port(
			a_i: in std_logic_vector(3 downto 0);
			b_i: in std_logic_vector(3 downto 0);
			s_o: out std_logic_vector(3 downto 0);
			c_o: out std_logic;
			sr_i: in std_logic
		);
	end component;

	-- Senales de prueba
	signal a_tb: std_logic_vector(3 downto 0) := "0001";
	signal b_tb: std_logic_vector(3 downto 0) := "0100";
	signal sr_tb: std_logic := '0';
	signal s_tb: std_logic_vector(3 downto 0);
	signal co_tb: std_logic;
	
begin

	-- Senales de excitacion
	-- a_tb <= not a_tb after 20 ns;
	-- b_tb <= not b_tb after 40 ns;
	sr_tb <= '1' after 180 ns, '0' after 250 ns, '1' after 400 ns,
		'0' after 600 ns,'1' after 800 ns;
    a_tb <= "0010" after 400 ns;
	b_tb <= "1111" after 400 ns;
	
	-- Instanciacion del componente a probar
	DUT: sum_rest4b
		port map(
			a_i		=> a_tb,
			b_i 	=> b_tb,
			sr_i	=> sr_tb,
			s_o 	=> s_tb,
			c_o		=> co_tb
		);

end;
