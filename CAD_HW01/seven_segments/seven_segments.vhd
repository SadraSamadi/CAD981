-------------------------------------------------------------------------------
--
-- Title       : seven_segments
-- Design      : seven_segments
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : seven_segments.vhd
-- Generated   : Sat Oct 26 15:08:28 2019
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
--{entity {seven_segments} architecture {seven_segments}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity seven_segments is
	 port(
		 input : in STD_LOGIC_VECTOR(3 downto 0);
		 output : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end seven_segments;

--}} End of automatically maintained section

architecture seven_segments of seven_segments is
begin

	-- enter your statements here --
	process(input)
	begin		
		case input is
			when "0000" => output <= "0111111"; 
			when "0001" => output <= "0000110";
			when "0010" => output <= "1011011";
			when "0011" => output <= "1001111";
			when "0100" => output <= "1100110"; 
			when "0101" => output <= "1101101";
			when "0110" => output <= "1111101";
			when "0111" => output <= "0000111";
			when "1000" => output <= "1111111"; 
			when "1001" => output <= "1100111";
			when "1010" => output <= "1110111";
			when "1011" => output <= "1111100";
			when "1100" => output <= "0111001"; 
			when "1101" => output <= "1011110";
			when "1110" => output <= "1111001";
			when others => output <= "1110001";
		end case;
	end process;

end seven_segments;
