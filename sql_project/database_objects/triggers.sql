USE rityjust;

-- TRIGGERS PARA LA CORRECTA GESTION DE LOS DATOS
	
DELIMITER //

USE rityjust;

DELIMITER //

CREATE TRIGGER IF NOT EXISTS trg_ofertas_calcula_precio_final
BEFORE INSERT ON ofertas
FOR EACH ROW
BEGIN
    DECLARE precio_lista DECIMAL(12,2);
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Insertar el mensaje de error en la tabla de log de errores
        INSERT INTO log_errores (error_message)
        VALUES (CONCAT('Error in trg_ofertas_calcula_precio_final: ', ERROR_MESSAGE()));
    END;

    -- Obtener el precio de lista del producto
    SET precio_lista = obtenerPrecioLista(NEW.id_prod);

    -- Calcular el precio final utilizando la función calcularPrecioFinal
    SET NEW.precio_final = COALESCE(calcularPrecioFinal(precio_lista, NEW.descuento), 0);

    -- Insertar los valores en la tabla de registro
    INSERT INTO log_ofertas (id_prod, precio_lista, descuento, precio_final)
    VALUES (NEW.id_prod, precio_lista, NEW.descuento, NEW.precio_final);
END //


-- Calcula el total del producto agregado a la factura multiplicando la cantidad por el el PRODUCTOS.precio_lista o OFERTAS.precio_final SI es distinto a 0  . 
CREATE TRIGGER IF NOT EXISTS trg_calcula_total
BEFORE INSERT ON link_fact_producto
FOR EACH ROW
BEGIN
    
    SET @product_price = (
        SELECT CASE
            WHEN o.precio_final > 0 THEN o.precio_final  -- condicion para ver si tiene oferta
            ELSE p.precio_lista
        END
        FROM productos AS p  
        LEFT JOIN ofertas AS o ON p.id_prod = o.id_prod
        WHERE p.id_prod = NEW.id_prod
    );
    SET NEW.total =  COALESCE(@product_price * NEW.cantidad, 0);

 
END//

-- Trigger que actualize los totales de todas las facturas apenas se normalize las tablas link

CREATE TRIGGER IF NOT EXISTS trg_calcula_total_factura
AFTER INSERT ON link_fact_producto
FOR EACH ROW
BEGIN 
	CALL actualizarTotalFactura(NEW.id_fact); 
END//







