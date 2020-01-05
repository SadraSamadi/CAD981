library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sequence_detector_tb is
end sequence_detector_tb;

architecture TB_ARCHITECTURE of sequence_detector_tb is
	-- Component declaration of the tested unit
	component sequence_detector
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		x : in STD_LOGIC;
		y : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '0';
	signal reset : STD_LOGIC := '0';
	signal x : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal y : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sequence_detector
		port map (
			clk => clk,
			reset => reset,
			x => x,
			y => y
		);

	-- Add your stimulus here ...	

	clk <= not clk after 2 ns;
	
	STIM: process
	begin
		x <= '0',
			 '0' after 4 ns,
			 '1' after 8 ns,
			 '1' after 12 ns,
			 '1' after 16 ns,
			 '0' after 20 ns,
			 '1' after 24 ns,
			 '1' after 28 ns,
			 '1' after 32 ns,
			 '0' after 36 ns,
			 '1' after 40 ns,
			 '1' after 44 ns,
			 '0' after 48 ns,
			 '0' after 52 ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sequence_detector of sequence_detector_tb is
	for TB_ARCHITECTURE
		for UUT : sequence_detector
			use entity work.sequence_detector(sequence_detector);
		end for;
	end for;
end TESTBENCH_FOR_sequence_detector;

