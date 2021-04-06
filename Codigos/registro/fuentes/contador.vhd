library IEEE;
use IEEE.std_logic_1164.all;

entity contador is
	generic (
		N: natural := 4
	);
	port (
		clk: in std_logic;
		rst: in std_logic;
		d: 	 in std_logic;
		ena: in std_logic;
		sal: out std_logic
	);
end;

architecture estruc of contador is
	component registro is
		generic(
			N: natural := 4
		);
		port(
			clk_i	: in std_logic;
			rst_i	: in std_logic;
			ena_i	: in std_logic;
			d_i	: in std_logic_vector(N-1 downto 0);
			q_o	: out std_logic_vector(N-1 downto 0)
		);
	end component;

	signal d: std_logic_vector(N-1 downto 0);
	
begin
	registro_i : for i in 0 to N-1 generate
		registro_inst:registro
			port map(
				clk_i 	=> clk ,
				d_i	  	=> d(i),
				rst_i 	=> rst,
				ena		=> ena,
				q_o 	=> d(i +1)
			);
	end generate;
sal <= d(N) ;
d(0) <= sal +1;

end;

