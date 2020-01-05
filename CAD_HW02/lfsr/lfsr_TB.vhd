library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity lfsr_tb is
end lfsr_tb;

architecture TB_ARCHITECTURE of lfsr_tb is
	-- Component declaration of the tested unit
	component lfsr
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR(4 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(4 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : lfsr
		port map (
			clk => clk,
			reset => reset,
			output => output
		);

	-- Add your stimulus here ...
	STIM_CLK: process
		begin
			clk <= '0';
			wait for 2 ns;
			clk <= '1';
			wait for 2 ns;
		end process;
	
	STIM: process
		begin
			reset <= '0';
			wait for 100 ns;
			reset <= '1';
			wait for 10 ns;
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_lfsr of lfsr_tb is
	for TB_ARCHITECTURE
		for UUT : lfsr
			use entity work.lfsr(lfsr);
		end for;
	end for;
end TESTBENCH_FOR_lfsr;

