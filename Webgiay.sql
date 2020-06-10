USE [ONLINESHOP]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NOT NULL,
	[MetaKeyword] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerUsername] [nvarchar](250) NOT NULL,
	[CustomerPassword] [nvarchar](250) NOT NULL,
	[CustomerEmail] [nvarchar](250) NULL,
	[CustomerName] [nvarchar](250) NOT NULL,
	[CustomerPhone] [nvarchar](20) NULL,
	[CustomerAdress] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CustomerUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[Total] [decimal](18, 2) NULL,
	[OrderStatusID] [int] NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERDETAIL]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERDETAIL](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[OrderID] [int] NULL,
	[SizeID] [int] NULL,
	[ProductID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERSTATUS]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERSTATUS](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NOT NULL,
	[ProductDescription] [nvarchar](4000) NULL,
	[ProductPrice] [decimal](18, 0) NOT NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Rating] [int] NULL,
	[ShowImage_1] [nvarchar](4000) NULL,
	[ShowImage_2] [nvarchar](4000) NULL,
	[ProductStock] [int] NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[ProductStatus] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTDETAIL]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTDETAIL](
	[ProductDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[SizeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTIMAGE]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTIMAGE](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[DetailImage_1] [nvarchar](4000) NULL,
	[DetailImage_2] [nvarchar](4000) NULL,
	[DetailImage_3] [nvarchar](4000) NULL,
	[ProductID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIZE]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIZE](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[Size] [nvarchar](2) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserUsername] [nvarchar](250) NOT NULL,
	[UserPassword] [nvarchar](250) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CATEGORY] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CUSTOMER] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ORDER] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[ORDERSTATUS] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT ((0)) FOR [PromotionPrice]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT (N'') FOR [ShowImage_1]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT (N'') FOR [ShowImage_2]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT ((1)) FOR [ProductStock]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PRODUCTIMAGE] ADD  DEFAULT (N'') FOR [DetailImage_1]
GO
ALTER TABLE [dbo].[PRODUCTIMAGE] ADD  DEFAULT (N'') FOR [DetailImage_2]
GO
ALTER TABLE [dbo].[PRODUCTIMAGE] ADD  DEFAULT (N'') FOR [DetailImage_3]
GO
ALTER TABLE [dbo].[SIZE] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[ORDERSTATUS] ([StatusID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[ORDER] ([OrderID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([SizeID])
REFERENCES [dbo].[SIZE] ([SizeID])
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CATEGORY] ([CategoryID])
GO
ALTER TABLE [dbo].[PRODUCTDETAIL]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCTDETAIL]  WITH CHECK ADD FOREIGN KEY([SizeID])
REFERENCES [dbo].[SIZE] ([SizeID])
GO
ALTER TABLE [dbo].[PRODUCTIMAGE]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD CHECK  (([RATING]>=(0) AND [RATING]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[SelectOrder]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SelectOrder]
    @CustomerID INT
AS
BEGIN
    SELECT [ORDER].OrderID,
        [ORDER].Total,
        [ORDER].OrderStatusID,
        [ORDERSTATUS].StatusName,
        [ORDER].OrderDate,
        [ORDER].DeliveryDate
    FROM [ORDER] JOIN [ORDERSTATUS] ON [ORDER].OrderStatusID = [ORDERSTATUS].StatusID
    WHERE [ORDER].CustomerID = @CustomerID
END

GO
/****** Object:  StoredProcedure [dbo].[SelectOrderID]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectOrderID]
    @CustomerID INT,
    @StatusID INT
AS
BEGIN
    IF @StatusID = 0
    BEGIN
        SELECT [ORDER].OrderID
        FROM [ORDER]
        WHERE [ORDER].CustomerID = @CustomerID
    END
        ELSE
        BEGIN
        SELECT [ORDER].OrderID
        FROM [ORDER]
        WHERE [ORDER].CustomerID = @CustomerID
            AND [OrderStatusID] = @StatusID
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SelectOrderProduct]    Script Date: 10/06/2020 10:34:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SelectOrderProduct]
    @OrderID INT
AS
BEGIN
    SELECT
        [PRODUCT].ProductID,
        [PRODUCT].ProductName,
        [CATEGORY].CategoryName,
        [SIZE].Size,
        [ORDERDETAIL].Quantity
    FROM [ORDERDETAIL]
        JOIN [ORDER] ON [ORDERDETAIL].OrderID = [ORDER].OrderID
        JOIN [ORDERSTATUS] ON [ORDER].OrderStatusID = [ORDERSTATUS].StatusID
        JOIN [SIZE] ON [ORDERDETAIL].SizeID = [SIZE].SizeID
        JOIN [PRODUCT] ON [ORDERDETAIL].[ProductID] = [PRODUCT].ProductID
        JOIN [CATEGORY] ON [PRODUCT].CategoryID = [CATEGORY].CategoryID
    WHERE [ORDER].OrderID = @OrderID
END

GO
