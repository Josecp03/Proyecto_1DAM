-- Borrado de Tablas
DROP TABLE PERSONAS CASCADE CONSTRAINTS;
DROP TABLE REPRESENTANTES CASCADE CONSTRAINTS;
DROP TABLE ARTISTAS CASCADE CONSTRAINTS;
DROP TABLE PRODUCTORES CASCADE CONSTRAINTS;
DROP TABLE GENEROS CASCADE CONSTRAINTS;
DROP TABLE DISCOS CASCADE CONSTRAINTS;
DROP TABLE CANCIONES CASCADE CONSTRAINTS;
DROP TABLE PREMIOS CASCADE CONSTRAINTS;
DROP TABLE REDES CASCADE CONSTRAINTS;
DROP TABLE CONCIERTOS CASCADE CONSTRAINTS;
DROP TABLE PRODUCTORES_PRODUCEN_ARTISTAS CASCADE CONSTRAINTS;
DROP TABLE PRODUCTORES_PRODUCEN_CANCIONES CASCADE CONSTRAINTS;
DROP TABLE ARTISTAS_CANTAN_CANCIONES CASCADE CONSTRAINTS;
DROP TABLE ARTISTAS_INTERPRETAN_GENEROS CASCADE CONSTRAINTS;
DROP TABLE ARTISTAS_REALIZAN_CONCIERTOS CASCADE CONSTRAINTS;
DROP TABLE AUDITA_PERSONAS CASCADE CONSTRAINTS;
DROP TABLE AUDITA_CANCIONES CASCADE CONSTRAINTS;


-- Tabla PERSONAS
CREATE TABLE PERSONAS (
    identificador VARCHAR2(50),
    nombre VARCHAR2(100) NOT NULL,
    apellidos VARCHAR2(100) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    fechaInicio DATE NOT NULL,
    tipo VARCHAR2(100) NOT NULL,
    CONSTRAINT per_ide_PK PRIMARY KEY (identificador),
    CONSTRAINT per_tip_CK CHECK (tipo IN ('Representante', 'Artista', 'Productor'))
);

-- Tabla REPRESENTANTES
CREATE TABLE REPRESENTANTES (
    identificador VARCHAR2(50),
    nacionalidad VARCHAR2(100) NOT NULL,
    telefono VARCHAR2(100) NOT NULL,
    correoElectronico VARCHAR2(100) NOT NULL,
    CONSTRAINT rep_ide_PK PRIMARY KEY (identificador),
    CONSTRAINT rep_ide_FK FOREIGN KEY (identificador) REFERENCES PERSONAS ON DELETE CASCADE
);

-- Tabla ARTISTAS
CREATE TABLE ARTISTAS (
    identificador VARCHAR2(50),
    nombreArtistico VARCHAR2(100) NOT NULL,
    pais VARCHAR2(100) NOT NULL,
    ciudad VARCHAR2(100) NOT NULL,
    oyentes NUMBER(10) NOT NULL,
    estado VARCHAR2(100) NOT NULL,
    identificadorRepresentante VARCHAR2(50) NOT NULL,
    CONSTRAINT art_ide_PK PRIMARY KEY (identificador),
    CONSTRAINT art_ide_FK FOREIGN KEY (identificador) REFERENCES PERSONAS ON DELETE CASCADE,
    CONSTRAINT art_idr_FK FOREIGN KEY (identificadorRepresentante) REFERENCES REPRESENTANTES ON DELETE CASCADE,
    CONSTRAINT art_est_CK CHECK (estado IN ('Activo', 'Retirado', 'Fallecido'))
);

-- Tabla PRODUCTORES
CREATE TABLE PRODUCTORES (
    identificador VARCHAR2(50),
    nacionalidad VARCHAR2(100) NOT NULL,
    telefono VARCHAR2(100) NOT NULL,
    correoElectronico VARCHAR2(100) NOT NULL,
    CONSTRAINT pro_ide_PK PRIMARY KEY (identificador),
    CONSTRAINT pro_ide_FK FOREIGN KEY (identificador) REFERENCES PERSONAS ON DELETE CASCADE
);

--Tabla GENEROS
CREATE TABLE GENEROS (
    identificador VARCHAR2(50),
    nombre VARCHAR2(100) NOT NULL,
    paisOrigen VARCHAR2(100) NOT NULL,
    CONSTRAINT gen_ide_PK PRIMARY KEY (identificador)
);

-- Tabla DISCOS
CREATE TABLE DISCOS (
    identificador VARCHAR2(50),
    titulo VARCHAR2(100) NOT NULL,
    fechaLanzamiento DATE NOT NULL,
    duracion NUMBER(8) NOT NULL,
    reproducciones NUMBER(20) NOT NULL,
    CONSTRAINT dis_ide_PK PRIMARY KEY (identificador)
);

