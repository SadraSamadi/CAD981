library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity counter_tb is
end counter_tb;

architecture TB_ARCHITECTURE of counter_tb is
	-- Component declaration of the tested unit
	component counter
	port(
		en : in STD_LOGIC;
		clk : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal en : STD_LOGIC;
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : counter
		port map (
			en => en,
			clk => clk,
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
	
	STIM_EN: process
	begin
		en <= '1';
		wait for 50 ns;
		en <= '0';
		wait for 20 ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_counter of counter_tb is
	for TB_ARCHITECTURE
		for UUT : counter
			use entity work.counter(counter);
		end for;
	end for;
end TESTBENCH_FOR_counter;

