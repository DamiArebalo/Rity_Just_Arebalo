USE rityjust;

-- IMPORTANTE PARA QUE ENTIENDA QUE DEBE HACER LA IMPORTACION
SET GLOBAL local_infile = true;


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
    (2, 10),
    (1, 0);
   



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

    
   
