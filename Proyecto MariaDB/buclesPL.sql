-- 1.-  Que pida un n�mero y diga si es primo o no.
-- 2.-  Que muestre los n�meros del 1 al 100.

Set Serveroutput On;
Declare 
i NUMBER(9) := 1;
Begin 
While (i<=100)
Loop
 Dbms_Output.Put_Line(I);
 i := i+1;
END loop;
END;

-- 3.-  Que muestre los n�meros del 100 al 1.
Set Serveroutput On;
Declare 
i NUMBER(9) := 100;
Begin 
While (i>=1)
Loop
 Dbms_Output.Put_Line(I);
 i := i-1;
End Loop;
END;

-- 4.- Que muestre los n�meros pares que haya del 1 al 100.
Set Serveroutput On;
Declare 
i NUMBER(9) := 0;
Begin 
While (i<=100)
Loop
 Dbms_Output.Put_Line(I);
 i := i+2;
End Loop;
END;

-- 5.- Que muestre los n�meros impares que haya del 1 al 100.
Set Serveroutput On;
Declare 
i NUMBER(9) := 1;
Begin 
While (i<=100)
Loop
 Dbms_Output.Put_Line(I);
 i := i+2;
End Loop;
END;
-- 6.- Que imprima la suma de todos los n�meros que van del 1 al 100.
Set Serveroutput On;
Declare 
I Number(9) := 1;
sumatorio number(9) := 0;
Begin 
While (i<=100)
Loop
 i:= i+1;
Sumatorio := Sumatorio+I;

End Loop;
Dbms_Output.Put_Line(sumatorio);
END;
-- 7.- Que imprima la suma de todos los n�meros pares que van del 1 al 100.
Set Serveroutput On;
Declare 
I Number(9) := 0;
sumatorio number(9) := 0;
Begin 
While (i<=100)
Loop
 i:= i+2;
Sumatorio := Sumatorio+I;

End Loop;
Dbms_Output.Put_Line(Sumatorio);
END;
-- 8.- Que imprima la suma de todos los n�meros impares que van del 1 al 100.
Set Serveroutput On;
Declare 
I Number(9) :=1 ;
sumatorio number(9) := 0;
Begin 
While (i<=100)
Loop
 i:= i+2;
Sumatorio := Sumatorio+I;

End Loop;
Dbms_Output.Put_Line(Sumatorio);
END;
-- 9.- Que imprima la suma de todos los n�meros pares que van del 1 al 100 y diga cu�ntos hay.
Set Serveroutput On;
Declare 
I Number(9) :=0 ;
Sumatorio Number(9) := 0;
contador number(9) := 1;
Begin 
While (i<=100)
Loop
contador:=i/2;
 i:= i+2;
Sumatorio := Sumatorio+I;

End Loop;
Dbms_Output.Put_Line('total: '||Sumatorio || ' y numeros: ' ||contador);
END;
-- 10.- Que imprima la suma de todos los n�meros impares que van del 1 al 100 y diga cu�ntos hay.
Set Serveroutput On;
Declare 
I Number(9) :=1 ;
Sumatorio Number(9) := 0;
contador number(9) := 1;
Begin 
While (i<=100)
Loop
contador:=i/2;
 i:= i+2;
Sumatorio := Sumatorio+I;

End Loop;
Dbms_Output.Put_Line('total: '||Sumatorio || ' y numeros: ' ||Contador);
END;
-- 11.- Que pida dos n�meros y muestre todos los n�meros que van desde el primero al segundo.
Set Serveroutput On;
Declare 

primero Number(9) := &primero;
Segundo Number(9) := &segundo;
i number(9):=0;
Begin 
for i in primero..segundo
Loop
Dbms_Output.Put_Line(i);
End Loop;

END;
-- 12.- Que pida dos n�meros y muestre todos los n�meros pares que van desde el primero al segundo.
set serveroutput on;
Declare
    primer int:=&primer;
    segundo int:=&segundo;
Begin
    For I In Primer .. Segundo Loop
        If(Mod(I,2)=0) Then
            dbms_output.put_line(i);
        end if; 
    end loop;
end;

-- 13.- Que pida dos n�meros y muestre todos los n�meros impares que van desde el primero al segundo.
set serveroutput on;
Declare
    primer int:=&primer;
    segundo int:=&segundo;
Begin
    For I In Primer .. Segundo Loop
        If(Mod(I,2)=1) Then
            dbms_output.put_line(i);
        end if; 
    End Loop;
end;
-- 14.- Que pida dos n�meros y sume todos los n�meros que van desde el primero al segundo.
Set Serveroutput On;
Declare 

primero Number(9) := &primero;
Segundo Number(9) := &segundo;
I Number(9):=0;
sumatorio number(8):=0;
Begin 
for i in primero..segundo
Loop
Sumatorio:=I+Sumatorio;

End Loop;
Dbms_Output.Put_Line(sumatorio);
END;
-- 15.- Que pida un n�mero y muestre en pantalla el mismo n�mero de asteriscos
Set Serveroutput On;
Declare 

Primero Number(9) := 0;
Segundo Number(9) := &numero;
i number(9):=0;
Begin 
for i in primero..segundo
Loop
Dbms_Output.Put_Line('*');
End Loop;

END;
-- 16.- Que calcule la media de X n�meros, se dejar�n de solicitar n�meros hasta que se introduzca el cero.
-- 17.- Que calcule la suma de los cuadrados de los 100 primeros n�meros.
Set Serveroutput On;
Declare 
I Number(9) := 0;
sumatorio number(9) := 0;
Begin 
While (i<=100)
Loop
 I:= I+2;
Sumatorio := Sumatorio+I*i;

End Loop;
Dbms_Output.Put_Line(Sumatorio);
END;

