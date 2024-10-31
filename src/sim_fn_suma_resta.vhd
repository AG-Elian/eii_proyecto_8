library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_fn_suma_resta is
end sim_fn_suma_resta;

architecture sim of sim_fn_suma_resta is
  component fn_suma_resta is
    port (
      A : in  std_logic_vector(31 downto 0);
      B : in  std_logic_vector(31 downto 0);
      sel : in std_logic;
      Y : out std_logic_vector(31 downto 0)
    );
  end component; -- fn_suma_resta
  signal entradaA, entradaB : std_logic_vector (31 downto 0);
  signal sel : std_logic;
  signal salida : std_logic_vector(31 downto 0);
begin
  -- Dispositivo bajo prueba
  dut : fn_suma_resta port map (A=>entradaA,B=>entradaB,sel=>sel,Y=>salida);

  excitaciones: process
  variable aleatorio : aleatorio_t;
  begin
    for i in 0 to 20 loop
      entradaA  <= aleatorio.genera_vector(32);
      entradaB  <= aleatorio.genera_vector(32);
      sel <= aleatorio.genera_bit;
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
