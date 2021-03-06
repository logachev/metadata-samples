USE [master]
GO
/****** Object:  Database [gbssqldb]    Script Date: 10/21/2019 3:13:55 PM ******/
CREATE DATABASE [gbssqldb]
GO
ALTER DATABASE [gbssqldb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gbssqldb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gbssqldb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gbssqldb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gbssqldb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gbssqldb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gbssqldb] SET ARITHABORT OFF 
GO
ALTER DATABASE [gbssqldb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gbssqldb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gbssqldb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gbssqldb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gbssqldb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gbssqldb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gbssqldb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gbssqldb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gbssqldb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gbssqldb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gbssqldb] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [gbssqldb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gbssqldb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [gbssqldb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gbssqldb] SET  MULTI_USER 
GO
ALTER DATABASE [gbssqldb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gbssqldb] SET ENCRYPTION ON
GO
ALTER DATABASE [gbssqldb] SET QUERY_STORE = ON
GO
ALTER DATABASE [gbssqldb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [gbssqldb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [gbssqldb]
GO
/****** Object:  Table [dbo].[tbl_datasets]    Script Date: 10/21/2019 3:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_datasets](
	[clm_int_id] [int] IDENTITY(1,1) NOT NULL,
	[clm_int_lineage_request_id] [int] NOT NULL,
	[clm_varchar_dataset] [varchar](256) NOT NULL,
	[clm_varchar_type] [varchar](256) NOT NULL,
	[clm_varchar_azure_resource] [varchar](256) NOT NULL,
	[clm_varchar_direction] [varchar](256) NOT NULL,
 CONSTRAINT [PK_tbl_datasets] PRIMARY KEY CLUSTERED 
(
	[clm_int_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lineage_request]    Script Date: 10/21/2019 3:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lineage_request](
	[clm_int_id] [int] IDENTITY(1,1) NOT NULL,
	[clm_varchar_execution_start_time] [datetime2](7) NOT NULL,
	[clm_varchar_execution_end_time] [datetime2](7) NOT NULL,
	[clm_varchar_datafactory_name] [varchar](256) NOT NULL,
	[clm_varchar_pipeline_name] [varchar](256) NOT NULL,
	[clm_varchar_activity_name] [varchar](256) NOT NULL,
 CONSTRAINT [PK_tbl_lineage_request] PRIMARY KEY CLUSTERED 
(
	[clm_int_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_datasets]  WITH CHECK ADD  CONSTRAINT [FK_tbl_datasets_tbl_lineage_request] FOREIGN KEY([clm_int_lineage_request_id])
REFERENCES [dbo].[tbl_lineage_request] ([clm_int_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_datasets] CHECK CONSTRAINT [FK_tbl_datasets_tbl_lineage_request]
GO
/****** Object:  StoredProcedure [dbo].[sp_create_lineage]    Script Date: 10/21/2019 3:14:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[sp_create_lineage]
(
    -- Add the parameters for the stored procedure here
    @execution_start_time varchar(256),
    @execution_end_time varchar(256),

    @datafactory_name varchar(256),
    @pipeline_name varchar(256),
    @activity_name varchar(256),

    @source_dataset varchar(256),
    @source_type varchar(256),
    @source_azure_resource varchar(256),

    @destination_dataset varchar(256),
    @destination_type varchar(256),
    @destination_azure_resource varchar(256)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	INSERT INTO tbl_lineage_request (clm_varchar_execution_start_time, clm_varchar_execution_end_time, clm_varchar_datafactory_name, clm_varchar_pipeline_name, clm_varchar_activity_name)
	values (@execution_start_time, @execution_end_time, @datafactory_name, @pipeline_name, @activity_name)

	DECLARE @requestId AS int
	SET @requestId = @@IDENTITY

	INSERT INTO tbl_datasets 
	(clm_int_lineage_request_id, clm_varchar_direction, clm_varchar_dataset, clm_varchar_type, clm_varchar_azure_resource)
	values (@requestId, 'source', @source_dataset, @source_type, @source_azure_resource)

	INSERT INTO tbl_datasets 
	(clm_int_lineage_request_id, clm_varchar_direction, clm_varchar_dataset, clm_varchar_type, clm_varchar_azure_resource)
	values (@requestId, 'destination', @destination_dataset, @destination_type, @destination_azure_resource)
END
GO
USE [master]
GO
ALTER DATABASE [gbssqldb] SET  READ_WRITE 
GO
