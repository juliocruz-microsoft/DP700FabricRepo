# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "9a97952e-4e14-408c-845b-ffed212b1166",
# META       "default_lakehouse_name": "Lakehouse2",
# META       "default_lakehouse_workspace_id": "f4c64c38-a2d7-4202-a9d7-0a5cea3bc8ee",
# META       "known_lakehouses": [
# META         {
# META           "id": "9a97952e-4e14-408c-845b-ffed212b1166"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

df = spark.read.format("csv").option("header","true").load("Files/Bronze/moviesbrasil.csv")
# df now is a Spark DataFrame containing CSV data from "Files/Bronze/moviesbrasil.csv".
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

moviesdf = df.select("year","title","genres")
display(moviesdf)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

moviesdf.write.mode("overwrite").parquet('Files/Silver')

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

moviesdf.write.format("delta").saveAsTable("moviessilver")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
