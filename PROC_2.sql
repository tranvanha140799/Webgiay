CREATE PROC Delete_Size
    @sizeID int
AS
BEGIN
    DELETE dbo.SIZE WHERE dbo.SIZE.SizeID=@sizeID
END
GO
CREATE PROC Update_Size
    @sizeID int,
    @sizeName varchar(2)
AS
BEGIN
    UPDATE dbo.SIZE
SET
    --SizeID - column value is auto-generated
    dbo.SIZE.Size =@sizeName, -- NVARCHAR
    dbo.SIZE.CreatedDate = GETDATE() -- DATETIME
	WHERE dbo.SIZE.SizeID=@sizeID
END
GO

CREATE PROC LoadSize_ByID
    @id int
AS
BEGIN
    SELECT *
    FROM dbo.SIZE s
    WHERE s.SizeID=@id
END
GO


CREATE PROC Create_Customer
    @username nvarchar(250),
    @pass nchar(250),
    @name nvarchar(250),
    @phone nvarchar(20),
    @mail nvarchar(250)
AS
BEGIN
    INSERT dbo.CUSTOMER
        (
        --CustomerID - column value is auto-generated
        CustomerUsername,
        CustomerPassword,
        CustomerEmail,
        CustomerName,
        CustomerPhone,
        CreatedDate
        )
    VALUES
        (
            -- CustomerID - INT
            @username, -- CustomerUsername - NVARCHAR
            @pass, -- CustomerPassword - NVARCHAR
            @mail, -- CustomerEmail - NVARCHAR
            @name, -- CustomerName - NVARCHAR
            @phone, -- CustomerPhone - NVARCHAR
            GETDATE() -- CreatedDate - DATETIME
)
END 
GO

CREATE PROC Delete_Customer
    @id int
AS
BEGIN
    DELETE FROM dbo.CUSTOMER 
WHERE dbo.CUSTOMER.CustomerID=@id
END
go

CREATE PROC LoadByUserName
    @username nvarchar(250)
AS
BEGIN
    SELECT *
    FROM dbo.CUSTOMER c
    WHERE c.CustomerUsername=@username
END 
GO

CREATE PROC	Load_Customer
AS
BEGIN
    SELECT *
    FROM dbo.CUSTOMER c
END
GO

CREATE PROC LoadCustomer_ByID
    @id int
AS
BEGIN
    SELECT *
    FROM dbo.CUSTOMER c
    WHERE c.CustomerID =@id
END
GO

CREATE PROC Create_User
    @username nvarchar(200),
    @pass nvarchar(200),
    @name nvarchar(200)
AS
BEGIN
    INSERT INTO dbo.[USER]
    VALUES
        (
            -- UserId - INT
            @username, -- UserUsername - NVARCHAR
            @pass, -- UserPassword - NVARCHAR
            @name, -- UserName - NVARCHAR
            getdate() -- CreatedDate - DATETIME
	)
END 
GO
CREATE PROC Login_Admin
    @username nvarchar(250),
    @pass nvarchar(250)
AS
BEGIN
    DECLARE @count int
    DECLARE @res bit
    SELECT @count = count(*)
    FROM dbo.[USER] u
    WHERE u.UserUsername=@username AND u.UserPassword=@pass
    IF @count > 0 
		SET @res=1
	ELSE
		SET @res=0
    SELECT @res
END
GO

CREATE PROC Create_Category
    @id varchar(20),
    @name nvarchar(250),
    @cate nvarchar(250)
AS
BEGIN
    INSERT dbo.CATEGORY
        (
        CategoryID,
        CategoryName,
        MetaKeyword,
        CreatedDate
        )
    VALUES
        (
            @id,
            @name, -- CategoryName - NVARCHAR
            @cate, -- MetaKeyword - NVARCHAR
            GETDATE() -- CreatedDate - DATETIME
)
END
GO

CREATE PROC Delete_Category
    @id varchar(20)
AS
BEGIN
    DELETE dbo.CATEGORY WHERE dbo.CATEGORY.CategoryID=@id
END
GO

CREATE PROC Edit_Category
    @id varchar(20),
    @name nvarchar(250),
    @meta nvarchar(250)
