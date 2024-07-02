DROP DATABASE IF EXISTS rityjust;
CREATE DATABASE IF NOT EXISTS rityjust;

USE  rityjust;

-- AGREGAR COMENTARIOS DISEÑAR SELECTS Y VISTAS

CREATE TABLE clientes(
	id_cliente int NOT NULL AUTO_INCREMENT
	,dni VARCHAR(8) NOT NULL 
	,nombre_completo varchar(100) NOT NULL
	,mail varchar(100) NOT NULL UNIQUE COMMENT 'Dato Validado desde backend con formato mail'
	,numero_tel VARCHAR(20) NOT NULL UNIQUE 
	,PRIMARY KEY (id_cliente,dni) COMMENT 'clave conformada por dni + id_cliente'

)COMMENT 'Tabla con informacion de los clientes al momento de la factura';


CREATE TABLE categorias(
	id_cat int NOT NULL AUTO_INCREMENT
	,nombre_cat VARCHAR(60) COMMENT 'nombre de la categoria'
	,PRIMARY KEY(id_cat)
)COMMENT 'Tabla que contiene las categorias de los productos';

CREATE TABLE productos(
	id_prod INT NOT NULL AUTO_INCREMENT
	,id_cat INT NOT NULL COMMENT 'Campo con FK'
	,descripcion VARCHAR(150) NOT NULL COMMENT 'Descripcion de los beneficios del producto'
	,nombre_prod VARCHAR(70) NOT NULL
	,stock INT DEFAULT(0) COMMENT 'Stock del producto. campo actualizable con cada facturacion'
	,precio_lista DECIMAL(12,2) NOT NULL DEFAULT(10000)
	,PRIMARY KEY (id_prod)

)COMMENT'TABLA CON INFORMACION PROPIA DE CADA PRODUCTO';


CREATE TABLE ofertas(
	id_oferta INT NOT NULL AUTO_INCREMENT
	,id_prod INT NOT NULL COMMENT 'Campo FK con tabla PRODUCTOS'
	,descuento INT NOT NULL DEFAULT(0) COMMENT 'Porcentaje de descuento de 2 digitos SI ES 0 = NO HAY DESCUENTO'
	,precio_final DECIMAL(10,2) COMMENT 'campo calculable con PRODUCTOS.precio_lista * (1 - descuento)'
	,PRIMARY KEY(id_oferta)
)COMMENT'TABLA CON LA INFORMACION DE LAS OFERTAS VIGENTES O NO VIGENTES DE LOS PRODUCTOS';


CREATE TABLE facturaciones(
	id_fact INT NOT NULL AUTO_INCREMENT
	,id_cliente INT NOT NULL COMMENT 'cliente foraneo a tabla clientes'
	,total DECIMAL(12,2) DEFAULT(0) COMMENT'total de la factura calculado con la suma de los totales de productos facturados'
	,fecha_fact datetime NOT NULL DEFAULT(current_timestamp) COMMENT'Fecha de compra'
	,pagado BOOL NOT NULL COMMENT 'estado de la compra' default(TRUE)
	,PRIMARY KEY(id_fact) 
)COMMENT 'TABLA CON INFORMACION PROPIA DE CADA FACTURA';

CREATE TABLE link_fact_producto(
	id_prod INT NOT NULL
	,id_fact INT NOT NULL
	,cantidad INT NOT NULL DEFAULT (1) COMMENT 'cantidad del pructo agregado'
	,total DECIMAL(10,2)   COMMENT 'Campo calculable del total de cada producto * su cantidad'
	,PRIMARY KEY(id_prod, id_fact)
)COMMENT 'Tabla de relacion entre productos y facturas';

CREATE TABLE lideres(
	id_lider INT NOT NULL AUTO_INCREMENT
	,nombre_completo VARCHAR(100) NOT NULL
	,cuit VARCHAR(11) NOT NULL  
	,PRIMARY KEY(id_lider)
) COMMENT 'TABLA DE INFORMACION DE LIDERES';

CREATE TABLE grupos(
	id_grupo INT NOT NULL AUTO_INCREMENT
	,id_lider INT NOT NULL
	,PRIMARY KEY(id_grupo) 
)COMMENT 'TABLA DE INFO DE GRUPOS CON SU LIDER';

