create database Inventario;
use Inventario;

create table Proveedores (
ID_Proveedor int auto_increment primary key,
Nombre varchar(100) not null,
Correo varchar(100),
Telefono varchar(15) not null 
);
create table Categorias (
ID_Categoria int auto_increment primary key,
Nombre_Categoria varchar(100) not null,
Descripcion text
);
create table Compras (
ID_Compra int auto_increment primary key,
ID_Proveedor int,
Fecha_Compras date not null,
Total decimal (10,2) not null,
Observaciones text,
foreign key (ID_Proveedor) references Proveedores(ID_Proveedor)
);
create table Productos (
ID_Producto int auto_increment primary key,
Nombre varchar(100) not null,
Descripcion text,
Precio_Unitario  decimal (10,2) not null,
Stock_Actual int,
Stock_Minimo int not null,
ID_Categoria int,
ID_Proveedor int,
foreign key (ID_Categoria) references Categorias(ID_Categoria),
foreign key (ID_Proveedor) references Proveedores(ID_Proveedor)
);
create table Movimientos_De_Stock (
ID_Movimiento int auto_increment primary key,
ID_Producto int,
ID_Compra int,
Tipo_Movimiento varchar(30),
Cantidad int not null,
Fecha date not null,
Observaciones text,
foreign key (ID_Producto) references Productos(ID_Producto),
foreign key (ID_Compra) references Compras(ID_Compra)
);
CREATE VIEW Alerta_Stock AS
SELECT 
  ID_Producto,
  Nombre,
  Stock_Actual,
  Stock_Minimo
FROM 
  Productos
WHERE 
  Stock_Actual < Stock_Minimo;
/*SELECT * FROM Alerta_Stock;






