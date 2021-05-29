select  NombreProd NombreProd, 
sum(CantidadProductos) CantidadProductos, 
sum(PrecioProd) PrecioProd 
from detalle, producto
where detalle.CodigoProd = producto.CodigoProd 
group by detalle.CodigoProd 
order by CantidadProductos  desc ;


select  CodigoProd, 
sum(CantidadProductos) CantidadProductos, 
sum(PrecioProd) PrecioProd 
from detalle
group by detalle.CodigoProd 
order by CantidadProductos  desc ;