-------------------------------------------------------------------------------
--
-- Title       : moore
-- Design      : my_workspace
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : moore.vhd
-- Generated   : Fri Nov 22 19:34:54 2019
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
--{entity {moore} architecture {moore}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity moore is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 x : in STD_LOGIC;
		 y : out STD_LOGIC
	     );
end moore;

--}} End of automatically maintained section

architecture moore of moore is

	type T_STATE is (S0, S1, S2, S3, S4, S5);

	signal state, next_state: T_STATE;

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
					next_state <= S4;
				end if;
			when S4 =>
				if x = '0' then
					next_state <= S0;
				else
					next_state <= S5;
				end if;
			when S5 =>
				if x = '0' then
					next_state <= S3;
				else
					next_state <= S2;
				end if;
			when others => next_state <= S0;
		end case;  
	end process;
	
	y <= '1' when state = S5 else '0';

end moore;