-- Tabla CANCIONES
CREATE TABLE CANCIONES (
    identificador VARCHAR2(50),
    titulo VARCHAR2(100) NOT NULL,
    fechaLanzamiento DATE NOT NULL,
    duracion NUMBER(8) NOT NULL,
    reproducciones NUMBER(20) NOT NULL,
    identificadorDisco VARCHAR2(50) NOT NULL,
    CONSTRAINT can_ide_PK PRIMARY KEY (identificador),
    CONSTRAINT can_ide_FK FOREIGN KEY (identificadorDisco) REFERENCES DISCOS ON DELETE CASCADE
);

-- Tabla PREMIOS
CREATE TABLE PREMIOS ( 
    identificador VARCHAR2(50),
    nombre VARCHAR2(100) NOT NULL,
    fechaEntrega DATE NOT NULL,
    organizacion VARCHAR2(100) NOT NULL,
    identificadorArtista VARCHAR2(50) NOT NULL,
    CONSTRAINT pre_ide_PK PRIMARY KEY (identificador),
    CONSTRAINT pre_ide_FK FOREIGN KEY (identificadorArtista) REFERENCES ARTISTAS ON DELETE CASCADE
);

-- Tabla REDES
CREATE TABLE REDES ( 
    identificador VARCHAR2(50),
    nombre VARCHAR2(100) NOT NULL,
    enlace VARCHAR2(100) NOT NULL,
    seguidores NUMBER(10) NOT NULL,
    identificadorArtista VARCHAR2(50) NOT NULL,
    CONSTRAINT red_ide_PK PRIMARY KEY (identificador),
    CONSTRAINT red_ide_FK FOREIGN KEY (identificadorArtista) REFERENCES ARTISTAS ON DELETE CASCADE
);

-- Tabla CONCIERTOS
CREATE TABLE CONCIERTOS ( 
    identificador VARCHAR2(50),
    titulo VARCHAR2(100) NOT NULL,
    fecha DATE NOT NULL,
    pais VARCHAR2(100) NOT NULL,
    ciudad VARCHAR2(100) NOT NULL,
    duracion NUMBER(8) NOT NULL,
    aforo NUMBER(8) NOT NULL,
    identificadorArtistaPrincipal VARCHAR2(50) NOT NULL,
    CONSTRAINT con_ide_PK PRIMARY KEY (identificador),
    CONSTRAINT con_ide_FK FOREIGN KEY (identificadorArtistaPrincipal) REFERENCES ARTISTAS ON DELETE CASCADE
);

-- Tabla PRODUCTORES_PRODUCEN_ARTISTAS
CREATE TABLE PRODUCTORES_PRODUCEN_ARTISTAS (
    identificadorProductor VARCHAR2(50),
    identificadorArtista VARCHAR2(50),
    CONSTRAINT ppa_PK PRIMARY KEY (identificadorProductor, identificadorArtista),
    CONSTRAINT ppa_idp_FK FOREIGN KEY (identificadorProductor) REFERENCES PRODUCTORES ON DELETE CASCADE,
    CONSTRAINT ppa_ida_FK FOREIGN KEY (identificadorArtista) REFERENCES ARTISTAS ON DELETE CASCADE
);

-- Tabla PRODUCTORES_PRODUCEN_CANCIONES
CREATE TABLE PRODUCTORES_PRODUCEN_CANCIONES (
    identificadorProductor VARCHAR2(50),
    identificadorCancion VARCHAR2(50),
    CONSTRAINT ppc_PK PRIMARY KEY (identificadorProductor, identificadorCancion),
    CONSTRAINT ppc_idp_FK FOREIGN KEY (identificadorProductor) REFERENCES PRODUCTORES ON DELETE CASCADE,
    CONSTRAINT ppc_idc_FK FOREIGN KEY (identificadorCancion) REFERENCES CANCIONES ON DELETE CASCADE
);

-- Tabla ARTISTAS_CANTAN_CANCIONES
CREATE TABLE ARTISTAS_CANTAN_CANCIONES (
    identificadorArtista VARCHAR2(50),
    identificadorCancion VARCHAR2(50),
    CONSTRAINT acc_PK PRIMARY KEY (identificadorArtista, identificadorCancion),
    CONSTRAINT acc_ida_FK FOREIGN KEY (identificadorArtista) REFERENCES ARTISTAS ON DELETE CASCADE,
    CONSTRAINT acc_idc_FK FOREIGN KEY (identificadorCancion) REFERENCES CANCIONES ON DELETE CASCADE
);

-- Tabla ARTISTAS_INTERPRETAN_GENEROS
CREATE TABLE ARTISTAS_INTERPRETAN_GENEROS (
    identificadorArtista VARCHAR2(50),
    identificadorGenero VARCHAR2(50),
    CONSTRAINT aig_PK PRIMARY KEY (identificadorArtista, identificadorGenero),
    CONSTRAINT aig_ida_FK FOREIGN KEY (identificadorArtista) REFERENCES ARTISTAS ON DELETE CASCADE,
    CONSTRAINT aig_idg_FK FOREIGN KEY (identificadorGenero) REFERENCES GENEROS ON DELETE CASCADE
);

