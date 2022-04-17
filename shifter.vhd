library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

Entity shifter is
	Port(input : in std_logic_vector(15 downto 0);
		C : in std_logic_vector(7 downto 0);	
		hiLo : in std_logic;			
		X : in std_logic;		
		output : out std_logic_vector(31 downto 0));
end shifter;

Architecture behav of shifter is
	signal zeroes : std_logic_vector(15 downto 0) := (others => '0');
	begin
		process(input, C, hiLo, X)
		begin
			if(hiLo = '1') then
				if(C(7) = '1') then			
					if(X = '1') then
						output <= std_logic_vector(shift_right(signed(input & zeroes), to_integer(unsigned(C(6 downto 0)))));
					else	
						output <= std_logic_vector(shift_right(unsigned(input & zeroes), to_integer(unsigned(C(6 downto 0)))));
					end if;
				else
					if(X = '1') then	
						output <= std_logic_vector(shift_left(signed(input & zeroes), to_integer(unsigned(C(6 downto 0)))));
					else			
						output <= std_logic_vector(shift_left(unsigned(input & zeroes), to_integer(unsigned(C(6 downto 0)))));
					end if;
				end if;
			else
				if(C(7) = '1') then
					if(X = '1') then
						output <= std_logic_vector(shift_right(signed(not(zeroes) & input), to_integer(unsigned(C(6 downto 0)))));
					else		
						output <= std_logic_vector(shift_right(unsigned(zeroes & input), to_integer(unsigned(C(6 downto 0)))));
					end if;
				else
					if(X = '1') then			
						output <= std_logic_vector(shift_left(signed(zeroes & input), to_integer(unsigned(C(6 downto 0)))));
					else					
						output <= std_logic_vector(shift_left(unsigned(zeroes & input), to_integer(unsigned(C(6 downto 0)))));
					end if;
				end if;
			end if;
		end process;
	end behav;
