library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mux_tb is
end mux_tb;

architecture TB_ARCHITECTURE of mux_tb is
	-- Component declaration of the tested unit
	component mux
	port(
		data_in_1 : in STD_LOGIC_VECTOR(15 downto 0);
		selection : in STD_LOGIC_VECTOR(1 downto 0);
		data_in_2 : in STD_LOGIC_VECTOR(15 downto 0);
		data_in_3 : in STD_LOGIC_VECTOR(15 downto 0);
		data_in_4 : in STD_LOGIC_VECTOR(15 downto 0);
		data_out : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal data_in_1 : STD_LOGIC_VECTOR(15 downto 0);
	signal selection : STD_LOGIC_VECTOR(1 downto 0);
	signal data_in_2 : STD_LOGIC_VECTOR(15 downto 0);
	signal data_in_3 : STD_LOGIC_VECTOR(15 downto 0);
	signal data_in_4 : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal data_out : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mux
		port map (
			data_in_1 => data_in_1,
			selection => selection,
			data_in_2 => data_in_2,
			data_in_3 => data_in_3,
			data_in_4 => data_in_4,
			data_out => data_out
		);

	-- Add your stimulus here ...
	
	SIM: process
	begin		
		data_in_1 <= "0000000000001111"; 
		data_in_2 <= "0000000011110000";
		data_in_3 <= "0000111100000000";
		data_in_4 <= "1111000000000000";
		selection <= "00",
					 "01" after 4 ns,
					 "10" after 8 ns,
					 "11" after 12 ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mux of mux_tb is
	for TB_ARCHITECTURE
		for UUT : mux
			use entity work.mux(mux);
		end for;
	end for;
end TESTBENCH_FOR_mux;