-- Tabla ARTISTAS_REALIZAN_CONCIERTOS
CREATE TABLE ARTISTAS_REALIZAN_CONCIERTOS (
    identificadorArtista VARCHAR2(50),
    identificadorConcierto VARCHAR2(50),
    CONSTRAINT arc_PK PRIMARY KEY (identificadorArtista, identificadorConcierto),
    CONSTRAINT arc_ida_FK FOREIGN KEY (identificadorArtista) REFERENCES ARTISTAS ON DELETE CASCADE,
    CONSTRAINT arc_idc_FK FOREIGN KEY (identificadorConcierto) REFERENCES CONCIERTOS ON DELETE CASCADE
);

-- Cambiar el formato de las fechas
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY'; 

-- INSERCIONES en PERSONAS
INSERT INTO PERSONAS VALUES ('000001PE', 'Miguel', 'Cantos Gómez', '25-05-2002', '31-07-2020', 'Artista');
INSERT INTO PERSONAS VALUES ('000002PE', 'Laura', 'González Pérez', '14-03-1995', '01-01-2019', 'Representante');
INSERT INTO PERSONAS VALUES ('000003PE', 'Juan', 'Martínez López', '20-09-1988', '15-06-2015', 'Productor');
INSERT INTO PERSONAS VALUES ('000004PE', 'Carlos', 'Santana Rodríguez', '10-12-1992', '01-09-2021', 'Artista');
INSERT INTO PERSONAS VALUES ('000005PE', 'María', 'Hernández Ruiz', '05-02-1990', '10-11-2016', 'Productor');
INSERT INTO PERSONAS VALUES ('000006PE', 'Luis', 'Fernández García', '30-07-1998', '25-03-2022', 'Artista');
INSERT INTO PERSONAS VALUES ('000007PE', 'Isabel', 'Martínez González', '12-07-1993', '20-02-2018', 'Representante');
INSERT INTO PERSONAS VALUES ('000008PE', 'Pedro', 'Ramírez Ortiz', '09-11-1985', '01-08-2010', 'Productor');
INSERT INTO PERSONAS VALUES ('000009PE', 'Ana', 'Sánchez López', '15-05-1997', '10-04-2021', 'Artista');
INSERT INTO PERSONAS VALUES ('000010PE', 'Roberto', 'García Fernández', '21-03-2000', '30-09-2022', 'Artista');
INSERT INTO PERSONAS VALUES ('000011PE', 'Claudia', 'Pérez Romero', '11-04-1996', '22-05-2019', 'Representante');
INSERT INTO PERSONAS VALUES ('000012PE', 'Diego', 'López Martínez', '28-12-1980', '10-01-2008', 'Productor');
INSERT INTO PERSONAS VALUES ('000013PE', 'Elena', 'García Sánchez', '19-02-2001', '18-09-2020', 'Artista');
INSERT INTO PERSONAS VALUES ('000014PE', 'Fernando', 'Hernández Torres', '05-06-1992', '01-02-2017', 'Artista');
INSERT INTO PERSONAS VALUES ('000015PE', 'Sara', 'Rodríguez García', '03-09-1994', '18-07-2018', 'Representante');
INSERT INTO PERSONAS VALUES ('000016PE', 'Mario', 'Díaz Pérez', '08-11-1987', '05-03-2011', 'Productor');
INSERT INTO PERSONAS VALUES ('000017PE', 'Laura', 'Martín Sánchez', '25-12-2000', '14-09-2020', 'Artista');
INSERT INTO PERSONAS VALUES ('000018PE', 'Pablo', 'Gómez Martínez', '19-07-1991', '22-04-2016', 'Artista');
INSERT INTO PERSONAS VALUES ('000019PE', 'Diego', 'Martínez López', '07-03-1998', '28-09-2021', 'Representante');
INSERT INTO PERSONAS VALUES ('000020PE', 'Elena', 'Gómez Rodríguez', '15-08-1989', '12-04-2015', 'Productor');
INSERT INTO PERSONAS VALUES ('000021PE', 'Alejandro', 'Fernández García', '29-11-1993', '03-07-2019', 'Artista');
INSERT INTO PERSONAS VALUES ('000022PE', 'Sofía', 'Hernández Martín', '12-06-1996', '19-10-2020', 'Artista');

-- INSERCIONES en REPRESENTANTES
INSERT INTO REPRESENTANTES VALUES ('000002PE', 'España', '654321987', 'laura.gonzalez@mail.com');
INSERT INTO REPRESENTANTES VALUES ('000007PE', 'México', '789456123', 'isabel.martinez@mail.com');
INSERT INTO REPRESENTANTES VALUES ('000011PE', 'Chile', '987123654', 'claudia.perez@mail.com');
INSERT INTO REPRESENTANTES VALUES ('000015PE', 'España', '654987321', 'sara.rodriguez@mail.com');
INSERT INTO REPRESENTANTES VALUES ('000019PE', 'México', '123789456', 'diego.martinez@mail.com');

