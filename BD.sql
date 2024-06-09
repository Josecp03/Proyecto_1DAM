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

-- Tabla PERSONAS
CREATE TABLE PERSONAS (
    identificador VARCHAR2(50),
    nombre VARCHAR2(100) NOT NULL,
    apellidos VARCHAR2(100) NOT NULL,
    fechaNaciemiento DATE NOT NULL,
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






