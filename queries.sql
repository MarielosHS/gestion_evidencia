CREATE LOGIN Ghost WITH PASSWORD=N'', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

EXEC master..sp_addsrvrolemember @loginame = N'Ghost', @rolename = N'sysadmin'
GO

CREATE DATABASE dicri;
go
SELECT name FROM master.sys.databases

CREATE LOGIN dicri_user WITH PASSWORD = 's';
go

USE dicri;
GO

CREATE USER dicri_user FOR LOGIN dicri_user;

EXEC sp_addrolemember 'db_datareader', 'dicri_user';
EXEC sp_addrolemember 'db_datawriter', 'dicri_user';
GRANT EXECUTE TO dicri_user;




-- =========================================
-- 1. TABLA USUARIO
-- =========================================
CREATE TABLE usuario (
    usuario_id      INT IDENTITY(1,1) PRIMARY KEY,
    nombre          VARCHAR(150) NOT NULL,
    rol             VARCHAR(50) NOT NULL, 
);
GO

-- =========================================
-- 2. TABLA EXPEDIENTE
-- =========================================
CREATE TABLE expediente (
    expediente_id       INT IDENTITY(1,1) PRIMARY KEY,
    fecha_registro      DATETIME NOT NULL DEFAULT GETDATE(),
    tecnico_id          INT NOT NULL, -- usuario que registra el expediente
    estado              VARCHAR(20) NOT NULL DEFAULT 'registrado', 
        -- valores posibles: 'registrado', 'en_revision', 'rechazado', 'aprobado'
    CONSTRAINT FK_expediente_tecnico FOREIGN KEY (tecnico_id)
        REFERENCES usuario(usuario_id)
);
GO

-- =========================================
-- 3. TABLA INDICIO
-- =========================================
CREATE TABLE indicio (
    indicio_id      INT IDENTITY(1,1) PRIMARY KEY,
    expediente_id   INT NOT NULL,
    descripcion     VARCHAR(500) NOT NULL,
    color           VARCHAR(100),
    tamaño          VARCHAR(100),
    peso            VARCHAR(100),
    ubicacion       VARCHAR(200),
    tecnico_id      INT NOT NULL, -- usuario que registra el indicio
    fecha_registro  DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_indicio_expediente FOREIGN KEY (expediente_id)
        REFERENCES expediente(expediente_id),

    CONSTRAINT FK_indicio_tecnico FOREIGN KEY (tecnico_id)
        REFERENCES usuario(usuario_id)
);
GO

-- =========================================
-- 4. TABLA EXPEDIENTE_APROBACION
-- =========================================
CREATE TABLE expediente_aprobacion (
    aprobacion_id       INT IDENTITY(1,1) PRIMARY KEY,
    expediente_id       INT NOT NULL,
    coordinador_id      INT NOT NULL, -- usuario que aprueba/rechaza
    fecha_revision      DATETIME NOT NULL DEFAULT GETDATE(),
    justificacion       VARCHAR(500) NULL,  -- obligatorio en caso de rechazo

    CONSTRAINT FK_aprobacion_expediente FOREIGN KEY (expediente_id)
        REFERENCES expediente(expediente_id),

    CONSTRAINT FK_aprobacion_coordinador FOREIGN KEY (coordinador_id)
        REFERENCES usuario(usuario_id)
);
GO

INSERT INTO usuario (nombre, rol)
VALUES
    ('Carlos Pérez', 'Coordinador'),
    ('María López', 'Coordinador'),
    ('Juan García', 'Tecnico'),
    ('Ana Rodríguez', 'Tecnico'),
    ('Luis Hernández', 'Tecnico');
GO