library IEEE;
use IEEE.std_logic_1164.all;

entity alu_32bits is
  port (
    A, B : in  std_logic_vector(31 downto 0);
    sel  : in  std_logic_vector(3 downto 0);
    Z    : out std_logic;
    Y    : out std_logic_vector(31 downto 0)
  );
end alu_32bits;

architecture structural of alu_32bits is
  component fn_cero32bits is -- Componente cero de 32 bits
    port (
      A,B : in std_logic_vector(31 downto 0);
      Z   : out std_logic
    );
    end component;
  
  component and_32 is --Componente AND con entradas y salida de 32 bits
    port(
      A,B : in std_logic_vector(31 downto 0);
      Y   : out std_logic_vector(31 downto 0)
    );
    end component;
  component or_32 is --Función OR con entradas y salida de 32bits
    port(
      A,B : in std_logic_vector(31 downto 0);
      Y   : out std_logic_vector(31 downto 0)
    );
  end component;
  component xor_32 is -- Componente XOR con entrada y salida de 32 bits
    port(
      A,B : in std_logic_vector(31 downto 0);
      Y   : out std_logic_vector(31 downto 0)
    );
    end component;
  
  component fn_suma_resta is -- Componente SUMA/RESTA con entrada A y B 32 bits y selección. Salida de 32 bits
    port(
      A, B : in std_logic_vector(31 downto 0);
      sel : in std_logic;
      Y : out std_logic_vector(31 downto 0)
    );
    end component;
  component fn_menor_que is  -- Componente MENOR QUE con entradas de 32 bits y salida de 1 bit
    port(
      A, B : in std_logic_vector(31 downto 0);
      con_signo : in std_logic;
      Y : out std_logic
    );
    end component;
    component desplaza_izq is -- Componente DESPLAZAMIENTO A LA IZQUIERDA: ingresa ceros desde la izquierda
      port(
        A : in std_logic_vector(31 downto 0);
        B : in std_logic_vector(4 downto 0);
        Y : out std_logic_vector(31 downto 0)
      );
      end component;

  component desplaza_der_32bits is -- Componente DESPLAZAMIENTO A LA DERECHA: ingresa ceros o unos desde la derecha
    port(
      A : in std_logic_vector(31 downto 0);
      B : in std_logic_vector(4 downto 0);
      con_signo : std_logic;
      Y : out std_logic_vector(31 downto 0)
    );
    end component;
  signal y_and, y_or, y_xor, y_sr, y_desp_der, y_desp_izq : std_logic_vector(31 downto 0);
  signal y_sel : std_logic_vector(4 downto 0);
  signal resta, menor_con_signo, desp_consigno : std_logic;
begin
  U1 : fn_suma_resta port map(
    A=>A, B=>B, resta=>resta, Y=>y_suma_resta);
  U2 : fn_menor_que port map(
    A=>A, B=>B, con_signo=>menor_consigno, Y=>y_menor);
end structural;
