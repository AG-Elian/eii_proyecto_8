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
  component fn_cero32bits is
    port (
      A,B : in std_logic_vector(31 downto 0);
      Z   : out std_logic
    );
    end component;
  
  component and_32 is
    port(
      A,B : in std_logic_vector(31 downto 0);
      Y   : out std_logic_vector(31 downto 0)
    );
    end component;
  component or_32 is
    port(
      A,B : in std_logic_vector(31 downto 0);
      Y   : out std_logic_vector(31 downto 0)
    );
  end component;
  component xor_32 is
    port(
      A,B : in std_logic_vector(31 downto 0);
      Y   : out std_logic_vector(31 downto 0)
    );
    end component;
  component desplaza_izq is
    port(
      A : in std_logic_vector(31 downto 0);
      B : in std_logic_vector(4 downto 0);
      Y : out std_logic_vector(31 downto 0)
    );
    end component;
  component fn_suma_resta is
    port(
      A, B : in std_logic_vector(31 downto 0);
      sel : in std_logic;
      Y : out std_logic_vector(31 downto 0);
    );
    end component;
  component fn_menor_que is
    port(
      A, B : in std_logic_vector(31 downto 0);
      con_signo : in std_logic;
      Y : out std_logic
    );
    end component;
  component desplaza_der_32bits is
    port(
      A : in std_logic_vector(31 downto 0);
      B : in std_logic_vector(3 downto 0);
      con_signo : std_logic;
      Y : out std_logic_vector(31 downto 0);
    );
    end component;
  y_and, y_or, y_xor, y_sr, y_desp_der, y_desp_izq : std_logic_vector(31 downto 0);
  y_sel : std_logic_vector;
  resta, menor, con_signo, desp_consigno: std_logic_vector;
begin
  Y <= A and B;
end structural;
