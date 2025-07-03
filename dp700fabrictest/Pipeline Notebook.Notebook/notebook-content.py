# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "0f78f23a-f988-4b09-83ef-8e8d78365ee5",
# META       "default_lakehouse_name": "DP700Lakehouse",
# META       "default_lakehouse_workspace_id": "974b8581-b727-4568-b089-5b5ae591912b",
# META       "known_lakehouses": [
# META         {
# META           "id": "0f78f23a-f988-4b09-83ef-8e8d78365ee5"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

table_name="FactSales"

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

from pyspark.sql.functions import *

# Read the new sales data
df = spark.read.format("csv").option("header","true").load("Files/bronze/sales.csv")

## Add month and year columns
df = df.withColumn("Year", year(col("OrderDate"))).withColumn("Month", month(col("OrderDate")))

# Derive FirstName and LastName columns
df = df.withColumn("FirstName", split(col("CustomerName"), " ").getItem(0)).withColumn("LastName", split(col("CustomerName"), " ").getItem(1))

# Filter and reorder columns
df = df["SalesOrderNumber", "SalesOrderLineNumber", "OrderDate", "Year", "Month", "FirstName", "LastName", "EmailAddress", "Item", "Quantity", "UnitPrice", "TaxAmount"]

# Load the data into a table
df.write.format("delta").mode("append").saveAsTable(table_name)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
