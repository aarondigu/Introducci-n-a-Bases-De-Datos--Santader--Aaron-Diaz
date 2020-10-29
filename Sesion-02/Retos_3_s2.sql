SHOW DATABASES;
USE tienda;
SHOW TABLES;

#######################################################
# RETO 3
####################################################### 

# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) AS Cantidad
FROM puesto
GROUP BY nombre;

# ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) AS Pago
FROM puesto
GROUP BY nombre;

# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(*) AS Ventas
FROM venta
GROUP BY id_empleado;

# ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) AS Ventas
FROM venta
GROUP BY id_articulo;