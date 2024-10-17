library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_adder_1 is
end sim_adder_1;

architecture sim of sim_adder_1 is
  component adder_1 is
    port (
      A : in  std_logic;
      B : in  std_logic;
      Ci : in  std_logic;
      Y : out std_logic;
      Co : out  std_logic
    );
  end component; -- adder_1
  signal ABC : std_logic_vector (2 downto 0);
  signal Y : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : adder_1 port map (A=>ABC(2),B=>ABC(1),Ci=>ABC(0),Y=>Y);

  excitaciones: process
  begin
    for i in 0 to 15 loop
      ABC <= std_logic_vector(to_unsigned(i,3));
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
