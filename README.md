# <center>Primer Entrega </center>
@Carlos Damian Arebalo



---

## Tematica del proyecto
¡Bienvenidos al repositorio de la base de datos "Rity Just"! Esta base de datos respalda el negocio de ventas de productos JUST, dirigido por mi propia Madre. Desde el almacen de productos, hasta el registro de facturaciones y el control de equipos de ventas, "Rity Just" abarca todos los aspectos necesarios para gestionar eficientemente  y darle un respiro a esos registros manuales con los que actualmente se maneja el negocio.

## OBJETIVOS DE LA BASE DE DATOS

1. **Almacen de Productos**: Registramos la información de los productos con su categoria y atributos asi como actualizar el stock disponible.

2. **Registro de Facturaciones**: Esta DB da la posibilidad de registrar los productos facturados por un cliente y la informacion del vendedor que se encargo de esta venta

3. **Control de Equipos**: Permitirnos registrar la informacion de GRUPOS de ventas, con sus lideres y vendedores

4. **Registro de Clientes**: Almacena eficientemente los datos de los clientes que previo a la compra de productos registran sus datos en la web


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

## DER SIMPLIFICADO
![Logo de mi proyecto](https://github.com/DamiArebalo/Rity_Just_Arebalo/blob/main/Assets/DER_Final.png?raw=true)


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
| CATEGORIAS    | ID_Cat            | INT   NOT NULL                        |
|               | NOMBRE            | VARCHAR(70)                           |


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


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| OFERTAS       | ID_OFERTA         | INT NOT NULL AI                       |
|               | ID_PROD           | INT NOT NULL                          |
|               | DESCUENTO         | INT NOT NULL  DEFAULT(0)              |
|               | PRECIO_FINAL      | DECIMAL(10,2) NOT NULL DEFAULT(0)     |

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| lOG_OFERTAS   | ID_OFERTA         | INT NOT NULL AI                       |
|               | ID_PROD           | INT                                   |
|               | DESCUENTO         | INT                                   |
|               | PRECIO_LISTA      | DECIMAL(10,2)                         |
|               | PRECIO_FINAL      | DECIMAL(10,2)                         |
|               | TIEMPO            | TIMESTAMP DEFAULT CURRENT_TIMESTAMP   |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| lOG_ERRORES   | ID_ERROR          | INT NOT NULL AI                       |
|               | ERROR_MESSAGE     | INT                                   |
|               | ERROR_TIME        | TIMESTAMP DEFAULT CURRENT_TIMESTAMP   |

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
-- Obtener los productos con stock mayor a 20 y su precio de lista
SELECT nombre_prod, precio_lista
FROM vw_productos_con_stock
WHERE Stock > 20;
```

### Vista: vw_vendedores_facturas

**Descripción:** Esta vista muestra el registro de ventas hechas por cada vendedor junto a su comision

**Columnas:**

* **Nombre_Vendedor:** Muestra el nombre del vendedor
* **id_fact:** identificador unico de factura
* **total:** Total de la factura
* **comision:** Comision del 20% sobre el total de la factura

**Ejemplo de consulta:**

```sql
-- Obtener las facturas con comisión superior a $500
SELECT id_fact, nombre_vendedor, comision
FROM vw_vendedores_facturas
WHERE comision > 500
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
-- Obtener los detalles de las facturas que incluyen el producto "Serum Antiedad"
SELECT Id_Factura, nombre_cliente, productos_involucrados, total_factura
FROM vw_factura_detalle
WHERE productos_involucrados LIKE '%Serum Antiedad%';
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
* El trigger toma el precio de lista de cada producto y le saca el porcentaje indicado en el numero registrado en el campo descuento.

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


# Documentación de Procedimientos Almacenados

## Procedimiento Almacenado: `actualizarTotalFactura`

**Descripción:** Este procedimiento calcula y actualiza el total de una factura en la tabla `facturaciones` a partir de los totales de los productos facturados.

**Parámetros:**
- `idFactura`: El identificador único de la factura.

**Ejemplo de uso:**

```sql
-- Llamar al procedimiento para actualizar el total de la factura con ID 123
CALL actualizarTotalFactura(5);
```

# Documentación de Procedimientos Almacenados

## Procedimiento Almacenado: `actualizarStock`

**Descripción:** Este procedimiento actualiza el stock de productos agregando una cantidad específica.

**Parámetros:**
- `cantidadNueva`: La cantidad a agregar al stock existente.

**Ejemplo de uso:**

```sql
-- Llamar al procedimiento para aumentar el stock en 50 unidades
CALL actualizarStock(50);
```

# Documentación de Procedimientos Almacenados

## Procedimiento Almacenado: `actualizarStockSolo`

**Descripción:** Este procedimiento actualiza el stock de productos específicos (filtrados por nombre) agregando una cantidad determinada.

**Parámetros:**
- `nombreProducto`: El nombre (o parte del nombre) del producto a actualizar.
- `cantidadNueva`: La cantidad a agregar al stock existente.

**Ejemplo de uso:**

```sql
-- Llamar al procedimiento para aumentar el stock del producto "Serum Antiedad" en 10 unidades
CALL actualizarStockSolo('Serum Antiedad', 10);
```
# Documentación de Funciones

## Función: `calcularPrecioFinal`

**Descripción:** Esta función calcula el precio final de un producto aplicando un porcentaje de descuento al precio de lista.

**Parámetros:**
- `precioLista`: El precio de lista del producto.
- `porcentajeDescuento`: El porcentaje de descuento a aplicar.

**Ejemplo de uso:**

```sql
-- Calcular el precio final con un descuento del 20% para un producto con precio de lista $100
SELECT calcularPrecioFinal(100, 20); -- Devuelve 80.00
```

# Documentación de Funciones

## Función: `obtenerPrecioLista`

**Descripción:** Esta función obtiene el precio de lista de un producto específico.

**Parámetros:**
- `id_producto`: El identificador único del producto.

**Ejemplo de uso:**

```sql
-- Obtener el precio de lista del producto con ID 456
SELECT obtenerPrecioLista(456); -- Devuelve el precio de lista correspondiente
```

## Como correr mi codigo
1. crear un codespace y situarse dentro de la carpeta del proyecto
2. en la terminal colocar el comando --> make
3. disfrutar la base de datos

## Herramientas y tecnologias usadas
* MySQL (Motor de bases de datos )
* Dbeaver (Interfaz grafica)
* Microsoft Copilot (para automatizar el script de ingreso de datos ficticios)
  
----------------------

