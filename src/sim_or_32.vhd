library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_or_32 is
end sim_or_32;

architecture sim of sim_or_32 is
  component or_32 is
    port (
      A : in  std_logic_vector(31 downto 0);
      B : in  std_logic_vector(31 downto 0);
      Y : out std_logic_vector(31 downto 0)
    );
  end component; -- or_32
  signal entradaA, entradaB : std_logic_vector (31 downto 0);
  signal salida : std_logic_vector(31 downto 0);
begin
  -- Dispositivo bajo prueba
  dut : or_32 port map (A=>entradaA,B=>entradaB,Y=>salida);

  excitaciones: process
  variable aleatorio : aleatorio_t;
  begin
    for i in 0 to 4 loop
      entradaA  <= aleatorio.genera_vector(32);
      entradaB  <= aleatorio.genera_vector(32);
      wait for 1 ns;
    end loop;
    entradaA <= "11111111111111111111111111111111";
    entradaB <= "11111111111111111111111111111111";
      wait for 1 ns;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
