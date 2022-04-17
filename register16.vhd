library ieee;
use ieee.std_logic_1164.all;  

Entity register16 is
    Port(input : in std_logic_vector(15 downto 0);  
      load : in std_logic; 
      clk : in std_logic;
      output : out std_logic_vector(15 downto 0));  
end register16;

Architecture behav of register16 is
  Signal storage : std_logic_vector(15 downto 0);
    begin
      process(input, load, clk)  
      begin
        if (clk'event and clk = '1' and load = '1') then  
          storage <= input;
        elsif (clk'event and clk = '0') then  
          output <= storage;
      end if;  
    end process;
end;
