use Mi_Cake;

-- Tabla de Roles
insert into Rol (descripcion) value 
('Administrador'),
('Empleado'),
('Cliente');

-- Tabla de permisos
insert into Permiso (descripcion) value
('Consultar detalle pedido'),
('Modificar detalle pedido'),
('Realizar pedido'),
('Rechazar pedido'),
('Anular pedido'),
('Consultar receta'),
('Modificar receta'),
('Insertar receta'),
('Agregar producto'),
('Ingresar nota de compra'),
('Ingresar nota de baja'),
('Habilitar permisos'),
('Consultar stock para realizar producto'),
('Modificar pedido');

-- Tabla intermedia Rol y Permiso
insert into Otorga (idRol, idPermiso, estado) values 
(1,1,1),
(1,2,1),
(1,3,0),
(1,4,1),
(1,5,1),
(1,6,1),
(1,7,1),
(1,8,1),
(1,9,1),
(1,10,1),
(1,11,1),
(1,12,1),
(1,13,1),
(1,14,1),
(2,1,1),
(2,2,0),
(2,3,0),
(2,4,1),
(2,5,0),
(2,6,1),
(2,7,0),
(2,8,0),
(2,9,0),
(2,10,1),
(2,11,0),
(2,12,0),
(2,13,1),
(2,14,0),
(3,1,1),
(3,2,1),
(3,3,0),
(3,4,1),
(3,5,0),
(3,6,0),
(3,7,0),
(3,8,0),
(3,9,0),
(3,10,0),
(3,11,0),
(3,12,0),
(3,13,0),
(3,14,0);

-- Tabla persona
insert into Persona(nombre,email,telefono,tipoPersona) values 
('Patricia Soria','Patri23@gmail.com',75563411,'C'),
('Daniel Becerra',null,null,'C'),
('Ernesto Zoto',null,72132125,'C'),
('Pedro Murrillo',null,72432125,'C'),
('Jorge Quispe',null,78832125,'C'),
('Carlo Marcelo','CarMarcelin33@gmail.com',78832125,'E'),
('Adriana Moreno','adriMoreno43@gamil.com',78832125,'E'),
('Micaela Roca',null,68432125,'A'),
('Emanuel Vaca','emanuelvaca39@gmail.com',76432125,'A');	

-- Tabla de usuario
INSERT INTO `mi_cake`.`usuario` (`nombre`, `contrasenha`, `idRol`, `idPersona`) VALUES ('patri', '1234', '3', '1');
INSERT INTO `mi_cake`.`usuario` (`nombre`, `contrasenha`, `idRol`, `idPersona`) VALUES ('dani_b', '4321', '3', '2');
INSERT INTO `mi_cake`.`usuario` (`nombre`, `contrasenha`, `idRol`, `idPersona`) VALUES ('zotero', '3333', '3', '3');
INSERT INTO `mi_cake`.`usuario` (`nombre`, `contrasenha`, `idRol`, `idPersona`) VALUES ('pedrito', 'pedro', '3', '4');
INSERT INTO `mi_cake`.`usuario` (`nombre`, `contrasenha`, `idRol`, `idPersona`) VALUES ('jorge_quispe', '230301', '2', '5');
INSERT INTO `mi_cake`.`usuario` (`nombre`, `contrasenha`, `idRol`, `idPersona`) VALUES ('adrian_more', '141198', '2', '6');
INSERT INTO `mi_cake`.`usuario` (`nombre`, `contrasenha`, `idRol`, `idPersona`) VALUES ('mica_roca', 'mica_1204', '1', '7');
INSERT INTO `mi_cake`.`usuario` (`nombre`, `contrasenha`, `idRol`, `idPersona`) VALUES ('emanuel_v', 'vaca1411', '1', '8');	

-- Tabla medida
insert into Medida(descripcion) value
('UNIDAD'),
('GRAMOS'),
('MILILITROS');

