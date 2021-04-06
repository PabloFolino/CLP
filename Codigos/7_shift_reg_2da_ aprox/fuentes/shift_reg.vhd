library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shift_reg is
	generic (
		N: natural := 4
	);
	port (
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		ent: in std_logic;
		sal: out std_logic_vector( N-1 downto 0)
	);
end;

architecture shift_reg_arq of shift_reg is
	
	signal sal_aux: std_logic_vector(N downto 0):= std_logic_vector(to_unsigned(0,N+1));
	signal temp: std_logic;
	
begin

	shift_p: process(clk) is
		begin
		if rst='1' then
			sal_aux <= std_logic_vector(to_unsigned(0,N+1));
			sal <= std_logic_vector(to_unsigned(0,N));
		else
			if rising_edge(clk) then
				for i in 0 to N-1 loop
					sal_aux(i+1) <= sal_aux(i); 
					sal(i) <= sal_aux(i+1); 
				end loop;
				sal_aux(0)<= ent;
			end if;
		end if;	
	end process;
end;

