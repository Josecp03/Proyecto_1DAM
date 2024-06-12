-- DELETE FROM AUDITA_PERSONAS;
-- DELETE FROM AUDITA_CANCIONES;


-- PRUEBAS TABLA PERSONAS
INSERT INTO PERSONAS VALUES ('000023PE', 'José', 'Corrochano Pardo', '28-04-2003', SYSDATE, 'Artista'); -- Prueba de Inserción
UPDATE PERSONAS SET APELLIDOS = 'Martínez' where identificador = '000023PE'; -- Prueba de Modificación de los apellidos
UPDATE PERSONAS SET NOMBRE = 'Pepe' where identificador = '000023PE'; -- Prueba de Modificación del nombre
UPDATE PERSONAS SET FECHANACIMIENTO = '26-04-2003' where identificador = '000023PE'; -- Prueba de Modificación de la fecha de nacimiento
UPDATE PERSONAS SET FECHAINICIO = '26-04-1999' where identificador = '000023PE'; -- Prueba de Modificación de la fecha de inicio
DELETE FROM PERSONAS WHERE identificador = '000023PE'; -- Prueba de borrado

-- PRUEBAS TABLA CANCIONES
INSERT INTO CANCIONES VALUES ('000016CA', 'Polaris Remix', '12-04-2020', 190, 10000000, '000003DI'); -- Prueba de Inserción
UPDATE CANCIONES SET TITULO = 'Supernova' where identificador = '000016CA'; -- Prueba de Modificación del título
UPDATE CANCIONES SET FECHALANZAMIENTO = '12-06-2021' where identificador = '000016CA'; -- Prueba de Modificación de la fecha de lanzamiento
UPDATE CANCIONES SET DURACION = 200 where identificador = '000016CA'; -- Prueba de Modificación de la duración
UPDATE CANCIONES SET REPRODUCCIONES = 15000000 where identificador = '000016CA'; -- Prueba de Modificación de las reproducciones
UPDATE CANCIONES SET IDENTIFICADORDISCO = '000010DI' where identificador = '000016CA'; -- Prueba de Modificación del identificador del disco
DELETE FROM CANCIONES WHERE identificador = '000016CA'; -- Prueba de borrado

