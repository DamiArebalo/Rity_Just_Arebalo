USE rityjust;



-- IMPORTANTE PARA QUE ENTIENDA QUE DEBE HACER LA IMPORTACION
SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE '/sql_project/data_csv/clientes.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/sql_project/data_csv/categorias.csv'
INTO TABLE categorias
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/sql_project/data_csv/productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/sql_project/data_csv/lideres.csv'
INTO TABLE lideres
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/sql_project/data_csv/grupos.csv'
INTO TABLE grupos
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/sql_project/data_csv/vendedores.csv'
INTO TABLE vendedores
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TEMPORARY TABLE temp_ofertas LIKE ofertas;


LOAD DATA LOCAL INFILE '/sql_project/data_csv/ofertas.csv'
INTO TABLE ofertas
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

INSERT INTO ofertas (id_oferta, id_prod, descuento, precio_final)
SELECT id_oferta, id_prod, descuento, precio_final FROM temp_ofertas;



LOAD DATA LOCAL INFILE '/sql_project/data_csv/facturaciones.csv'
INTO TABLE facturaciones
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/sql_project/data_csv/link_fact_producto.csv'
INTO TABLE link_fact_producto
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/sql_project/data_csv/link_fact_vendedor.csv'
INTO TABLE link_vendedor_fact
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;