library IEEE;
use IEEE.std_logic_1164.all;

entity desplaza_der_32bits is
  port (
    A : in  std_logic_vector(7 downto 0);
    B : in std_logic_vector(3 downto 0);
    con_signo : in std_logic;
    Y : out std_logic
  );
end desplaza_der_32bits;

architecture arch of desplaza_der_32bits is
  signal s4,s2,s1 : std_logic_vector(7 downto 0);
  signal relleno : std_logic_vector(3 downto);
begin
  relleno <= (others=>A(7)) when con_signo else (others => );
  Y <= A and B;
end arch;
