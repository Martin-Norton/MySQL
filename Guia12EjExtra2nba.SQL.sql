#1 
select nombre from jugadores order by nombre asc;
#2 
select nombre , posicion from jugadores where Peso > 200 and Posicion = "C";
#3 
select Nombre from equipos order by Nombre asc;
#4
select Nombre from equipos where Conferencia = "east";
#5
select Nombre , Ciudad from equipos where ciudad like "c%";
#6
select nombre, nombre_equipo from jugadores  order by nombre_equipo asc;
#7
select nombre from jugadores where nombre_equipo like "Raptors" order by nombre asc;
#8
select j.nombre , e.puntos_por_partido from jugadores j inner join estadisticas e where j.nombre like "Pau Gasol";
#9
select j.nombre , e.puntos_por_partido, e.temporada from jugadores j inner join estadisticas e where j.nombre like "Pau Gasol" and e.temporada = "04/05";
#10 Mostrar el número de puntos de cada jugador en toda su carrera.
select j.nombre , sum(e.puntos_por_partido) from jugadores j inner join estadisticas e on j.codigo = e.jugador group by j.nombre;
#11 Mostrar el número de jugadores de cada equipo.
select nombre_equipo , count(codigo) as "cantidad de jugadores" from jugadores group by nombre_equipo;
#12 Mostrar el jugador que más puntos ha realizado en toda su carrera.
select j.nombre , sum(e.puntos_por_partido) as "puntos" from jugadores j inner join estadisticas e on j.codigo = e.jugador group by j.nombre order by puntos desc limit 1;
#13 Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.
#select e.nombre , e.conferencia , e.division , j.nombre, j.Altura from equipos e inner join jugadores j order by j.altura asc limit 1;
 SELECT j.nombre, j.Altura, e.Nombre, e.Conferencia, e.Division
     FROM equipos e, jugadores j
     WHERE e.Nombre = j.Nombre_equipo AND
           j.Altura = (SELECT MAX(Altura) FROM jugadores);
           
#14 Mostrar la media de puntos en partidos de los equipos de la división Pacific.
SELECT ROUND(AVG((partidos.puntos_local + partidos.puntos_visitante)/2), 2) AS media_puntos 
FROM partidos 
WHERE partidos.equipo_local IN (SELECT equipos.nombre FROM equipos WHERE equipos.division = 'Pacific')
   OR partidos.equipo_visitante IN (SELECT equipos.nombre FROM equipos WHERE equipos.division = 'Pacific');
   
#15 Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor diferencia de puntos.
SELECT equipo_local AS "Equipo local", equipo_visitante AS "Equipo visitante", ABS(puntos_local - puntos_visitante) AS "Diferencia" FROM partidos WHERE ABS(puntos_local - puntos_visitante) = (SELECT MAX(ABS(puntos_local - puntos_visitante)) FROM partidos);
/* 16. Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante.  */
SELECT equipo AS Equipo,
  SUM(puntos_local) AS PuntosLocal, 
  SUM(puntos_visitante) as PuntosVisitante
FROM (
    SELECT equipo_local AS equipo, puntos_local, 0 AS puntos_visitante
    From partidos
    UNION ALL
    SELECT equipo_visitante AS equipo, 0 AS puntos_local, puntos_visitante
    FROM partidos) AS resultados
    GROUP BY equipo;