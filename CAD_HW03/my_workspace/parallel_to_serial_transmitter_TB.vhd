library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity parallel_to_serial_transmitter_tb is
end parallel_to_serial_transmitter_tb;

architecture TB_ARCHITECTURE of parallel_to_serial_transmitter_tb is
	-- Component declaration of the tested unit
	component parallel_to_serial_transmitter
	port(
		reset : in STD_LOGIC;
		clk : in STD_LOGIC;
		load : in STD_LOGIC;
		start : in STD_LOGIC;
		data_in : in STD_LOGIC_VECTOR(7 downto 0);
		serial_data : out STD_LOGIC;
		finish : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal reset : STD_LOGIC := '0';
	signal clk : STD_LOGIC := '0';
	signal load : STD_LOGIC;
	signal start : STD_LOGIC;
	signal data_in : STD_LOGIC_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal serial_data : STD_LOGIC;
	signal finish : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : parallel_to_serial_transmitter
		port map (
			reset => reset,
			clk => clk,
			load => load,
			start => start,
			data_in => data_in,
			serial_data => serial_data,
			finish => finish
		);

	-- Add your stimulus here ...
	
	clk <= not clk after 2 ns;
	
	STIM: process
	begin
		data_in <= "10010110";
		start <= '0';
		load <= '1';
		wait for 8 ns;
		load <= '0';
		start <= '1';
		wait for 4 ns;
		start <= '0';
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_parallel_to_serial_transmitter of parallel_to_serial_transmitter_tb is
	for TB_ARCHITECTURE
		for UUT : parallel_to_serial_transmitter
			use entity work.parallel_to_serial_transmitter(parallel_to_serial_transmitter);
		end for;
	end for;
end TESTBENCH_FOR_parallel_to_serial_transmitter;

