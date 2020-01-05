-------------------------------------------------------------------------------
--
-- Title       : counter
-- Design      : counter
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : counter.vhd
-- Generated   : Sun Nov 10 18:06:01 2019
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
	 	 en : in STD_LOGIC;
	 	 clk : in STD_LOGIC;
		 output : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end counter;

--}} End of automatically maintained section

architecture counter of counter is

	signal counter: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin

	-- enter your statements here --
	process(en, clk)
	begin
		if rising_edge(clk) then
			if en = '1' then
				if counter = "0000010010110000" then
					counter <= (others => '0');
				else
					counter <= counter + 1;
				end if;
			end if;
		end if;
	end process;
	
	output <= counter;

end counter;
