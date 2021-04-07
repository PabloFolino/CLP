library IEEE;
use IEEE.std_logic_1164.all;

entity contador_bcd is
	generic (
		N: natural := 4
	);
	port(
		clk: 	in std_logic;
		rst: 	in std_logic;
		ena: 	in std_logic;
		Q: 		out std_logic_vector(N-1 downto 0)
	);
	end contador_bcd;

architecture contador_bcd_arq of contador_bcd is
	component ffd is
		port(
			clk: 	in std_logic;
			rst: 	in std_logic;
			ena: 	in std_logic;
			D: 		in std_logic;
			Q: 		out std_logic
		);
	end component;
	
	signal D: std_logic_vector(N-1 downto 0);
	signal ena_aux: std_logic_vector(N downto 0);
	signal Q_aux: std_logic_vector(N downto 0);
		
	begin
		Q <= Q_aux(N downto 1);
		Q_aux(0)<='1';
		ena_aux(0) <= ena;
	
		ffd_i : for i in 0 to N-1 generate
			begin
				ff_inst:ffd
					port map(
						clk =>	clk ,
						D 	=> 	D(i),
						ena =>	ena,
						rst =>	rst,
						Q 	=>	Q_aux(i+1)
					);
				D(i) <=Q_aux(i+1) xor ena_aux(i);
				ena_aux(i+1) <= ena_aux(i) and Q_aux(i+1);
			end generate ffd_i;
end ;

