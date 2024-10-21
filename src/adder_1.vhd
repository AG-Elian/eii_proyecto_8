library IEEE;
use IEEE.std_logic_1164.all;

entity adder_1 is
  port (
    A : in  std_logic;
    B : in  std_logic;
    Ci : in std_logic; -- Carry de entrada
    Y : out std_logic; -- Carry de salida
    Co : out  std_logic
  );
end adder_1;

architecture arch of adder_1 is
begin
  Y <= A xor B xor Ci; --Suma
  Co <= (A and B) or (Ci and (A xor B)); -- Acarreo
end arch;