CREATE TABLE vendedores(
	id_vendedor INT NOT NULL AUTO_INCREMENT
	,id_grupo INT NOT NULL
	,nombre_completo VARCHAR(100) NOT NULL
	,cuit VARCHAR(11) NOT NULL  
	,PRIMARY KEY(id_vendedor)
	
)COMMENT 'TABLA CON INFOMRACION PROPIA DE CADA VENDEDOR';

CREATE TABLE link_vendedor_fact(
	id_vendedor INT NOT NULL
	,id_fact INT NOT NULL
	,PRIMARY KEY(id_vendedor, id_fact)
)COMMENT 'TABLA DE RELACION ENTRE FACTURAS Y VENDEDORES';



-- AGREGADO DE FK CON ALTER TABLES

ALTER TABLE link_fact_producto
	ADD CONSTRAINT fk_link_fact_prod
		FOREIGN KEY (id_prod) REFERENCES productos(id_prod);
	
ALTER TABLE link_fact_producto
	ADD CONSTRAINT fk_link_prod_fact
		FOREIGN KEY (id_fact) REFERENCES facturaciones(id_fact);
	
ALTER TABLE link_vendedor_fact
	ADD CONSTRAINT fk_link_fact_vendedor
		FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor);
	
ALTER TABLE link_vendedor_fact
	ADD CONSTRAINT fk_link_vendedor_fact
		FOREIGN KEY (id_fact) REFERENCES facturaciones(id_fact);
		
ALTER TABLE FACTURACIONES 
	ADD CONSTRAINT fk_fact_cl
		FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);
	
		
ALTER TABLE PRODUCTOS 
	ADD CONSTRAINT fk_cat_prod
		FOREIGN KEY (id_cat) REFERENCES categorias(id_cat);
		
ALTER TABLE OFERTAS 
	ADD CONSTRAINT fk_ofertas_prod
		FOREIGN KEY (id_prod) REFERENCES productos(id_prod);

		
ALTER TABLE GRUPOS 
	ADD CONSTRAINT fk_grupo_lider
		FOREIGN KEY (id_lider) REFERENCES lideres(id_lider);
	
		
ALTER TABLE VENDEDORES
	ADD CONSTRAINT fk_vendedor_grupo
		FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo);
	
	
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
        SET NEW.precio_final = COALESCE(v_precio_lista * (1 - NEW.descuento / 100),0);
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

-- Inserción de datos en la tabla "clientes"
INSERT INTO clientes (dni, nombre_completo, mail, numero_tel)
VALUES
    ('12345678', 'Ana García', 'ana.garcia@gmail.com', '1122334455'),
    ('87654321', 'Carlos Martínez', 'carlos.martinez@hotmail.com', '1133557799'),
    ('23456789', 'Elena Pérez', 'elena.perez@hotmail.com', '1144667788'),
    ('34567890', 'Diego Fernández', 'diego.fernandez@gmail.com', '1155889900');
   
--  registros ficticios para la tabla "categorias"
INSERT INTO categorias (nombre_cat)
VALUES
    ('botiquin'),
    ('aromaterapia'),
    ('dermatologico'),
    ('intimo');
 
   
-- Inserción de datos en la tabla "productos"
INSERT INTO productos (nombre_prod, descripcion, id_cat, stock, precio_lista)
VALUES
    ('Crema Facial Hidratante', 'Hidratación profunda para una piel suave y radiante.', 3, 20, 15000),
    ('Aceite Esencial de Lavanda', 'Relajación y bienestar con aroma floral.', 2, 15, 5000.00),
    ('Serum Antiedad', 'Reduce arrugas y líneas de expresión. Fórmula con colágeno y ácido hialurónico.', 3, 25, 18000),
    ('Aceite de Rosa Mosqueta', 'Regeneración celular y cicatrización. Ideal para pieles sensibles.', 2, 18, 7000);

-- Inserción de datos en la tabla "ofertas"
INSERT INTO ofertas (id_prod, descuento)
VALUES
    (3, 20),
    (2, 10);
   



