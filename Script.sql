USE [master]
GO
/****** Object:  Database [ElectronicsStore]    Script Date: 6/18/2022 12:50:05 PM ******/
CREATE DATABASE [ElectronicsStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElectronicsStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS2012\MSSQL\DATA\ElectronicsStore.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ElectronicsStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS2012\MSSQL\DATA\ElectronicsStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ElectronicsStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectronicsStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectronicsStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElectronicsStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElectronicsStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElectronicsStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElectronicsStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElectronicsStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElectronicsStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElectronicsStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElectronicsStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElectronicsStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElectronicsStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ElectronicsStore] SET  MULTI_USER 
GO
ALTER DATABASE [ElectronicsStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElectronicsStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElectronicsStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElectronicsStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ElectronicsStore]
GO
/****** Object:  StoredProcedure [dbo].[Add_Account]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Account]

@Password varchar(64) = null,
@SecretAnswer varchar(64) = null,
@CustomerID int,
@Email nvarchar(150),
@LastName nvarchar(75),
@FirstName nvarchar(75),
@PhoneNumber nvarchar(25),
@SecretQuestionID int,
@RoleID int,
@Status bit

as

IF NOT EXISTS (SELECT id FROM account WHERE email_address = @Email AND id != @CustomerID)
BEGIN
UPDATE account SET
  email_address = COALESCE(@Email, email_address),
  first_name = COALESCE(@FirstName, first_name),
  last_name = COALESCE(@LastName, last_name),
  phone_number = COALESCE(@PhoneNumber, phone_number),
  password = COALESCE(@Password, password),
  security_question_id = COALESCE(@SecretQuestionID, security_question_id),
  security_answer = COALESCE(@SecretAnswer, security_answer),
  role_id = COALESCE(@RoleID, role_id),
  status = COALESCE(@Status, status)
WHERE id = @CustomerID;
SELECT 1
END

ELSE
	BEGIN
	SELECT 0
	END
GO
/****** Object:  StoredProcedure [dbo].[Add_Category]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Category]

@Description nvarchar(50),
@Status bit

as

INSERT INTO category (description,status) VALUES (@Description,@Status)
SELECT category.id FROM category WHERE category.description = @Description;

GO
/****** Object:  StoredProcedure [dbo].[Add_Product]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Product]

@ProductName nvarchar(50),
@SupplierID int,
@CategoryID int,
@Price money,
@Status bit

as

INSERT INTO [dbo].[product]
           ([product_name]
           ,[supplier_id]
           ,[category_id]
           ,[retail_price]
           ,[status])
     VALUES
           (@ProductName
           ,TRY_CAST (@SupplierID as int)
           ,TRY_CAST (@CategoryID as int)
           ,@Price
           ,@Status)
SELECT 1
GO
/****** Object:  StoredProcedure [dbo].[Add_Role]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Role]

@Description nvarchar(50),
@Status bit

as

INSERT INTO role (description,status) VALUES (@Description,@Status)
SELECT role.id FROM role WHERE role.description = @Description;

GO
/****** Object:  StoredProcedure [dbo].[Add_Supplier]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Supplier]

@CompanyName nvarchar(50),
@CompanyAddress nvarchar(150),
@MainContactName nvarchar(100),
@MainPhone nvarchar(50),
@Status bit

as

INSERT INTO supplier (company_name,company_address,main_contact_name,main_contact_phone,status)
VALUES (@CompanyName,@CompanyAddress,@MainContactName,@MainPhone,Try_Cast(@Status as bit))
SELECT supplier.id FROM supplier WHERE company_name = @CompanyName;

GO
/****** Object:  StoredProcedure [dbo].[Change_Password]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Change_Password]
@Email nvarchar(150),
@Password varchar(64)
as
UPDATE account 
	SET password = @Password
	WHERE email_address = @Email
GO
/****** Object:  StoredProcedure [dbo].[Get_Security_Questions]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Security_Questions]

as 

SELECT id, security_question FROM security_question
ORDER BY security_question
GO
/****** Object:  StoredProcedure [dbo].[Insert_User]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_User]

@Email nvarchar(150),
@LastName nvarchar(75),
@FirstName nvarchar(75),
@PhoneNumber nvarchar(25),
@Password varchar(64),
@SecretQuestionID int,
@SecretAnswer varchar(64),
@RoleID int,
@Status bit
as

IF NOT EXISTS (SELECT id FROM account WHERE email_address = @Email)
BEGIN
INSERT INTO account(email_address, last_name, first_name, phone_number, 
password, security_question_id, security_answer,role_id,status)
VALUES (@Email, @LastName, @FirstName, @PhoneNumber, @Password, @SecretQuestionID,
@SecretAnswer,@RoleID,@Status);
SELECT id FROM account WHERE email_address = @Email
END

ELSE 
BEGIN
SELECT 0
END


GO
/****** Object:  StoredProcedure [dbo].[Load_Account_Search_First_Name]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Account_Search_First_Name]

@Query nvarchar(75)

as

SELECT account.id,account.first_name,account.last_name,		
		case 
			when account.status = 1 then REPLACE(account.status,1,'Active')
			when account.status = 0 then REPLACE(account.status,0,'Inactive')
		END
		as status
FROM account
WHERE account.first_name like '%' + @Query + '%'
ORDER BY first_name ASC;
GO
/****** Object:  StoredProcedure [dbo].[Load_Account_Search_Last_Name]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Account_Search_Last_Name]

@Query nvarchar(75)

as

SELECT account.id,account.first_name,account.last_name,
		case 
			when account.status = 1 then REPLACE(account.status,1,'Active')
			when account.status = 0 then REPLACE(account.status,0,'Inactive')
		END
		as status
FROM account
WHERE account.last_name like '%' + @Query + '%'
ORDER BY last_name ASC;
GO
/****** Object:  StoredProcedure [dbo].[Load_Category_Table]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Category_Table]

as

SELECT category.id, category.description, category.status FROM category
ORDER BY category.description ASC;
GO
/****** Object:  StoredProcedure [dbo].[Load_Customer]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Customer]

@ID nvarchar(100)

as

SELECT [id]
      ,[email_address]
      ,[first_name]
      ,[last_name]
      ,[phone_number]
      ,null as [password]
      ,[security_question_id]
      ,null as [security_answer]
      ,[role_id]
      ,[status] 
	  FROM account WHERE account.id = TRY_CAST(@ID as int);
GO
/****** Object:  StoredProcedure [dbo].[Load_Order_Products]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Order_Products]

@Supplier nvarchar(50),
@Category nvarchar(50)

as

SELECT id,product_name FROM product

WHERE supplier_id = TRY_CAST (@Supplier as int) AND category_id = TRY_CAST (@Category as int)
GO
/****** Object:  StoredProcedure [dbo].[Load_Products]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Products]
as
SELECT [id]
      ,[product_name]
      ,[supplier_id]
      ,[category_id]
      ,[retail_price]
      ,[status]
  FROM [ElectronicsStore].[dbo].[product]
GO
/****** Object:  StoredProcedure [dbo].[Load_Products_View]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Products_View]

@Supplier int = null
as

IF ((SELECT COUNT(*) FROM product WHERE product.supplier_id=@Supplier)=0)

SELECT 0 as id
      ,null as [product_name]
      ,null as company_name
	  ,null as supplier_id
      ,null as category
	  ,null as  [category_id]
      ,null as [retail_price]
      ,TRY_CAST(1 as bit) as status
ELSE
SELECT product.id
      ,[product_name]
      ,supplier.company_name
	  ,supplier_id
      ,category.description as category
	  , category_id
      ,[retail_price]
      ,product.[status]
  FROM [ElectronicsStore].[dbo].[product]
INNER JOIN supplier
    ON  supplier_id = supplier.id
INNER JOIN category
ON  category_id = category.id 
WHERE supplier_id = COALESCE(@Supplier,0);

GO
/****** Object:  StoredProcedure [dbo].[Load_Role_Table]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Role_Table]

as

select  role.id, 
		role.description,
		case 
			when role.status = 1 then REPLACE(role.status,1,'Active')
			when role.status = 0 then REPLACE(role.status,0,'Inactive')
		END
		as status
from role
 ORDER BY description ASC; 
GO
/****** Object:  StoredProcedure [dbo].[Load_Suppliers]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[Load_Suppliers]

as

SELECT  [id]
      ,[company_name]
      ,[company_address]
      ,[main_contact_name]
      ,[main_contact_phone]
      ,[status]
  FROM [ElectronicsStore].[dbo].[supplier]
GO
/****** Object:  StoredProcedure [dbo].[Update_Account]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Account]

@Password varchar(64) = null,
@SecretAnswer varchar(64) = null,
@CustomerID int,
@Email nvarchar(150),
@LastName nvarchar(75),
@FirstName nvarchar(75),
@PhoneNumber nvarchar(25),
@SecretQuestionID int,
@RoleID int,
@Status bit

as

IF NOT EXISTS (SELECT id FROM account WHERE email_address = @Email AND id != @CustomerID)
BEGIN
UPDATE account SET
  email_address = COALESCE(@Email, email_address),
  first_name = COALESCE(@FirstName, first_name),
  last_name = COALESCE(@LastName, last_name),
  phone_number = COALESCE(@PhoneNumber, phone_number),
  password = COALESCE(@Password, password),
  security_question_id = COALESCE(@SecretQuestionID, security_question_id),
  security_answer = COALESCE(@SecretAnswer, security_answer),
  role_id = COALESCE(@RoleID, role_id),
  status = COALESCE(@Status, status)
WHERE id = @CustomerID;
SELECT 1
END

ELSE
	BEGIN
	SELECT 0
	END


GO
/****** Object:  StoredProcedure [dbo].[Verify_Login]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Verify_Login]
@Email nvarchar(150), @Password varchar(64)
AS
SELECT account.id,account.email_address,role.description
FROM dbo.account
INNER JOIN role ON role_id = role.id
WHERE account.email_address = @Email AND account.password = @Password AND account.status = 1 AND role.status = 1;

GO
/****** Object:  StoredProcedure [dbo].[Verify_Recovery_Credentials]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Verify_Recovery_Credentials]

@Email nvarchar(150),
@SecretQuestionID int,
@SecretAnswer varchar(64)
as

IF EXISTS (SELECT id FROM dbo.account
WHERE email_address = @Email AND security_question_id = @SecretQuestionID AND security_answer = @SecretAnswer)
BEGIN
	SELECT 1
END

ELSE 
BEGIN
	SELECT 0
END
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email_address] [nvarchar](150) NULL,
	[first_name] [nvarchar](75) NULL,
	[last_name] [nvarchar](75) NULL,
	[phone_number] [nvarchar](50) NULL,
	[password] [varchar](64) NULL,
	[security_question_id] [int] NULL,
	[security_answer] [varchar](64) NULL,
	[role_id] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[supplier_id] [int] NULL,
	[category_id] [int] NULL,
	[retail_price] [money] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[security_question]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[security_question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[security_question] [nvarchar](100) NULL,
 CONSTRAINT [PK_secret_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[supplier]    Script Date: 6/18/2022 12:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [nvarchar](50) NULL,
	[company_address] [nvarchar](150) NULL,
	[main_contact_name] [nvarchar](100) NULL,
	[main_contact_phone] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_security_question] FOREIGN KEY([security_question_id])
REFERENCES [dbo].[security_question] ([id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_security_question]
GO
USE [master]
GO
ALTER DATABASE [ElectronicsStore] SET  READ_WRITE 
GO
