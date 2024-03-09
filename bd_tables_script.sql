CREATE TABLE `Par` (
  `Id_dispositivo` integer UNIQUE PRIMARY KEY NOT NULL,
  `nombre_dispositivo` varchar(255),
  `Nombre_modelo` varchar(255),
  `Id_usuario` integer NOT NULL
);

CREATE TABLE `Zapato` (
  `Id_par` integer UNIQUE NOT NULL,
  `Izquierdo` boolean UNIQUE NOT NULL,
  PRIMARY KEY (`Id_par`, `Izquierdo`)
);

CREATE TABLE `Usuario` (
  `Id_usuario` integer UNIQUE PRIMARY KEY NOT NULL,
  `Nombre` varchar(255),
  `Apellidos` varchar(255),
  `Fecha_nac` date
);

CREATE TABLE `Credencial` (
  `Id_usuario` integer UNIQUE NOT NULL,
  `Correo` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255),
  PRIMARY KEY (`Id_usuario`, `Correo`)
);

CREATE TABLE `Modelo` (
  `Nombre_modelo` varchar(255) UNIQUE PRIMARY KEY NOT NULL,
  `Anio` integer,
  `Color` varchar(255),
  `Descripcion` varchar(255),
  `Img` varchar(255)
);

CREATE TABLE `Sensor` (
  `Nombre_sensor` varchar(255) UNIQUE PRIMARY KEY NOT NULL,
  `Descripcion` varchar(255),
  `Tipo` integer
);

CREATE TABLE `Modelo_sensor` (
  `Nombre_modelo` varchar(255) UNIQUE NOT NULL,
  `Nombre_sensor` varchar(255) UNIQUE NOT NULL,
  PRIMARY KEY (`Nombre_modelo`, `Nombre_sensor`)
);

CREATE TABLE `Informacion` (
  `Id_par` integer UNIQUE NOT NULL,
  `Izquierdo` boolean UNIQUE NOT NULL,
  `Nombre_sensor` varchar(255) UNIQUE NOT NULL,
  `Fecha` date,
  `Medicion` varchar(255),
  PRIMARY KEY (`Id_par`, `Izquierdo`, `Nombre_sensor`)
);

ALTER TABLE `Zapato` ADD FOREIGN KEY (`Id_par`) REFERENCES `Par` (`Id_dispositivo`);

ALTER TABLE `Credencial` ADD FOREIGN KEY (`Id_usuario`) REFERENCES `Usuario` (`Id_usuario`);

ALTER TABLE `Par` ADD FOREIGN KEY (`Id_usuario`) REFERENCES `Usuario` (`Id_usuario`);

ALTER TABLE `Informacion` ADD FOREIGN KEY (`Id_par`) REFERENCES `Zapato` (`Id_par`);

ALTER TABLE `Informacion` ADD FOREIGN KEY (`Nombre_sensor`) REFERENCES `Sensor` (`Nombre_sensor`);

ALTER TABLE `Par` ADD FOREIGN KEY (`Nombre_modelo`) REFERENCES `Modelo` (`Nombre_modelo`);

ALTER TABLE `Modelo_sensor` ADD FOREIGN KEY (`Nombre_modelo`) REFERENCES `Modelo` (`Nombre_modelo`);

ALTER TABLE `Modelo_sensor` ADD FOREIGN KEY (`Nombre_sensor`) REFERENCES `Sensor` (`Nombre_sensor`);
