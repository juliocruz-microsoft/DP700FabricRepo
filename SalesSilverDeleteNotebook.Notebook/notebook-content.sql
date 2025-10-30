-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "synapse_pyspark"
-- META   },
-- META   "dependencies": {
-- META     "lakehouse": {
-- META       "default_lakehouse": "f396231d-91b1-48cd-a744-8d8341a3630f",
-- META       "default_lakehouse_name": "DP700Lakehouse",
-- META       "default_lakehouse_workspace_id": "d4f03fa4-f9f9-4c93-a5f1-4258420e9872",
-- META       "known_lakehouses": [
-- META         {
-- META           "id": "f396231d-91b1-48cd-a744-8d8341a3630f"
-- META         }
-- META       ]
-- META     }
-- META   }
-- META }

-- CELL ********************

delete from salessilverpipeline

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************

delete from DimProduct

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }
