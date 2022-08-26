/*** Crear base de datos y tablas ***/

USE nomitech;
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'
EXEC sp_msforeachtable 'DROP TABLE ?'
CREATE TABLE departamentos
(id_Departamento INT IDENTITY(1,1) PRIMARY KEY, Codigo NVARCHAR(3) NOT NULL,
Nombre NVARCHAR(35) NOT NULL, Extension INT NOT NULL,
);

CREATE TABLE supervisores
(id_Supervisor INT  IDENTITY(1,1) PRIMARY KEY, Nombre NVARCHAR(35) NOT NULL, 
Apellido NVARCHAR (35) NOT NULL,
Telefono NVARCHAR(15) NOT NULL, 
);

CREATE TABLE empleados 
(id_Empleado INT  IDENTITY(1,1) PRIMARY KEY, Nombre NVARCHAR(30) NOT NULL, 
Apellido NVARCHAR(30) NOT NULL, Telefono NVARCHAR(15) NOT NULL, 
Correo NVARCHAR(45) NOT NULL, id_Supervisor INT NOT NULL,
id_Departamento INT NOT NULL, 
FOREIGN KEY (id_Supervisor) REFERENCES supervisores(id_Supervisor),
FOREIGN KEY (id_Departamento) REFERENCES departamentos(id_Departamento)
);

CREATE TABLE nominas
(id_Nomina INT  IDENTITY(1,1) PRIMARY KEY, Sueldo_Hora DECIMAL NOT NULL, 
ARS DECIMAL NOT NULL, AFP DECIMAL NOT NULL, Neto DECIMAL NOT NULL, 
id_Empleado INT NOT NULL, 
FOREIGN KEY (id_Empleado) REFERENCES empleados(id_Empleado)
);

CREATE TABLE jornadas
(id_Jornada INT  IDENTITY(1,1) PRIMARY KEY, horas_Trabajadas INT NOT NULL, 
horas_Extra INT NOT NULL,Bono DECIMAL NOT NULL, id_Empleado INT NOT NULL, 
FOREIGN KEY (id_Empleado) REFERENCES empleados(id_Empleado)
);

