-------------------------------------------------------------------------------
--
-- Title       : mealy
-- Design      : my_workspace
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : mealy.vhd
-- Generated   : Fri Nov 22 19:26:33 2019
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
--{entity {mealy} architecture {mealy}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mealy is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 x : in STD_LOGIC;
		 y : out STD_LOGIC
	     );
end mealy;

--}} End of automatically maintained section

architecture mealy of mealy is

	type T_STATE is (S0, S1, S2, S3);

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
					next_state <= S2;
				end if;
			when S1 =>
				if x = '0' then
					next_state <= S0;
				else
					next_state <= S2;
				end if;
			when S2 =>
				if x = '0' then
					next_state <= S2;
				else
					next_state <= S3;
				end if;
			when S3 =>
				if x = '0' then
					next_state <= S3;
				else
					next_state <= S1;
				end if;
			when others => next_state <= S0;
		end case;  
	end process;
	
	output: process(state, x)
	begin
		case state is
			when S0 => y <= x;
			when S1 => y <= '0';
			when S2 => y <= not x;
			when S3 => y <= x;
			when others => y <= '0';
		end case;
	end process;

end mealy;
