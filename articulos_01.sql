use jueves;

describe articulos;

-- mostrar todos los articulos
select * from articulos;

-- mostrar solo codigo,marca,nombre y precio
select codigo, marca, nombre, precio
	from articulos;
    
-- mostrar con alias
select codigo as numero, marca, nombre as producto, precio
	from articulos;
    
-- agregar columnas como expresiones
select codigo, marca, nombre as producto, precio, precio*0.21 as IVA
	from articulos;
select codigo, marca, nombre as producto, precio, round(precio*0.21,2) as IVA, round(precio*1.21,2) as 'Precio Final'
	from articulos;
-- para redondear a dos decimales > round(precio*0.21,2) 

-- ordenar (x columna) salidad de filas: Order by
select codigo, marca, nombre as producto, precio, round(precio*0.21,2) as IVA, round(precio*1.21,2) as 'Precio Final'
	from articulos
    order by marca; -- desc para que el orden sea descendente, sino por defecto es ascendente. (order by marca desc;)

-- mostrar, codigo, descripcion, marca, nombre y stock ordenado por stock de menor a mayor
select codigo, descripcion, marca, nombre, stock 
	from articulos
    order by stock;

-- filtrar filas/registros por columnas , datos
-- clausula : where
-- mostrar los productos de marca LG
select *
	from articulos
    where marca = 'LG' -- = 'lg', no importa si es mayuscula o minuscula
    order by descripcion;
    
-- mostrar los articulos con precios menores a 1000
select *
	from articulos
    where precio < 1000
    order by precio;
    
-- mostrar los articulos de marca noblex , LG y samsung
select *
	from articulos
    where marca = 'LG' or marca = 'noblex' or marca = 'samsung';

-- or multiples, clausula in
select *
	from articulos
    where marca in ('LG','noblex','samsung');
    
-- mostrar todos los articulos excepto hitachi
select *
	from articulos
    where marca != 'hitachi';

select *
	from articulos
    where marca not in ('hitachi');
    
select *
	from articulos
    where not marca = 'hitachi';
    
-- mostrar los articulos con precios mayores a 1000 y menos a 2000
select *
	from articulos
    where precio > 1000 and precio < 2000
    order by precio desc;
    
-- mostrar los articulos con precios mayores o igual a 1000 y menos a 2000
select *
	from articulos
    where precio >= 1000 and precio < 2000;

-- simplificación del and con rango : between
select * 
	from articulos
    where precio between 1000 and 2000	-- incluye los extremos
    order by precio;
    
-- filtrar a traves de un patro clausula like
-- mostrar los articulos cuya marca empiece con S
select *
	from articulos
    where marca like 'S%'
    order by marca;
    
-- mostrar los articulos cuya descripción termine con S 
select * 
	from articulos
    where descripcion like '%S';
    
-- mostrar los televisores de 26"
select *
	from articulos
    where descripcion = 'televisores' and nombre like '%26"%';
    
