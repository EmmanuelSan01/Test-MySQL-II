DROP DATABASE IF EXISTS sakilacampus;
CREATE DATABASE sakilacampus;
USE sakilacampus;

CREATE TABLE pais (
	id int PRIMARY KEY,
	nombre varchar(50),
	ultima_actualizacion timestamp
);

CREATE TABLE ciudad (
	id int PRIMARY KEY,
	nombre varchar(50),
	id_pais int,
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_pais) REFERENCES pais(id)
);

CREATE TABLE direccion (
	id int PRIMARY KEY,
	direccion varchar(50),
	direccion2 varchar(50),
	distrito varchar(20),
	id_ciudad int,
	codigo_postal varchar(10),
	telefono varchar(20),
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_ciudad) REFERENCES ciudad(id)
);

CREATE TABLE empleado (
	id int PRIMARY KEY,
	nombre varchar(45),
	apellidos varchar(45),
	id_direccion int,
	imagen blob,
	email varchar(50),
	id_almacen int,
	activo int,
	username varchar(16),
	password varchar(40),
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_direccion) REFERENCES direccion(id)
);

CREATE TABLE almacen (
	id int PRIMARY KEY,
	id_empleado_jefe int,
	id_direccion int,
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_empleado_jefe) REFERENCES empleado(id),
	FOREIGN KEY (id_direccion) REFERENCES direccion(id)
);

CREATE TABLE cliente (
	id int PRIMARY KEY,
	id_almacen int,
	nombre varchar(45),
	apellidos varchar(45),
	email varchar(50),
	id_direccion int,
	activo int,
	fecha_creacion datetime,
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_almacen) REFERENCES almacen(id),
	FOREIGN KEY (id_direccion) REFERENCES direccion(id)
);

CREATE TABLE idioma (
	id int PRIMARY KEY,
	nombre char(20),
	ultima_actualizacion timestamp
);

CREATE TABLE pelicula (
	id int PRIMARY KEY,
	titulo varchar(255),
	descripcion text,
	anyo_lanzamiento year,
	id_idioma int,
	id_idioma_original int,
	duarcion_alquiler int,
	rental_rate decimal(4,2),
	duracion int,
	replacement_cost decimal(5,2),
	clasificacion enum("G", "PG", "PG-13", "R", "NC-17"),
	caracteristicas_especiales set("Trailers", "Commentaries", "Deleted Scenes", "Behind the Scenes"),
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_idioma) REFERENCES idioma(id),
	FOREIGN KEY (id_idioma_original) REFERENCES idioma(id)
	
);

CREATE TABLE inventario (
	id int PRIMARY KEY,
	id_pelicula int,	
	id_almacen int,
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_pelicula) REFERENCES pelicula(id),
	FOREIGN KEY (id_almacen) REFERENCES almacen(id)
);

CREATE TABLE alquiler (
	id int PRIMARY KEY,
	fecha_alquiler datetime,
	id_inventario int,
	id_cliente int,
	fecha_devolucion datetime,
	id_empleado int,
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_inventario) REFERENCES inventario(id),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id),
	FOREIGN KEY (id_empleado) REFERENCES empleado(id)
);

CREATE TABLE pago (
	id int PRIMARY KEY,
	id_cliente int,
	id_empleado int,
	id_alquiler int,
	total decimal(5,2),
	fecha_pago datetime,
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_cliente) REFERENCES cliente(id),
	FOREIGN KEY (id_empleado) REFERENCES empleado(id),
	FOREIGN KEY (id_alquiler) REFERENCES alquiler(id)
);

CREATE TABLE categoria (
	id int PRIMARY KEY,
	nombre varchar(25),
	ultima_actualizacion timestamp
);

CREATE TABLE actor (
	id int PRIMARY KEY,
	nombre varchar(45),
	apellidos varchar(45),
	ultima_actualizacion timestamp
);

CREATE TABLE pelicula_categoria (
	id_pelicula int,	
	id_categoria int,
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_pelicula) REFERENCES pelicula(id),
	FOREIGN KEY (id_categoria) REFERENCES categoria(id),
	PRIMARY KEY (id_pelicula, id_categoria)
);

CREATE TABLE pelicula_actor (
	id_actor int,
	id_pelicula int,
	ultima_actualizacion timestamp,
	FOREIGN KEY (id_actor) REFERENCES actor(id),
	FOREIGN KEY (id_pelicula) REFERENCES pelicula(id),
	PRIMARY KEY (id_actor, id_pelicula)
);

CREATE TABLE film_text (
	id int PRIMARY KEY,
	title varchar(255),
	descripcion text
);
