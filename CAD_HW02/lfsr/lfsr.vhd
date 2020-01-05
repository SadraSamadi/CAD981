-------------------------------------------------------------------------------
--
-- Title       : lfsr
-- Design      : lfsr
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : lfsr.vhd
-- Generated   : Sun Nov 10 20:52:19 2019
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
--{entity {lfsr} architecture {lfsr}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity lfsr is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 output : out STD_LOGIC_VECTOR(4 downto 0)
	     );
end lfsr;

--}} End of automatically maintained section

architecture lfsr of lfsr is

	signal reg: STD_LOGIC_VECTOR(4 downto 0) := "00000";

begin

	-- enter your statements here --
	process(clk, reset)
	begin
		if reset = '1' then
			reg <= "00000";
		elsif rising_edge(clk) then
			reg(0) <= reg(2) xnor reg(4);
			reg(1) <= reg(0);
			reg(2) <= reg(1);
			reg(3) <= reg(2);
			reg(4) <= reg(3);
		end if;
	end process;
	
	output <= reg;

end lfsr;
