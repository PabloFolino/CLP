library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gen_hab is
	generic (
		N: integer := 4
	);
	port(
		clk: 	in std_logic;
		rst: 	in std_logic;
		s: 		out std_logic
	);
end;

architecture gen_hab_arq of gen_hab is

		
	begin
    proceso_gen_Hab: process (clk,rst) is
    	variable count: integer range 0 to 512:=0;
		begin
        if rst = '1' then
            count:=0;
			s <='0';
			elsif rising_edge(clk) then
				count:= count+1;
				s <='0';
				if count=N+1 then
				    count:=0;
					s <= '1';
				end if;
		end if;
    end process  proceso_gen_Hab;
 end;
