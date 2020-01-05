-------------------------------------------------------------------------------
--
-- Title       : sequence_detector
-- Design      : my_workspace
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : sequence_detector.vhd
-- Generated   : Fri Nov 22 21:48:02 2019
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
--{entity {sequence_detector} architecture {sequence_detector}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sequence_detector is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 x : in STD_LOGIC;
		 y : out STD_LOGIC
	     );
end sequence_detector;

--}} End of automatically maintained section

architecture sequence_detector of sequence_detector is

	type T_STATE is (S0, S1, S2, S3);

	signal state, next_state: T_STATE;

	signal y_i: STD_LOGIC := '0';
	
begin

	-- enter your statements here --  
	
	reg: process(clk, reset)
	begin
		if reset = '1' then
			state <= S0;
		elsif rising_edge(clk) then
			state <= next_state;
		end if;
	end process;
	
	cmb: process(x, state)
	begin
		case state is
			when S0 =>
				if x = '0' then
					next_state <= S0;
				else
					next_state <= S1;
				end if;
			when S1 =>
				if x = '0' then
					next_state <= S0;
				else
					next_state <= S2;
				end if;
			when S2 =>
				if x = '0' then
					next_state <= S3;
				else
					next_state <= S2;
				end if;
			when S3 =>
				if x = '0' then
					next_state <= S0;
				else
					next_state <= S1;
				end if;
			when others => next_state <= S0;
		end case;  
	end process;
	
	output: process(state)
	begin
		if state = S3 then
			y_i <= not y_i;
		end if;
	end process;

	y <= y_i;

end sequence_detector;
