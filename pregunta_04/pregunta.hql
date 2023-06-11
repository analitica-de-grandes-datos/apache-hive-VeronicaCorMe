/* 
Pregunta
===========================================================================

Escriba una consulta que retorne los valores únicos de la columna `t0.c5` 
(ordenados). 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.
*/


DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data0.csv' INTO TABLE tbl0;


/*
    >>> Escriba su respuesta a partir de este punto <<<
*/

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
MAP KEYS TERMINATED BY '#'
COLLECTION ITEMS TERMINATED BY ','
LINES TERMINATED BY '\n'
SELECT DISTINCT c5[0] as columna FROM tbl0 SORT BY columna;