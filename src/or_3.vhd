library IEEE;
use IEEE.std_logic_1164.all;

entity or_3 is
  port (
    A : in  std_logic;
    B : in  std_logic;
    C : in  std_logic;
    Y : out std_logic
  );
end or_3;

architecture arch of or_3 is
begin
  Y <= A or B or C;
end arch;
