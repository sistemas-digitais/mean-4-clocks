-- mean_4_clocks - A system that calculates the mean over four clocks
-- Copyright (C) 2018  Digital Systems Group - UFMG
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, see <https://www.gnu.org/licenses/>.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mean_4_clocks is
    generic (
        W       :       integer := 32
    );
    port (
        CLK     : in    std_logic;
        INPUT   : in    std_logic_vector(W - 1 downto 0);
        OUTPUT  : out   std_logic_vector(W - 1 downto 0)
    );
end mean_4_clocks;

-- Implement the testbench and find the errors in this model.
-- Consider the following expected behavior:
--      Every rising edge of CLK input, the content of INPUT
--      is added to a register chain and used to calculate the
--      mean value over 4 clock periods

architecture arch of mean_4_clocks is
begin
    process(CLK) is
        variable var1 : std_logic_vector(W - 1 downto 0);
        variable var2 : std_logic_vector(W - 1 downto 0);
        variable var3 : std_logic_vector(W - 1 downto 0);
        variable var4 : std_logic_vector(W - 1 downto 0);
    begin
        
        if (rising_edge(CLK)) then
            var1 := "00" & INPUT(W-1 downto 2);
            var2 := var1;
            var3 := var2;
            var4 := var3;
        end if;
        
        OUTPUT <= var1 + var2 + var3 + var4;
    end process;
    
end arch;