-- INSERCIONES en ARTISTAS
INSERT INTO ARTISTAS VALUES ('000001PE', 'MC Gomez', 'España', 'Madrid', 1500000, 'Activo', '000002PE');
INSERT INTO ARTISTAS VALUES ('000004PE', 'Carlos Santana', 'Puerto Rico', 'San Juan', 2300000, 'Activo', '000002PE');
INSERT INTO ARTISTAS VALUES ('000006PE', 'Luigi', 'España', 'Barcelona', 500000, 'Activo', '000002PE');
INSERT INTO ARTISTAS VALUES ('000009PE', 'Ana S', 'México', 'Ciudad de México', 1200000, 'Activo', '000007PE');
INSERT INTO ARTISTAS VALUES ('000010PE', 'Robo G', 'España', 'Valencia', 800000, 'Activo', '000007PE');
INSERT INTO ARTISTAS VALUES ('000013PE', 'Elena G', 'Argentina', 'Buenos Aires', 2000000, 'Activo', '000011PE');
INSERT INTO ARTISTAS VALUES ('000014PE', 'Fernando H', 'México', 'Guadalajara', 900000, 'Activo', '000011PE');
INSERT INTO ARTISTAS VALUES ('000017PE', 'Laura M', 'España', 'Madrid', 1800000, 'Activo', '000015PE');
INSERT INTO ARTISTAS VALUES ('000018PE', 'Pablo G', 'Argentina', 'Buenos Aires', 850000, 'Activo', '000015PE');
INSERT INTO ARTISTAS VALUES ('000021PE', 'Alex F', 'España', 'Barcelona', 1600000, 'Activo', '000019PE');
INSERT INTO ARTISTAS VALUES ('000022PE', 'Sofy H', 'Argentina', 'Buenos Aires', 700000, 'Activo', '000019PE');

-- INSERCIONES en PRODUCTORES
INSERT INTO PRODUCTORES VALUES ('000003PE', 'España', '987654321', 'juan.martinez@mail.com');
INSERT INTO PRODUCTORES VALUES ('000005PE', 'Puerto Rico', '123456789', 'maria.hernandez@mail.com');
INSERT INTO PRODUCTORES VALUES ('000008PE', 'Colombia', '321654987', 'pedro.ramirez@mail.com');
INSERT INTO PRODUCTORES VALUES ('000012PE', 'Brasil', '456789123', 'diego.lopez@mail.com');
INSERT INTO PRODUCTORES VALUES ('000016PE', 'Chile', '789654123', 'mario.diaz@mail.com');
INSERT INTO PRODUCTORES VALUES ('000020PE', 'Colombia', '789321654', 'elena.gomez@mail.com');

-- INSERCIONES en GENEROS
INSERT INTO GENEROS VALUES ('000001GE', 'Reggaeton', 'Puerto Rico');
INSERT INTO GENEROS VALUES ('000002GE', 'Trap', 'España');
INSERT INTO GENEROS VALUES ('000003GE', 'Hip-Hop', 'Estados Unidos');
INSERT INTO GENEROS VALUES ('000004GE', 'Pop', 'Estados Unidos');
INSERT INTO GENEROS VALUES ('000005GE', 'Rock', 'Reino Unido');
INSERT INTO GENEROS VALUES ('000006GE', 'Jazz', 'Estados Unidos');
INSERT INTO GENEROS VALUES ('000007GE', 'Electrónica', 'Alemania');
INSERT INTO GENEROS VALUES ('000008GE', 'RyB', 'Estados Unidos');
INSERT INTO GENEROS VALUES ('000009GE', 'Indie', 'Reino Unido');
INSERT INTO GENEROS VALUES ('000010GE', 'Folk', 'Irlanda');
INSERT INTO GENEROS VALUES ('000011GE', 'Country', 'Estados Unidos');

-- INSERCIONES en DISCOS
INSERT INTO DISCOS VALUES ('000001DI', 'Urban Beats', '15-08-2020', 3600, 10000000);
INSERT INTO DISCOS VALUES ('000002DI', 'Rhythms of the Night', '10-12-2022', 4200, 8000000);
INSERT INTO DISCOS VALUES ('000003DI', 'Pop Hits', '12-06-2021', 3800, 6000000);
INSERT INTO DISCOS VALUES ('000004DI', 'Rock Legends', '01-03-2023', 4500, 7000000);
INSERT INTO DISCOS VALUES ('000005DI', 'Jazz Classics', '22-10-2021', 3900, 8000000);
INSERT INTO DISCOS VALUES ('000006DI', 'Electro Beats', '14-04-2022', 4300, 9500000);
INSERT INTO DISCOS VALUES ('000007DI', 'RyB Soul', '28-05-2022', 4000, 7000000);
INSERT INTO DISCOS VALUES ('000008DI', 'Indie Vibes', '10-09-2023', 4100, 6000000);
INSERT INTO DISCOS VALUES ('000009DI', 'Folk Tales', '05-11-2023', 3800, 7500000);
INSERT INTO DISCOS VALUES ('000010DI', 'Country Road', '15-03-2024', 4200, 6800000);

