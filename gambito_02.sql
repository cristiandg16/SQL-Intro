use jueves;
describe alumnos;

-- tipo de campo especial

create table localidades
(
	id int auto_increment primary key, -- se va aumentando de manera automatica
    nombre varchar(30)
);

insert into localidades(nombre)
values('olivos');

-- recuperar datos de una tabla: select
-- * muestra todos los campos desde una tabla
select * from localidades;
select * from alumnos;
select nombre from alumnos;
select id from localidades;

-- muestra los campos de cada tabla: describe
describe alumnos;
describe localidades;