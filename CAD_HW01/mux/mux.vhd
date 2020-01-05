-------------------------------------------------------------------------------
--
-- Title       : mux
-- Design      : mux
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : mux.vhd
-- Generated   : Sat Oct 26 14:43:19 2019
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
--{entity {mux} architecture {mux}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux is
	 port(
		 data_in_1 : in STD_LOGIC_VECTOR(15 downto 0);
		 selection : in STD_LOGIC_VECTOR(1 downto 0);
		 data_in_2 : in STD_LOGIC_VECTOR(15 downto 0);
		 data_in_3 : in STD_LOGIC_VECTOR(15 downto 0);
		 data_in_4 : in STD_LOGIC_VECTOR(15 downto 0);
		 data_out : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end mux;

--}} End of automatically maintained section

architecture mux of mux is
begin

	-- enter your statements here --
	process(data_in_1, data_in_2, data_in_3, data_in_4, selection)
	begin
		case selection is
			when "00" =>
				data_out <= data_in_1;
			when "01" =>
				data_out <= data_in_2;
			when "10" =>
				data_out <= data_in_3;
			when others =>
				data_out <= data_in_4;
		end case;
	end process;

end mux;
