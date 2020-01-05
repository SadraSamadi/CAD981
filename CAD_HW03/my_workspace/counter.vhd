-------------------------------------------------------------------------------
--
-- Title       : counter
-- Design      : my_workspace
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : counter.vhd
-- Generated   : Sat Nov 23 19:01:13 2019
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
--{entity {counter} architecture {counter}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
	 port(
		 clk : in STD_LOGIC;
		 en : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 output : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end counter;

--}} End of automatically maintained section

architecture counter of counter is

	signal reg: STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

	-- enter your statements here --
	
	process(clk, reset)
	begin
		if reset = '1' then
			reg <= "0000";
		elsif rising_edge(clk) then
			if en = '1' then
				if reg = "1111" then
					reg <= "0000";
				else
					reg <= reg + 1;
				end if;
			end if;
		end if;
	end process;
	
	output <= reg;

end counter;
