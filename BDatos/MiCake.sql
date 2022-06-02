create database Mi_Cake;
use Mi_Cake;

create table Persona (
	id int unsigned not null primary key AUTO_INCREMENT,
    nombre varchar(80) not null,
    email varchar(80) default null,
    telefono int unsigned default null,
    tipoPersona char(1) not null, 
    check (tipoPersona in ('C', 'E', 'A')) 						-- C(Cliente) ó E(Empleado) ó A(Admi)		
);

create table Rol (							-- Roles de los usuarios
	id tinyint unsigned not null primary key AUTO_INCREMENT,
    descripcion varchar(20)
);

create table Permiso (						-- Permisos de los roles de usuario
	id tinyint unsigned not null primary key AUTO_INCREMENT,
    descripcion varchar(80) not null
);

create table Otorga ( 						-- Tabla intermedia entre Usuario y Rol
	idRol tinyint unsigned not null,
    idPermiso tinyint unsigned not null,
    estado bit not null,
    foreign key (idPermiso) references Permiso(id)					-- Fk hace referencia a la tabla Permiso
	on delete cascade on update cascade,
    foreign key (idRol) references Rol(id)							-- Fk hace referencia a la tabla Rol
	on delete cascade on update cascade,
    primary key(idRol,idPermiso)
);

create table Usuario (
	id int unsigned not null primary key AUTO_INCREMENT,
	nombre varchar(25) not null,
	contrasenha varchar(15) not null,
	estado bit not null default 1,									-- True habilitado y False deshabilitado
	idRol tinyint unsigned not null,
	idPersona int unsigned not null,
	foreign key (idRol) references Rol(id)							-- Fk hace referencia a la tabla Rol
	on delete cascade on update cascade,
	foreign key (idPersona) references Persona(id)					-- Fk hace referencia a la tabla persona 
	on delete cascade on update cascade
);

create table Empleado (  					-- Especializacion de la tabla persona	
	id int unsigned not null primary key AUTO_INCREMENT,
    ci int unsigned not null,
    salario mediumint unsigned not null default 2164,			-- Sueldo base
    direccion varchar(40) not null,
    foreign key (id) references Persona(id)						-- Fk hace referencia a la tabla persona 
	on delete cascade on update cascade
);

create table Pedido (
	nro bigint unsigned not null primary key AUTO_INCREMENT,		
    fechaPedido datetime not null default current_timestamp,	-- Fecha en la que realizo el pedido
    fechaEntrega datetime not null,	    						-- Fecha a entregar el pedido
	total decimal(6,2) not null,
    estadoPago bit not null,									-- 0 cancelado al 50% y 1 al 100%
    estado bit not null default 0,								-- Si ya fue entregado
    idUsuario int unsigned not null, 
    foreign key (idUsuario) references Usuario(id)						-- Fk hace referencia a la tabla Persona
	on delete cascade on update cascade
);

create table Categoria (					-- Tabla de las categorias de los productos
	id tinyint unsigned not null primary key AUTO_INCREMENT,
    descripcion varchar(20) not null
);

create table Receta (						-- Tabla de la receta de cada producto
	id smallint unsigned not null primary key AUTO_INCREMENT,
    descripcion varchar(20),
    idBase smallint unsigned default null						-- Hace referencia a otra receta
);

alter table Receta add foreign key (idBase) references Receta(id);

ALTER TABLE `mi_cake`.`receta` 
CHANGE COLUMN `descripcion` `descripcion` VARCHAR(80) NOT NULL ;

create table Producto (
	cod smallint unsigned not null primary key AUTO_INCREMENT,
    descripcion varchar(30) not null,
    precio decimal(4,2) not null default 0 check(Precio >= 0),
    idCategoria tinyint unsigned not null,
    idReceta smallint unsigned not null,
    foreign key (idCategoria) references Categoria(id)					-- Fk hace referencia a la tabla Categoria
	on delete cascade on update cascade,
    foreign key (idReceta) references Receta(id)						-- Fk hace referencia a la tabla Receta
	on delete cascade on update cascade
);

create table DetalleProd ( 					-- Tabla intermedia de relacion recursiva en tabla Producto									
	codP1 smallint unsigned not null,
    codP2 smallint unsigned not null,
    cant tinyint unsigned not null check (cant > 0),
    foreign key (codP1) references Producto(cod)						-- Fk hace referencia a la tabla Producto
	on delete cascade on update cascade,
    foreign key (codP2) references Producto(cod)						-- Fk hace referencia a la tabla Producto				
	on delete cascade on update cascade,
    primary key (codP1, codP2)
);

create table DetallePedido ( 				-- Tabla intermedia entre Pedido y producto
	nroPedido bigint unsigned not null,
    codProd smallint unsigned not null,
    cant tinyint unsigned not null check (cant > 0),
    importe decimal(6,2) not null check (importe >= 0),						
    foreign key (nroPedido) references Pedido(nro)						-- Fk hace referencia a la tabla Pedido				
	on delete cascade on update cascade,
    foreign key (codProd) references Producto(cod)						-- Fk hace referencia a la tabla Producto				
	on delete cascade on update cascade,
    primary key (nroPedido,codProd)
);

