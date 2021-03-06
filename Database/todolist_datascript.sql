USE [ToDoList]
GO
/****** Object:  Table [dbo].[GlobalCodeCategories]    Script Date: 12-07-2022 10:31:47 ******/
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
/****** Object:  Table [dbo].[GlobalCodes]    Script Date: 12-07-2022 10:31:48 ******/
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
SET IDENTITY_INSERT [dbo].[GlobalCodeCategories] ON 

INSERT [dbo].[GlobalCodeCategories] ([CategoryId], [CategoryName], [AllowAddDelete], [AllowCodeNameEdit], [Description], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Isdeleted], [DeletedBy], [DeletedDate]) VALUES (1, N'ColourType', N'N', N'N', N'This is used for the diffrent colours used in the ToDo List', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GlobalCodeCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[GlobalCodes] ON 

INSERT [dbo].[GlobalCodes] ([GlobalCodeId], [CategoryId], [CodeName], [Description], [CannotModifyNameOrDelete], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Isdeleted], [DeletedBy], [DeletedDate]) VALUES (1, 1, N'#e63c3c', N'Red', N'N', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[GlobalCodes] ([GlobalCodeId], [CategoryId], [CodeName], [Description], [CannotModifyNameOrDelete], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Isdeleted], [DeletedBy], [DeletedDate]) VALUES (2, 1, N'#088cd1', N'Blue', N'N', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[GlobalCodes] ([GlobalCodeId], [CategoryId], [CodeName], [Description], [CannotModifyNameOrDelete], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Isdeleted], [DeletedBy], [DeletedDate]) VALUES (3, 1, N'#f1cf6d', N'Yellow', N'N', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[GlobalCodes] ([GlobalCodeId], [CategoryId], [CodeName], [Description], [CannotModifyNameOrDelete], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Isdeleted], [DeletedBy], [DeletedDate]) VALUES (4, 1, N'#cc5af2', N'Purple', N'N', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[GlobalCodes] ([GlobalCodeId], [CategoryId], [CodeName], [Description], [CannotModifyNameOrDelete], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Isdeleted], [DeletedBy], [DeletedDate]) VALUES (5, 1, N'#5fee81', N'Green', N'N', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[GlobalCodes] ([GlobalCodeId], [CategoryId], [CodeName], [Description], [CannotModifyNameOrDelete], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Isdeleted], [DeletedBy], [DeletedDate]) VALUES (6, 1, N'#b0d8f5', N'Sky-blue', N'N', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GlobalCodes] OFF
GO
ALTER TABLE [dbo].[GlobalCodeCategories] ADD  CONSTRAINT [DF_GlobalCodeCategories_IsActive]  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[GlobalCodeCategories] ADD  CONSTRAINT [DF_GlobalCodeCategories_Isdeleted]  DEFAULT (CONVERT([bit],(0))) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[GlobalCodes] ADD  CONSTRAINT [DF_GlobalCodes_IsActive]  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[GlobalCodes] ADD  CONSTRAINT [DF_GlobalCodes_Isdeleted]  DEFAULT (CONVERT([bit],(0))) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[GlobalCodes]  WITH CHECK ADD  CONSTRAINT [GlobalCodes_GlobalCodeCategories_CategoryId_FK] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[GlobalCodeCategories] ([CategoryId])
GO
ALTER TABLE [dbo].[GlobalCodes] CHECK CONSTRAINT [GlobalCodes_GlobalCodeCategories_CategoryId_FK]
GO