AS
BEGIN
    UPDATE dbo.CATEGORY
SET
    --CategoryID - column value is auto-generated
    dbo.CATEGORY.CategoryName = @name, -- NVARCHAR
    dbo.CATEGORY.MetaKeyword = @meta, -- NVARCHAR
    dbo.CATEGORY.CreatedDate = GETDATE() -- DATETIME
	WHERE dbo.CATEGORY.CategoryID=@id
END
GO

CREATE PROC LoadMeta_ByID
    @id varchar(20)
AS
BEGIN
    SELECT *
    FROM dbo.CATEGORY c
    WHERE c.CategoryID=@id
END 
GO

CREATE PROC Load_Order
AS
BEGIN
    SELECT *
    FROM dbo.[ORDER] o
END 
GO

CREATE PROC LoadOrderStatus
AS
BEGIN
    SELECT *
    FROM dbo.ORDERSTATUS o
END
GO

CREATE PROC Cancel_Order
    @orderID int
AS
BEGIN
    UPDATE dbo.[ORDER]
SET
    dbo.[ORDER].OrderStatusID = 5
WHERE dbo.[ORDER].OrderID=@orderID
END 
GO

CREATE PROC Change_Order
    @orderID int,
    @statusID int
AS
BEGIN
    UPDATE dbo.[ORDER]
SET
    dbo.[ORDER].OrderStatusID = @statusID
	WHERE dbo.[ORDER].OrderID=@orderID
END
GO

CREATE PROC Load_CustomerOrder
    @cusID int
AS
BEGIN
    SELECT *
    FROM dbo.[ORDER] o
    WHERE o.CustomerID=@cusID
END
GO

CREATE PROC LoadByMeta_Cate
    @meta nvarchar(250)
AS
BEGIN
    SELECT *
    FROM dbo.CATEGORY c
    WHERE c.MetaKeyword=@meta
END
GO

CREATE PROC LoadByMeta_Prod
    @meta nvarchar(250)
AS
BEGIN
    SELECT *
    FROM dbo.PRODUCT p
    WHERE p.MetaKeyword=@meta
END
GO

CREATE PROC SelectPaging
    @PageSize INT,
    @PageIndex INT,
    @Sort nvarchar(10),
    @Search nvarchar(255) = NULL,
    @Cate INT = NULL
AS
BEGIN
    IF(@Cate IS NULL)
    BEGIN
        SELECT *
        FROM [PRODUCT]
        WHERE(@Search IS NULL OR [PRODUCT].[ProductName] LIKE '%'+@Search+'%')
        ORDER BY
		CASE
			WHEN @Sort = '' THEN ProductID END ASC,
        CASE 
            WHEN @Sort = 'name_desc' THEN ProductName END DESC,
        CASE 
            WHEN @Sort = 'name_asc' THEN ProductName END ASC,
        CASE 
            WHEN @Sort = 'price_desc' THEN ProductPrice END DESC,
        CASE 
            WHEN @Sort = 'price_asc' THEN ProductPrice END ASC,
        CASE 
            WHEN @Sort = 'top_view' THEN ViewCount END DESC
        OFFSET @PageSize * @PageIndex ROWS
        FETCH NEXT @PageSize ROWS ONLY
    END
    ELSE
    BEGIN
        SELECT *
        FROM [PRODUCT]
        WHERE [PRODUCT].CategoryID = @Cate
        ORDER BY
		CASE
			WHEN @Sort = '' THEN ProductID END ASC,
        CASE 
            WHEN @Sort = 'name_desc' THEN ProductName END DESC,
        CASE 
            WHEN @Sort = 'name_asc' THEN ProductName END ASC,
        CASE 
            WHEN @Sort = 'price_desc' THEN ProductPrice END DESC,
        CASE 
            WHEN @Sort = 'price_asc' THEN ProductPrice END ASC,
        CASE 
            WHEN @Sort = 'top_view' THEN ViewCount END DESC
        OFFSET @PageSize * @PageIndex ROWS
        FETCH NEXT @PageSize ROWS ONLY
    END
END
GO