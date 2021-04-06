library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador_bcd_4d is
	generic (
		M: natural := 4
	);
	port(
		clk: 	in std_logic;
		rst: 	in std_logic;
		ena: 	in std_logic;
		co: 	out std_logic;
		bcd0,bcd1,bcd2,bcd3: out std_logic_vector(M-1 downto 0)
	);
end;

architecture contador_bcd_4d_arq of contador_bcd_4d is
	component contador_bcd is
		generic (
			N: natural := 4
		);
		port(
			clk: 	in std_logic;
			rst: 	in std_logic;
			ena: 	in std_logic;
			cy: 	out std_logic;
			Q: 		out std_logic_vector(N-1 downto 0)
		);
	end component;

		signal ena_aux: std_logic_vector(M-1 downto 0);
		signal cy_aux: std_logic_vector(M-1 downto 0);
	
	begin
	
	ena_aux(0)<= ena;
	ena_aux(1)<= ena_aux(0) and cy_aux(0);
	ena_aux(2)<= ena_aux(1) and cy_aux(1);
	ena_aux(3)<= ena_aux(2) and cy_aux(2);
	co <= cy_aux(3);
	
		contador_bcd0_inst:contador_bcd
			generic map(N => 4) 
			port map(
				clk =>  clk ,
				rst => 	rst,
				ena => ena_aux(0),
				cy =>  cy_aux(0),
				Q 	=> 	bcd0
			);
			
		contador_bcd1_inst:contador_bcd
			generic map(N => 4) 
			port map(
				clk =>  clk ,
				rst => 	rst,
				ena =>  ena_aux(1),
				cy =>   cy_aux(1),
				Q 	=> 	bcd1
			);
		
		contador_bcd2_inst:contador_bcd
			generic map(N => 4) 
			port map(
				clk =>  clk ,
				rst => 	rst,
				ena =>  ena_aux(2),
				cy =>   cy_aux(2),
				Q 	=> 	bcd2
			);
		
		contador_bcd3_inst:contador_bcd
			generic map(N => 4) 
			port map(
				clk =>  clk ,
				rst => 	rst,
				ena =>  ena_aux(3),
				cy =>   cy_aux(3),
				Q 	=> 	bcd3
			);
end;
