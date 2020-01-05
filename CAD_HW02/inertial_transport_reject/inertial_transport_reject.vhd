-------------------------------------------------------------------------------
--
-- Title       : inertial_transport_reject
-- Design      : inertial_transport_reject
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : inertial_transport_reject.vhd
-- Generated   : Sun Nov 10 17:38:25 2019
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
--{entity {inertial_transport_reject} architecture {inertial_transport_reject}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inertial_transport_reject is
	 port(
		 qin : in STD_LOGIC;
		 Y1 : out STD_LOGIC;
		 Y2 : out STD_LOGIC;
		 Y3 : out STD_LOGIC;
		 Y4 : out STD_LOGIC;
		 Y5 : out STD_LOGIC
	     );
end inertial_transport_reject;

--}} End of automatically maintained section

architecture inertial_transport_reject of inertial_transport_reject is
begin

	-- enter your statements here --
	Y1 <= qin;
	Y2 <= qin after 1ns;
	Y3 <= inertial qin after 1ns;
	Y4 <= transport qin after 1ns;
	Y5 <= reject 500ps inertial qin after 1ns;

end inertial_transport_reject;
