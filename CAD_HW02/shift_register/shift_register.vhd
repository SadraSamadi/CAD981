-------------------------------------------------------------------------------
--
-- Title       : shift_register
-- Design      : shift_register
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : shift_register.vhd
-- Generated   : Sun Nov 10 19:10:38 2019
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
--{entity {shift_register} architecture {shift_register}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_register is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 shr : in STD_LOGIC;
		 shl : in STD_LOGIC;
		 load : in STD_LOGIC;
		 data_in : in STD_LOGIC_VECTOR(15 downto 0);
		 output : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end shift_register;

--}} End of automatically maintained section

architecture shift_register of shift_register is

	signal reg: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin

	-- enter your statements here --
	process(clk, reset)

		variable temp: STD_LOGIC;

	begin
		if reset = '1' then
			reg <= (others => '0');
		else
			if rising_edge(clk) then
				if load = '1' then
					reg <= data_in;
				elsif shl = '1' and shr = '1' then
					reg <= (others => '1');
				elsif shl = '1' then
					temp := reg(data_in'length - 1);
					for i in data_in'length - 2 downto 0 loop
						reg(i + 1) <= reg(i);
					end loop;
					reg(0) <= temp;
				elsif shr = '1' then
					temp := reg(0);
					for i in 0 to data_in'length - 2 loop
						reg(i) <= reg(i + 1);
					end loop;
					reg(data_in'length - 1) <= temp;
				end if;
			end if;
		end if;
	end process;
	
	output <= reg;

end shift_register;
