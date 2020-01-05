library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity moore_tb is
end moore_tb;

architecture TB_ARCHITECTURE of moore_tb is
	-- Component declaration of the tested unit
	component moore
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
	constant sample: STD_LOGIC_VECTOR(13 downto 0) := "00111011101100";

begin

	-- Unit Under Test port map
	UUT : moore
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
--		x <= '0',
--			 '0' after 4 ns,
--			 '1' after 8 ns,
--			 '1' after 12 ns,
--			 '1' after 16 ns,
--			 '0' after 20 ns,
--			 '1' after 24 ns,
--			 '1' after 28 ns,
--			 '1' after 32 ns,
--			 '0' after 36 ns,
--			 '1' after 40 ns,
--			 '1' after 44 ns,
--			 '0' after 48 ns,
--			 '0' after 52 ns;
		for i in sample'length - 1 downto 0 loop
			x <= sample(i);
			wait until rising_edge(clk);
		end loop;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_moore of moore_tb is
	for TB_ARCHITECTURE
		for UUT : moore
			use entity work.moore(moore);
		end for;
	end for;
end TESTBENCH_FOR_moore;

