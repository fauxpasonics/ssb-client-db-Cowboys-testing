SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




/*****	Revision History

DCH on 2017-08-16	-	Sproc creation.  The purpose of this sproc is to replace a character(s) in all char columns of the requested table.

*****/


CREATE PROCEDURE [dbo].[ReplaceChar]
(
	@SchemaName		nvarchar(50),
	@TableName		nvarchar(100),
	@CharToReplace	nvarchar(50),
	@NewChar		nvarchar(50)
)
AS
BEGIN


DECLARE @SQLStatement	nvarchar(MAX) = NULL,
		@ColumnName		nvarchar(100) = NULL,
		@RowCounter		int = 1,
		@MaxRowNum		int = 1,
		@EndingChar		char(1) = NULL;


--	ensure that parameters are valid
IF NOT EXISTS (select * from sys.schemas where name = @SchemaName)
OR NOT EXISTS (select * from sys.tables where name = @TableName)
OR @CharToReplace IS NULL
OR @NewChar IS NULL
BEGIN
		PRINT 'ERROR:	One or more parameters is invalid.'
		GOTO ExitSproc
END;


--	build numbered list of char columns for the specified table
with firststep as (
	select t.object_id
	from sys.tables t
	join sys.schemas s
		on t.schema_id = s.schema_id
	where t.name = @TableName
	and s.name = @SchemaName
)
select c.name, ROW_NUMBER() OVER (Partition By 1 Order By column_id ASC) as rownum
into #tmp_Columns
from sys.columns c
join firststep f
	on c.object_id = f.object_id
where LEFT(c.name,4) <> 'ETL_'
and c.collation_name IS NOT NULL;


--	exit sproc if zero columns returned from above query
IF (select count(9) from #tmp_Columns) = 0
BEGIN
	PRINT 'ERROR:	No character columns found in specified table.'
	GOTO ExitSproc
END;


--	set loop variables
SET @RowCounter = 1;
SET @MaxRowNum = (select MAX(rownum) from #tmp_Columns);


WHILE 1=1
BEGIN

	IF @RowCounter = 1
		SET @SQLStatement = CONCAT('UPDATE ', @SchemaName, '.', @TableName, ' SET ');

	SELECT @EndingChar = CASE WHEN @RowCounter = @MaxRowNum THEN ';' ELSE ',' END;

	SELECT @ColumnName = (select CONCAT('[',name,']') from #tmp_Columns where rownum = @RowCounter);
	 
	SELECT @SQLStatement = CONCAT(@SQLStatement, @ColumnName, ' = REPLACE(', @ColumnName, ',''', @CharToReplace, ''',''', @NewChar, ''')', @EndingChar);

--	increment @RowCounter
	SET @RowCounter = @RowCounter+1;

--	if @RowCounter > @MaxRowNum, break the loop
	IF @RowCounter > @MaxRowNum
		BREAK
	ELSE
		CONTINUE;

END;	


	
--	SELECT @SQLStatement;
EXEC (@SQLStatement);


ExitSproc:

END








GO
