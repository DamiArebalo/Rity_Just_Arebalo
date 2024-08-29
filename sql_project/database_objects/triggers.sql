USE rityjust;

-- TRIGGERS PARA LA CORRECTA GESTION DE LOS DATOS
	
DELIMITER //



DROP TRIGGER IF EXISTS trg_ofertas_calcula_precio_final//
CREATE TRIGGER  trg_ofertas_calcula_precio_final
BEFORE INSERT ON ofertas
FOR EACH ROW
BEGIN
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Insertar el mensaje de error en la tabla de log de errores
        CALL manejar_error("Error al calcular precio de oferta", NEW.id_prod , NEW.descuento);
    END;

    -- Obtener el precio de lista del producto
    SET @precio_lista = obtenerPrecioLista(NEW.id_prod);

    -- Calcular el precio final utilizando la función calcularPrecioFinal
    SET NEW.precio_final = COALESCE(calcularPrecioFinal(@precio_lista, NEW.descuento), 0);

    -- Insertar los valores en la tabla de registro
    INSERT INTO log_ofertas (id_prod, precio_lista, descuento, precio_final)
    VALUES (NEW.id_prod, @precio_lista, NEW.descuento, NEW.precio_final);
END //


-- Calcula el total del producto agregado a la factura multiplicando la cantidad por el el PRODUCTOS.precio_lista o OFERTAS.precio_final SI es distinto a 0  . 
DROP TRIGGER IF EXISTS trg_calcula_total//
CREATE TRIGGER  trg_calcula_total
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
DROP TRIGGER IF EXISTS trg_calcula_total_factura//
CREATE TRIGGER trg_calcula_total_factura
AFTER INSERT ON link_fact_producto
FOR EACH ROW
BEGIN 
	CALL actualizarTotalFactura(NEW.id_fact); 
END//

DROP TRIGGER IF EXISTS control_de_stock//
CREATE TRIGGER control_de_stock
BEFORE UPDATE ON productos
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 THEN
        CALL manejar_error('Stock no puede ser negativo', NEW.id_prod, NEW.stock);
    END IF;
END //

DELIMITER ;







