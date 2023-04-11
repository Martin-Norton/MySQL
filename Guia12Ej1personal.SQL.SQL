#1 Obtener los datos completos de los empleados.
select* from empleados;
#2 Obtener los datos completos de los departamentos.
select*from departamentos;
#3 Listar el nombre de los departamentos.
select nombre_depto from departamentos;
#4 Obtener el nombre y salario de todos los empleados.
select nombre , sal_emp from empleados;
#5 Listar todas las comisiones.
select comision_emp from empleados;
#6 Obtener los datos de los empleados cuyo cargo sea ‘Secretaria’.
select* from empleados where cargo_emp like "Secretaria";
#7 Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente.
select* from empleados where cargo_emp like "Vendedor" order by nombre asc;
#8 Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a mayor.
select nombre as "nombre del empleado" , cargo_emp as "cargo en la empresa" from empleados order by sal_emp asc;
#9
SELECT nombre_jefe_depto FROM departamentos WHERE ciudad = "CIUDAD REAL";
#10
select nombre as "Nombre" , cargo_emp as "Cargo" FROM  empleados;
#11
select sal_emp AS "salario" , comision_emp as"comision" FROM empleados where id_depto = 2000 order by comision_emp asc;
#12
select nombre , (sal_emp + comision_emp + 500) as "salario a cobrar" , id_depto FROM empleados where id_depto=3000 order BY nombre asc ;
#13
select nombre from empleados where nombre like "j%";
#14
select sal_emp , comision_emp , (sal_emp + comision_emp) as "total" , nombre from empleados  where comision_emp > 1000;
#15
select sal_emp , comision_emp , (sal_emp + comision_emp) as "total" , nombre from empleados  where not comision_emp;
#16
select nombre, sal_emp , comision_emp from empleados where comision_emp > sal_emp;
#17
#Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
select nombre from empleados where comision_emp<= (sal_emp * 0.30);
#18
select nombre from empleados where nombre not like "%ma%" or nombre not like "ma%" or nombre not like "%ma";
#19
select nombre_jefe_depto,nombre_depto from departamentos where nombre_depto in ("ventas","investigacion","mantenimiento");
#20
select nombre_jefe_depto,nombre_depto from departamentos where not nombre_depto in ("ventas","investigacion","mantenimiento");
#21
select nombre,sal_emp from empleados order by sal_emp desc limit 1 ;
#22
select nombre from empleados order by nombre desc limit 1;
#23
select max(sal_emp) , min(sal_emp) , max(sal_emp)- min(sal_emp) AS "diferencia " from empleados ;
#24
select avg(sal_emp)as prom, id_depto as id from empleados group by id_depto;
#25 Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.
SELECT id_depto,COUNT(id_emp) FROM empleados GROUP BY id_depto HAVING COUNT(id_emp) > 3;
SELECT COUNT(e.id_emp) AS 'NroEmpleados', e.id_depto   FROM empleados e, departamentos d
    WHERE e.id_depto = d.id_depto GROUP BY e.id_depto HAVING COUNT(e.id_emp) > 3;
#26 Hallar los departamentos que no tienen empleados
select id_depto from empleados group by id_depto having count(id_emp)=0;
#27 Mostrar la lista de empleados, con su respectivo departamento y el jefe de cada departamento.
select e.nombre , d.nombre_depto , d.nombre_jefe_depto from empleados e inner join departamentos d on d.id_depto = e.id_depto; 
#28 Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.
select e.nombre , d.nombre_depto, sal_emp from empleados e , departamentos d where e.sal_emp >= (select avg(sal_emp) from empleados);
 
