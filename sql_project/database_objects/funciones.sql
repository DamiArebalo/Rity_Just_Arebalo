
USE rityjust;

DELIMITER //

-- CREACION DE FUNCIONES

CREATE FUNCTION calcularPrecioFinal(precioLista DECIMAL(10,2), porcentajeDescuento DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE precioFinal DECIMAL(10,2);
    SET precioFinal = precioLista * (1 - porcentajeDescuento / 100);
    RETURN precioFinal;
END//

CREATE FUNCTION obtenerPrecioLista(id_producto INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE precio_lista DECIMAL(10,2);
    
    -- Obtener el precio de lista del producto
    SELECT precio_lista INTO precio_lista
    FROM productos
    WHERE id_prod = id_producto;
    
    RETURN precio_lista;
END //