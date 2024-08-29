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
	,PRIMARY KEY (id_cliente) COMMENT 'clave conformada por id_cliente'

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
	,precio_final DECIMAL(10,2) NOT NULL DEFAULT(0) COMMENT 'campo calculable con funcion'
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

CREATE TABLE IF NOT EXISTS log_ofertas (
    id_oferta INT AUTO_INCREMENT PRIMARY KEY,
    id_prod INT,
    precio_lista DECIMAL(10,2),
    descuento DECIMAL(5,2),
    precio_final DECIMAL(10,2),
    tiempo TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)COMMENT 'TABLA PARA LA GESTION DE ERRORES EN EL CALCULO DE DATOS';

CREATE TABLE IF NOT EXISTS log_errores (
    id_error INT AUTO_INCREMENT PRIMARY KEY,
    error_message VARCHAR(100),
	error_details VARCHAR(255),
    error_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)COMMENT 'TABLA PARA LA GESTION DE ERRORES GUARDA LAS ALERTAS Y LA HORA EN LA QUE SE EFECTUA';

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
		
ALTER TABLE facturaciones 
	ADD CONSTRAINT fk_fact_cl
		FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);
	
		
ALTER TABLE productos 
	ADD CONSTRAINT fk_cat_prod
		FOREIGN KEY (id_cat) REFERENCES categorias(id_cat);
		
ALTER TABLE ofertas 
	ADD CONSTRAINT fk_ofertas_prod
		FOREIGN KEY (id_prod) REFERENCES productos(id_prod);

		
ALTER TABLE grupos 
	ADD CONSTRAINT fk_grupo_lider
		FOREIGN KEY (id_lider) REFERENCES lideres(id_lider);
	
		
ALTER TABLE vendedores
	ADD CONSTRAINT fk_vendedor_grupo
		FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo);
	