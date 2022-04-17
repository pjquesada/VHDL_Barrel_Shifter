library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity BarrelShifter is
	port(dmd : inout std_logic_vector(15 downto 0);
		r : inout std_logic_vector(15 downto 0);
		C : in std_logic_vector(7 downto 0);
		hiLo : in std_logic;
		x : in std_logic;
		load : in std_logic_vector(2 downto 0);
		sel : in std_logic_vector(3 downto 0);
		ctr : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		result : out std_logic_vector(31 downto 0);
end BarrelShifter;

architecture behav of BarrelShifter is
	component register16
		Port(input : in std_logic_vector(15 downto 0);
			load : in std_logic;
			clk : in std_logic;
			output : out std_logic_vector(15 downto 0));
	end component;

	component mux21
		Port(input0 : in std_logic_vector(15 downto 0);
			input1 : in std_logic_vector(15 downto 0);
			sel : in std_logic;
			output : out std_logic_vector(15 downto 0));
	end component;

	component shifter
		Port(input : in std_logic_vector(15 downto 0);
			C : in std_logic_vector(7 downto 0);
			hiLo : in std_logic;			
			X : in std_logic;		
			output : out std_logic_vector(31 downto 0));
	end component;

	component tristate16
		Port(input : in std_logic_vector(15 downto 0);
			enable : in std_logic;
			output : out std_logic_vector(15 downto 0));
	end component;
	
	component Display
		port(Input        : in std_logic_vector(3 downto 0);
		     segmentSeven : out std_logic_vector(6 downto 0));
	end component;

	Signal s1out : std_logic_vector(15 downto 0);
	Signal sr1out : std_logic_vector(15 downto 0);
	Signal sr0out : std_logic_vector(15 downto 0);
	Signal m1out : std_logic_vector(15 downto 0);
	Signal m2out : std_logic_vector(15 downto 0);
	Signal m3out : std_logic_vector(15 downto 0);
	Signal m4out : std_logic_vector(15 downto 0);
	Signal saout : std_logic_vector(31 downto 0); 
	

	begin
		S1 : register16 port map("1011011010100011", '1', clk, s1out); --Insert 16-bit binary num for shifting
		SR1 : register16 port map(m2out, '1', clk, sr1out);
		SR0 : register16 port map(m3out, '1', clk, sr0out);
		
		M0 : mux21 port map(s1out, R, '0', m1out);
		M1 : mux21 port map(saout(31 downto 16), dmd, '0', m2out);
		M2 : mux21 port map(saout(15 downto 0), dmd, '0', m3out);
		M3 : mux21 port map(sr1out, sr0out, sel(3), m4out);
		
		T0 : tristate16 port map(s1out, ctr(0), dmd);
		T1 : tristate16 port map(sr1out, ctr(1), R);
		T2 : tristate16 port map(sr0out, ctr(2), R);
		T3 : tristate16 port map(m4out, ctr(3), dmd);
		
		BS : shifter port map(m1out, C, hiLo, X, saout);
				
		result <= saout;

end behav;
