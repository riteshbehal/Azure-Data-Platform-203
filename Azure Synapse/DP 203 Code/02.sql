-- Lab - External Tables - Parquet file

-- If we need to drop the existing artefacts

DROP EXTERNAL TABLE [logdata]

DROP EXTERNAL DATA SOURCE log_data

DROP DATABASE SCOPED CREDENTIAL SasToken

-- Then we can recreate the required credentials

CREATE DATABASE SCOPED CREDENTIAL SasToken
WITH IDENTITY='SHARED ACCESS SIGNATURE'
, SECRET = 'sv=2022-11-02&ss=b&srt=sco&sp=rwd&se=2024-03-31T13:12:23Z&st=2024-03-31T05:12:23Z&spr=https&sig=ybtnbcrlN18SFSP%2FheD8EjnH798RhE%2BBsfuiqXLm0mI%3D'


CREATE EXTERNAL DATA SOURCE log_data_parquet
WITH (    LOCATION   = 'https://sqlstorage1010.blob.core.windows.net/parquet',
          CREDENTIAL = SasToken
)

CREATE EXTERNAL FILE FORMAT parquetfile  
WITH (  
    FORMAT_TYPE = PARQUET,  
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'  
);

-- Here we define the external table


CREATE EXTERNAL TABLE [log_data_parquet]
(
    [Correlation id] [varchar](200) NULL,
	[Operation name] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Event category] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [varchar](500) NULL,
	[Subscription] [varchar](200) NULL,
	[Eventinitiated by] [varchar](1000) NULL,
	[Resource type] [varchar](1000) NULL,
	[Resource group] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL)
WITH (
 LOCATION = '/log.parquet',
    DATA_SOURCE = log_data_parquet,  
    FILE_FORMAT = parquetfile
)

SELECT * FROM [log_data_parquet]

-- Then we will get the error

-- Column 'Time' of type 'DATETIME' is not compatible with external data type 'Parquet physical type: BYTE_ARRAY, logical type: UTF8', please try with 'VARCHAR(8000)'. File/External table name: 'logdata_parquet'.

-- This is because when I converted the CSV file where everything is a string
-- Its also put it as a string in parquet based file.

CREATE EXTERNAL TABLE [logdata_parquet]
(
    [Correlationid] [varchar](200) NULL,
	[Operationname] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Eventcategory] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [varchar](500) NULL,
	[Subscription] [varchar](200) NULL,
	[Event initiated by] [varchar](1000) NULL,
	[Resourcetype] [varchar](1000) NULL,
	[Resourcegroup] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL)
WITH (
 LOCATION = '/log.parquet',
    DATA_SOURCE = log_data_parquet,  
    FILE_FORMAT = parquetfile
)



SELECT [Operationname] , COUNT([Operationname]) as [Operation Count]
FROM [log_data_parquet]
GROUP BY [Operationname]
ORDER BY [Operation Count]


-- Lab - External Tables - Multiple Parquet files


DROP EXTERNAL TABLE [log_data_parquet]

CREATE EXTERNAL TABLE [log_data_parquet]
(
    [Correlationid] [varchar](200) NULL,
	[Operationname] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Eventcategory] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [varchar](500) NULL,
	[Subscription] [varchar](200) NULL,
	[Event initiated by] [varchar](1000) NULL,
	[Resourcetype] [varchar](1000) NULL,
	[Resourcegroup] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL)
WITH (
 LOCATION = '/',
    DATA_SOURCE = log_data_parquet,  
    FILE_FORMAT = parquetfile
)

SELECT * FROM [log_data_parquet]