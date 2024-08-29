-- Inserción de datos en la tabla "clientes"
INSERT INTO clientes (dni, nombre_completo, mail, numero_tel)
VALUES
    ('12345678', 'Ana García', 'ana.garcia@gmail.com', '1122334455'),
    ('87654321', 'Carlos Martínez', 'carlos.martinez@hotmail.com', '1133557799'),
    ('23456789', 'Elena Pérez', 'elena.perez@hotmail.com', '1144667788'),
    ('34567890', 'Diego Fernández', 'diego.fernandez@gmail.com', '1155889900'),
    ('98765432', 'Sofía Rodríguez', 'sofia.rodriguez@gmail.com', '1166778899'),
    ('87654321', 'Mateo López', 'mateo.lopez@hotmail.com', '1177889900'),
    ('76543210', 'Valentina Gómez', 'valentina.gomez@gmail.com', '1188990011'),
    ('65432109', 'Benjamín Torres', 'benjamin.torres@hotmail.com', '1199001122'),
    ('54321098', 'Isabella Sánchez', 'isabella.sanchez@gmail.com', '1100112233'),
    ('43210987', 'Santiago Ramírez', 'santiago.ramirez@hotmail.com', '1111223344'),
    ('32109876', 'Emma Flores', 'emma.flores@gmail.com', '1122334456'),
    ('21098765', 'Sebastián Castro', 'sebastian.castro@hotmail.com', '1133445566'),
    ('10987654', 'Olivia Ortiz', 'olivia.ortiz@gmail.com', '1144556677'),
    ('09876543', 'Nicolás Morales', 'nicolas.morales@hotmail.com', '1155667788'),
    ('98765432', 'Martina Ríos', 'martina.rios@gmail.com', '1166778899'),
    ('87654321', 'Emiliano Vargas', 'emiliano.vargas@hotmail.com', '1177889900'),
    ('76543210', 'Renata Silva', 'renata.silva@gmail.com', '1188990011'),
    ('65432109', 'Thiago Mendoza', 'thiago.mendoza@hotmail.com', '1199001122'),
    ('54321098', 'Antonella Rojas', 'antonella.rojas@gmail.com', '1100112233');
 
   
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
    ('Aceite de Rosa Mosqueta', 'Regeneración celular y cicatrización. Ideal para pieles sensibles.', 2, 18, 7000),
    ('Gel Limpiador Facial', 'Limpieza profunda y suave para todo tipo de piel.', 3, 30, 12000),
    ('Champú de Hierbas', 'Fortalece el cabello y previene la caída.', 1, 22, 9000),
    ('Jabón de Caléndula', 'Suavidad y cuidado para la piel.', 1, 40, 6000),
    ('Aceite de Almendras', 'Hidratación y nutrición para la piel.', 2, 28, 7500),
    ('Crema para Manos', 'Protege y suaviza la piel de las manos.', 3, 15, 8000),
    ('Bálsamo Labial', 'Hidratación y protección para los labios.', 4, 50, 3500),
    ('Mascarilla de Arcilla', 'Limpieza profunda y desintoxicación para la piel.', 3, 25, 13000),
    ('Aceite Esencial de Menta', 'Refrescante y energizante. Ideal para aromaterapia.', 2, 20, 6000),
    ('Crema Antiarrugas', 'Combate los signos del envejecimiento. Con retinol y vitamina E.', 3, 15, 22000),
    ('Jabón de Aloe Vera', 'Hidratante y calmante para todo tipo de piel.', 1, 35, 5500),
    ('Aceite de Jojoba', 'Hidratación profunda para piel y cabello.', 2, 18, 8500),
    ('Loción Corporal', 'Hidratación intensa para todo el cuerpo.', 3, 30, 11000),
    ('Exfoliante Facial', 'Renovación celular para una piel más suave y luminosa.', 3, 22, 14000),
    ('Aceite Esencial de Eucalipto', 'Descongestivo y purificante. Ideal para masajes.', 2, 25, 7000),
    ('Crema para Contorno de Ojos', 'Reduce ojeras y líneas de expresión.', 4, 20, 16000),
    ('Gel de Aloe Vera', 'Multiusos: hidratante, calmante y regenerador.', 1, 40, 9000),
    ('Aceite de Argán', 'Nutrición intensa para piel y cabello.', 2, 15, 12000),
    ('Protector Solar Facial', 'Alta protección UVA/UVB. Textura ligera.', 3, 25, 18000),
    ('Champú Sólido', 'Ecológico y libre de sulfatos. Para todo tipo de cabello.', 1, 30, 7500),
    ('Aceite Esencial de Tea Tree', 'Propiedades antibacterianas y purificantes.', 2, 20, 6500),
    ('Sérum de Vitamina C', 'Iluminador y antioxidante para una piel radiante.', 3, 18, 20000);

