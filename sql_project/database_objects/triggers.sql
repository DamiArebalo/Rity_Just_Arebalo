USE rityjust;

-- TRIGGERS PARA LA CORRECTA GESTION DE LOS DATOS
	
DELIMITER //

CREATE TRIGGER trg_ofertas_calcula_precio_final
AFTER INSERT ON ofertas
FOR EACH ROW
BEGIN
    -- Calcular el precio final utilizando la función calcularPrecioFinal
    SET @v_precio_final = COALESCE(calcularPrecioFinal(obtenerPrecioLista(NEW.id_prod), NEW.descuento), 0);

    -- Actualizar el precio final en el registro insertado
    UPDATE ofertas SET precio_final = @v_precio_final WHERE id_oferta = NEW.id_oferta;

    -- Insertar los valores en la tabla de registro
    INSERT INTO log_ofertas (id_prod, precio_lista, descuento, precio_final)
    VALUES (NEW.id_prod, obtenerPrecioLista(NEW.id_prod), NEW.descuento, @v_precio_final);
END //


-- Calcula el total del producto agregado a la factura multiplicando la cantidad por el el PRODUCTOS.precio_lista o OFERTAS.precio_final SI es distinto a 0  . 
CREATE TRIGGER trg_calcula_total
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





