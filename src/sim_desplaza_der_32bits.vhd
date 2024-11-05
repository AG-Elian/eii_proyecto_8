library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_desplaza_der_32bits is
end sim_desplaza_der_32bits;

architecture sim of sim_desplaza_der_32bits is
  component desplaza_der_32bits is
    port (
    A         : in  std_logic_vector(31 downto 0);
    B         : in std_logic_vector(4 downto 0);
    con_signo : in std_logic;
    Y         : out std_logic_vector(31 downto 0)
  );
  end component; -- desplaza_der_32bits
  signal entradaA, salida : std_logic_vector(31 downto 0);
  signal entradaB : std_logic_vector(4 downto 0);
  signal con_signo : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : desplaza_der_32bits port map (A=>entradaA, B=>entradaB, con_signo=>con_signo, Y=>salida);

  excitaciones: process
  variable aleatorio : aleatorio_t;
  begin
    for i in 0 to 20 loop
      entradaA  <= aleatorio.genera_vector(32);
      entradaB  <= aleatorio.genera_vector(5);
      con_signo <= aleatorio.genera_bit;
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
