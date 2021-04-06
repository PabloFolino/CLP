library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg is
	generic (
		N: natural := 4
	);
	port (
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		ent: in std_logic;
		sal: out std_logic
	);
end;

architecture shift_reg_arq of shift_reg is
	component ffd is
		port ( 
			rst: 	in std_logic;
			clk: 	in std_logic;
			ena: 	in std_logic;
			D: 	in std_logic;
			Q: 	out std_logic
		);
	end component;
	
	signal D: std_logic_vector(0 to N);
	
begin
	shift_reg_i : for i in 0 to N-1 generate
		ff_inst:ffd
			port map(
				clk =>  clk ,
				ena => ena ,
				D =>   	D(i),
				rst => 	rst,
				Q => 	D(i +1)
			);
	end generate;
D(0) <= ent ;
sal <= D(N) ;
end;

