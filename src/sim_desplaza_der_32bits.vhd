library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all

entity sim_desplaza_der_32bits is
end sim_desplaza_der_32bits;

architecture sim of sim_desplaza_der_32bits is
  component desplaza_der_32bits is
    port (
    A : in  std_logic_vector(7 downto 0);
    B : in std_logic_vector(3 downto 0);
    con_signo : in std_logic;
    Y : out std_logic
    );
  end component; -- desplaza_der_32bits
  signal entradaA, salida : std_logic_vector(7 downto 0);
  signal entradaB : std_logic_vector(3 downto);
  signal 
begin
  -- Dispositivo bajo prueba
  dut : desplaza_der_32bits port map (A=>entradas(1),B=>entradas(0),Y=>salida);

  excitaciones: process
  begin
    for i in 0 to (2**entradas'length)-1 loop
      entradas <= std_logic_vector(to_unsigned(i,entradas'length));
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
