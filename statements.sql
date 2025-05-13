/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
edad INT 
);
-- PASO 2
-- Tu código aquí
CREATE TABLE roles (
id_rol INT PRIMARY KEY AUTO_INCREMENT,
nombre_rol VARCHAR(50) NOT NULL
)

-- PASO 3
-- Tu código aquí
ALTER TABLE usuarios ADD id_rol INT NOT NULL;
UPDATE `sql2`.`usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '1');
UPDATE `sql2`.`usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '2');
UPDATE `sql2`.`usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '3');
UPDATE `sql2`.`usuarios` SET `id_rol` = '3' WHERE (`id_usuario` = '4');
UPDATE `sql2`.`usuarios` SET `id_rol` = '4' WHERE (`id_usuario` = '5');
UPDATE `sql2`.`usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '6');
UPDATE `sql2`.`usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '7');
UPDATE `sql2`.`usuarios` SET `id_rol` = '3' WHERE (`id_usuario` = '8');
UPDATE `sql2`.`usuarios` SET `id_rol` = '3' WHERE (`id_usuario` = '9');
UPDATE `sql2`.`usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '10');
UPDATE `sql2`.`usuarios` SET `id_rol` = '4' WHERE (`id_usuario` = '11');
UPDATE `sql2`.`usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '12');
UPDATE `sql2`.`usuarios` SET `id_rol` = '3' WHERE (`id_usuario` = '13');
UPDATE `sql2`.`usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '14');
UPDATE `sql2`.`usuarios` SET `id_rol` = '4' WHERE (`id_usuario` = '15');
UPDATE `sql2`.`usuarios` SET `id_rol` = '1' WHERE (`id_usuario` = '16');
UPDATE `sql2`.`usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '17');
UPDATE `sql2`.`usuarios` SET `id_rol` = '3' WHERE (`id_usuario` = '18');
UPDATE `sql2`.`usuarios` SET `id_rol` = '4' WHERE (`id_usuario` = '19');
UPDATE `sql2`.`usuarios` SET `id_rol` = '2' WHERE (`id_usuario` = '20');

-- PASO 4
-- Tu código aquí

SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol FROM
usuarios JOIN roles ON usuarios.id_rol = roles.id_rol;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias (
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nombre_categoria VARCHAR(100) NOT NULL
)

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD id_categoria INT NOT NULL;

-- PASO 3
-- Tu código aquí-- Asignar categorías a usuarios específicos
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (2, 6, 10, 14, 18);
UPDATE usuarios SET id_categoria = 3 WHERE id_usuario IN (3, 7, 11, 15, 19);
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario IN (4, 8, 12, 16, 20);

-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios 
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria
JOIN roles ON usuarios.id_rol = roles.id_rol;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
	id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT
);

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10),

-- PASO 3
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM 
usuarios JOIN usuarios_categorias 
ON usuarios.id_usuario = usuarios_categorias.id_usuario
JOIN categorias
ON categorias.id_categoria = usuarios.id_categoria
JOIN roles
ON usuarios.id_rol = roles.id_rol;
