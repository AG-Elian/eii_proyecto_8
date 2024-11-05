library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_fn_menor_que is
end sim_fn_menor_que;

architecture sim of sim_fn_menor_que is
  component fn_menor_que is
    port (
      A : in  std_logic_vector(31 downto 0);
      B : in  std_logic_vector(31 downto 0);
      sin_signo: std_logic;
      Y : out std_logic
    );
  end component; -- fn_menor_que
  signal entradaA, entradaB : std_logic_vector (31 downto 0);
  signal sin_signo, salida : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : fn_menor_que port map (A=>entradaA,B=>entradaB,sin_signo=>sin_signo,Y=>salida);

  excitaciones: process
  variable aleatorio : aleatorio_t;
  begin
    for i in 0 to 4 loop
      sin_signo <= aleatorio.genera_bit;
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
