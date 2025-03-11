USE sakilacampus;

-- 1. Encuentra el cliente que ha realizado la mayor cantidad de alquileres en los últimos 6 meses.
SELECT a.id_cliente, c.nombre, c.apellidos, COUNT(id_cliente) AS conteo  
FROM alquiler a
LEFT JOIN cliente c ON a.id_cliente = c.id
GROUP BY id_cliente
ORDER BY conteo DESC
LIMIT 1;

-- 2. Lista las cinco películas más alquiladas durante el último año.
SELECT  p.id, p.titulo, COUNT(id_inventario) AS conteo 
FROM alquiler a
LEFT JOIN inventario i ON a.id_inventario = i.id
LEFT JOIN pelicula p ON i.id_pelicula = p.id
WHERE YEAR(a.fecha_alquiler) = 2025
GROUP BY p.id
ORDER BY conteo DESC
LIMIT 5;

-- 3. Obtén el total de ingresos y la cantidad de alquileres realizados por cada categoría de película.
SELECT c.nombre AS categoria, COUNT(c.id) AS conteo, SUM(pa.total) AS ingresos
FROM pago pa 
LEFT JOIN alquiler a ON pa.id_alquiler = a.id
LEFT JOIN inventario i ON a.id_inventario = i.id
LEFT JOIN pelicula pe ON i.id_pelicula = pe.id
LEFT JOIN pelicula_categoria pc ON pc.id_pelicula = pa.id
LEFT JOIN categoria c ON pc.id_categoria = c.id
GROUP BY categoria
ORDER BY conteo DESC;

-- 4. Calcula el número total de clientes que han realizado alquileres por cada idioma disponible en un mes específico.
SELECT ia.nombre AS idioma, COUNT(c.id) AS conteo
FROM alquiler a
LEFT JOIN cliente c ON a.id_cliente = c.id
LEFT JOIN inventario io ON a.id_inventario = io.id
LEFT JOIN pelicula p ON io.id_pelicula = p.id
LEFT JOIN idioma ia ON p.id_idioma = ia.id
WHERE MONTH(a.fecha_alquiler) = "03"
GROUP BY idioma;

-- 5. Encuentra a los clientes que han alquilado todas las películas de una misma categoría.

-- 6. Lista las tres ciudades con más clientes activos en el último trimestre.
SELECT ci.nombre AS ciudad, COUNT(cl.id) AS conteo
FROM ciudad ci 
LEFT JOIN direccion d ON ci.id = d.id_ciudad
LEFT JOIN cliente cl ON cl.id_direccion = d.id
WHERE cl.activo = 1
GROUP BY ciudad
ORDER BY conteo DESC
LIMIT 3;

-- 7. Muestra las cinco categorías con menos alquileres registrados en el último año.
SELECT c.nombre AS categoria, COUNT(c.id) AS conteo
FROM pago pa 
LEFT JOIN alquiler a ON pa.id_alquiler = a.id
LEFT JOIN inventario i ON a.id_inventario = i.id
LEFT JOIN pelicula pe ON i.id_pelicula = pe.id
LEFT JOIN pelicula_categoria pc ON pc.id_pelicula = pa.id
LEFT JOIN categoria c ON pc.id_categoria = c.id
WHERE YEAR(a.fecha_alquiler) = 2025
GROUP BY categoria
ORDER BY conteo ASC
LIMIT 6;

-- 8. Calcula el promedio de días que un cliente tarda en devolver las películas alquiladas.

-- 9. Encuentra los cinco empleados que gestionaron más alquileres en la categoría de Acción.
SELECT a.id_empleado, e.nombre, e.apellidos, COUNT(a.id_empleado) AS conteo 
FROM alquiler a
LEFT JOIN inventario i ON a.id_inventario = i.id
LEFT JOIN pelicula p ON i.id_pelicula = p.id
LEFT JOIN empleado e ON a.id_empleado = e.id
LEFT JOIN pelicula_categoria pc ON p.id = pc.id_pelicula
LEFT JOIN categoria c ON pc.id_categoria = c.id
WHERE LOWER(c.nombre) = "action"
GROUP BY a.id_empleado
ORDER BY conteo DESC 
LIMIT 5;

-- 10. Genera un informe de los clientes con alquileres más recurrentes.
SELECT a.id_cliente, c.nombre, c.apellidos, COUNT(id_cliente) AS conteo  
FROM alquiler a
LEFT JOIN cliente c ON a.id_cliente = c.id
GROUP BY id_cliente
ORDER BY conteo DESC
LIMIT 10;

-- 11. Calcula el costo promedio de alquiler por idioma de las películas.
SELECT ia.nombre AS idioma, AVG(pa.total) AS promedio
FROM pago pa
LEFT JOIN alquiler a ON pa.id_alquiler = a.id
LEFT JOIN cliente c ON a.id_cliente = c.id
LEFT JOIN inventario io ON a.id_inventario = io.id
LEFT JOIN pelicula pe ON io.id_pelicula = pe.id
LEFT JOIN idioma ia ON pe.id_idioma = ia.id
GROUP BY idioma;

-- 12. Lista las cinco películas con mayor duración alquiladas en el último año.
SELECT p.id, p.titulo, p.duracion
FROM alquiler a
LEFT JOIN inventario i ON a.id_inventario = i.id
LEFT JOIN pelicula p ON i.id_pelicula = p.id
WHERE YEAR(a.fecha_alquiler) = 2025
GROUP BY p.id
ORDER BY p.duracion DESC
LIMIT 5;