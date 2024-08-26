USE rityjust;

DELIMITER //

DROP PROCEDURE IF EXISTS actualizarTotalFactura//
CREATE PROCEDURE actualizarTotalFactura(IN idFactura INT)
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
END//

DROP PROCEDURE IF EXISTS actualizarStock//
CREATE PROCEDURE actualizarStock(IN cantidadNueva INT)
BEGIN
    UPDATE productos
    SET stock = stock + cantidadNueva;
END//

DROP PROCEDURE IF EXISTS actualizarStockSolo//
CREATE PROCEDURE actualizarStockSolo(
    IN nombreProducto VARCHAR(100),
    IN cantidadNueva INT
)
BEGIN
    UPDATE productos
    SET STOCK = STOCK + cantidadNueva
    WHERE NOMBRE_PROD LIKE CONCAT('%', nombreProducto, '%');
END//

DROP PROCEDURE IF EXISTS cambio_de_equipo//
CREATE PROCEDURE cambio_de_equipo(
    IN p_nombre_completo VARCHAR(100),
    IN p_id_grupo INT
)
BEGIN
    DECLARE v_id_vendedor INT;
    DECLARE exit handler for sqlexception
    BEGIN
        -- Manejo de errores
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vendedor no encontrado';
    END;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Validar si el vendedor existe
    SELECT id_vendedor INTO v_id_vendedor
    FROM vendedores
    WHERE nombre_completo = p_nombre_completo;

    IF v_id_vendedor IS NULL THEN
        -- Si el vendedor no existe, finalizar la transacción y mostrar error
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vendedor no encontrado';
    ELSE
        -- Si el vendedor existe, actualizar su grupo
        UPDATE vendedores
        SET id_grupo = p_id_grupo
        WHERE id_vendedor = v_id_vendedor;

        -- Confirmar la transacción
        COMMIT;
    END IF;
END//

DELIMITER ;