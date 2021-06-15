-- crear tabla alumnos
-- DNI, apellido, nombre, email
-- indico en que base de datos voy a trabajar
use jueves;
create table alumnos
(
	-- campos
    dni int primary key, -- clave primaria
    apellido varchar(30) not null,
    nombre varchar(30) not null,
    email varchar(40)
);
