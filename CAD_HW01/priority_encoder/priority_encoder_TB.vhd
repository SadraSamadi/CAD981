library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity priority_encoder_tb is
end priority_encoder_tb;

architecture TB_ARCHITECTURE of priority_encoder_tb is
	-- Component declaration of the tested unit
	component priority_encoder
	port(
		plain : in STD_LOGIC_VECTOR(7 downto 0);
		coded : out STD_LOGIC_VECTOR(2 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal plain : STD_LOGIC_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal coded : STD_LOGIC_VECTOR(2 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : priority_encoder
		port map (
			plain => plain,
			coded => coded
		);

	-- Add your stimulus here ...
	SIM: process
	begin
		plain <= "00000001",
		         "00000011" after 4 ns,
		         "00000111" after 8 ns,
		         "00001111" after 12 ns,
		         "00011111" after 16 ns,
		         "00111111" after 20 ns,
		         "01111111" after 24 ns,
		         "11111111" after 28 ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_priority_encoder of priority_encoder_tb is
	for TB_ARCHITECTURE
		for UUT : priority_encoder
			use entity work.priority_encoder(priority_encoder);
		end for;
	end for;
end TESTBENCH_FOR_priority_encoder;

