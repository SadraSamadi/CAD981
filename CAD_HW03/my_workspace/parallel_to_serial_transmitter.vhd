-------------------------------------------------------------------------------
--
-- Title       : parallel_to_serial_transmitter
-- Design      : my_workspace
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : parallel_to_serial_transmitter.vhd
-- Generated   : Fri Nov 22 22:22:40 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {parallel_to_serial_transmitter} architecture {parallel_to_serial_transmitter}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity parallel_to_serial_transmitter is
	 port(
		 reset : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 load : in STD_LOGIC;
		 start : in STD_LOGIC;
		 data_in : in STD_LOGIC_VECTOR(7 downto 0);
		 serial_data : out STD_LOGIC;
		 finish : out STD_LOGIC
	     );
end parallel_to_serial_transmitter;

--}} End of automatically maintained section

architecture parallel_to_serial_transmitter of parallel_to_serial_transmitter is

	type T_STATE is (IDLE, LOADING, SENDING);

	signal state, next_state: T_STATE;
	
	signal sr_load, sr_shl, sr_shr, c_reset, c_en: STD_LOGIC;

	signal sr_data_out: STD_LOGIC_VECTOR(7 downto 0);

	signal c_output: STD_LOGIC_VECTOR(3 downto 0);

begin

	-- enter your statements here --
	
	sr: entity work.shift_register(shift_register)
		port map (
			clk => clk,
			reset => reset,
			load => sr_load,
			shl => sr_shl,
			shr => sr_shr,
			data_in => data_in,
			data_out => sr_data_out
		);

	cnt: entity work.counter(counter)
		port map (
			clk => clk,
			reset => c_reset,
			en => c_en,
			output => c_output
		);

	reg: process(clk, reset)
	begin
		if reset = '1' then
			state <= IDLE;
		elsif rising_edge(clk) then
			state <= next_state;
		end if;
	end process;

	cmb: process(state, load, start, c_output)
	begin
		case state is
			when IDLE =>
				if load = '1' then
					next_state <= LOADING;
				elsif start = '1' then
					next_state <= SENDING;
				else
					next_state <= IDLE;
				end if;
			when LOADING =>
				next_state <= IDLE;
			when SENDING =>
				if c_output = "1000" then
					next_state <= IDLE;
				else
					next_state <= SENDING;
				end if;
			when others =>
				next_state <= IDLE;
		end case;  
	end process;

	output: process(state, c_output)
	begin
		case state is
			when IDLE =>
				sr_load <= '0';
				sr_shr <= '0';
				c_reset	<= '1';
				c_en <= '0';
				serial_data <= 'U';
				finish <= '0';
			when LOADING =>
				sr_load <= '1';
			when SENDING =>
				c_reset	<= '0';
				c_en <= '1';
				if c_output = "1000" then
					serial_data <= 'U';
					finish <= '1';
				else
					serial_data <= sr_data_out(to_integer(unsigned(c_output)));
				end if;
			when others =>
				serial_data <= 'U';
				finish <= '0';
		end case;
	end process;

end parallel_to_serial_transmitter;
