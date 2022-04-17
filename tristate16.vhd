library ieee;
use ieee.std_logic_1164.all;  

  entity tristate16 is
    port(input	: in std_logic_vector(15 downto 0);  
          enable : in std_logic;
          output: out std_logic_vector(15 downto 0));  
  end tristate16;

  architecture behav of tristate16 is  
    begin
      process( input, enable)  
        begin
          if(enable = '0') then  
            output <= input;
          else
            output <= "ZZZZZZZZZZZZZZZZ";
         end if;  
    end process;
  end behav;
