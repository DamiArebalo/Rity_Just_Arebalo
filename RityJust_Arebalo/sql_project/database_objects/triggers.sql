USE rityjust;

-- TRIGGERS PARA LA CORRECTA GESTION DE LOS DATOS
	
DELIMITER //

-- calcula el precio final de un producto luego de aplicarle el descuento formateado. Si el descuento es 0 el precio final tambien
CREATE TRIGGER trg_ofertas_calcula_precio_final
BEFORE INSERT ON ofertas
FOR EACH ROW
BEGIN
    DECLARE v_precio_lista DECIMAL(10,2);
    SELECT precio_lista INTO v_precio_lista
    FROM productos
    WHERE id_prod = NEW.id_prod;

    IF NEW.descuento = 0 THEN
        SET NEW.precio_final = 0;
    ELSE
        SET NEW.precio_final = calcularPrecioFinal(v_precio_lista,NEW.descuento);
    END IF;
END;
//

-- Calcula el total del producto agregado a la factura multiplicando la cantidad por el el PRODUCTOS.precio_lista o OFERTAS.precio_final SI es distinto a 0  . 
CREATE TRIGGER trg_calcula_total
BEFORE INSERT ON link_fact_producto
FOR EACH ROW
BEGIN
    DECLARE product_price DECIMAL(12, 2);
    SET product_price = (
        SELECT CASE
            WHEN o.precio_final > 0 THEN o.precio_final
            ELSE p.precio_lista
        END
        FROM productos AS p
        LEFT JOIN ofertas AS o ON p.id_prod = o.id_prod
        WHERE p.id_prod = NEW.id_prod
    );
    SET NEW.total =  COALESCE(product_price * NEW.cantidad, 0);
END;
//

 -- trigger para actualizar el total de la factura sumando el total de los productos facturados
CREATE TRIGGER `calcula_total_facturas`
BEFORE INSERT ON link_fact_producto
FOR EACH ROW
BEGIN
    DECLARE total_amount DECIMAL(12,2);
    
    SELECT SUM(total) INTO total_amount
    FROM link_fact_producto
    WHERE id_fact = NEW.id_fact;
    
    UPDATE facturaciones
    	SET total = total_amount
    	WHERE id_fact = NEW.id_fact;
END;
//

DELIMITER ;
