SHOW DATABASES;
USE tienda;
SHOW TABLES;

#######################################################
# RETO 2
####################################################### 

# ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario) AS 'Promedio'
FROM puesto;

# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*)
FROM articulo
WHERE nombre LIKE '%pasta%';

# ¿Cuál es el salario mínimo y máximo?
SELECT min(salario) AS 'Mínimo', max(salario) AS 'Máximo'
FROM puesto;

# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
# Primero se revisa cuales son los últimos 5 puestos
SELECT *
FROM puesto
ORDER BY id_puesto DESC
LIMIT 5;

# Después se suman dichos 5 puestos
SELECT sum(salario) AS suma
FROM puesto
WHERE id_puesto > 995;

