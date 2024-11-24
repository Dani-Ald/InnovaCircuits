-- Crear la base de datos llamada Tienda
CREATE DATABASE Prueba2;
USE Prueba2;

-- -------------------------------------------------------------
-- Tabla Cliente
-- Propósito: Almacena la información de los clientes de la tienda.
-- -------------------------------------------------------------
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,                  -- Identificador único para cada cliente.
    Nombre VARCHAR(100) NOT NULL,                 -- Nombre del cliente (campo obligatorio).
    Correo VARCHAR(100) UNIQUE NOT NULL,          -- Correo electrónico único (campo obligatorio).
    Telefono VARCHAR(20),                         -- Teléfono del cliente.
    Direccion TEXT                                -- Dirección completa del cliente.
);

-- -------------------------------------------------------------
-- Tabla Empleado
-- Propósito: Almacena la información sobre los empleados de la tienda.
-- -------------------------------------------------------------
CREATE TABLE Empleado (
    ID_Empleado INT PRIMARY KEY,                  -- Identificador único para cada empleado.
    Nombre VARCHAR(100) NOT NULL,                 -- Nombre del empleado (campo obligatorio).
    Fecha_Contratacion DATE NOT NULL,             -- Fecha en que el empleado fue contratado (campo obligatorio).
    Salario DECIMAL(10, 2) NOT NULL               -- Salario del empleado (campo obligatorio).
);

-- -------------------------------------------------------------
-- Tabla Departamento
-- Propósito: Almacena los diferentes departamentos de la tienda.
-- -------------------------------------------------------------
CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,              -- Identificador único para cada departamento.
    Nombre VARCHAR(100) NOT NULL,                 -- Nombre del departamento (campo obligatorio).
    Descripcion TEXT                              -- Descripción del departamento.
);

-- -------------------------------------------------------------
-- Tabla intermedia Empleado_Departamento
-- Propósito: Relaciona empleados con los departamentos a los que pertenecen.
-- -------------------------------------------------------------
CREATE TABLE Empleado_Departamento (
    ID_Empleado INT NOT NULL,                     -- ID del empleado que pertenece al departamento.
    ID_Departamento INT NOT NULL,                 -- ID del departamento al que pertenece el empleado.
    PRIMARY KEY (ID_Empleado, ID_Departamento),   -- La combinación de ambos IDs es única.
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado) ON DELETE CASCADE ON UPDATE CASCADE, -- Relación con la tabla Empleado.
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento) ON DELETE CASCADE ON UPDATE CASCADE  -- Relación con la tabla Departamento.
);

-- -------------------------------------------------------------
-- Tabla Venta
-- Propósito: Almacena la información de las ventas realizadas.
-- -------------------------------------------------------------
CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY,                     -- Identificador único de cada venta.
    Fecha DATE NOT NULL,                           -- Fecha de la venta (campo obligatorio).
    ID_Cliente INT NOT NULL,                       -- ID del cliente que realizó la venta (campo obligatorio).
    ID_Empleado INT NOT NULL,                      -- ID del empleado que gestionó la venta (campo obligatorio).
    Total DECIMAL(10, 2) NOT NULL,                 -- Total de la venta (campo obligatorio).
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente) ON DELETE CASCADE ON UPDATE CASCADE, -- Relación con la tabla Cliente.
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado) ON DELETE CASCADE ON UPDATE CASCADE  -- Relación con la tabla Empleado.
);

-- -------------------------------------------------------------
-- Tabla Producto
-- Propósito: Almacena la información de los productos que se venden en la tienda.
-- -------------------------------------------------------------
CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY,                   -- Identificador único de cada producto.
    Nombre VARCHAR(100) NOT NULL,                  -- Nombre del producto (campo obligatorio).
    Precio DECIMAL(10, 2) NOT NULL,                -- Precio de venta del producto (campo obligatorio).
    Descripcion TEXT                               -- Descripción del producto.
);

-- -------------------------------------------------------------
-- Tabla intermedia Venta_Producto
-- Propósito: Relaciona los productos con las ventas que los incluyen.
-- -------------------------------------------------------------
CREATE TABLE Venta_Producto (
    ID_Venta INT NOT NULL,                         -- ID de la venta que incluye el producto.
    ID_Producto INT NOT NULL,                      -- ID del producto incluido en la venta.
    Cantidad INT NOT NULL,                         -- Cantidad de este producto en la venta.
    PRIMARY KEY (ID_Venta, ID_Producto),           -- La combinación de ambos IDs es única.
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta) ON DELETE CASCADE ON UPDATE CASCADE, -- Relación con la tabla Venta.
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto) ON DELETE CASCADE ON UPDATE CASCADE  -- Relación con la tabla Producto.
);

-- -------------------------------------------------------------
-- Tabla Componente
-- Propósito: Almacena información sobre los componentes individuales que forman los productos.
-- -------------------------------------------------------------
CREATE TABLE Componente (
    ID_Componente INT PRIMARY KEY,                 -- Identificador único de cada componente.
    Nombre VARCHAR(100) NOT NULL,                   -- Nombre del componente (campo obligatorio).
    Descripcion TEXT                               -- Descripción del componente.
);

-- -------------------------------------------------------------
-- Tabla intermedia Producto_Componente
-- Propósito: Relaciona los productos con los componentes que los conforman.
-- -------------------------------------------------------------
CREATE TABLE Producto_Componente (
    ID_Producto INT NOT NULL,                      -- ID del producto que tiene el componente.
    ID_Componente INT NOT NULL,                    -- ID del componente que forma parte del producto.
    PRIMARY KEY (ID_Producto, ID_Componente),      -- La combinación de ambos IDs es única.
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto) ON DELETE CASCADE ON UPDATE CASCADE, -- Relación con la tabla Producto.
    FOREIGN KEY (ID_Componente) REFERENCES Componente(ID_Componente) ON DELETE CASCADE ON UPDATE CASCADE  -- Relación con la tabla Componente.
);

-- -------------------------------------------------------------
-- Tabla Proveedor
-- Propósito: Almacena información sobre los proveedores que suministran los componentes.
-- -------------------------------------------------------------
CREATE TABLE Proveedor (
    ID_Proveedor INT PRIMARY KEY,                  -- Identificador único de cada proveedor.
    Nombre VARCHAR(100) NOT NULL,                   -- Nombre del proveedor (campo obligatorio).
    Telefono VARCHAR(20),                           -- Teléfono del proveedor.
    Direccion TEXT                                  -- Dirección del proveedor.
);

-- -------------------------------------------------------------
-- Tabla intermedia Proveedor_Componente
-- Propósito: Relaciona los proveedores con los componentes que suministran.
-- -------------------------------------------------------------
CREATE TABLE Proveedor_Componente (
    ID_Proveedor INT NOT NULL,                      -- ID del proveedor que suministra el componente.
    ID_Componente INT NOT NULL,                     -- ID del componente suministrado por el proveedor.
    PRIMARY KEY (ID_Proveedor, ID_Componente),      -- La combinación de ambos IDs es única.
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor) ON DELETE CASCADE ON UPDATE CASCADE, -- Relación con la tabla Proveedor.
    FOREIGN KEY (ID_Componente) REFERENCES Componente(ID_Componente) ON DELETE CASCADE ON UPDATE CASCADE  -- Relación con la tabla Componente.
);
