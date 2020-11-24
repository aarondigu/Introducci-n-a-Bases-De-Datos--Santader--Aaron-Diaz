

# RETO 1
CREATE DATABASE IF NOT EXISTS bedu_test;

USE bedu_test;

# Tabla movies
CREATE TABLE IF NOT EXISTS movies (
	id INT PRIMARY KEY,
    titulo VARCHAR(100),
    generos VARCHAR(100)
);

# Tabla ratings

CREATE TABLE IF NOT EXISTS ratings (
	user_id INT,
    movie_id INT,
    rating INT,
    time_stamp BIGINT
);