-- INSERCIONES en CANCIONES
INSERT INTO CANCIONES VALUES ('000001CA', 'Summer Vibes', '15-08-2020', 240, 5000000, '000001DI');
INSERT INTO CANCIONES VALUES ('000002CA', 'Night Moves', '10-12-2022', 300, 3000000, '000002DI');
INSERT INTO CANCIONES VALUES ('000003CA', 'Baila Conmigo', '15-08-2020', 180, 2000000, '000001DI');
INSERT INTO CANCIONES VALUES ('000004CA', 'Love Song', '12-06-2021', 210, 3500000, '000003DI');
INSERT INTO CANCIONES VALUES ('000005CA', 'Rock Anthem', '01-03-2023', 320, 4500000, '000004DI');
INSERT INTO CANCIONES VALUES ('000006CA', 'Dance with Me', '12-06-2021', 200, 3000000, '000003DI');
INSERT INTO CANCIONES VALUES ('000007CA', 'Smooth Jazz', '22-10-2021', 220, 4000000, '000005DI');
INSERT INTO CANCIONES VALUES ('000008CA', 'Electro Wave', '14-04-2022', 310, 5000000, '000006DI');
INSERT INTO CANCIONES VALUES ('000009CA', 'Jazz Night', '22-10-2021', 240, 4500000, '000005DI');
INSERT INTO CANCIONES VALUES ('000010CA', 'Soulful RyB', '28-05-2022', 230, 3800000, '000007DI');
INSERT INTO CANCIONES VALUES ('000011CA', 'Indie Groove', '10-09-2023', 280, 4200000, '000008DI');
INSERT INTO CANCIONES VALUES ('000012CA', 'RyB Jam', '28-05-2022', 250, 3500000, '000007DI');
INSERT INTO CANCIONES VALUES ('000013CA', 'Irish Ballad', '05-11-2023', 240, 4200000, '000009DI');
INSERT INTO CANCIONES VALUES ('000014CA', 'Country Sunset', '15-03-2024', 280, 4800000, '000010DI');
INSERT INTO CANCIONES VALUES ('000015CA', 'Folk Story', '05-11-2023', 220, 3900000, '000009DI');

-- INSERCIONES en PREMIOS
INSERT INTO PREMIOS VALUES ('000001PR', 'Best New Artist', '20-11-2021', 'Urban Music Awards', '000001PE');
INSERT INTO PREMIOS VALUES ('000002PR', 'Song of the Year', '25-12-2022', 'Global Music Awards', '000004PE');
INSERT INTO PREMIOS VALUES ('000003PR', 'Best Pop Song', '05-11-2021', 'Music Awards', '000009PE');
INSERT INTO PREMIOS VALUES ('000004PR', 'Best Rock Performance', '20-12-2023', 'Rock Awards', '000010PE');
INSERT INTO PREMIOS VALUES ('000005PR', 'Best Jazz Album', '30-11-2021', 'Jazz Awards', '000013PE');
INSERT INTO PREMIOS VALUES ('000006PR', 'Best Electronic Song', '15-05-2022', 'Electronic Music Awards', '000014PE');
INSERT INTO PREMIOS VALUES ('000007PR', 'Best RyB Album', '15-12-2022', 'Soul Music Awards', '000017PE');
INSERT INTO PREMIOS VALUES ('000008PR', 'Best Indie Song', '20-05-2023', 'Indie Music Awards', '000018PE');
INSERT INTO PREMIOS VALUES ('000009PR', 'Best Folk Album', '10-12-2023', 'Folk Music Awards', '000021PE');
INSERT INTO PREMIOS VALUES ('000010PR', 'Best Country Song', '25-04-2024', 'Country Music Awards', '000022PE');

-- INSERCIONES en REDES
INSERT INTO REDES VALUES ('000001RE', 'Instagram', 'https://instagram.com/mcgomez', 300000, '000001PE');
INSERT INTO REDES VALUES ('000002RE', 'Twitter', 'https://twitter.com/luigi', 150000, '000006PE');
INSERT INTO REDES VALUES ('000003RE', 'Facebook', 'https://facebook.com/anas', 200000, '000009PE');
INSERT INTO REDES VALUES ('000004RE', 'YouTube', 'https://youtube.com/robog', 400000, '000010PE');
INSERT INTO REDES VALUES ('000005RE', 'Instagram', 'https://instagram.com/elenag', 250000, '000013PE');
INSERT INTO REDES VALUES ('000006RE', 'Facebook', 'https://facebook.com/fernandoh', 300000, '000014PE');
INSERT INTO REDES VALUES ('000007RE', 'TikTok', 'https://tiktok.com/lauram', 200000, '000017PE');
INSERT INTO REDES VALUES ('000008RE', 'Snapchat', 'https://snapchat.com/pablog', 100000, '000018PE');
INSERT INTO REDES VALUES ('000009RE', 'LinkedIn', 'https://linkedin.com/alexfernandez', 180000, '000021PE');
INSERT INTO REDES VALUES ('000010RE', 'Tumblr', 'https://tumblr.com/sofyh', 120000, '000022PE');

