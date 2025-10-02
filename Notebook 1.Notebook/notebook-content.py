# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "557bcfcd-744d-4a21-a76c-98d7672aadd0",
# META       "default_lakehouse_name": "DP700Lakehouse",
# META       "default_lakehouse_workspace_id": "f371512d-3806-4888-9fc4-a407e39710ae",
# META       "known_lakehouses": [
# META         {
# META           "id": "557bcfcd-744d-4a21-a76c-98d7672aadd0"
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

df = spark.read.format("csv").option("header","true").load("Files/bronze/salesbronze.csv")
# df now is a Spark DataFrame containing CSV data from "Files/bronze/salesbronze.csv".
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
