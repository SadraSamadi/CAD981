library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mealy_tb is
end mealy_tb;

architecture TB_ARCHITECTURE of mealy_tb is
	-- Component declaration of the tested unit
	component mealy
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		x : in STD_LOGIC;
		y : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '0';
	signal reset : STD_LOGIC := '1';
	signal x : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal y : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mealy
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
		reset <= '0' after 8 ns;
		x <= '0',
			 '1' after 8 ns,
			 '0' after 24 ns,
			 '1' after 32 ns,
			 '0' after 48 ns,
			 '1' after 56 ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mealy of mealy_tb is
	for TB_ARCHITECTURE
		for UUT : mealy
			use entity work.mealy(mealy);
		end for;
	end for;
end TESTBENCH_FOR_mealy;

