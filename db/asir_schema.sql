-- Script de Creación de la Base de Datos para el Proyecto ASIR
-- Creado por: Alvaro Moises Hilares Natividad
-- Fecha: 19/04/2025

-- 1. Creación de la Base de Datos
CREATE DATABASE IF NOT EXISTS asir_project;
USE asir_project;

-- 2. Creación de la tabla de Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    rol VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- 3. Creación de la tabla de Proyectos
CREATE TABLE Proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATE NOT NULL,
    estado VARCHAR(50) DEFAULT 'activo'
) ENGINE=InnoDB;

-- 4. Creación de la tabla de Logs de Auditoría
CREATE TABLE Logs_Auditoria (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_evento DATETIME DEFAULT CURRENT_TIMESTAMP,
    descripcion TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 5. Inserción de datos de prueba en la tabla de Usuarios
INSERT INTO Usuarios (nombre, email, rol) VALUES
('Alvaro Hilares', 'alvaro.hilares@gmail.com', 'administrador'),
('Maria Perez', 'maria.perez@outlook.com', 'operador');

-- 6. Inserción de datos de prueba en la tabla de Proyectos
INSERT INTO Proyectos (titulo, descripcion) VALUES
('Plataforma de Gestión de Contenedores', 'Despliegues automatizados con Kubernetes y CI/CD.'),
('Sistema de Monitorización', 'Supervisión y análisis de recursos.');

-- 7. Inserción de Datos de Prueba en la Tabla de Logs de Auditoría
INSERT INTO Logs_Auditoria (id_usuario, descripcion) VALUES
(1, 'Creación del proyecto Plataforma de Gestión de Contenedores'),
(2, 'Actualización de datos de usuario Maria Perez');
