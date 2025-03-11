# Test-MySQL-II
## Consideraciones importantes
- Se añadió la línea `SET foreign_key_checks = 0;` a dml.sql (principio del archivo)
- Se borraron las siguientes líneas de dml.sql:
  ```
  SET SQL_MODE=@OLD_SQL_MODE;
  SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
  SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
  ```
  (final del archivo)
## Examen del módulo MySQL II
### Descripción del proyecto
Se ha pedido una base de datos que permita llevar control de varias acciones de gestión de una tienda de alquiler de películas, como registrar ventas e inventariar películas.

### Requisitos del sistema
- Tener instalado MySQL (MySQL Server) versión 8 o superior
- Cliente de MySQL Workbench o DBeaver
- Mínimo 4 GB de RAM
- Mínimo 50 MB de almacenamiento disponible

### Instalación y Configuaración
1. Desde la terminal
  - Pase el archivo DDL y DML (en ese orden) a una conexión de MySQL
2. Importar en  cliente de MySQL
  - Importe los archivos DDL y DML (en ese orden) a una conexión de MySQL
3. Copiando y pegsando los scripts
  - Genere un script en su cliente de MySQL con una conexión funcional
  - Copie y pegue el contenido de los archivos DDL y DML en un script para cada uno
  - Ejecute los archivos en su cliente
