library IEEE;
use IEEE.std_logic_1164.all;

entity xor_2 is
  port (
    A : in  std_logic;
    B : in  std_logic;
    Y : out std_logic
  );
end xor_2;

architecture arch of xor_2 is
begin
  Y <= A xor B;
end arch;
