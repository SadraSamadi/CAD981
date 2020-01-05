-------------------------------------------------------------------------------
--
-- Title       : decoder
-- Design      : decoder
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : decoder.vhd
-- Generated   : Sat Oct 26 11:46:30 2019
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
--{entity {decoder} architecture {decoder}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder is
	 port(
		 coded : in STD_LOGIC_VECTOR(2 downto 0);
		 decoded : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end decoder;

--}} End of automatically maintained section

architecture decoder of decoder is
begin
	
	-- enter your statements here --
	decoded(0) <= not coded(2) and not coded(1) and not coded(0);
	decoded(1) <= not coded(2) and not coded(1) and     coded(0);
	decoded(2) <= not coded(2) and     coded(1) and not coded(0);
	decoded(3) <= not coded(2) and     coded(1) and     coded(0);
	decoded(4) <=     coded(2) and not coded(1) and not coded(0);
	decoded(5) <=     coded(2) and not coded(1) and     coded(0);
	decoded(6) <=     coded(2) and     coded(1) and not coded(0);
	decoded(7) <=     coded(2) and     coded(1) and     coded(0);
	
end decoder;
