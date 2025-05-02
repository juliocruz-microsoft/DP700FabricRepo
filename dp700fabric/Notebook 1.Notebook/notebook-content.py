# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "75bf9b4b-7678-4e1d-b0fd-db6d3fff36ca",
# META       "default_lakehouse_name": "dp700lakehouse",
# META       "default_lakehouse_workspace_id": "b6578471-9d1d-403f-8365-a7a3b1d6177e",
# META       "known_lakehouses": [
# META         {
# META           "id": "75bf9b4b-7678-4e1d-b0fd-db6d3fff36ca"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# ATTENTION: AI-generated code can include errors or operations you didn't intend. Review the code in this cell carefully before running it.

# Importing or Reading a CSV into a Spark DataFrame:
file_path = 'Files/'
file_name = 'sales.csv'

spark_df = spark.read.format("csv").option("header", "true").load(file_path + file_name)
display(spark_df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
