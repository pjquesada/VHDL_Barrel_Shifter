Library ieee;
use ieee.std_logic_signed.all;
use ieee.std_logic_1164.all;


Entity mux21 is
	port(input0: in std_logic_vector(15 downto 0); 
	input1: in std_logic_vector(15 downto 0);
	sel: in std_logic;
	output: out std_logic_vector(15 downto 0));
End mux21;

Architecture behavioral of mux21 is
	begin
		process(input0, input1, sel)
		begin
		if (sel = '0') then
			output <= input0;
		elsif(sel = '1') then
			output <= input1;
		end if;
	end process;
end behavioral;
