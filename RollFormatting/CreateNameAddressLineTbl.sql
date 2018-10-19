IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NAME_ADDRESS_LINES]') AND type in (N'U'))
ALTER TABLE [dbo].[NAME_ADDRESS_LINES] DROP CONSTRAINT IF EXISTS [DF_NAME_ADDRESS_LINES_DateTimeStamp]
GO

/****** Object:  Table [dbo].[NAME_ADDRESS_LINES]    Script Date: 10/19/2018 12:07:57 PM ******/
DROP TABLE IF EXISTS [dbo].[NAME_ADDRESS_LINES]
GO

/****** Object:  Table [dbo].[NAME_ADDRESS_LINES]    Script Date: 10/19/2018 12:07:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NAME_ADDRESS_LINES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NAME_ADDRESS_LINES](
	[dimFolio_SK] [int] NOT NULL,
	[dimRollYear] [int] NOT NULL,
	[dimFolio_BK] [varchar](255) NOT NULL,
	[NAME_LINE1] [varchar](35) NOT NULL,
	[NAME_LINE2] [varchar](35) NOT NULL,
	[ADRS_LINE1] [varchar](35) NOT NULL,
	[ADRS_LINE2] [varchar](35) NOT NULL,
	[ADRS_LINE3] [varchar](35) NOT NULL,
	[ADRS_LINE4] [varchar](35) NOT NULL,
	[ADRS_LINE5] [varchar](35) NOT NULL,
	[DateTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_NAME_ADDRESS_LINES] PRIMARY KEY CLUSTERED 
(
	[dimFolio_SK] ASC,
	[dimRollYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NAME_ADDRESS_LINES_DateTimeStamp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NAME_ADDRESS_LINES] ADD  CONSTRAINT [DF_NAME_ADDRESS_LINES_DateTimeStamp]  DEFAULT (getdate()) FOR [DateTimeStamp]
END
GO