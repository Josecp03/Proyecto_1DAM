-- DELETE FROM AUDITA_PERSONAS;
-- DELETE FROM AUDITA_CANCIONES;

-- PRUEBAS TABLA PERSONAS
INSERT INTO PERSONAS VALUES ('000023PE', 'Jos�', 'Corrochano Pardo', '28-04-2003', SYSDATE, 'Artista'); -- Prueba de Inserci�n
UPDATE PERSONAS SET APELLIDOS = 'Mart�nez' where identificador = '000023PE'; -- Prueba de Modificaci�n de los apellidos
UPDATE PERSONAS SET NOMBRE = 'Pepe' where identificador = '000023PE'; -- Prueba de Modificaci�n del nombre
UPDATE PERSONAS SET FECHANACIMIENTO = '26-04-2003' where identificador = '000023PE'; -- Prueba de Modificaci�n de la fecha de nacimiento
UPDATE PERSONAS SET FECHAINICIO = '26-04-1999' where identificador = '000023PE'; -- Prueba de Modificaci�n de la fecha de inicio
DELETE FROM PERSONAS WHERE identificador = '000023PE'; -- Prueba de borrado

-- PRUEBAS TABLA CANCIONES
INSERT INTO CANCIONES VALUES ('000016CA', 'Polaris Remix', '12-04-2020', 190, 10000000, '000003DI'); -- Prueba de Inserci�n
UPDATE CANCIONES SET TITULO = 'Supernova' where identificador = '000016CA'; -- Prueba de Modificaci�n del t�tulo
UPDATE CANCIONES SET FECHALANZAMIENTO = '12-06-2021' where identificador = '000016CA'; -- Prueba de Modificaci�n de la fecha de lanzamiento
UPDATE CANCIONES SET DURACION = 200 where identificador = '000016CA'; -- Prueba de Modificaci�n de la duraci�n
UPDATE CANCIONES SET REPRODUCCIONES = 15000000 where identificador = '000016CA'; -- Prueba de Modificaci�n de las reproducciones
UPDATE CANCIONES SET IDENTIFICADORDISCO = '000010DI' where identificador = '000016CA'; -- Prueba de Modificaci�n del identificador del disco
DELETE FROM CANCIONES WHERE identificador = '000016CA'; -- Prueba de borrado

-- PRUEBA PARA EL TRIGGER DEL M�NIMO DE OYENTES EN LOS ARTISTAS
UPDATE ARTISTAS SET OYENTES = -1 WHERE IDENTIFICADOR = '000001PE';

-- PRUEBA PARA EL TRIGGER DEL M�NIMO DE REPRODUCCIONES EN LAS CANCIONES
UPDATE CANCIONES SET REPRODUCCIONES = -1 WHERE IDENTIFICADOR = '000001CA';
UPDATE CANCIONES SET DURACION = -1 WHERE IDENTIFICADOR = '000001CA';

-- PRUEBA PARA EL TRIGGER DEL M�NIMO DE DURACI�N EN LOS CONCIERTOS
UPDATE CONCIERTOS SET DURACION = -1 WHERE IDENTIFICADOR = '000001CO';

-- LLAMADA AL PROCEDMIENTO PARA LISTRAR LAS CANCIONES DE LOS ARTISTAS DADO UN REPRESENTANTE
DECLARE
    v_representante representantes.identificador%type := '000002PE';
BEGIN
    mostrar_canciones_discos(v_representante);
END;
/