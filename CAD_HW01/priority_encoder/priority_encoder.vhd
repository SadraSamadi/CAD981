-------------------------------------------------------------------------------
--
-- Title       : priority_encoder
-- Design      : priority_encoder
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : priority_encoder.vhd
-- Generated   : Sat Oct 26 13:55:40 2019
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
--{entity {priority_encoder} architecture {priority_encoder}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity priority_encoder is
	 port(
		 plain : in STD_LOGIC_VECTOR(7 downto 0);
		 coded : out STD_LOGIC_VECTOR(2 downto 0)
	     );
end priority_encoder;

--}} End of automatically maintained section

architecture priority_encoder of priority_encoder is
begin

	-- enter your statements here --
	coded <= "111" when plain(7) = '1' else
	         "110" when plain(6) = '1' else
	         "101" when plain(5) = '1' else
	         "100" when plain(4) = '1' else
	         "011" when plain(3) = '1' else
	         "010" when plain(2) = '1' else
	         "001" when plain(1) = '1' else
	         "000" when plain(0) = '1';

end priority_encoder;