-- Inserción de datos en la tabla "lideres"
INSERT INTO lideres (nombre_completo, cuit)
VALUES
    ('María Rodríguez', '20123456780'),
    ('Juan Pérez', '20234567891');
    

-- Inserción de datos en la tabla "grupos"
INSERT INTO grupos (id_lider)
VALUES
    (1),
    (2);
   

-- Inserción de datos en la tabla "vendedores"
INSERT INTO vendedores (id_grupo, nombre_completo, cuit)
VALUES
    (1, 'Pedro López', '20345678902'),
    (2, 'Laura Fernández', '20456789013'),
    (1, 'Damian Arebalo', '20345776902'),
    (2, 'Sheila Gonzalez', '20446789013'),
    (1, 'Juan López', '20345788902'),
    (2, 'Abril Fernández', '20426789013');

-- Inserción de datos en la tabla "facturaciones"
INSERT INTO facturaciones (id_cliente, fecha_fact, pagado)
VALUES
    (1, '2024-04-01', TRUE),
    (2, '2024-04-05', TRUE),
    (3, '2024-04-10', TRUE),
    (4, '2024-04-15', TRUE),
    (4, '2024-04-20', TRUE),
    (2, '2024-04-25', TRUE),
    (1, CURDATE(), FALSE),
    (2, CURDATE(), FALSE),
    (3, CURDATE(), FALSE),
    (4, CURDATE(), FALSE);

-- Inserción de datos en la tabla "link_fact_producto"
INSERT INTO link_fact_producto (id_fact, id_prod, cantidad)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 3),
    (2, 4, 5),
    (3, 1, 4),
    (3, 3, 2),
    (4, 2, 1),
    (4, 4, 4),
    (5, 1, 3),
    (5, 4, 5),
    (6, 2, 2),
    (6, 3, 1),
    (7, 1, 5),
    (7, 4, 3),
    (8, 2, 3),
    (8, 3, 4),
    (9, 1, 1),
    (9, 4, 2),
    (10, 2, 4),
    (10, 3, 5);
  
-- Inserción de datos en la tabla "link_fact_vendedor"
INSERT INTO link_vendedor_fact(id_fact, id_vendedor)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 1),
    (8, 2),
    (9, 3),
    (10, 4);
   

-- DEFINICION DE VISTAS

-- Vista que liste los productos con su categoria y precio
CREATE VIEW vw_listado_productos as  
	SELECT p.id_prod, c.nombre_cat AS categoria, p.nombre_prod, p.precio_lista
	FROM productos p
		JOIN categorias c ON p.id_cat = c.id_cat;

-- vista que liste los productos disponibles (stock > 0)
CREATE VIEW vw_productos_con_stock AS 
	SELECT id_prod, nombre_prod, stock
	FROM productos
		WHERE stock > 0;

-- vista que muestre las ventas que hicieron los vendedores
CREATE VIEW vw_vendedores_facturas AS 
	SELECT 
		v.nombre_completo AS vendedor_nombre
		, lf.id_fact
		, f.total
		, (f.total * 0.2) as comision
	FROM vendedores v
		JOIN link_vendedor_fact lf ON v.id_vendedor = lf.id_vendedor
		join facturaciones f on f.id_fact = lf.id_fact;
	
-- vista que muestre el detalle completo de facturaiones (id, cliente, vendedor, productos y total)
CREATE VIEW vw_factura_detalle AS
    SELECT
    	f.id_fact,
    	MAX(c.nombre_completo) AS nombre_cliente,
    	MAX(v.nombre_completo) AS nombre_vendedor,
    	GROUP_CONCAT(p.nombre_prod SEPARATOR ', ') AS productos_involucrados,
    	SUM(lfp.total) AS total_factura
	FROM facturaciones f
	    JOIN link_fact_producto lfp ON f.id_fact = lfp.id_fact
	    JOIN productos p ON lfp.id_prod = p.id_prod
	    JOIN clientes c ON f.id_cliente = c.id_cliente
	    JOIN link_vendedor_fact lvf ON f.id_fact = lvf.id_fact
	    JOIN vendedores v ON lvf.id_vendedor = v.id_vendedor
	    GROUP BY f.id_fact;
