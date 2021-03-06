USE [ToDoList]
GO
/****** Object:  User [ToDoList]    Script Date: 12-07-2022 11:54:15 ******/
CREATE USER [ToDoList] FOR LOGIN [ToDoList] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getCurrentDateTime]    Script Date: 12-07-2022 11:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Neeraj Saini
-- Create date: 11-07-2022
-- Description:	To get the current Date and Time
-- sELECT [dbo].[fn_getCurrentDateTime]
-- =============================================
CREATE FUNCTION [dbo].[fn_getCurrentDateTime]
(
)
RETURNS datetime
AS
BEGIN

		Declare @Datetime DateTime 
		Set @Datetime= Getdate()

	return @Datetime
END
GO
/****** Object:  Table [dbo].[ApiLogs]    Script Date: 12-07-2022 11:54:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiLogs](
	[APILogId] [int] IDENTITY(1,1) NOT NULL,
	[ErrorLogId] [int] NULL,
	[APIUrl] [varchar](500) NULL,
	[APIParams] [varchar](max) NULL,
	[Headers] [varchar](max) NULL,
	[Method] [varchar](10) NULL,
	[Success] [bit] NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
 CONSTRAINT [PK_ApiLogs] PRIMARY KEY CLUSTERED 
(
	[APILogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[ErrorLogId] [int] IDENTITY(1,1) NOT NULL,
	[ExceptionMsg] [varchar](max) NULL,
	[ExceptionType] [varchar](max) NULL,
	[ExceptionSource] [varchar](max) NULL,
	[LogDateTime] [datetime] NULL,
 CONSTRAINT [PK_ErrorLogs] PRIMARY KEY CLUSTERED 
(
	[ErrorLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalCodeCategories]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalCodeCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[AllowAddDelete] [nvarchar](100) NULL,
	[AllowCodeNameEdit] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Isdeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_GlobalCodeCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalCodes]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalCodes](
	[GlobalCodeId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CodeName] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[CannotModifyNameOrDelete] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Isdeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_GlobalCodes] PRIMARY KEY CLUSTERED 
(
	[GlobalCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDoLists]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDoLists](
	[ToDoListId] [int] IDENTITY(1,1) NOT NULL,
	[ColourId] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Isdeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ToDoLists] PRIMARY KEY CLUSTERED 
(
	[ToDoListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlobalCodeCategories] ADD  CONSTRAINT [DF_GlobalCodeCategories_IsActive]  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[GlobalCodeCategories] ADD  CONSTRAINT [DF_GlobalCodeCategories_Isdeleted]  DEFAULT (CONVERT([bit],(0))) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[GlobalCodes] ADD  CONSTRAINT [DF_GlobalCodes_IsActive]  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[GlobalCodes] ADD  CONSTRAINT [DF_GlobalCodes_Isdeleted]  DEFAULT (CONVERT([bit],(0))) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[ToDoLists] ADD  CONSTRAINT [DF_ToDoLists_IsActive]  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[ToDoLists] ADD  CONSTRAINT [DF_ToDoLists_Isdeleted]  DEFAULT (CONVERT([bit],(0))) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[ApiLogs]  WITH CHECK ADD  CONSTRAINT [ApiLogs_ErrorLogs_ErrorLogId_FK] FOREIGN KEY([ErrorLogId])
REFERENCES [dbo].[ErrorLogs] ([ErrorLogId])
GO
ALTER TABLE [dbo].[ApiLogs] CHECK CONSTRAINT [ApiLogs_ErrorLogs_ErrorLogId_FK]
GO
ALTER TABLE [dbo].[GlobalCodes]  WITH CHECK ADD  CONSTRAINT [GlobalCodes_GlobalCodeCategories_CategoryId_FK] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[GlobalCodeCategories] ([CategoryId])
GO
ALTER TABLE [dbo].[GlobalCodes] CHECK CONSTRAINT [GlobalCodes_GlobalCodeCategories_CategoryId_FK]
GO
ALTER TABLE [dbo].[ToDoLists]  WITH CHECK ADD  CONSTRAINT [ToDoLists_GlobalCodes_ColourId_FK] FOREIGN KEY([ColourId])
REFERENCES [dbo].[GlobalCodes] ([GlobalCodeId])
GO
ALTER TABLE [dbo].[ToDoLists] CHECK CONSTRAINT [ToDoLists_GlobalCodes_ColourId_FK]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddAPILog]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Neeraj Saini
-- Create date: 11-07-2022
-- Description:	Add API log Detail.
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddAPILog]
	@ApiLogId int,
	@ApiUrl varchar(500),
	@ApiParams varchar(max),
	@Headers varchar(max),
	@Method varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @Id int

   Insert ApiLogs (APIUrl, APIParams, Headers, Method) 
   values (@ApiUrl, @ApiParams, @Headers, @Method)

   Set @Id = SCOPE_IDENTITY()
   SELECT @Id as KeyId, ERROR_NUMBER() as ResponseCode, ERROR_MESSAGE() as ResponseMessage
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddToDoList]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Neeraj Saini
-- Create date: 11-07-2022
-- Description:	This Store Procedure is used to add colour and Text into the ToDoLists 
-- exec sp_AddToDoList 1,1,'For Test',''
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddToDoList] 
	-- Add the parameters for the stored procedure here
	@ToDoListId int,
	@ColourId int,
	@Text nvarchar(2000),
	@ActionPerformedBy varchar(255)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE  @Id AS int      
DECLARE @CurrentDate AS DATETIME      
SET @CurrentDate = dbo.fn_getCurrentDateTime()

BEGIN TRY	
Begin Tran

-- ========================= Add Customers Information in Customers Table =========================================== --
If (@ToDoListId is null)
	begin
		If not Exists (Select 1 from ToDoLists T where T.ColourId = @ColourId and T.[Text] = @Text and T.IsDeleted = 0)
			Begin
			print 'A'
				 Insert into dbo.ToDoLists (ColourId, [Text],CreatedBy,CreatedDate,ModifiedBy,ModifiedDate)
				 Values (@ColourId,@Text,@ActionPerformedBy,@CurrentDate,@ActionPerformedBy,@CurrentDate)

				 Set @ToDoListId = SCOPE_IDENTITY()
 					Select @ToDoListId as KeyId,200 as ResponseCode,'ToDo item has been added.' as ResponseMessage

			End
		else
			begin
 				Select @ToDoListId as KeyId,500 as ResponseCode,'ToDo item cannot be added because it already exists.' as ResponseMessage
			End
	End
Else
	begin
		If not Exists (Select 1 from ToDoLists T where T.ColourId = @ColourId and T.[Text] = @Text and T.IsDeleted = 0 and T.ToDoListId<>@ToDoListId)
				Begin
				print 'A.1'
					Update ToDoLists Set ColourId = @ColourId, Text = @Text, ModifiedBy = @ActionPerformedBy, ModifiedDate = @CurrentDate where 
					ToDoListId = @ToDoListId
 						Select @ToDoListId as KeyId,200 as ResponseCode,'ToDo item has been updated.' as ResponseMessage

				End
		else
				begin
 					Select 0 as KeyId,500 as ResponseCode,'ToDo item cannot be added because it already exists.' as ResponseMessage
				End

	End
 Commit Tran
End Try
-- ================================Log the exception ===================================================---
BEGIN CATCH      
 ROLLBACK TRANSACTION         
 DECLARE @error INT, @message VARCHAR(4000);      
 Set @error = ERROR_NUMBER()      
 Set @message = ERROR_MESSAGE();      
 Select 0 as KeyId,@error as ResponseCode, @message as ResponseMessage        

 END CATCH      

END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteToDoList]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- =============================================  
-- Author: Neeraj Saini  
-- Create Date: 11-07-2022
-- Description: This store porcedure is used to Delete the ToDoList 
-- exec sp_DeleteToDoList   
-- =============================================  
  
CREATE PROCEDURE [dbo].[sp_DeleteToDoList]  
(  
@ToDoListId int,  
@ActionPerformedBy varchar(255)  
)  
AS  
BEGIN  
DECLARE @CurrentDate AS DATETIME  
 SET @CurrentDate = dbo.fn_getCurrentDateTime()   
 DECLARE @TraceValues AS VARCHAR(8000)  
 SET @TraceValues = '';  
-- ===============================Delete the Existing Jobs =================================================  
BEGIN TRY  
 BEGIN TRAN  
  
 SET @TraceValues = @TraceValues + ' ToDoList Id - ' + cast(isnull(@ToDoListId,'')  AS VARCHAR(10))  
 + ' DeletedBy - ' + isnull(@ActionPerformedBy,'')  
  
 if exists(Select 1 from dbo.ToDoLists where ToDoListId=@ToDoListId and IsDeleted=0  )  
 Begin  
 UPDATE dbo.ToDoLists set IsDeleted = 1,DeletedBy=@ActionPerformedBy,DeletedDate=@CurrentDate where ToDoListId=@ToDoListId and IsDeleted=0  
   
 select @ToDoListId  as KeyId,200 as ResponseCode,'ToDolist item has been deleted successfully.' as ResponseMessage  
 END  
  
 Else  
 Begin  
  select 0 as KeyId,500 as ResponseCode,'ToDolist item cannot be deleted.' as ResponseMessage  
 End  
 COMMIT TRAN  
END TRY  
-- ================================ Maintain Exception in LogException Table ============================================  
BEGIN CATCH  
 ROLLBACK TRANSACTION  
 DECLARE @error INT, @message VARCHAR(4000);      
 Set @error = ERROR_NUMBER()      
 Set @message = ERROR_MESSAGE();      
 Select 0 as KeyId,@error as ResponseCode, @message as ResponseMessage        
END CATCH  
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAPILogs]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Neeraj Saini
-- Modified date: 11-07-2022
-- Description:	This procedure returns APILogs
-- =============================================
CREATE PROCEDURE  [dbo].[sp_GetAPILogs]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 5 * FROM dbo.ApiLogs;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetGlobalCodeCategories]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Neeraj Saini
-- Create Date:   11-07-2022
-- Description: This Stored Procedure will be used for GetGlobalCodeCategories
-- exec [dbo].[sp_GetGlobalCodeCategories]
-- =============================================
CREATE PROC [dbo].[sp_GetGlobalCodeCategories]

AS
BEGIN
BEGIN TRY

 -- ================= GetGlobalCodeCategories and GetGlobalCodeById Information in GlobalCodeCategories Table ============================

select CategoryId,CategoryName,AllowAddDelete,AllowCodeNameEdit,Description,IsActive,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate,IsDeleted,DeletedBy,DeletedDate from dbo.GlobalCodeCategories

END TRY
    BEGIN CATCH	
	   DECLARE @error INT, @message VARCHAR(4000);	   
       SELECT @error = ERROR_NUMBER(), 
		      @message = ERROR_MESSAGE();			 
END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetGlobalCodes]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================================
-- Author:        Neeraj Saini
-- Create Date:   11-07-2022
-- Description:   This Stored Procedure will be used for get the list of GetGlobalCode and GetGlobalCodebyId
-- exec [dbo].[sp_GetGlobalCodes] 'ColourType',-1
-- ==========================================================================================
CREATE PROC [dbo].[sp_GetGlobalCodes] 

@CategoryName varchar(100)=Null,
@GlobalCodeId int=-1
AS
BEGIN
BEGIN TRY

-- =========== GetGlobalCode Information in GlobalCodes Table ==============

 Select Glo.GlobalCodeId, Glo.CategoryId,GC.CategoryName , Glo.CodeName, Glo.Description,
        Glo.CannotModifyNameOrDelete, Glo.IsActive, Glo.CreatedBy, Glo.CreatedDate, Glo.ModifiedBy,
        Glo.ModifiedDate, Glo.IsDeleted, Glo.DeletedBy, Glo.DeletedDate
        from dbo.GlobalCodes Glo
        inner join dbo.GlobalCodeCategories GC on GC.CategoryId=Glo.CategoryId and GC.IsDeleted=0
	    where Glo.IsActive=1 and Glo.IsDeleted=0 and (IsNUll(@GlobalCodeId, -1) = -1 or Glo.GlobalCodeId = @GlobalCodeId)
        and (@CategoryName is null or GC.CategoryName=@CategoryName)  Order by Glo.CodeName asc
 
 END TRY
    BEGIN CATCH	
	   DECLARE @error INT, @message VARCHAR(4000);	   
       SELECT @error = ERROR_NUMBER(), 
		      @message = ERROR_MESSAGE();			 
END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetToDoLists]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Neeraj Saini
-- Create date: 11-07-2022
-- Description:	This store procedure is used to get the list of ToDoList
-- sp_GetToDoLists 1,-1,-1,-1,1,100,'','',''
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetToDoLists]
	-- Add the parameters for the stored procedure here
(	
	@ToDoListId int = -1,
	@ColourId int = -1,
	@PageNo INT = 0,  
    @PageSize INT = 0,  
    @SearchValue NVARCHAR(50) = NULL,  
    @SortColumn NVARCHAR(20)=Null,  
    @SortOrder NVARCHAR(20)=Null
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @SearchValue = ISNULL(@SearchValue, '');    
    SET @SortColumn = ISNULL(@SortColumn, '');    
    SET @SortOrder = ISNULL(@SortOrder, '');    
    SET @SearchValue = LTRIM(RTRIM(@SearchValue));

    -- Insert statements for procedure here
	
	SELECT T.ToDoListId, T.ColourId,Gc.CodeName,T.[Text],T.IsActive from ToDoLists T
	Left join GlobalCodes Gc on Gc.GlobalCodeId = T.ColourId and Gc.Isdeleted = 0
	where (T.ToDoListId= @ToDoListId or Isnull(@ToDoListId,-1)=-1)  and T.IsDeleted = 0  and (T.ColourId= @ColourId or Isnull(@ColourId,-1)=-1) 

	--======================= Searching of the Tags ======================================================--
	AND (CONCAT(ISNULL(T.ToDoListId, ''), '', ISNULL( T.ColourId, ''), '', ISNULL(Gc.CodeName, ''), '', ISNULL(T.[Text], '')) LIKE  '%' + @SearchValue + '%')

	--======================Sorting of the Tags==================================--
							
							ORDER BY CASE    
							  WHEN(@SortColumn = 'ToDoListId'    
                                   AND @SortOrder = 'ASC')    
                              THEN T.ToDoListId 
                              END ASC,    
                              CASE    
                              WHEN(@SortColumn = 'ToDoListId'    
                                   AND @SortOrder = 'DESC')    
                              THEN T.ToDoListId 
                              END DESC, 
							  CASE
                              WHEN(@SortColumn = 'ColourId'    
                                   AND @SortOrder = 'ASC')    
                              THEN T.ColourId 
                              END ASC,    
                              CASE    
                              WHEN(@SortColumn = 'ColourId'    
                                   AND @SortOrder = 'DESC')    
                              THEN T.ColourId    
                              END DESC,             
							  CASE    
                              WHEN(@SortColumn = 'CodeName'    
                                   AND @SortOrder = 'ASC')    
                              THEN Gc.CodeName   
							  END ASC,    
							   CASE    
                              WHEN(@SortColumn = 'CodeName'    
                                   AND @SortOrder = 'DESC')    
                              THEN  Gc.CodeName      
							  End DESC,  
							  CASE    
                              WHEN(@SortColumn = 'Text'    
                                   AND @SortOrder = 'ASC')    
                              THEN T.[Text]  
							  END ASC,    
							   CASE    
                              WHEN(@SortColumn = 'Text'    
                                   AND @SortOrder = 'DESC')    
                              THEN T.[Text]    
							  End DESC,
							  
							   CASE    
                              WHEN(@SortColumn = 'ModifiedDate'    
                                   AND @SortOrder = 'DESC')    
                              THEN T.ModifiedDate     
							  End DESC
					OFFSET @PageSize * (@PageNo - 1) ROWS FETCH NEXT @PageSize ROWS ONLY
					PRINT @SortColumn;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAPILog]    Script Date: 12-07-2022 11:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Neeraj Saini
-- Modified date: 11-07-2022
-- Description:	 Update API log Detail.
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateAPILog] 
@apilogid AS int, @exceptionmsg AS varchar(max), @exceptionsource AS varchar(max), @exceptiontype AS varchar(max), @success AS bit
AS
BEGIN
    DECLARE @temperrorlogid AS int = NULL;
    IF(@success = 0)
    BEGIN
        INSERT INTO ErrorLogs([ExceptionMsg],
                             [ExceptionType],
                             [ExceptionSource],
                             [LogDateTime])
        VALUES(@exceptionmsg, @exceptiontype, @exceptionsource, GETUTCDATE());
        SELECT @temperrorlogid = @@identity;
    END;
  IF(ISNULL(@apilogid,-1)>-1)
	Begin
    UPDATE APILogs
      SET
          Success = @success,
          EndDateTime = GETUTCDATE(),
          ErrorLogId = @temperrorlogid
     WHERE APILogId = @apilogid;
	 End;
	   SELECT SCOPE_IDENTITY() as KeyId, ERROR_NUMBER() as ResponseCode, ERROR_MESSAGE() as ResponseMessage

END;
GO
