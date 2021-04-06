library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

entity contador_Nfft is
	generic (
		N: natural := 8
	);
	port (
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		sal: out std_logic
	);
end;

architecture contador_Nfft_arq of contador_Nfft is
	component fft is
		generic(
			N: natural := 8
		);
		port(
			clk_i: 	in std_logic;
			rst_i: 	in std_logic;
			ena_i: 	in std_logic;
			T_i:	in std_logic;
			Q_o:	out std_logic
		);
	end component;

	signal sal_aux: std_logic_vector(0 to N);
	
begin
	conta_i : for i in 0 to N-1 generate
		fft_inst:fft
			port map(
                clk_i  => sal_aux(i),
				rst_i 	=> rst,				
				ena_i	=> ena,
				T_i     => '1',
				Q_o   =>  sal_aux(i+1)  
			);
	end generate;

sal_aux(0) <= clk;
sal_aux(N) <= sal_aux(1);
sal <= sal_aux(N);
--asig_sal:for x in 1 to N loop
	  --sal(x) <=  sal_aux(x);
	 --end loop asig_sal;
end;

