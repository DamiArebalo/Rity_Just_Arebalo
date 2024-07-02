# <center>Primer Entrega </center>
@Damian Carlos Arebalo



---

### **Consignas:**
- La base de datos debe contener al menos:
    * ~ 15 tablas, entre las cuales debe haber al menos 1 tabla de hechos,  2 tablas transaccionales.
    * ~ 5 vistas.
    * ~ 2 stored procedure.
    * ~ 2  trigger.
    * ~ 2 funciones
    
- El documento debe contener:
    - Introducción
    - Objetivo
    - Situación problemática
    - Modelo de negocio
    - Diagrama de entidad relació
    - Listado de tablas con descripción de estructura (columna,descripción, tipo de datos, tipo de clave)
    - Scripts de creación de cada objeto de la base de datos
    - Scripts de inserción de datos
    - Informes generados en base a la información de la base
    - Herramientas y tecnologías usadas



---

## Tematica del proyecto
La tematica de esta base de datos esta pensada en el negocio de ventas de productos JUST que tiene mi madre, el cual tiene un programa de grupos tambien para tener registro y comisiones de ventas
## Modelo de negocio

1. **Reserva de Productos**: Creamos una base de datos que nos permita registrar la información de los productos su categoria y atributos asi como actualizar el stock disponible.

2. **Registro de Facturaciones**: Esta DB da la posibilidad de registrar los productos facturados por un cliente y la informacion del vendedor que se encargo de esta venta

3. **Control de Equipos**: La base de datos debe permitirnos registrar la informacion de equipos de ventas, con sus lideres y vendedores

4. **Registro de Clientes**: La DB registra correctamente los datos de los clientes que compran productos


## Diagrama entidad relacion (DER)


```

+-------------+
| Categorias  |
+-------------+
| ID_Cat PK   |
|  Nombre     |
+-------------+
        |
+-------------------+       +-------------+       +-----------------+      
|   PRODUCTOS       |       |LINK_PROD_FACT       |  FACTURACIONES  |      
+-------------------+       +-------------+       +-----------------+      
| IDPRODUCTO PK     |       | IDCLIENTE PK|       | ID_FACT PK      |     +-----------------+
| ID_CAT FK         |<------|             |<------|                 |     |    CLIENTES     |
| DESCRIPCION       |<------|             |       | ID_CLIENTE FK   |     +-----------------+
| NOMBRE_PROD       |<------|  STATUS     |       | TOTAL           |     | ID_CLIENTE  PK  |  
| STOCK             |<------| FECHA_ALTA  |       | FECHA_FACT      |<----| DNI PK          |
| PRECIO_LISTA      |       |   NOMBRE    |       | PAGADO          |     | NOMBRE_COMPLETO |
|                   |       |  TELEFONO   |       |                 |     | MAIL            | 
+-------------------+       |   CORREO    |       |                 |     | NUM_TELEFONO    |
                            +-------------+       +-------------    +     +-----------------+
                                                         |
                                                         |
                                                    +----------------+       +-----------------+       +-------------------+       +-------------------+
                                                    |LINK_FACT_VEND  |       | VENDEDORES      |       | GRUPO             |       | LIDERES           |
                                                    +----------------+       +-----------------+       +-------------------+       +-------------------+
                                                    | ID_FACT PK     |       | ID_VENDEDOR_ PK |       | IDGRUPO PK        |       | IDLIDER PK        |
                                                    | ID_VENDEDOR PK |-----> | ID_GRUPO_ FK    |<------| IDLIDER FK        |-----> | NOMBRE_COMPLETO   |
                                                    +----------------+       | NOMBRE          |       |                   |       | CUIT              |
                                                                             | CUIT            |       |                   |       +-------------------+
                                                                             |                 |       +-------------------+       
                                                                             |                 |                                   
                                                                             +-----------------+                                 

```



## Listado de tablas y descripcion

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |-------------------------------------: |
| PRODUCTOS     | ID_PRODUCTO       | INT   NOT NULL                        |
|               | ID_CAT            | INT   NOT NULL                        |
|               | DESCRIPCION       | VARCHAR(150)                          |
|               | NOMBRE_PROD       | VARCHAR(70)  NOT NULL                 |
|               | STOCK             | INT   NOT NULL                        |
|               | PRECIO_LISTA      | DECIMAL(12,2) NOT NULL                |




| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| CLIENTES      | IDCLIENTE         | INT  NOT NULL                         |
|               | NOMBRE            | VARCHAR(100) DEFAULT 'ANONYMUS'       |
|               | TELEFONO          | VARCHAR(20) NOT NULL                  |
|               | CORREO            | VARCHAR(100) UNIQUE NOT NULL          |
|               | DNI               | VARCHAR (8) NOT NUL 


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| VENDEDORES    | ID_VENDEDOR       | INT  NOT NULL                         |
|               | NOMBRE            | VARCHAR(100) NOT NULL                 |
|               | CUIT              | VARCHAR(11) NOT NULL                  |
|               | ID_GRUPO          | INT  NOT NULL                         |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| GRUPOS        | ID_GRUPO          | INT  NOT NULL                         |
|               | ID_LIDER          | INT NOT NULL                          |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| categorias    | ID_Cat            | INT   NOT NULL                        |
|               | NOMBRE            | VARCHAR(70)                           |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| LIDERES       | ID_LIDER          | INT  NOT NULL                         |
|               | NOMBRE            | VARCHAR(100) NOT NULL                 |
|               | CUIIT             | VARCHAR(11) NOT NULL                  |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| LINK_FACT_VEND| ID_FACT           | INT NOT NULL                          |
|               | ID_VENDEDOR       | INT NOT NULL                          |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| LINK_FACT_PROD| ID_FACT           | INT NOT NULL                          |
|               | ID_VENDEDOR       | INT NOT NULL                          |
|               | CANTIDAD          | INT NOT NULL  DEFAULT(1)              |
|               | TOTAL             | DECIMAL(10,2)                         |




## Objetos de la base de datos


### Documentacion de Vistas
### Vista: vw_listado_productos

**Descripción:** Esta vista lista los productos con su categoria y precio

**Columnas:**

* **Categoria:** categoria del producto
* **Nombre_Producto:** Nombre del producto
* **Precio de Lista:** precio del producto

**Ejemplo de consulta:**

```sql
SELECT * FROM vw_listado_productos;
```

### Vista: vw_productos_con_stock

**Descripción:** Esta vista muestra los productos que estan disponibles // que tiene stock mayor a 0

**Columnas:**

* **ID_Prod:** Identificador único de los productos
* **Nombre_Producto:** NOmbre del producto
* **Stock:** Número de stock

**Ejemplo de consulta:**

```sql
SELECT * FROM vw_productos_con_stock
ORDER BY stock DESC;
```

### Vista: vw_vendedores_facturas

**Descripción:** Esta vista muestra el registro de ventas hecchas por cada vendedor junto a su comision

**Columnas:**

* **Nombre_Vendedor:** Muestra el nombre del vendedor
* **id_fact:** identificador unico de factura
* **total:** Total de la factura
* **comision:** Comision del 20% sobre el total de la factura

**Ejemplo de consulta:**

```sql
SELECT * FROM vw_vendedores_facturas
ORDER BY comision DESC;
```

### Vista: vw_factura_detalle

**Descripción:** Esta vista muestra todos los datos referidos a las facturas
**Columnas:**

* **Id_Factura:** Identificador unico de factura
* **nombre_cliente:** nombre del cliente involucrado
* **nombre_vendedor:** nombre del vendedor involucrado
* **productos_involucrados:** concatenacion de los productos facturados 
* **total_factura:** precio total de la factura

**Ejemplo de consulta:**

```sql
SELECT * FROM vw_vw_factura_detalle
ORDER BY total_factura DESC;
```


## Documentación de Triggers

### Trigger: trg_ofertas_calcula_precio_final

**Descripción:** Este trigger calcula el precio final de los producto que tengan un porcentaje de descuento activo solo si tienen descuento

**Detalles:**

* **Tabla afectada:** OFERTAS
* **Acción:** SET // CALCULO
* **Información registrada:** Descuento, Precio_lista, Precio_final

**Ejemplo:**

* Se inserta una nueva oferta para productos seleccionados.
* El trigger toma el precio de lsita de cada producto y le saca el porcentaje indicado en el numero registrado en el campo descuento.

### Trigger: trg_calcula_total

**Descripción:** Este trigger calcula el total de cada producto facturado teniendo en cuenta la cantidad que se esta comprando Y SI TIENE OFERTA O NO.

**Detalles:**

* **Tabla afectada:** LINK_FACT_PRODUCTO
* **Acción:** SET // CALCULO
* **Información registrada:**  ID_PRODUCTO, PRECIO_FINAL//PRECIO_LISTA , CANTIDAD, TOTAL
**Ejemplo:**

* Se agrega una nueva factura y relacion de productos.
* Si el producto elejido tiene precio de oferta se toma ese precio, si no el precio de lista, multiplica ese precio por la cantidad y setea el total de cada producto en cada factura

### Trigger: calcula_total_facturas

**Descripción:** Este trigger calcula el total de cada factura

**Detalles:**

* **Tabla afectada:** FACTURACIONES
* **Acción:** UPDATE
* **Información registrada:**  ID_FACT, TOTAL

**Ejemplo:**

* SE Genera las relaciones nuevas de facturacion y productos
* El trigger toma el total de todos los pruductos en una misma factura y los suma para obtener el total.


## Herramientas y tecnologias usadas
* MySQL (Motor de bases de datos )
* Dbeaver (Interfaz grafica)
* Microsoft Copilot (para automatizar el script de ingreso de datos ficticios)
  
