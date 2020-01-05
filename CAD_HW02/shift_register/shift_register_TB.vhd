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
		data_in : in STD_LOGIC_VECTOR(15 downto 0);
		output : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal shr : STD_LOGIC;
	signal shl : STD_LOGIC;
	signal load : STD_LOGIC;
	signal data_in : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(15 downto 0);

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
			data_in <= "0110110000111001";
			shl <= '0';
			shr <= '0';
			load <= '0';
			reset <= '1';
			wait for 10 ns;
			reset <= '0';
			load <= '1';
			wait for 10 ns;
			load <= '0';
			shl <= '1';
			wait for 30 ns;
			shl <= '0';
			shr <= '1';
			wait for 30 ns;
			shl <= '1';
			shr <= '1';
			wait for 10 ns;
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_shift_register of shift_register_tb is
	for TB_ARCHITECTURE
		for UUT : shift_register
			use entity work.shift_register(shift_register);
		end for;
	end for;
end TESTBENCH_FOR_shift_register;

