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
		sal: out std_logic_vector( 3 downto 0)
	);
end;

architecture shift_reg_arq of shift_reg is
	
	signal sal_aux: std_logic_vector(3 downto 0):= "0000";
	
begin

	shift_p: process(clk)
		begin
		if rst='1' then
			sal_aux <= "0000";
			sal <= sal_aux;
		else
			if rising_edge(clk) then
				if sal_aux="0000" then
					sal_aux<="0001";
					sal <= sal_aux;
					elsif sal_aux="0001" then
						sal_aux<="0010";
						sal <= sal_aux;
					elsif sal_aux="0010" then
						sal_aux<="0100";
						sal <= sal_aux;
					elsif sal_aux="0100" then
						sal_aux<="1000";
						sal <= sal_aux;
					elsif sal_aux="1000" then
						sal_aux<="0000";
						sal <= sal_aux;
				else
					sal_aux<="1111";
					sal <= sal_aux;
				end if;	
			end if;
		end if;	
	end process;

end;