-- INSERCIONES en CONCIERTOS
INSERT INTO CONCIERTOS VALUES ('000001CO', 'Summer Fest', '30-07-2023', 'España', 'Barcelona', 120, 20000, '000001PE');
INSERT INTO CONCIERTOS VALUES ('000002CO', 'Urban Night', '15-09-2023', 'Puerto Rico', 'San Juan', 150, 25000, '000004PE');
INSERT INTO CONCIERTOS VALUES ('000003CO', 'Pop Fiesta', '15-08-2023', 'México', 'Guadalajara', 140, 22000, '000009PE');
INSERT INTO CONCIERTOS VALUES ('000004CO', 'Rock Night', '20-09-2023', 'España', 'Valencia', 160, 27000, '000010PE');
INSERT INTO CONCIERTOS VALUES ('000005CO', 'Jazz Fest', '22-10-2023', 'Argentina', 'Buenos Aires', 130, 18000, '000013PE');
INSERT INTO CONCIERTOS VALUES ('000006CO', 'Electro Night', '14-08-2023', 'México', 'Guadalajara', 170, 23000, '000014PE');
INSERT INTO CONCIERTOS VALUES ('000007CO', 'RyB Night', '28-05-2024', 'España', 'Barcelona', 150, 25000, '000017PE');
INSERT INTO CONCIERTOS VALUES ('000008CO', 'Indie Fest', '10-09-2024', 'Argentina', 'Buenos Aires', 200, 30000, '000018PE');
INSERT INTO CONCIERTOS VALUES ('000009CO', 'Folk Fest', '05-11-2024', 'España', 'Barcelona', 170, 22000, '000021PE');
INSERT INTO CONCIERTOS VALUES ('000010CO', 'Country Night', '15-03-2025', 'Argentina', 'Buenos Aires', 220, 27000, '000022PE');

-- INSERCIONES en PRODUCTORES_PRODUCEN_ARTISTAS
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000003PE', '000001PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000005PE', '000004PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000008PE', '000009PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000008PE', '000010PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000012PE', '000013PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000012PE', '000014PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000016PE', '000017PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000016PE', '000018PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000020PE', '000021PE');
INSERT INTO PRODUCTORES_PRODUCEN_ARTISTAS VALUES ('000020PE', '000022PE');

-- INSERCIONES en PRODUCTORES_PRODUCEN_CANCIONES
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000003PE', '000001CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000005PE', '000002CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000008PE', '000004CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000008PE', '000005CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000012PE', '000007CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000012PE', '000008CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000016PE', '000010CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000016PE', '000011CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000020PE', '000013CA');
INSERT INTO PRODUCTORES_PRODUCEN_CANCIONES VALUES ('000020PE', '000014CA');

-- INSERCIONES en ARTISTAS_CANTAN_CANCIONES
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000001PE', '000001CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000004PE', '000002CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000001PE', '000003CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000009PE', '000004CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000010PE', '000005CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000009PE', '000006CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000013PE', '000007CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000014PE', '000008CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000013PE', '000009CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000017PE', '000010CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000018PE', '000011CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000017PE', '000012CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000021PE', '000013CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000022PE', '000014CA');
INSERT INTO ARTISTAS_CANTAN_CANCIONES VALUES ('000021PE', '000015CA');

-- INSERCIONES en ARTISTAS_INTERPRETAN_GENEROS
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000001PE', '000001GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000004PE', '000002GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000006PE', '000003GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000009PE', '000004GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000010PE', '000005GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000013PE', '000006GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000014PE', '000007GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000017PE', '000008GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000018PE', '000009GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000021PE', '000010GE');
INSERT INTO ARTISTAS_INTERPRETAN_GENEROS VALUES ('000022PE', '000011GE');

-- INSERCIONES en ARTISTAS_REALIZAN_CONCIERTOS
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000001PE', '000001CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000004PE', '000002CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000009PE', '000003CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000010PE', '000004CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000013PE', '000005CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000014PE', '000006CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000017PE', '000007CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000018PE', '000008CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000021PE', '000009CO');
INSERT INTO ARTISTAS_REALIZAN_CONCIERTOS VALUES ('000022PE', '000010CO');

-- AUDITA PERSONAS
CREATE TABLE AUDITA_PERSONAS (
    mensaje VARCHAR2(500)
);

CREATE OR REPLACE TRIGGER AUDITA_PERSONAS BEFORE INSERT OR UPDATE OR DELETE ON PERSONAS FOR EACH ROW
DECLARE
    v_mensaje varchar2(500);
