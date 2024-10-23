library IEEE;
use IEEE.std_logic_1164.all;

entity comparador_a2_4bits is
  port (
    A : in  std_logic_vector(3 downto 0);
    B : in  std_logic_vector(3 downto 0);
    menor : out std_logic;
    mayor : out std_logic;
    igual : out std_logic
  );
end comparador_a2_4bits;

architecture arch of comparador_a2_4bits is
  signal v3, v2, v1, v0, w3, w2, w1, w0 : std_logic;
  begin
    v3 <= (A(3) nand B(3)) or (A(3) and B(3));
    w3 <= (A(3) nand B(3));
    v2 <= ((not A(2)) and (not w3) and B(2)) or v3;
    w2 <= ((not B(2)) and (not v3) and A(2)) or w3;
    v1 <= ((not A(1)) and (not w2) and B(1)) or v2;
    w1 <= ((not B(1)) and (not v2) and A(1)) or w2;
    v0 <= ((not A(0)) and (not w1) and B(0)) or v1;
    w0 <= ((not B(0)) and (not v1) and A(0)) or w1;
    mayor <= (w0 and (A(3) nand B(3))) or (A(3) and (not B(3))) or (v0 and (A(3) and B(3))); -- Compara v0 con los bits mas significativos.
    menor <= (v0 and (A(3) nand B(3))) or (B(3) and (not A(3))) or (w0 and (A(3) and B(3)));
    igual <= mayor nor menor;
  end arch;
  