library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity decoder_tb is
end decoder_tb;

architecture TB_ARCHITECTURE of decoder_tb is
	-- Component declaration of the tested unit
	component decoder
	port(
		coded : in STD_LOGIC_VECTOR(2 downto 0);
		decoded : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal coded : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal decoded : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : decoder
		port map (
			coded => coded,
			decoded => decoded
		);

	-- Add your stimulus here ...
	SIM: process
	begin											
		coded <= "000",
		         "001" after 4 ns,
		         "010" after 8 ns,
		         "011" after 12 ns,
		         "100" after 16 ns,
		         "101" after 20 ns,
		         "110" after 24 ns,
		         "111" after 28 ns;
		wait;
	end process;					 

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_decoder of decoder_tb is
	for TB_ARCHITECTURE
		for UUT : decoder
			use entity work.decoder(decoder);
		end for;
	end for;
end TESTBENCH_FOR_decoder;

