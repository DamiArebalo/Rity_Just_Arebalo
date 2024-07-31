USE rityjust;

-- creacion de procedures 
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS actualizarTotalFactura(IN idFactura INT)
BEGIN
    DECLARE total_amount DECIMAL(12,2);
    
    -- Calcula la suma de los totales de los productos facturados
    SELECT SUM(total) INTO total_amount
    FROM link_fact_producto
    WHERE id_fact = idFactura;
    
    -- Actualiza el total de la factura en la tabla facturaciones
    UPDATE facturaciones
    SET total = total_amount
    WHERE id_fact = idFactura;
END //


-- proceso para actualizar el stock de todos los productos
CREATE PROCEDURE IF NOT EXISTS actualizarStock(IN cantidadNueva INT)
BEGIN
    UPDATE productos
    SET STOCK = STOCK + cantidadNueva;
END//

-- proceso para actualizar el stock de un solo producto
CREATE PROCEDURE IF NOT EXISTS actualizarStockSolo(IN nombreProducto VARCHAR(100), IN cantidadNueva INT)
BEGIN
    UPDATE productos
    SET STOCK = STOCK + cantidadNueva
    WHERE NOMBRE_PROD LIKE CONCAT('%', nombreProducto, '%');
END//





DELIMITER ;