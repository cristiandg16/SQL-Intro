use jueves;

create table marcas(
	id int auto_increment primary key,
    nombre varchar(40),
    origen varchar(20)
);

select * from marcas;

insert into marcas(nombre)
select distinct marca from articulos
	order by marca;
    

-- actualizar el origen
-- id : 1,2,4,6 USA
-- id : 3,5,8,9 JAPON
-- id : 7,10,11,12 ARGENTINA
-- id : 13,14,15,16,17,18 ALEMANIA

update marcas
set origen = 'USA'
	where id in (1,2,4,6);

update marcas
set origen = 'JAPON'
	where id in (3,5,8,9);
    
update marcas
set origen = 'ARGENTINA'
	where id in (7,10,11,12);
    
update marcas
set origen = 'ALEMANIA'
	where id in (13,14,15,16,17,18);
    
-- campo comun entre articulos y marcas
-- de articulos -> marca y de marcas -> nombre
SET SQL_SAFE_UPDATES=0;

update articulos as a
join marcas as m on a.marca = m.nombre
set a.idmarca = m.id;

select * from articulos;

-- agregar 3 marcas
insert into marcas(nombre,origen)
	values('GENIUS','USA');
    
    
ALTER TABLE `jueves`.`marcas` 
ADD UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) ;
