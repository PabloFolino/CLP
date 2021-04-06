library IEEE;
use IEEE.std_logic_1164.all;

entity sum_rest4b is
	port(
		a_i: in std_logic_vector(3 downto 0);
		b_i: in std_logic_vector(3 downto 0);
		s_o: out std_logic_vector(3 downto 0);
		c_o: out std_logic;
		sr_i: in std_logic
	);
end;

architecture sum_rest4b_arq of sum_rest4b is
	
	component sum_rest1b is
		port(
			a_i: in std_logic;
			b_i: in std_logic;
			c_i: in std_logic;
			sr_i: in std_logic;
			s_o: out std_logic;
			c_o: out std_logic
		);
	end component;

	signal aux: std_logic_vector(4 downto 0); 
begin

	-- sr_i además de decir si es suma o resta, en resta 
	-- suma uno para hacer el complemento a 2 
	aux(0) <= sr_i;
	
	sum_rest1b_ins_0: sum_rest1b
		port map(
			a_i		=> a_i(0), 
			b_i		=> b_i(0), 
			c_i		=> aux(0),
			sr_i	=> aux(0),
			s_o		=> s_o(0), 
			c_o		=> aux(1)
		);

	sum_rest1b_ins_1: sum_rest1b
		port map(
			a_i		=> a_i(1), 
			b_i		=> b_i(1), 
			c_i		=> aux(1),
			sr_i	=> sr_i,		
			s_o		=> s_o(1), 
			c_o		=> aux(2)
		);
		
	sum_rest1b_ins_2: sum_rest1b
		port map(
			a_i		=> a_i(2), 
			b_i		=> b_i(2), 
			c_i		=> aux(2),
			sr_i	=> sr_i,
			s_o		=> s_o(2), 
			c_o		=> aux(3)
		);

	sum_rest1b_ins_3: sum_rest1b
		port map(
			a_i		=> a_i(3), 
			b_i		=> b_i(3), 
			c_i		=> aux(3),
			sr_i	=> sr_i,
			s_o		=> s_o(3), 
			c_o		=> aux(4)
		);
	-- Carry de salida del Módulo de 4 bits
	c_o <= aux(4);

end;
