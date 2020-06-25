-- SET SERVEROUTPUT ON;
DECLARE
    Interes Number(5,3):=16.6;
    Descripcion VARCHAR2(50):= 'inicial';
    Fecha_max DATE:='11/03/2020';
    Contabilizado BOOLEAN:=TRUE;
    PI CONSTANT REAL:= 3.14159;
    codigoWarehouse boxes.warehouse%type;
BEGIN
    DBMS_OUTPUT.PUT_LINE('LA VARIABLE INTERES ES TIPO NUMBER Y CONTIENE '|| INTERES);
    DBMS_OUTPUT.PUT_LINE('LA VARIABLE DESCRIPCION ES TIPO VARCHAR2(50) Y CONTIENE '|| descripcion);
    DBMS_OUTPUT.PUT_LINE('LA VARIABLE FECHA_MAX ES TIPO NUMBER Y CONTIENE '|| FECHA_MAX);
    DBMS_OUTPUT.PUT_LINE('LA VARIABLE PI ES TIPO NUMBER Y CONTIENE '|| pi);
END;

SET serveroutput on;
declare
    a int:=&introduce_un_valor;-- 5;
    b int:= &introduce_otro_valor;--6;
begin
    if (a>b) then
    dbms_output.put_line('a ' || a || ' es mayor que ' || b);
    else
    dbms_output.put_line('a ' || b || ' es mayor que ' || a);
    end if;
end;
/*
CASE variable
WHEN expresion then valor1/bloque de instrucciones
WHEN expresion2 then valor2/bloque de instrucciones
WHEN expresion3 then valor3/bloque de instrucciones
ELSE valor4/bloque de instrucciones
END;
*/
-- introduce un DNI y que devuelva por pantalla la letra que corresponde a ese numero
-- case pedir un dni tipo entero
set serveroutput on;
DECLARE
    DNI INT:=&introduce_un_dni;
    resto int;
BEGIN
    RESTO:=MOD(DNI,23);
CASE RESTO
WHEN 0 then dbms_output.put_line('La letra es T');
WHEN 1 then dbms_output.put_line('La letra es R');
WHEN 2 then dbms_output.put_line('La letra es W');
WHEN 3 then dbms_output.put_line('La letra es A');
WHEN 4 then dbms_output.put_line('La letra es G');
WHEN 5 then dbms_output.put_line('La letra es M');
WHEN 6 then dbms_output.put_line('La letra es Y');
WHEN 7 then dbms_output.put_line('La letra es F');
WHEN 8 then dbms_output.put_line('La letra es P');
WHEN 9 then dbms_output.put_line('La letra es D');
WHEN 10 then dbms_output.put_line('La letra es X');
WHEN 11 then dbms_output.put_line('La letra es B');
WHEN 12 then dbms_output.put_line('La letra es N');
WHEN 13 then dbms_output.put_line('La letra es J');
WHEN 14 then dbms_output.put_line('La letra es Z');
WHEN 15 then dbms_output.put_line('La letra es S');
WHEN 16 then dbms_output.put_line('La letra es Q');
WHEN 17 then dbms_output.put_line('La letra es V');
WHEN 18 then dbms_output.put_line('La letra es H');
WHEN 19 then dbms_output.put_line('La letra es L');
WHEN 20 then dbms_output.put_line('La letra es C');
WHEN 21 then dbms_output.put_line('La letra es K');
ELSE dbms_output.put_line('La letra es E');
end case;
END;

set serveroutput on;
DECLARE
    DNI INT:=&introduce_un_dni;
    resto int;
BEGIN
    RESTO:=MOD(DNI,23);
CASE RESTO
WHEN 0 then :=T;
WHEN 1 then dbms_output.put_line('La letra es R');
WHEN 2 then dbms_output.put_line('La letra es W');
WHEN 3 then dbms_output.put_line('La letra es A');
WHEN 4 then dbms_output.put_line('La letra es G');
WHEN 5 then dbms_output.put_line('La letra es M');
WHEN 6 then dbms_output.put_line('La letra es Y');
WHEN 7 then dbms_output.put_line('La letra es F');
WHEN 8 then dbms_output.put_line('La letra es P');
WHEN 9 then dbms_output.put_line('La letra es D');
WHEN 10 then dbms_output.put_line('La letra es X');
WHEN 11 then dbms_output.put_line('La letra es B');
WHEN 12 then dbms_output.put_line('La letra es N');
WHEN 13 then dbms_output.put_line('La letra es J');
WHEN 14 then dbms_output.put_line('La letra es Z');
WHEN 15 then dbms_output.put_line('La letra es S');
WHEN 16 then dbms_output.put_line('La letra es Q');
WHEN 17 then dbms_output.put_line('La letra es V');
WHEN 18 then dbms_output.put_line('La letra es H');
WHEN 19 then dbms_output.put_line('La letra es L');
WHEN 20 then dbms_output.put_line('La letra es C');
WHEN 21 then dbms_output.put_line('La letra es K');
ELSE dbms_output.put_line('La letra es E');
end case;
END;
/*
Bucle:
    loop
        sentencias
    end loop;
*/
set serveroutput on;
DECLARE
    impar INT;
BEGIN
LOOP
    
    mod2=1
    
Declare
NUM1 number:=0;
begin
loop
    NUM2 := 0
    NUM1 := MOD(NUM2,23);
    dbms_output.put_line (NUM1||',');
exit when NUM1<=100;
end loop;
end;