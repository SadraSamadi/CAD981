library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity seven_segments_tb is
end seven_segments_tb;

architecture TB_ARCHITECTURE of seven_segments_tb is
	-- Component declaration of the tested unit
	component seven_segments
	port(
		input : in STD_LOGIC_VECTOR(3 downto 0);
		output : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : seven_segments
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ...
	process
	begin
		input <= "0000",
				 "0001" after 2 ns,	
				 "0010" after 4 ns,
				 "0011" after 6 ns,
				 "0100" after 8 ns,
				 "0101" after 10 ns,
				 "0110" after 12 ns,
				 "0111" after 14 ns,
				 "1000" after 16 ns,
				 "1001" after 18 ns,
				 "1010" after 20 ns,
				 "1011" after 22 ns,
				 "1100" after 24 ns,
				 "1101" after 26 ns,
				 "1110" after 28 ns,
				 "1111" after 30 ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_seven_segments of seven_segments_tb is
	for TB_ARCHITECTURE
		for UUT : seven_segments
			use entity work.seven_segments(seven_segments);
		end for;
	end for;
end TESTBENCH_FOR_seven_segments;

