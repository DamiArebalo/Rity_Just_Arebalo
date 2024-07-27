
USE rityjust;

DELIMITER //

-- CREACION DE FUNCIONES

CREATE FUNCTION calcularPrecioFinal(precioLista DECIMAL(10,2), porcentajeDescuento DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE precioFinal DECIMAL(10,2);
    SET precioFinal = COALESCE(precioLista * (1 - porcentajeDescuento / 100), 0);
    RETURN precioFinal;
END//
