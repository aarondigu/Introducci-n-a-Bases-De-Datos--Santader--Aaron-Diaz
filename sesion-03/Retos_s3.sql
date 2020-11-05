SHOW DATABASES;
USE tienda;
SHOW TABLES;

#######################################################
# RETO 1. SUBCONSULTAS
####################################################### 

# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT *
FROM puesto
WHERE salario < 10000;

SELECT nombre AS "Nombre"
FROM (SELECT *
FROM puesto
WHERE salario < 10000) AS Salario;

# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT * FROM venta;
SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM
 (SELECT clave, id_empleado, count(*) AS total
      FROM venta
      GROUP BY clave, id_empleado) AS venta1
GROUP BY id_empleado;

# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave
FROM venta
WHERE id_articulo IN (SELECT id_articulo FROM articulo WHERE precio > 5000);


#######################################################
# RETO 2. JOINS
####################################################### 

# ¿Cuál es el nombre de los empleados que realizaron cada venta?
SHOW KEYS FROM venta;
SHOW KEYS FROM empleado;

SELECT clave, nombre
FROM venta AS v
JOIN empleado AS e ON v.id_empleado = e.id_empleado
ORDER BY clave;

# ¿Cuál es el nombre de los artículos que se han vendido?
SELECT clave, count(*)
FROM venta
GROUP BY clave;

SELECT clave, nombre
FROM venta 
JOIN articulo ON venta.id_articulo = articulo.id_articulo
ORDER BY clave;

# ¿Cuál es el total de cada venta?
SHOW KEYS FROM articulo;
SELECT clave, sum(precio) AS "Total"
FROM venta AS v
LEFT JOIN articulo AS a ON v.id_articulo = a.id_articulo
GROUP BY clave
ORDER BY clave;

#######################################################
# RETO 3. VISTAS
####################################################### 

# Obtener el puesto de un empleado.
CREATE VIEW emple25 AS
SELECT e.nombre AS emp_nombre, e.apellido_paterno, e.apellido_materno, p.nombre AS pu_nombre
FROM empleado as e
JOIN puesto as p ON e.id_puesto = p.id_puesto;

SELECT *
FROM emple25;

# Saber qué artículos ha vendido cada empleado.
CREATE VIEW art_vend25 AS
SELECT v.clave, e.nombre AS em_nombre, a.nombre AS art_nombre
FROM venta as v
JOIN empleado as e ON v.id_empleado = e.id_empleado
JOIN articulo as a ON v.id_articulo = a.id_articulo
ORDER BY v.clave;

SELECT *
FROM art_vend25;

# Saber qué puesto ha tenido más ventas.
CREATE VIEW ven_pues25 AS
SELECT p.nombre, count(*) AS "total"
FROM venta as v
JOIN empleado as e ON v.id_empleado = e.id_empleado
JOIN puesto as p ON e.id_puesto = p.id_puesto
GROUP BY p.nombre;

SELECT *
FROM ven_pues25
ORDER BY total DESC
LIMIT 1;