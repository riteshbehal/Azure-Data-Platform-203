-- Lab - Loading data - COPY command - CSV
CREATE TABLE [pool_logdata]
(
    [Correlation id] [varchar](200) NULL,
	[Operation name] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Event category] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [datetime] NULL,
	[Subscription] [varchar](200) NULL,
	[Event initiated by] [varchar](1000) NULL,
	[Resource type] [varchar](1000) NULL,
	[Resource group] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL
)

COPY INTO [pool_logdata] FROM 'https://demodatastorage120.blob.core.windows.net/csv/Log.csv'
WITH(
    FILE_TYPE='CSV',
    CREDENTIAL=(IDENTITY='Storage Account Key',SECRET='9DJochJDEGReN6SBrY9eTF0pzhNRb986r+mKontYhImFnBaTAgnACumJ9uaEh+rdCf5mgHZWnn1l+AStYTIdyQ=='),
    FIRSTROW=2)

SELECT * FROM [pool_logdata]



-- Lab - Loading data - COPY command - Parquet

CREATE TABLE [pool_logdata_parquet]
(
    [Correlationid] [varchar](200) NULL,
	[Operationname] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Eventcategory] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [varchar](500) NULL,
	[Subscription] [varchar](200) NULL,
	[Eventinitiatedby] [varchar](1000) NULL,
	[Resourcetype] [varchar](1000) NULL,
	[Resourcegroup] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL)
    
COPY INTO [pool_logdata_parquet] FROM 'https://demodatastorage120.blob.core.windows.net/parquet/log.parquet'
WITH(
    FILE_TYPE='PARQUET',
    CREDENTIAL=(IDENTITY='Storage Account Key',SECRET='vDV2bSKSR44lbE6x05HtFz57DvlK3O2WNkb11te+H+GrBjeXCojnHjiTw3KdYBWXJRSAnOAZNdgB+AStAasz8w==') )

SELECT * FROM [pool_logdata_parquet]

SELECT * FROM [logdata_parquet]