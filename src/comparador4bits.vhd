library IEEE;
use IEEE.std_logic_1164.all;

entity comparador4bits is
  port (
    A : in  std_logic_vector(3 downto 0);
    B : in  std_logic_vector(3 downto 0);
    menor : out std_logic;
    mayor : out std_logic;
    igual : out std_logic
  );
end comparador4bits;

architecture arch of comparador4bits is
  signal v3, v2, v1, w3, w2, w1 : std_logic;
begin
  v3 <= (not A(3)) and B(3);
  w3 <= A(3) and (not B(3));
  v2 <= ((not A(2)) and (not w3) and B(2)) or v3;
  w2 <= ((not B(2)) and (not v3) and A(2)) or w3;
  v1 <= ((not A(1)) and (not w2) and B(1)) or v2;
  w1 <= ((not B(1)) and (not v2) and A(1)) or w2;
  menor <= ((not A(0)) and (not w1) and B(0)) or v1;
  mayor <= ((not B(0)) and (not v1) and A(0)) or w1;
  igual <= mayor nor menor;
end arch;
