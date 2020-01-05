library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity shift_register_tb is
end shift_register_tb;

architecture TB_ARCHITECTURE of shift_register_tb is
	-- Component declaration of the tested unit
	component shift_register
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		shr : in STD_LOGIC;
		shl : in STD_LOGIC;
		load : in STD_LOGIC;
		data_in : in STD_LOGIC_VECTOR(7 downto 0);
		data_out : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '0';
	signal reset : STD_LOGIC := '1';
	signal shr : STD_LOGIC := '0';
	signal shl : STD_LOGIC := '0';
	signal load : STD_LOGIC := '0';
	signal data_in : STD_LOGIC_VECTOR(7 downto 0) := "01101001";
	-- Observed signals - signals mapped to the output ports of tested entity
	signal data_out : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : shift_register
		port map (
			clk => clk,
			reset => reset,
			shr => shr,
			shl => shl,
			load => load,
			data_in => data_in,
			data_out => data_out
		);

	-- Add your stimulus here ...
	
	clk <= not clk after 2 ns;
	
	STIM: process
	begin
		wait for 8 ns;
		reset <= '0';
		load <= '1';
		wait for 8 ns;
		load <= '0';
		shl <= '1';
		wait for 16 ns;
		shl <= '0';
		shr <= '1';
		wait for 16 ns;
		shl <= '1';
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_shift_register of shift_register_tb is
	for TB_ARCHITECTURE
		for UUT : shift_register
			use entity work.shift_register(shift_register);
		end for;
	end for;
end TESTBENCH_FOR_shift_register;