-- Inserción de datos en la tabla "ofertas"
INSERT INTO ofertas (id_prod, descuento)
VALUES
    (3, 20),
    (6, 30),
    (4, 0),
    (2, 10),
    (5, 15),
    (7, 25),
    (8, 10),
    (10, 20),
    (11, 15),
    (12, 30),
    (13, 5),
    (14, 10),
    (15, 20),
    (16, 15),
    (17, 25),
    (18, 10),
    (19, 20),
    (20, 15),
    (21, 30);
   



-- Inserción de datos en la tabla "lideres"
INSERT INTO lideres (nombre_completo, cuit)
VALUES
    ('María Rodríguez', '20123456780'),
    ('Juan Pérez', '20234567891'),
    ('Luciana Fernández', '20567890123'),
    ('Tomás González', '20678901234'),
    ('Camila Martínez', '20789012345');
    

-- Inserción de datos en la tabla "grupos"
INSERT INTO grupos (id_lider)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5);
   

-- Inserción de datos en la tabla "vendedores"
INSERT INTO vendedores (id_grupo, nombre_completo, cuit)
VALUES
    (1, 'Pedro López', '20345678902'),
    (2, 'Laura Fernández', '20456789013'),
    (1, 'Damian Arebalo', '20345776902'),
    (2, 'Sheila Gonzalez', '20446789013'),
    (1, 'Juan López', '20345788902'),
    (2, 'Abril Fernández', '20426789013'),
    (1, 'Valentín Acosta', '20890123456'),
    (1, 'Martina Blanco', '20901234567'),
    (1, 'Lautaro Cabrera', '20012345678'),
    (2, 'Zoe Díaz', '20123456789'),
    (2, 'Benjamín Escobar', '20234567890'),
    (2, 'Alma Figueroa', '20345678901'),
    (3, 'Ignacio Giménez', '20456789012'),
    (3, 'Mía Hernández', '20567890123'),
    (3, 'Felipe Ibáñez', '20678901234'),
    (4, 'Emilia Jiménez', '20789012345'),
    (4, 'Mateo Keller', '20890123456'),
    (4, 'Sofía Luna', '20901234567'),
    (5, 'Dante Moreno', '20012345678'),
    (5, 'Olivia Navarro', '20123456789'),
    (5, 'Santino Ortega', '20234567890'),
    (1, 'Renata Pacheco', '20345678901'),
    (2, 'Thiago Quintana', '20456789012'),
    (3, 'Isabella Romero', '20567890123');

-- Inserción de datos en la tabla "facturaciones"
INSERT INTO facturaciones (id_cliente, fecha_fact, pagado)
VALUES
    (1, '2024-04-02', TRUE),
    (2, '2024-04-06', TRUE),
    (3, '2024-04-10', TRUE),
    (4, '2024-04-15', TRUE),
    (13, '2024-04-20', TRUE),
    (2, '2024-04-25', TRUE),
    (1, CURDATE(), FALSE),
    (2, CURDATE(), FALSE),
    (3, CURDATE(), FALSE),
    (4, CURDATE(), FALSE),
    (1, '2024-05-01', TRUE),
    (2, '2024-05-05', TRUE),
    (3, '2024-05-10', TRUE),
    (4, '2024-05-15', TRUE),
    (4, '2024-05-20', TRUE),
    (5, '2024-05-25', TRUE),
    (6, '2024-05-30', TRUE),
    (7, '2024-06-05', TRUE),
    (8, '2024-06-10', TRUE),
    (9, '2024-06-15', FALSE),
    (10, '2024-06-20', TRUE),
    (11, '2024-06-25', TRUE),
    (12, '2024-06-30', FALSE);

   


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
    (10, 3, 5),
    (11, 1, 2),
    (12, 2, 1),
    (13, 3, 3),
    (14, 4, 5),
    (15, 1, 4),
    (16, 5, 2),
    (16, 7, 1),
    (17, 8, 3),
    (17, 10, 2),
    (18, 11, 1),
    (18, 13, 2),
    (19, 14, 3),
    (19, 16, 1),
    (20, 17, 2),
    (20, 19, 1),
    (21, 20, 3),
    (21, 21, 2),
    (22, 6, 1),
    (22, 9, 2),
    (23, 12, 3);
  
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
    (10, 4),
    (11, 1),
    (12, 2),
    (13, 3),
    (14, 4),
    (15, 5),
    (16, 7),
    (17, 8),
    (18, 9),
    (19, 10),
    (20, 11),
    (21, 12),
    (22, 13),
    (23, 14);
