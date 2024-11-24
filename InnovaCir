-- Crear la base de datos
CREATE DATABASE Prueba2;
USE Prueba2;

-- Crear tablas principales
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,                  
    Nombre VARCHAR(100) NOT NULL,                 
    Apellidos VARCHAR(100) NOT NULL,              
    Correo VARCHAR(100) UNIQUE NOT NULL,          
    Telefono VARCHAR(20),                         
    Direccion TEXT                                
);

CREATE TABLE Empleado (
    ID_Empleado INT PRIMARY KEY,                  
    Nombres VARCHAR(100) NOT NULL,                
    Apellidos VARCHAR(100) NOT NULL,              
    Puesto VARCHAR(100) NOT NULL,                 
    Fecha_Contratacion DATE NOT NULL,             
    Salario DECIMAL(10, 2) NOT NULL,              
    ID_Departamento INT                           
);

CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,              
    Nombre_Departamento VARCHAR(100) NOT NULL,    
    Descripcion TEXT                              
);

CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY,                     
    Fecha DATE NOT NULL,                           
    ID_Cliente INT NOT NULL,                       
    ID_Empleado INT NOT NULL,                      
    Total DECIMAL(10, 2) NOT NULL                 
);

CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY,                  
    Nombre_Producto VARCHAR(100) NOT NULL,        
    Valor_Unitario DECIMAL(10, 2) NOT NULL,       
    Descripcion TEXT                              
);

CREATE TABLE Componente (
    ID_Componente INT PRIMARY KEY,                
    Nombre_Componente VARCHAR(100) NOT NULL,      
    Descripcion TEXT                              
);

CREATE TABLE Proveedor (
    ID_Proveedor INT PRIMARY KEY,                 
    Nombre_Razon_Social VARCHAR(150) NOT NULL,    
    Telefono_Proveedor VARCHAR(20),               
    Direccion_Proveedor TEXT                      
);

-- Crear tablas intermedias
CREATE TABLE Producto_Componente (
    ID_Producto INT NOT NULL,                     
    ID_Componente INT NOT NULL,                   
    PRIMARY KEY (ID_Producto, ID_Componente)      
);

CREATE TABLE Componente_Proveedor (
    ID_Componente INT NOT NULL,                   
    ID_Proveedor INT NOT NULL,                    
    PRIMARY KEY (ID_Componente, ID_Proveedor)     
);

-- Crear tabla intermedia para ventas y productos
CREATE TABLE Venta_Producto (
    ID_Venta INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    PRIMARY KEY (ID_Venta, ID_Producto)
);

-- -------------------------------------------------------------
-- Crear relaciones de claves foráneas
-- -------------------------------------------------------------

-- Relación de Empleado con Departamento
ALTER TABLE Empleado
ADD CONSTRAINT FK_Empleado_Departamento FOREIGN KEY (ID_Departamento)
REFERENCES Departamento(ID_Departamento);

-- Relación de Venta con Cliente
ALTER TABLE Venta
ADD CONSTRAINT FK_Venta_Cliente FOREIGN KEY (ID_Cliente)
REFERENCES Cliente(ID_Cliente);

-- Relación de Venta con Empleado
ALTER TABLE Venta
ADD CONSTRAINT FK_Venta_Empleado FOREIGN KEY (ID_Empleado)
REFERENCES Empleado(ID_Empleado);

-- Relación de Producto_Componente con Producto
ALTER TABLE Producto_Componente
ADD CONSTRAINT FK_Producto_Componente_Producto FOREIGN KEY (ID_Producto)
REFERENCES Producto(ID_Producto);

-- Relación de Producto_Componente con Componente
ALTER TABLE Producto_Componente
ADD CONSTRAINT FK_Producto_Componente_Componente FOREIGN KEY (ID_Componente)
REFERENCES Componente(ID_Componente);

-- Relación de Componente_Proveedor con Componente
ALTER TABLE Componente_Proveedor
ADD CONSTRAINT FK_Componente_Proveedor_Componente FOREIGN KEY (ID_Componente)
REFERENCES Componente(ID_Componente);

-- Relación de Componente_Proveedor con Proveedor
ALTER TABLE Componente_Proveedor
ADD CONSTRAINT FK_Componente_Proveedor_Proveedor FOREIGN KEY (ID_Proveedor)
REFERENCES Proveedor(ID_Proveedor);

-- Relación de Venta_Producto con Venta
ALTER TABLE Venta_Producto
ADD CONSTRAINT FK_Venta_Producto_Venta FOREIGN KEY (ID_Venta)
REFERENCES Venta(ID_Venta);

-- Relación de Venta_Producto con Producto
ALTER TABLE Venta_Producto
ADD CONSTRAINT FK_Venta_Producto_Producto FOREIGN KEY (ID_Producto)
REFERENCES Producto(ID_Producto);
