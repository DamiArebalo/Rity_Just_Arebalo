LOAD DATA INFILE '/sql_project/data_csv/clientes.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/sql_project/data_csv/categorias.csv'
INTO TABLE categorias
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/sql_project/data_csv/productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/sql_project/data_csv/lideres.csv'
INTO TABLE lideres
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/sql_project/data_csv/grupos.csv'
INTO TABLE grupos
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/sql_project/data_csv/vendedores.csv'
INTO TABLE vendedores
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/sql_project/data_csv/facturaciones.csv'
INTO TABLE facturaciones
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/sql_project/data_csv/link_fact_producto.csv'
INTO TABLE link_fact_producto
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/sql_project/data_csv/link_vendedor_fact.csv'
INTO TABLE link_vendedor_fact
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;

