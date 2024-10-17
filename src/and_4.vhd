library IEEE;
use IEEE.std_logic_1164.all;

entity and_4 is
  port (
    A : in  std_logic;
    B : in  std_logic;
    C : in  std_logic;
    D : in  std_logic;
    Y : out std_logic
  );
end and_4;

architecture arch of and_4 is
begin
  Y <= A and B and C and D;
end arch;
