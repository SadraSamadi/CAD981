-------------------------------------------------------------------------------
--
-- Title       : shift_register
-- Design      : my_workspace
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : shift_register.vhd
-- Generated   : Sat Nov 23 15:47:27 2019
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
		 data_in : in STD_LOGIC_VECTOR(7 downto 0);
		 data_out : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end shift_register;

--}} End of automatically maintained section

architecture shift_register of shift_register is

	signal data_reg: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

begin

	-- enter your statements here --

	process(clk, reset)
	begin
		if reset = '1' then
			data_reg <= (others => '0');
		elsif rising_edge(clk) then
			if load = '1' then
				data_reg <= data_in;
			elsif shl = '1' and shr = '0' then
				data_reg <= data_reg(data_reg'length - 2 downto 0) & '0';
			elsif shl = '0' and shr = '1' then
				data_reg <= '0' & data_reg(data_reg'length - 1 downto 1);
			elsif shl = '1' and shr = '1' then
				data_reg <= (others => '1');
			end if;
		end if;
	end process;
	
	data_out <= data_reg;

end shift_register;
