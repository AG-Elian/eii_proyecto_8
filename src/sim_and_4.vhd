library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_and_4 is
end sim_and_4;

architecture sim of sim_and_4 is
  component and_4 is
    port (
      A : in  std_logic;
      B : in  std_logic;
      C : in  std_logic;
      D : in  std_logic;
      Y : out std_logic
    );
  end component; -- and_4
  signal ABCD : std_logic_vector (3 downto 0);
  signal Y : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : and_4 port map (A=>ABCD(3),B=>ABCD(2), C=>ABCD(1), D=>ABCD(0),Y=>Y);

  excitaciones: process
  begin
    for i in 0 to 15 loop
      ABCD <= std_logic_vector(to_unsigned(i,4));
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
