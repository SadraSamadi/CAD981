library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity inertial_transport_reject_tb is
end inertial_transport_reject_tb;

architecture TB_ARCHITECTURE of inertial_transport_reject_tb is
	-- Component declaration of the tested unit
	component inertial_transport_reject
	port(
		qin : in STD_LOGIC;
		Y1 : out STD_LOGIC;
		Y2 : out STD_LOGIC;
		Y3 : out STD_LOGIC;
		Y4 : out STD_LOGIC;
		Y5 : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal qin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Y1 : STD_LOGIC;
	signal Y2 : STD_LOGIC;
	signal Y3 : STD_LOGIC;
	signal Y4 : STD_LOGIC;
	signal Y5 : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : inertial_transport_reject
		port map (
			qin => qin,
			Y1 => Y1,
			Y2 => Y2,
			Y3 => Y3,
			Y4 => Y4,
			Y5 => Y5
		);

	-- Add your stimulus here ...
	STIMULUS:
		process
		begin
			qin <= '0',
				   '1' after 10 ns,
				   '0' after 13 ns,
				   '1' after 15 ns,
				   '0' after 15.8 ns,
				   '1' after 17 ns,
				   '0' after 17.4 ns,
				   '1' after 21 ns,
				   '0' after 23 ns,
				   '1' after 23.6 ns;
			wait;
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_inertial_transport_reject of inertial_transport_reject_tb is
	for TB_ARCHITECTURE
		for UUT : inertial_transport_reject
			use entity work.inertial_transport_reject(inertial_transport_reject);
		end for;
	end for;
end TESTBENCH_FOR_inertial_transport_reject;

