library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_comparador4bits is
end sim_comparador4bits;

architecture sim of sim_comparador4bits is
  component comparador4bits is
    port (
      A : in  std_logic_vector(3 downto 0);
      B : in  std_logic_vector(3 downto 0);
      mayor : out std_logic;
      menor : out std_logic;
      igual : out std_logic
    );
  end component; -- comparador4bits
  signal A : std_logic_vector(3 downto 0);
  signal B : std_logic_vector(3 downto 0);
  signal menor : std_logic;
  signal mayor : std_logic;
  signal igual : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : comparador4bits port map (A=>A,B=>B,menor=>menor, mayor=>mayor, igual=>igual);

  excitaciones: process
  begin
    A <= "0010";
    B <= "0001";
    wait for 1 ns;
    A <= "0011";
    B <= "0011";
    wait for 1 ns;
    A <= "0010";
    B <= "1001";
    wait for 1 ns;
    A <= "0110";
    B <= "0101";
    wait for 1 ns;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
