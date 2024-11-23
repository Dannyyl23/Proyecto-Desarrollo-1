-- Tabla Películas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    duracion INT,  -- en minutos
    clasificacion VARCHAR(50),
    genero VARCHAR(100)
);

-- Tabla Salas
CREATE TABLE Salas (
    id_sala INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT,
    tipo VARCHAR(50)  -- Ejemplo: "2D", "3D"
);

-- Tabla Sillas
CREATE TABLE Sillas (
    id_silla INT PRIMARY KEY AUTO_INCREMENT,
    id_sala INT,
    numero_asiento INT,
    estado VARCHAR(20),  -- Puede ser "disponible", "reservado", "ocupado"
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)
);

-- Tabla Funciones
CREATE TABLE Funciones (
    id_funcion INT PRIMARY KEY AUTO_INCREMENT,
    id_pelicula INT,
    id_sala INT,
    fecha_hora DATETIME,
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    correo VARCHAR(255) UNIQUE,
    contrasena VARCHAR(255),
    rol ENUM('cliente', 'administrador') NOT NULL
);

-- Tabla Ventas de Boletos
CREATE TABLE Ventas_Boletos (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_funcion INT,
    id_usuario INT,
    fecha_venta DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_funcion) REFERENCES Funciones(id_funcion),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabla Boletos
CREATE TABLE Boletos (
    id_boleto INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    id_silla INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_venta) REFERENCES Ventas_Boletos(id_venta),
    FOREIGN KEY (id_silla) REFERENCES Sillas(id_silla)
);




-- Insertar datos en la tabla Peliculas
INSERT INTO Peliculas (titulo, descripcion, duracion, clasificacion, genero)
VALUES
('La Guerra de las Galaxias', 'Una épica lucha entre el bien y el mal en el espacio.', 120, 'Apta para todo público', 'Ciencia Ficción'),
('Avengers: Endgame', 'Los superhéroes luchan para salvar al universo.', 180, 'B15', 'Acción'),
('El Señor de los Anillos: La Comunidad del Anillo', 'Un joven hobbit se embarca en una misión épica para destruir un anillo poderoso.', 210, 'Apta para todo público', 'Aventura'),
('Jurassic Park', 'Un parque temático con dinosaurios clonados que se escapan y causan caos.', 127, 'B15', 'Ciencia Ficción');


-- Insertar datos en la tabla Salas
INSERT INTO Salas (nombre, capacidad, tipo)
VALUES
('Sala 1', 200, '3D'),
('Sala 2', 150, '2D'),
('Sala 3', 120, '2D'),
('Sala 4', 180, '3D');

-- Insertar datos en la tabla Sillas
INSERT INTO Sillas (id_sala, numero_asiento, estado)
VALUES
(1, 1, 'disponible'),
(1, 2, 'ocupado'),
(1, 3, 'reservado'),
(1, 4, 'disponible'),
(2, 1, 'disponible'),
(2, 2, 'reservado'),
(2, 3, 'ocupado'),
(3, 1, 'disponible');

-- Insertar datos en la tabla Funciones
INSERT INTO Funciones (id_pelicula, id_sala, fecha_hora)
VALUES
(1, 1, '2024-11-25 18:30:00'),
(2, 2, '2024-11-25 20:30:00'),
(3, 3, '2024-11-26 17:00:00'),
(4, 4, '2024-11-27 19:45:00');

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (nombre, correo, contrasena, rol)
VALUES
('Juan Pérez', 'juan.perez@gmail.com', 'password123', 'cliente'),
('María López', 'maria.lopez@gmail.com', 'admin123', 'administrador'),
('Carlos García', 'carlos.garcia@gmail.com', '123456', 'cliente'),
('Ana Ruiz', 'ana.ruiz@gmail.com', 'admin456', 'administrador');


-- Insertar datos en la tabla Ventas de Boletos
INSERT INTO Ventas_Boletos (id_funcion, id_usuario, fecha_venta, total)
VALUES
(1, 1, '2024-11-24 12:00:00', 8000),
(2, 2, '2024-11-24 14:00:00', 4000),
(3, 3, '2024-11-25 10:00:00', 4000),
(4, 4, '2024-11-25 16:30:00', 8000);


-- Insertar datos en la tabla Boletos
INSERT INTO Boletos (id_venta, id_silla, precio)
VALUES
(1, 1, 8000),
(1, 3, 8000),
(2, 2, 4000),
(2, 3, 4000),
(3, 1, 4000),
(3, 2, 4000),
(4, 1, 8000),
(4, 2, 8000);