BEGIN
    v_mensaje := 'FECHA: ' || sysdate || ' HORA:' || to_char(sysdate,'HH:MM:SS' || ' ');

    if inserting then -- En caso de inserción
        v_mensaje := v_mensaje || 'OPERACIÓN: INSERCIÓN || ' || 'ID: ' || :new.identificador || ', APELLIDO: ' || :new.apellidos || ', NOMBRE: ' || :new.nombre || ', FECHA NACIMIENTO: ' || :new.fechanacimiento || ', FECHA INICIO: ' || :new.fechainicio;
    end if;

    if deleting then -- En caso de borrado
        v_mensaje := v_mensaje || 'OPERACIÓN: BORRADO || ' || 'ID: ' || :old.identificador || ', APELLIDO: ' || :old.apellidos || ', NOMBRE: ' || :old.nombre || ', FECHA NACIMIENTO: ' || :old.fechanacimiento || ', FECHA INICIO: ' || :old.fechainicio;
    end if;

    if updating('apellidos') then -- En caso de actualizar el apellido
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'APELLIDO ANTERIOR: '  || :old.apellidos || ', APELLIDO NUEVO: ' || :new.apellidos;
    end if;
    
    if updating('nombre') then -- En caso de actualizar el nombre
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'NOMBRE ANTERIOR: ' || :old.nombre || ', NOMBRE NUEVO: ' || :new.nombre;
    end if;
    
    if updating('fechanacimiento') then -- En caso de actualizar la fecha de nacimiento
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'FECHA DE NACIMIENTO ANTERIOR: ' || :old.fechanacimiento || ', FECHA DE NACIEMIENTO NUEVA: ' || :new.fechanacimiento;
    end if;
    
    if updating('fechainicio') then -- En caso de actualizar la fecha de inicio
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'FECHA DE INICIO ANTERIOR: ' || :old.fechainicio || ', FECHA DE INICIO NUEVA: ' || :new.fechainicio;
    end if;
    
    insert into audita_personas values(v_mensaje); -- Realizar la inserción del mensaje a la nueva tabla
END;
/

-- AUDITA CANCIONES
CREATE TABLE AUDITA_CANCIONES (
    mensaje VARCHAR2(500)
);

CREATE OR REPLACE TRIGGER AUDITA_CANCIONES BEFORE INSERT OR UPDATE OR DELETE ON CANCIONES FOR EACH ROW
DECLARE
    v_mensaje varchar2(500);
BEGIN
    v_mensaje := 'FECHA: ' || sysdate || ' HORA:' || to_char(sysdate,'HH:MM:SS' || ' ');

    if inserting then -- En caso de inserción
        v_mensaje := v_mensaje || 'OPERACIÓN: INSERCIÓN || ' || 'ID: ' || :new.identificador || ', TÍTULO: ' || :new.titulo || ', FECHA LANZAMIENTO: ' || :new.fechalanzamiento || ', DURACIÓN: ' || :new.duracion || ', REPRODUCCIONES: ' || :new.reproducciones || ', ID DISCO: ' || :new.identificadordisco;
    end if;

    if deleting then -- En caso de borrado
            v_mensaje := v_mensaje || 'OPERACIÓN: BORRADO || ' || 'ID: ' || :old.identificador || ', TÍTULO: ' || :old.titulo || ', FECHA LANZAMIENTO: ' || :old.fechalanzamiento || ', DURACIÓN: ' || :old.duracion || ', REPRODUCCIONES: ' || :old.reproducciones || ', ID DISCO: ' || :old.identificadordisco;
    end if;

    if updating('titulo') then -- En caso de actualizar el título
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'TÍTULO ANTERIOR: '  || :old.titulo || ', TÍTULO NUEVO: ' || :new.titulo;
    end if;
    
    if updating('fechalanzamiento') then -- En caso de actualizar la fecha de lanzamiento
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'FECHA LANZAMIENTO ANTERIOR: ' || :old.fechalanzamiento || ', FECHA LANZAMIENTO NUEVO: ' || :new.fechalanzamiento;
    end if;
    
    if updating('duracion') then -- En caso de actualizar la duación
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'DURACIÓN ANTERIOR: ' || :old.duracion || ', DURACIÓN NUEVA: ' || :new.duracion;
    end if;
    
    if updating('reproducciones') then -- En caso de actualizar las reproducciones
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'REPRODUCCIONES ANTERIORES: ' || :old.reproducciones || ', REPRODUCCIONES NUEVAS: ' || :new.reproducciones;
    end if;
    
    if updating('identificadordisco') then -- En caso de actualizar el identificador del disco
        v_mensaje := v_mensaje || 'OPERACIÓN: MODIFICACIÓN || ' || 'DISCO ANTERIOR: ' || :old.identificadordisco || ', DISCO NUEVO: ' || :new.identificadordisco;
    end if;
    
    insert into audita_canciones values(v_mensaje); -- Realizar la inserción del mensaje a la nueva tabla
END;
/

-- TRIGGER PARA ESTABLECER UN MÍNIMO DE OYENTES EN LOS ARTISTAS
CREATE OR REPLACE TRIGGER OYENTES_MINIMOS BEFORE UPDATE ON ARTISTAS FOR EACH ROW
DECLARE
BEGIN
    if updating('oyentes') then
        if (:new.oyentes < 0) then
            :new.oyentes := :old.oyentes;
            raise_application_error(-20001, 'El valor de la columna no puede ser negativo.');
        end if;
    end if;
END;
/

