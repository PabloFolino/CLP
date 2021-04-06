library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sumNb_tb is
end;

architecture sumNb_tb_arq of sumNb_tb is

	-- Declaracion de componente
	component sumNb is
		generic(
			N:natural:=4
		);	
		port(
			a_i: 	in std_logic_vector(N-1 downto 0);
			b_i: 	in std_logic_vector(N-1 downto 0);
			ci_i: 	in std_logic;
			s_o: 	out std_logic_vector(N-1 downto 0);
			co_o: 	out std_logic
		);
	end component;

	constant N_tb: natural := 4;
	-- Senales de prueba
	signal a_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(3,N_tb));
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(5,N_tb));
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic_vector(N_tb downto 0);
	signal co_tb: std_logic;
	
begin

	-- Senales de excitacion
	-- a_tb <= not a_tb after 20 ns;
	-- b_tb <= not b_tb after 40 ns;
	ci_tb <= '1' after 180 ns, '0' after 360 ns, '1' after 540 ns;

	-- Instanciacion del componente a probar
	DUT: sumNb
		generic map(
			N => N_tb
		)
		port map(
			a_i	=> a_tb,
			b_i	=> b_tb,
			ci_i	=> ci_tb,
			s_o	=> s_tb,
			co_o	=> co_tb
		);

end;
