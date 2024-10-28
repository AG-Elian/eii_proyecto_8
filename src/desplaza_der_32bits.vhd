library IEEE;
use IEEE.std_logic_1164.all;

entity desplaza_der_32bits is
  port (
    A         : in  std_logic_vector(7 downto 0);
    B         : in std_logic_vector(2 downto 0);
    con_signo : in std_logic;
    Y         : out std_logic_vector(7 downto 0)
  );
end desplaza_der_32bits;

architecture arch of desplaza_der_32bits is
  signal s4,s2,s1 : std_logic_vector(7 downto 0);
  signal relleno  : std_logic_vector(3 downto 0);
begin
  relleno <= (others=>A(7)) when con_signo else (others => '0');
  s4 <= relleno(3 downto 0)&A(7 downto 4) when B(2) else A;
  s2 <= relleno(1 downto 0)&s4(7 downto 2) when B(1) else s4;
  s1 <= relleno(0)&s2(7 downto 1) when B(0) else s2;
  Y<=s1;
end arch;
