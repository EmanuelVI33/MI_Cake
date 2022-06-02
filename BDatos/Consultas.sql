use mi_cake;

-- 1 Recetas que tienen como base otra receta
select *
from Receta 
where (idBase != null);

-- 2 Mostrar los ingrediente de una receta que tiene como base otra receta
select *
from Receta
where isnull(idbase) = 0;
                    
-- 3 Mostrar los ingrediente de una receta
select codIngre, Ingrediente.nombre, cantidad
from Receta, Ingrediente, DetalleReceta
where (Receta.id = idReceta or Receta.idBase = idReceta) and (Ingrediente.cod = codIngre);

-- 4 Mostrar ingrediente clasificados por su Medida
select Descripcion as Medida, cod, nombre
from Ingrediente, Medida
where idMedida = medida.id
order by medida.id;

-- 5 Mostrar los ingrediente con stock bajo, tomando en cuenta su medida 
select cod, nombre, stock
from Ingrediente, Medida
where idMedida = id and ((idMedida = 1 and stock < 5) or (idMedida = 2 and stock < 1000) or (idMedida = 3 and stock < 500));

-- 6 Mostrar detalle de compra de una compra en especifico
select *
from detallecompra
where nroCompra = 1;

-- 7 Mostrar compras realizas en un mes especifico
select *
from NotaCompra
where date(month(fecha)) = 1;		-- Mes 1 (Enero)

-- 8 Mostrar los ingredientes que incremetaron su precio en una compra especifica
select cod, nombre, precioUni
from Ingrediente, detallecompra as d
where d.nroCompra = 1 and cod = d.codIngre and Precio < cdPrecioUni; 

-- 9 Precio de una recta en especifica
select isnull(sum(precio * cant)) as Total
from Ingrediente, Receta, DetalleReceta
where cod = codIngre and (id = 3 or idBase = idReceta);
    
-- 10 Mostrar detalle de un pedido en especifico
select codProd, cant, importe
from DetallePedido, Pedido, Producto
where nroPedido = nro and codProd = cod and nro = 1;

-- 12 Mostrar los pedidos con importe mayor a 100
select nroPedido
from Pedido, DetallePedido
where nro = nroPedido 
group by nroPedido
	having sum(importe) > 100;
    
-- 13 Mostrar los pedidos que contenga distintos productos
select nro
from Pedido, DetallePedido
where nro = nroPedido
group by nroPedido
	having count(*) > 1;
    
-- 14 Mostrar cantidad de pedidos realizados por los usuarios clientes
select id, nombre, count(*) as Total_pedidos
from Usuario, Pedido
where id = idUsuario 
group by idUsuario;

-- 15 Mostrar usuarios que no hay realizado ningún pedido
select id, nombre
from Usuario, Pedido
where id = idUsuario 
group by idUsuario
	having count(*) = 0;
    
-- 16 Mostrar usuarios que han realizado mas de 3 pedidos
select id, nombre
from Usuario, Pedido
where id = idUsuario 
group by idUsuario
	having count(*) > 3;
    
-- 17 Cantidad de productos vendidos
select codProd, descripcion, sum(cant)
from Producto, DetallePedido
where cod = codProd 
group by codProd; 

-- 18 Total vendido por cada producto
select codProd, descripcion, sum(importe)
from Producto, DetallePedido
where cod = codProd 
group by codProd; 

-- 19 Mostrar los usuario con el rol de empleado
select Usuario.id, nombre as user
from Usuario, Rol
where Rol.id = Usuario.idRol and descripcion = 'Empleado';
	
-- 20 Mostrar los usuarios con sus roles
select Usuario.id, nombre, descripcion
from Usuario, Rol
where Rol.id = Usuario.idRol;

-- 21 Mostra las notas de compra con el usuario que las ingreso
select id, nombre, nro as Nro_Compra 
from Usuario, NotaCompra
where id = idUsuario;

-- 22 Mostrar las notas de compras de un mes en especifico
select Nro, total, date(fecha) as fecha
from NotaCompra
where month(fecha) = 1;

-- 23 Mostrar total en compra en un mes en especifico
select Nro, sum(total), date(fecha) as fecha
from NotaCompra
where month(fecha) = 1;

-- 24 Mostra detalle de compra de una compra especifica
select codIngre, I.descripcion, cantUni, cantTot, precioUni, precioTot
from NotaCompra, DetalleCompra, Ingrediente as I 
where nro = nroCompra and I.cod = codIngre and nro = 1;

-- 25 Mostrar los usuario con el rol de empleado
select Usuario.id, nombre as user
from Usuario, Rol
where Rol.id = Usuario.idRol and descripcion = 'Empleado';
	
-- 26 Mostrar los usuarios con sus roles
select Usuario.id, nombre, descripcion
from Usuario, Rol
where Rol.id = Usuario.idRol;

-- 27 Mostra las notas de compra con el usuario que las ingreso
select id, nombre, nro as Nro_Compra 
from Usuario, NotaCompra
where id = idUsuario;

-- 28 Mostrar las notas de compras de un mes en especifico
select Nro, total, date(fecha) as fecha
from NotaCompra
where month(fecha) = 1;

-- 29 Mostrar total en compra en un mes en especifico
select Nro, sum(total), date(fecha) as fecha
from NotaCompra
where month(fecha) = 1;

-- 30 Mostra detalle de compra de una compra especifica
select codIngre, I.descripcion, cantUni, cantTot, precioUni, precioTot
from NotaCompra, DetalleCompra, Ingrediente as I 
where nro = nroCompra and I.cod = codIngre and nro = 1;






              