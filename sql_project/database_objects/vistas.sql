USE rityjust;

-- DEFINICION DE VISTAS

-- Vista que liste los productos con su categoria y precio
DROP VIEW IF EXISTS vw_listado_productos;
CREATE VIEW vw_listado_productos as  
	SELECT p.id_prod, c.nombre_cat AS categoria, p.nombre_prod, p.precio_lista
	FROM productos p
		JOIN categorias c ON p.id_cat = c.id_cat;


-- vista que liste los productos disponibles (stock > 0)
DROP VIEW IF EXISTS vw_productos_con_stock;
CREATE VIEW vw_productos_con_stock AS 
	SELECT id_prod, nombre_prod, stock, precio_lista
	FROM productos
		WHERE stock > 0;


-- vista que muestre las ventas que hicieron los vendedores
DROP VIEW IF EXISTS vw_vendedores_facturas;
CREATE VIEW  vw_vendedores_facturas AS 
	SELECT 
		v.nombre_completo AS vendedor_nombre
		, lf.id_fact
		, f.total
		, (f.total * 0.2) as comision -- 20% de comision
	FROM vendedores v
		JOIN link_vendedor_fact lf ON v.id_vendedor = lf.id_vendedor
		join facturaciones f on f.id_fact = lf.id_fact;
        
	
-- vista que muestre el detalle completo de facturaiones (id, cliente, vendedor, productos y total)
DROP VIEW IF EXISTS vw_factura_detalle;
CREATE VIEW vw_factura_detalle AS
    SELECT
    	f.id_fact,
    	MAX(c.nombre_completo) AS nombre_cliente,
    	MAX(v.nombre_completo) AS nombre_vendedor,
    	GROUP_CONCAT(CONCAT(lfp.cantidad, ' ', p.nombre_prod)) AS productos_involucrados,
    	SUM(lfp.total) AS total_factura
	FROM facturaciones f
	    JOIN link_fact_producto lfp ON f.id_fact = lfp.id_fact
	    JOIN productos p ON lfp.id_prod = p.id_prod
	    JOIN clientes c ON f.id_cliente = c.id_cliente
	    JOIN link_vendedor_fact lvf ON f.id_fact = lvf.id_fact
	    JOIN vendedores v ON lvf.id_vendedor = v.id_vendedor
	    GROUP BY f.id_fact;