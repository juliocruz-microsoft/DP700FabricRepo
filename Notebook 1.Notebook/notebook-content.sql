-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "synapse_pyspark"
-- META   },
-- META   "dependencies": {
-- META     "lakehouse": {
-- META       "default_lakehouse": "205ba6be-8085-4895-b4bb-62bcadab21bc",
-- META       "default_lakehouse_name": "Lakehouse",
-- META       "default_lakehouse_workspace_id": "f4c64c38-a2d7-4202-a9d7-0a5cea3bc8ee",
-- META       "known_lakehouses": [
-- META         {
-- META           "id": "205ba6be-8085-4895-b4bb-62bcadab21bc"
-- META         }
-- META       ]
-- META     }
-- META   }
-- META }

-- CELL ********************

CREATE TABLE managed_default
  (width INT, length INT, height INT);

INSERT INTO managed_default
VALUES (3 INT, 2 INT, 1 INT)

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

describe detail managed_default

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

CREATE TABLE external_default
  (width INT, length INT, height INT)
LOCATION 'Files/external_default';
  
INSERT INTO external_default
VALUES (3 INT, 2 INT, 1 INT)

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

describe detail external_default

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

select * from managed_default

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

select * from external_brasil

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

drop TABLE managed_default

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

drop table external_default

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

CREATE TABLE external_brasil
  (width INT, length INT, height INT)
LOCATION 'Files/external_default';

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- MARKDOWN ********************

-- Celula nova
