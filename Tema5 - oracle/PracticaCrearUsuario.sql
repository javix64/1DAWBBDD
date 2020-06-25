-- 1
select * from dba_tab_privs;
/*
dba_pro
    son los perfiles de oracle que 
    pone un limite a los recursos de la base de datos
files dba_roles
    son los roles que existen en la BD
dba_users
    son los usuarios que existen en la BD
dba_role_privs
    muestra los roles puestos a todos los usuarios
    y los roles en la BD
dba_tab_privs
    muestra todos los objetos con permisos
    en la BD
dba_sys_privs
    muestra el sistema de privilegios concedidos
    a los usuarios y los roles
*/
-- 2
/*
Conectarse como usuario SYSTEM a la base y crear un usuario
llamado “administrador” autentificado por la base de datos.
Indicar como "tablespace" por defecto USERS y como "tablespace"
temporal TEMP; asignar una cuota de 500K en el "tablespace" USERS.
*/
CREATE USER administrador 
IDENTIFIED BY administrador 
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP QUOTA 500K ON USERS;

-- 3
/*
Averiguar qué privilegios de sistema, roles y privilegios sobre
objetos tiene concedidos el usuario “administrador”.
*/
select * from dba_sys_privs where GRANTEE='ADMINISTRADOR';
-- 4
/*
Otorgar el privilegio “CREATE SESSION” al usuario
“administrador” e intentar de nuevo la conexión.
*/
grant CREATE SESSION to administrador;

-- 5
/*
Conectarse como usuario “administrador” y crear un usuario
llamado “prueba00” que tenga como "tablespace" por defecto USERS
y como "tablespace" temporal TEMP; asignar una cuota de 0K en el
"tablespace" USERS. ¿Es posible hacerlo?.
*/
create user prueba00
identified by prueba00
default tablespace users
temporary tablespace temp
quoat 0k on users;
-- 6
/*
Conectado como usuario SYSTEM, otorgar el privilegio “create
user” al usuario “administrador” y repetir el ejercicio anterior.
*/
grant create user to administrador;

-- 7
/*
Averiguar que usuarios de la base de datos tienen asignado el
privilegio “create user” de forma directa, ¿qué vista debe ser
consultada?
*/

-- 8
/*
Hacer lo mismo para el privilegio “create session”
*/

-- 9
create TABLESPACE tab_factura
DATAFILE 'D:\Documentos\DAW\Base de datos\Tema5 - oracle\tables_facturas.dat' size 100M
ONLINE
PERMANENT;
DROP TABLESPACE tab_factura;
commit;

-- 10
/*

*/