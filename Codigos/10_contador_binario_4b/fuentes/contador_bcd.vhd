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
			D: 		in std_logic;
			Q: 		out std_logic
		);
	end component;
	
	signal D: std_logic_vector(N-1 downto 0);
	signal ena_aux: std_logic_vector(N downto 0);
	signal Q_aux: std_logic_vector(N downto 0);
	
	--constant pepe: integer:=4;
	
	begin
	process (clk,ena) is
	begin
	Q_aux(0)<='1';
	ena_aux(0) <= ena;
	--N=1
	D(0)<= Q_aux(1) xor ena_aux(0);
	ena_aux(1)<=Q_aux(0) and ena_aux(0);
	--N=2
	D(1)<= Q_aux(2) xor ena_aux(1);
	ena_aux(2)<=Q_aux(1) and ena_aux(1);
	--N=3
	D(2)<= Q_aux(3) xor ena_aux(2);
	ena_aux(3)<=Q_aux(2) and ena_aux(2);
	--N=4
	D(3)<= Q_aux(4) xor ena_aux(3);
	ena_aux(4)<=Q_aux(3) and ena_aux(3);
		
	Q <= Q_aux(N downto 1);
	end process;
	
	--	process (ena) is
	--		begin
	--			Q_aux(0)<='1';
	--			ena_aux(0) <= ena ;
	--			if ena='1'then
	--				for j in 1 to N loop
	--					D(j-1)<= Q_aux(j) xor ena_aux(j-1);
	--					ena_aux(j)<=Q_aux(j-1) and ena_aux(j-1);
	--				end loop;
	--			Q(2) <= ena;
	--			end if;	
	--		--Q <= Q_aux(N downto 1);	
	--		Q(0) <= Q_aux(1);
	--		Q(1) <= '1';
	--		Q(3) <= Q_aux(4);
				
	--	end process;
	
	
		ffd_i : for i in 0 to N-1 generate
			ff_inst:ffd
				port map(
					clk =>  clk ,
					D 	=> 	D(i),
					rst => 	rst,
					Q 	=> 	Q_aux(i+1)
				);
		end generate ffd_i;
end ;

