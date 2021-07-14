USE AdventureWorks
GO

-- SELECT DISTINCT TYPE, type_desc FROM SYS.all_objects
SELECT * FROM SYS.all_objects WHERE  type = 'U'
SELECT * FROM SYS.schemas

SELECT S.name  ESQUEMA ,T.name [TABLA],  c.name [Columna] 
FROM SYS.tables T 
	INNER JOIN sys.schemas S on T.schema_id = S.schema_id
	INNER JOIN sys.columns  c on T.object_id = c.object_id
WHERE T.name = 'PERSON'

-- U => TABLA DE USUARIO , PARA EL DISEÑO DE LA BD
-- S TABLAS DE SISTEMA
SELECT name, object_id, schema_id, type  
FROM sys.tables 



select * from sys.columns  
-- metadata informacion propio de la bd


SELECT * FROM sys.views

SP_HELPTEXT 'SALES.SODSOH'


SELECT * FROM SYS.syscomments WHERE ID = OBJECT_ID('SALES.SODSOH')


SELECT @@VERSION AS Version_SQL;
SELECT SERVERPROPERTY('ProductVersion') as NúmeroVersion;
SELECT SERVERPROPERTY('Collation') as colation
SELECT SERVERPROPERTY('InstanceName') as Instancia;
SELECT SERVERPROPERTY('EngineEdition') as Instancia; -- 1 desktop -- 2 standar -- 3 enterprise --4 express
SELECT SCHEMA_NAME(9) AS ESQUEMA;
SELECT DB_ID('AdventureWorks') as IdBaseDatos;


SELECT * FROM SYS.databases;
SELECT * FROM SYS.master_files;


EXEC sys.sp_helpfile;
EXEC sys.sp_databases;
EXEC sys.sp_help 'Sales.Customer';
EXEC sys.sp_tables
	@table_name =  '%' , 
	@table_owner = 'Sales';