-- Tabla ingredientes
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Huevo', '1');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Mantequilla sin sal', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Chocolate negro', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Azucar', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Vainilla', '3');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Harina0000', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Harian000', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Polvo de hornear', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Azucar impalpable', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Leche blanca', '3');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Crema da gusto', '2');
INSERT INTO `mi_cake`.`ingrediente` (`cod`, `nombre`, `idMedida`) VALUES ('12', 'Galleta oreo', '1');
UPDATE `mi_cake`.`ingrediente` SET `nombre` = 'Azucar granulada' WHERE (`cod` = '4');
INSERT INTO `mi_cake`.`ingrediente` (`cod`, `nombre`, `idMedida`) VALUES ('13', 'Crema de leche', '3');
INSERT INTO `mi_cake`.`ingrediente` (`cod`, `nombre`, `idMedida`) VALUES ('14', 'Esencia de coco', '3');
INSERT INTO `mi_cake`.`ingrediente` (`cod`, `nombre`, `idMedida`) VALUES ('15', 'Esencia de chocolate', '3');
INSERT INTO `mi_cake`.`ingrediente` (`cod`, `nombre`, `idMedida`) VALUES ('16', 'Bicarbonato', '2');
UPDATE `mi_cake`.`ingrediente` SET `nombre` = 'Esencia de Vainilla' WHERE (`cod` = '5');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Cocoa', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Cafe', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Sal', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Gelatina', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Queso crema', '2');
INSERT INTO `mi_cake`.`ingrediente` (`nombre`, `idMedida`) VALUES ('Leche condensada', '2');
INSERT INTO `mi_cake`.`ingrediente` (`cod`, `nombre`, `idMedida`) VALUES ('23', 'Dulce de leche', '2');
INSERT INTO `mi_cake`.`ingrediente` (`cod`, `nombre`, `idMedida`) VALUES ('24', 'Colorante', '2');


-- Tabla categorias
INSERT INTO `mi_cake`.`categoria` (`descripcion`) VALUES ('Tortas');
INSERT INTO `mi_cake`.`categoria` (`descripcion`) VALUES ('Postres');
INSERT INTO `mi_cake`.`categoria` (`descripcion`) VALUES ('Tartas');

-- Tabla receta
INSERT INTO `mi_cake`.`receta` (`descripcion`) VALUES ('Browni de chocolate personal');
INSERT INTO `mi_cake`.`receta` (`descripcion`) VALUES ('Masa de vainilla');
INSERT INTO `mi_cake`.`receta` (`descripcion`) VALUES ('Masa de oreo', '2');

-- Tabla intermedia entre receta y ingrediente
insert into DetalleReceta (idReceta, codIngre, cant) values 
(1,1,4),
(1,2,110),
(1,3,200),
(1,4,120),
(1,5,15),
(1,6,85);
INSERT INTO `mi_cake`.`detallereceta` (`idReceta`, `codIngre`, `cant`) VALUES ('2', '2', '115');
INSERT INTO `mi_cake`.`detallereceta` (`idReceta`, `codIngre`, `cant`) VALUES ('2', '1', '2');
INSERT INTO `mi_cake`.`detallereceta` (`idReceta`, `codIngre`, `cant`) VALUES ('2', '6', '200');
INSERT INTO `mi_cake`.`detallereceta` (`idReceta`, `codIngre`, `cant`) VALUES ('2', '9', '220');
INSERT INTO `mi_cake`.`detallereceta` (`idReceta`, `codIngre`, `cant`) VALUES ('2', '8', '30');
INSERT INTO `mi_cake`.`detallereceta` (`idReceta`, `codIngre`, `cant`) VALUES ('2', '10', '150');
INSERT INTO `mi_cake`.`detallereceta` (`idReceta`, `codIngre`, `cant`) VALUES ('2', '5', '15');
INSERT INTO `mi_cake`.`detallereceta` (`idReceta`, `codIngre`, `cant`) VALUES ('3', '12', '6');

-- Tabla producto 
INSERT INTO `mi_cake`.`producto` (`descripcion`, `precio`, `idCategoria`, `idReceta`) VALUES ('Browni de chocolate', '18', '2', '1');
INSERT INTO `mi_cake`.`producto` (`cod`, `descripcion`, `idCategoria`, `idReceta`) VALUES ('2', 'Masa de vainilla', '1', '2');
INSERT INTO `mi_cake`.`producto` (`cod`, `descripcion`, `idCategoria`, `idReceta`) VALUES ('3', 'Masa de oreo', '1', '3');







