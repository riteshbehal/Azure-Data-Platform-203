# Lab - Creating a temporary view


df.createOrReplaceTempView("logdata")
sqlresultset=spark.sql("SELECT * FROM logdata")
display(sqlresultset)

sqlresultset=spark.sql("SELECT Operationname, count(Operationname) FROM logdata GROUP BY Operationname")



%%sql
SELECT Operationname, count(Operationname) FROM logdata GROUP BY Operationname