create table Medida (						-- Tipo de medida de los ingredientes
	id tinyint unsigned not null primary key AUTO_INCREMENT,
    descripcion varchar(50)
);

create table Ingrediente (
	cod mediumint unsigned not null primary key AUTO_INCREMENT,
    nombre varchar(25) not null,
    precio decimal(4,2) not null default 0 check (precio >= 0),
    precioProm decimal(4,2) not null default 0 check (precioProm >= 0),
    stock smallint unsigned not null default 0 check (stock >= 0),		
    idMedida tinyint unsigned not null,										-- Medida del ingrediente
    foreign key (idMedida) references Medida(id)							-- Fk hace referencia a la tabla Medida				
	on delete cascade on update cascade
);

create table DetalleReceta ( 				-- Tabla intermedia entre Receta y Ingrediente
	idReceta smallint unsigned not null,
    codIngre mediumint unsigned not null,
    cant smallint unsigned not null check (cant > 0),						-- Cantidad del ingrediente según su medida
    foreign key (idReceta) references Receta(id)							-- Fk hace referencia a la tabla receta				
	on delete cascade on update cascade,
    foreign key (codIngre) references Ingrediente(cod)						-- Fk hace referencia a la tabla Producto				
	on delete cascade on update cascade,
    primary key (idReceta, codIngre)
);

create table NotaCompra (					-- Tabla de Nota de compra de ingredientes
	nro int unsigned not null primary key AUTO_INCREMENT,
    fecha datetime not null default current_timestamp,						-- Fecha de la compra
    total decimal(6,2) not null default 0 check (total >= 0),				-- Total de la compra
    idUsuario int unsigned not null,										-- Empleado que realizo la compra
    foreign key (idUsuario) references Usuario(id)							-- FK hace referencia a la tabla Empleado
	on delete cascade on update cascade
);

create table DetalleCompra ( 				-- Tabla intermedia entre Nota de compra y Ingrediente 
	nroCompra int unsigned not null,
    codIngre mediumint unsigned not null,
    cantUni smallint unsigned not null check (cantUni > 0),					-- Cantidad del ingrediente unidad
    cantTot smallint unsigned not null default 1 check (cantTot > 0),		-- Cantidad de la unidad
    precioUni decimal(4,2) not null check (precioUni > 0),					-- Precio unidad
    precioTot decimal(6,2) not null check (precioTot > 0),					-- Precio total
    descripcion varchar(40) default null,
    foreign key (nroCompra) references NotaCompra(nro)						-- Fk hace referencia a la tabla Pedido				
	on delete cascade on update cascade,
    foreign key (codIngre) references Ingrediente(cod)						-- Fk hace referencia a la tabla Producto				
	on delete cascade on update cascade,
    primary key (nroCompra, codIngre)
);

create table NotaBaja (						-- Tabla de Nota de baja de ingredientes
	nro int unsigned not null primary key AUTO_INCREMENT,
    fecha datetime not null default current_timestamp,						-- Fecha de la baja
    total decimal(6,2) not null default 0 check (total >= 0),				-- Total de perdida de dinero
    idUsuario int unsigned not null,										-- Empleado que realizo ingresa la perdida
    foreign key (idUsuario) references Usuario(id)							-- FK hace referencia a la tabla Empleado
	on delete cascade on update cascade
);

create table DetalleBaja ( 										-- Tabla intermedia entre Nota de baja y Ingrediente 
	nroBaja int unsigned not null,
    codIngre mediumint unsigned not null,
    cantidad smallint unsigned not null check (cantidad > 0),				-- Cantidad del ingrediente para dar de baja
    foreign key (nroBaja) references NotaBaja(nro)							-- Fk hace referencia a la tabla Pedido				
	on delete cascade on update cascade,
    foreign key (codIngre) references Ingrediente(cod)						-- Fk hace referencia a la tabla Producto				
	on delete cascade on update cascade,
    primary key (nroBaja, codIngre)
);

create table Accion (						-- Tabla de acciones que realizan los usuario
	id tinyint unsigned not null primary key AUTO_INCREMENT,
    descripcion varchar(20) not null,
    tipo char(1) not null check (tipo in ('I','D','U','C'))					-- Insert-Delete-Update-Consult
);
	
create table Bitacora (						-- Tabla de bitacora de usuarios
	id int unsigned not null primary key AUTO_INCREMENT,
    fecha datetime not null default current_timestamp,
	idUsuario int unsigned not null,
    idAccion tinyint unsigned not null,
    foreign key (idUsuario) references Usuario(id)
    on delete cascade on update cascade,
    foreign key (idAccion) references Accion(id)
    on delete cascade on update cascade
);
