USE rityjust;

-- TRIGGERS PARA LA CORRECTA GESTION DE LOS DATOS
	
DELIMITER //

-- calcula el precio final de un producto luego de aplicarle el descuento formateado. Si el descuento es 0 el precio final tambien
CREATE TRIGGER trg_ofertas_calcula_precio_final
AFTER INSERT ON ofertas
FOR EACH ROW
BEGIN
    DECLARE v_precio_lista DECIMAL(10,2);
    DECLARE v_precio_final DECIMAL(10,2);

    -- Obtener el precio de lista del producto
    SET v_precio_lista = obtenerPrecioLista(NEW.id_prod);

    -- Verificar si el descuento es 0
    IF NEW.descuento = 0 THEN
        SET v_precio_final = 0;
    ELSE
        -- Calcular el precio final utilizando la función calcularPrecioFinal
        SET v_precio_final = COALESCE(calcularPrecioFinal(v_precio_lista, NEW.descuento), 0);
    END IF;

    -- Actualizar el precio final en la tabla ofertas
    UPDATE ofertas
    SET precio_final = v_precio_final
    WHERE id_prod = NEW.id_prod AND descuento = NEW.descuento;
END //





