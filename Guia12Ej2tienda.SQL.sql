#1,3 Lista el nombre de todos los productos que hay en la tabla producto.
select * from producto;
#2,4 Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre,round(precio) from producto;
#5 Lista el código de los fabricantes que tienen productos en la tabla producto.
select codigo_fabricante from producto;
#6 Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar los repetidos.
select distinct codigo_fabricante from producto;
#7 Lista los nombres de los fabricantes ordenados de forma ascendente.
 select nombre from fabricante order by nombre asc;
#9 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
#10

#12
select nombre , precio from producto where precio <= 120;
#13
select nombre , precio from producto where precio between 60 and 200;
#14
select nombre , codigo_fabricante from producto where codigo_fabricante in (1,3,5);
#15
select nombre from producto where nombre like "%portatil%";
#CONSULTAS MULTITABLA
#1
select f.codigo as "codigo fabricante" , f.nombre as "nombre fabricante" , p.nombre as "nombre producto" , p.codigo as "codigo producto" from producto p , fabricante f;
#2 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos
#  los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por
#  orden alfabético.
select p.nombre as "nombre producto" , p.precio as "precio", f.nombre as "nombre fabricante" from producto p , fabricante f where p.codigo_fabricante=f.codigo order by f.nombre asc ;
#3


