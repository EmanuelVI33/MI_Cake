use mi_cake;

-- Agrega producto al un pedido		
create procedure Agregar_a_Pedido(idPed int, idP int, c int)
	insert into DetallePedido (idPedido, idProducto, cant) values (idPed, idP, c);


-- Agrega ingrediente a una compra
create procedure Agregar_a_Compra
(nroC int, idI int, cantU int, cantT int, preU decimal(4,2), d varchar(80))
	insert into DetalleCompra values (nroC, idI, cantU, cantT, cant * d);


-- Agrega ingrediente a una Nota de baja
create procedure Agregar_a_NotaB
(nroB int, idI int, cantU int)
	insert into DetalleBaja values (nroB, idI, cantU);

    
-- Función que verifica si una receta tiene el stock suficiente para realizar el producto
-- Parametros codigo del ingrediente y cantidad del ingrediente
-- Función que verifica si hay el stock suficiente de ese ingrediente
delimiter //
create function HayStockIngre(codI int, cantI int) returns boolean
deterministic
begin
    declare s int;
    
	select stock into s from Ingrediente where cod = codI;  -- Obtenemos el stock
    set s = s - cantI;
    
    return (s > 0);
end//
delimiter ;
 
-- Verifica si hay stock suficiente para la produción de producto
-- Recibe el id de receta y la cantidad del producto, devuelve 1 si hay stock/0 si no hay, 
-- devuelve una lista con los productos que no existen
delimiter //
create procedure Producto (in idR int,in cantidad int, out b boolean, out l varchar(300)) 
begin
	declare ingre int;
    declare c int;
    declare nomb varchar(80);
    
    declare Verifica cursor for (select codIngre,descripcion, cant from DetallePedido, Receta, Ingrediente	-- Cursor para Ingrediente y su cantidad
								where id = idReceta and cod = codIngre and id = idR);
	declare continue handler for sqlstate '02000' set listo = true;
    
    set l = '';
    set b = 1;
    
    open Verfica;
    Veri_loop: loop
		fetch Verifica into ingre,nomb, c;
        if (listo) then leave Veri_loop;	-- Si esta vacia la tabla sale del bucle
        end if;
        
        if (HayStock(ingre, c * cantidad) = 0) then 
			set l = l + nomb + '\n';
        end if;
        
    end loop Veri_loop;
    close Verifica;
    
    if (l != "") then 
		set b = 0;
	end if;
    
end//
delimiter ;





	


