library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_fn_cero32bits is
end sim_fn_cero32bits;

architecture sim of sim_fn_cero32bits is
  component fn_cero32bits is
    port (
      A : in  std_logic_vector(31 downto 0);
      Y : out std_logic
    );
  end component; -- fn_cero32bits
  signal entrada : std_logic_vector (31 downto 0);
  signal salida : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : fn_cero32bits port map (A=>entrada,Y=>salida);

  excitaciones: process
  variable aleatorio : aleatorio_t;
  begin
    for i in 0 to 4 loop
      entrada  <= aleatorio.genera_vector(32);
      wait for 1 ns;
    end loop;
    entrada <= "00000000000000000000000000000000"; -- Entrada nula de 32 bits
      wait for 1 ns;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
