# candado a posicion : Teniendo el máximo de asistencias por partido, muestre cuantas veces se logró dicho máximo.
select count(Asistencias_por_partido) from estadisticas where Asistencias_por_partido like "34"; #resultado=2
# candado a clave: Muestre la suma total del peso de los jugadores, donde la conferencia sea Este y la posición sea centro o esté comprendida en otras posiciones.
select sum(j.peso) from jugadores j , equipos e where j.Nombre_equipo = e.nombre and e.conferencia = "east" and j.posicion = "center";
# candado b posicion: Muestre la cantidad de jugadores que poseen más asistencias por partidos, que el numero de jugadores que tiene el equipo Heat.
select count(nombre) from jugadores where Nombre_equipo like "heat";# = 16
select count(jugador) from estadisticas where asistencias_por_partido > "16";# resultado = 3
#candado b clave: La clave será igual al conteo de partidos jugados durante las temporadas del año 1999.
select count(codigo) from partidos where temporada like "%99%"; #resultado = 3480
#candado c posicion: La posición del código será igual a la cantidad de jugadores que proceden de Michigan y forman parte de equipos de la conferencia oeste.
select count(j.codigo) from jugadores j , equipos e where j.Procedencia like "Michigan" and j.nombre_equipo = e.nombre and e.conferencia = "west";# resultado= 2
# candado c clave: Para obtener el siguiente código deberás redondear hacia abajo el resultado que se devuelve de
                  #sumar: el promedio de puntos por partido, el conteo de asistencias por partido, y la suma de
				  #tapones por partido. Además, este resultado debe ser, donde la división sea central. resultado = 724
SELECT avg((partidos.puntos_local + partidos.puntos_visitante)/2) as suma2 #103.20915638
FROM partidos 
WHERE partidos.equipo_local IN (SELECT equipos.nombre FROM equipos WHERE equipos.division = 'central')
   OR partidos.equipo_visitante IN (SELECT equipos.nombre FROM equipos WHERE equipos.division = 'central');
select count(Asistencias_por_partido)#384
from estadisticas
where estadisticas.jugador in (select jugadores.codigo from jugadores , equipos where jugadores.Nombre_equipo = equipos.Nombre and equipos.Division = "central");
select sum(Tapones_por_partido) #237.64000104740262
from estadisticas
where estadisticas.jugador in (select jugadores.codigo from jugadores , equipos where jugadores.Nombre_equipo = equipos.Nombre and equipos.Division = "central");
# candado d posicion: Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01. Este resultado debe ser redondeado.
select round(Tapones_por_partido) from estadisticas where jugador = "28" and temporada like "00/01"; #resultado = 4
# candado d clave : Para obtener el siguiente código deberás redondear hacia abajo, la suma de puntos por partido de todos los jugadores de procedencia argentina. resultado= 191
select round(sum(estadisticas.Puntos_por_partido)) 
from estadisticas 
where estadisticas.jugador in (select jugadores.codigo from jugadores where jugadores.Procedencia like "Argentina");