-- TRIGGER PARA ESTABLECER MÍNIMOS EN LA TABLA CANCIONES
CREATE OR REPLACE TRIGGER MINIMOS_CANCIONES BEFORE UPDATE ON CANCIONES FOR EACH ROW
DECLARE
BEGIN
    if updating('reproducciones') then -- En caso actualizar las reproducciones
        if (:new.reproducciones < 0) then
            :new.reproducciones := :old.reproducciones;
            raise_application_error(-20001, 'El valor de la columna no puede ser negativo.');
        end if;
    end if;
    
    if updating('duracion') then -- En caso actualizar la duración
        if (:new.duracion < 0) then
            :new.duracion := :old.duracion;
            raise_application_error(-20001, 'El valor de la columna no puede ser negativo.');
        end if;
    end if;
END;
/

-- TRIGGER PARA ESTABLECER UN MÍNIMO DE DURACIÓN EN LOS CONCIERTOS
CREATE OR REPLACE TRIGGER DURACION_MINIMA_CONCIERTO BEFORE UPDATE ON CONCIERTOS FOR EACH ROW
DECLARE
BEGIN
    if updating('duracion') then
        if (:new.duracion < 0) then
            :new.duracion := :old.duracion;
            raise_application_error(-20001, 'El valor de la columna no puede ser negativo.');
        end if;
    end if;
END;
/

-- PROCEDIMIENTO PARA REALIZAR UN LISTADO DE LOS ARTISTAS QUE TIENE UN REPRESENTANTE Y LAS CANCIONES DE ESTOS
CREATE OR REPLACE PROCEDURE MOSTRAR_CANCIONES_DISCOS (p_identificador_representante artistas.identificadorrepresentante%type)
IS
    v_nombre_representante personas.nombre%type; -- Variable para el nombre del representante
    
    -- Variables para los contadores de artistas y canciones
    v_contador_artistas number(8) := 0;
    v_contador_canciones number(8) := 0;

    -- Cursor para guardar la información de los artistas
    cursor cursor_artistas is
        select *
        from artistas
        where identificadorrepresentante = p_identificador_representante;
    
    -- Cursor para guardar la información de las canciones
    cursor cursor_canciones(p_identificador_artista artistas.identificador%type) is
        select * 
        from canciones
        where identificador in (
            select identificadorcancion
            from artistas_cantan_canciones
            where identificadorartista = p_identificador_artista
        );
        
    -- Definición del tipo de registro personalizado
    type persona_artista_record is record (
        identificador personas.identificador%type,
        nombre personas.nombre%type,
        apellidos personas.apellidos%type,
        fechanacimiento personas.fechanacimiento%type,
        fechainicio personas.fechainicio%type,
        nombreArtistico artistas.nombreartistico%type,
        pais artistas.pais%type,
        ciudad artistas.ciudad%type,
        oyentes artistas.oyentes%type,
        estado artistas.estado%type
    );
    
    -- Variables para guardar la información de un artista y de una canción
    v_artista persona_artista_record;
    v_cancion canciones%rowtype;
    
BEGIN
    
    -- Consulta para seleccionar el nombre de la academia según su código
    select nombre into v_nombre_representante
    from personas
    where identificador = p_identificador_representante;
    
    dbms_output.put_line('NOMBRE DEL REPRESENTANTE: ' || v_nombre_representante);
    
    -- Primer cursor
    open cursor_artistas;
        loop
            fetch cursor_artistas into v_artista;
            exit when cursor_artistas%notfound;
            -- Si encuentra un artista, sumarlo al contador de artistas
            if cursor_artistas%found then
                v_contador_artistas := v_contador_artistas + 1;
            end if;
            dbms_output.put_line('----------------------------------------------------------------------------------------------------');
            dbms_output.put_line('PROFESOR: ' || v_profesor.nom_profesor || ' ' || v_profesor.ape_profesor);
            dbms_output.put_line('----------------------------------------------------------------------------------------------------');
            dbms_output.put_line('      NOMBRE ALUMNO           APELLIDOS ALUMNO            FECHA NACIMIENTO');
            -- Segundo Cursor
            open cursor_canciones (v_artista.identificador);
                loop
                    fetch cursor_canciones into v_cancion;
                    exit when cursor_canciones%notfound;
                    -- Si encuentra un opositor, sumarlo al contador de alumnos
                    if cursor_canciones%found then
                        v_contador_canciones := v_contador_canciones + 1;
                 end if;
                    dbms_output.put_line('      ' || 
                                         RPAD(v_artista.nombre, 24, ' ') ||
                                         RPAD(v_artista.apellidos, 30, ' ') ||
                                         v_artista.oyentes
                                        );

                end loop;
            close cursor_opositores;
        end loop;
    close cursor_profesores;
    
    dbms_output.put_line('----------------------------------------------------------------------------------------------------');
    dbms_output.put_line('NÚMERO TOTAL DE ARTISTAS: ' || v_contador_artistas || '                       ' || 'NÚMERO TOTAL DE CANCIONES: ' || v_contador_canciones);
    dbms_output.put_line('----------------------------------------------------------------------------------------------------');

-- Manejo de excepciones
EXCEPTION
    when no_data_found then
        dbms_output.put_line('No se ha encontró el artista en la base de datos');
    when others then
        dbms_output.put_line('Error indeteminado en la Base de Datos');
END;
/









