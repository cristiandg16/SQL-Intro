use jueves;
select * from articulos;

-- mostrar los articulos cuya 2da letra y 4ra sea una "e" en la descripcion

select * from articulos
	where descripcion like '_e_e%'; -- los _ simulan un char cualquiera
    
/* Clausula limit: restringir cantidad de registros */
select * from articulos limit 10;

/* MOstrar desde tal registro a tal otro */
select * from articulos limit 5300,4;

/* regexp : expresion regular */
-- filtrar por marca que comience con s
select * from articulos
	where marca regexp '^s';
    
-- clausula condicional : if
/* agregar una columna reponer stock si el stock es menor a 20 */
select codigo, nombre, stock,
	if(stock < 20, 'SI', 'No') as Reponer, -- primer coma es then, segunda coma el else.
    if(stock < 20,20 - stock,0) as Cantidad
from articulos;

/* datos al azar */
select * from articulos
	order by rand() limit 5;
    
/* Funciones de agregado o agrupamiento
count: cuenta filas con valores no nulos en sus campos
sum: suma contenido de campos numericos
max: retorna el valor mayor de un campo num
min: retorna el valor menor de un campo num
avg: retorna el promedio de un campo num */

/* Count */
-- Cuantos modelos de articulos tengo?
select count(*) as cantidad from articulos;

-- Cuantos televisores tengo?
select count(codigo) as 'Cantidad Televisores' from articulos
	where descripcion = 'televisores';
    
/* Cuantos televisores tengo, cuanto stock, precio max y min */
select
	count(codigo) as 'Cantidad Televisores',
    sum(stock) as 'Total de Stock',
    max(precio) 'Precio Max',
    min(precio) 'Precio Minimo',
    avg(precio) as 'Precio Promedio' from articulos
		where descripcion = 'televisores';
        
/* cantidad de articulos marca LG */
select count(*) as CantidadLG from articulos
	where marca = 'lg';
    
/* cantidad de articulos por marca */
-- marca cantidad
select marca, count(*) as Cantidad from articulos
	group by marca
    order by cantidad;
    
-- mostrar total de stock por descripcion
select descripcion, sum(stock) as TotalStock from articulos
	group by descripcion
    having sum(stock) >  100 -- puedo poner TotalStock en lugar de sum(stock)
    order by TotalStock;
    
/* Mostrar agrupado por marca
   Cantidad de articulos
   Siempre que su promedio de precio sea mayor a 100 */
select marca, count(*) as total from articulos
	where marca in ('lg','gafa','kodak')
	group by marca
    having avg(precio) > 100;
    
    
-- insert into : agregar filas a una tabla
-- Tiene 4 formas
/*
   1. Con nombres de campos y valores
   2. Solo valores
   3. A partir de un select
   4. Creando la tabla
*/

/* 1. Con nombres de campos y valores
   Agregar un articulo nuevo 
*/
insert into articulos(codigo, descripcion, nombre, precio, stock, marca)
	values (66, 'Televisores', 'LED 4K CON NETFLIX 55"', 32000, 100, 'SONY');

select * from articulos where codigo = 66;

/* 2. Solo valores */
insert into articulos values (67, 'Televisores', 'LED 8K DISNEY+ 43"',12000,50,'SANYO'); -- valores deben estar ordenados

/* 3. A partir de un select */
insert into articulos
	select * from nuevosProductos;