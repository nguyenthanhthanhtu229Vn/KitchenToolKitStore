USE [KitchenStore]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK__Users__roleID__145C0A3F]
GO
ALTER TABLE [dbo].[ProductImg] DROP CONSTRAINT [FK__ProductIm__produ__1FCDBCEB]
GO
ALTER TABLE [dbo].[ProductDetail] DROP CONSTRAINT [FK__ProductDe__produ__1BFD2C07]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK__Product__userID__182C9B23]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK__Product__itemsID__1920BF5C]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK__Orders__userID__22AA2996]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK__OrderDeta__produ__276EDEB3]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK__OrderDeta__order__267ABA7A]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK__Comment__userID__2A4B4B5E]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK__Comment__product__2B3F6F97]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[RoleUser]
GO
/****** Object:  Table [dbo].[ProductImg]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[ProductImg]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[ProductDetail]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[Items]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP TABLE [dbo].[Comment]
GO
USE [master]
GO
/****** Object:  Database [KitchenStore]    Script Date: 19/03/2021 10:24:27 CH ******/
DROP DATABASE [KitchenStore]
GO
/****** Object:  Database [KitchenStore]    Script Date: 19/03/2021 10:24:27 CH ******/
CREATE DATABASE [KitchenStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KitchenStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\KitchenStore.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KitchenStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\KitchenStore_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KitchenStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KitchenStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KitchenStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KitchenStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KitchenStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KitchenStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KitchenStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [KitchenStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KitchenStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KitchenStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KitchenStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KitchenStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KitchenStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KitchenStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KitchenStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KitchenStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KitchenStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KitchenStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KitchenStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KitchenStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KitchenStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KitchenStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KitchenStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KitchenStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KitchenStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KitchenStore] SET  MULTI_USER 
GO
ALTER DATABASE [KitchenStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KitchenStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KitchenStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KitchenStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KitchenStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [KitchenStore]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[commentID] [varchar](30) NOT NULL,
	[userID] [varchar](30) NULL,
	[productID] [varchar](30) NULL,
	[content] [nvarchar](400) NULL,
	[commentDate] [datetime] NULL,
	[statusIsDelete] [bit] NOT NULL DEFAULT ('true'),
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[itemsID] [varchar](30) NOT NULL,
	[itemsName] [nvarchar](30) NOT NULL,
	[itemsImg] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[itemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [varchar](30) NOT NULL,
	[orderID] [varchar](30) NULL,
	[productDetailID] [varchar](30) NULL,
	[quantity] [int] NULL,
	[unitPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [varchar](30) NOT NULL,
	[userID] [varchar](30) NULL,
	[orderDate] [datetime] NOT NULL,
	[shipAddress] [nvarchar](400) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[status] [bit] NOT NULL DEFAULT ('true'),
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [varchar](30) NOT NULL,
	[userID] [varchar](30) NULL,
	[itemsID] [varchar](30) NULL,
	[productName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[productDetailID] [varchar](30) NOT NULL,
	[productID] [varchar](30) NULL,
	[size] [varchar](30) NULL,
	[brand] [nvarchar](30) NOT NULL,
	[prize] [float] NULL,
	[productDecription] [nvarchar](400) NOT NULL,
	[quantity] [int] NULL,
	[statusIsDelete] [bit] NOT NULL DEFAULT ('true'),
PRIMARY KEY CLUSTERED 
(
	[productDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductImg]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductImg](
	[productImgID] [varchar](30) NOT NULL,
	[productID] [varchar](30) NULL,
	[productURLImg] [varchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[productImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleUser](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19/03/2021 10:24:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [varchar](30) NOT NULL,
	[roleID] [varchar](10) NULL,
	[password] [varchar](30) NOT NULL,
	[fullName] [nvarchar](30) NOT NULL,
	[email] [varchar](30) NULL,
	[phone] [varchar](30) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[statusIsDelete] [bit] NOT NULL DEFAULT ('true'),
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Comment] ([commentID], [userID], [productID], [content], [commentDate], [statusIsDelete]) VALUES (N'COMMENT-001', N'tuntt', N'PRODUCT-001', N'abcxyz', CAST(N'2021-12-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([commentID], [userID], [productID], [content], [commentDate], [statusIsDelete]) VALUES (N'COMMENT-002', N'tuntt', N'PRODUCT-001', N'sa', CAST(N'2021-03-19 07:16:01.537' AS DateTime), 1)
INSERT [dbo].[Comment] ([commentID], [userID], [productID], [content], [commentDate], [statusIsDelete]) VALUES (N'COMMENT-003', N'tuntt', N'PRODUCT-002', N'sa', CAST(N'2021-03-19 10:53:10.323' AS DateTime), 1)
INSERT [dbo].[Comment] ([commentID], [userID], [productID], [content], [commentDate], [statusIsDelete]) VALUES (N'COMMENT-004', NULL, N'PRODUCT-002', N'anh hai', CAST(N'2021-03-19 13:44:18.890' AS DateTime), 1)
INSERT [dbo].[Comment] ([commentID], [userID], [productID], [content], [commentDate], [statusIsDelete]) VALUES (N'COMMENT-005', N'nhanhn', N'PRODUCT-002', N'anh hai', CAST(N'2021-03-19 20:27:23.937' AS DateTime), 1)
INSERT [dbo].[Comment] ([commentID], [userID], [productID], [content], [commentDate], [statusIsDelete]) VALUES (N'COMMENT-006', N'tuntt', N'PRODUCT-002', N'a', CAST(N'2021-03-19 20:42:11.293' AS DateTime), 1)
INSERT [dbo].[Comment] ([commentID], [userID], [productID], [content], [commentDate], [statusIsDelete]) VALUES (N'COMMENT-007', NULL, N'PRODUCT-003', N'Sản phẩm rất tuyệt', CAST(N'2021-03-19 21:55:12.247' AS DateTime), 1)
INSERT [dbo].[Comment] ([commentID], [userID], [productID], [content], [commentDate], [statusIsDelete]) VALUES (N'COMMENT-008', N'tuntt', N'PRODUCT-003', N'Sản phẩm rất tuyệt', CAST(N'2021-03-19 21:55:40.013' AS DateTime), 1)
INSERT [dbo].[Items] ([itemsID], [itemsName], [itemsImg]) VALUES (N'ITEM-001', N'Nồi', N'size18cm-price649000.jpg')
INSERT [dbo].[Items] ([itemsID], [itemsName], [itemsImg]) VALUES (N'ITEM-002', N'Chảo', N'size20cm-price420000.jpg')
INSERT [dbo].[Items] ([itemsID], [itemsName], [itemsImg]) VALUES (N'ITEM-003', N'Dao', N'price2290000.jpg')
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-001', N'ORDER-001', N'PRODUCTDETAIL-001', 1, 150000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-002', N'ORDER-002', N'PRODUCTDETAIL-002', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-003', N'ORDER-002', N'PRODUCTDETAIL-001', 1, 150000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-004', N'ORDER-003', N'PRODUCTDETAIL-002', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-005', N'ORDER-004', N'PRODUCTDETAIL-003', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-006', N'ORDER-005', N'PRODUCTDETAIL-002', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-022', N'ORDER-016', N'PRODUCTDETAIL-001', 12, 150000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-023', N'ORDER-017', N'PRODUCTDETAIL-002', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-024', N'ORDER-018', N'PRODUCTDETAIL-003', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-025', N'ORDER-019', N'PRODUCTDETAIL-002', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-026', N'ORDER-020', N'PRODUCTDETAIL-003', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-027', N'ORDER-021', N'PRODUCTDETAIL-002', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-028', N'ORDER-022', N'PRODUCTDETAIL-003', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-029', N'ORDER-023', N'PRODUCTDETAIL-002', 1, 200000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productDetailID], [quantity], [unitPrice]) VALUES (N'ORDERDETAIL-030', N'ORDER-024', N'PRODUCTDETAIL-003', 2, 200000)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-001', N'tuntt', CAST(N'2021-03-18 23:29:05.927' AS DateTime), N'HCM', 123456789, 150000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-002', N'nhanhn', CAST(N'2021-03-19 11:17:58.103' AS DateTime), N'Vĩnh Long', 123123123, 350000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-003', N'nhanhn', CAST(N'2021-03-19 11:40:28.377' AS DateTime), N'Vĩnh Long', 1231231231, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-004', N'nhanhn', CAST(N'2021-03-19 11:41:27.560' AS DateTime), N'Vĩnh Long', 1231231231, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-005', N'nhanhn', CAST(N'2021-03-19 11:42:34.983' AS DateTime), N'Vĩnh Long', 1231231231, 200000, 1)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-016', N'nhanhn', CAST(N'2021-03-19 17:32:03.143' AS DateTime), N'Vĩnh Long', 1231231231, 1800000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-017', N'nhanhn', CAST(N'2021-03-19 19:25:12.300' AS DateTime), N'Vĩnh Long', 1231231231, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-018', N'nhanhn', CAST(N'2021-03-19 19:30:47.387' AS DateTime), N'Vĩnh Long', 1231231231, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-019', N'tuntt', CAST(N'2021-03-19 20:31:04.507' AS DateTime), N'Hà Nội', 1232131221, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-020', N'tuntt', CAST(N'2021-03-19 20:33:03.690' AS DateTime), N'Hà Nội', 1232131221, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-021', N'tuntt', CAST(N'2021-03-19 20:33:28.417' AS DateTime), N'Hà Nội', 1232131221, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-022', N'tuntt', CAST(N'2021-03-19 20:34:55.097' AS DateTime), N'Hà Nội', 1232131221, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-023', N'tuntt', CAST(N'2021-03-19 20:39:38.830' AS DateTime), N'Hà Nội', 1232131221, 200000, 0)
INSERT [dbo].[Orders] ([orderID], [userID], [orderDate], [shipAddress], [phoneNumber], [totalPrice], [status]) VALUES (N'ORDER-024', N'nanaTv', CAST(N'2021-03-19 22:07:20.517' AS DateTime), N'Hà Nội', 909905811, 400000, 0)
INSERT [dbo].[Product] ([productID], [userID], [itemsID], [productName]) VALUES (N'PRODUCT-001', N'admin', N'ITEM-001', N'Nồi Sunhouse')
INSERT [dbo].[Product] ([productID], [userID], [itemsID], [productName]) VALUES (N'PRODUCT-002', N'admin', N'ITEM-002', N'Chảo')
INSERT [dbo].[Product] ([productID], [userID], [itemsID], [productName]) VALUES (N'PRODUCT-003', N'admin', N'ITEM-001', N'Nồi bra')
INSERT [dbo].[Product] ([productID], [userID], [itemsID], [productName]) VALUES (N'PRODUCT-004', N'admin', N'ITEM-002', N'Chảo Elmich')
INSERT [dbo].[Product] ([productID], [userID], [itemsID], [productName]) VALUES (N'PRODUCT-005', N'admin', N'ITEM-002', N'Chảo Nướng Hàn Quốc')
INSERT [dbo].[Product] ([productID], [userID], [itemsID], [productName]) VALUES (N'PRODUCT-006', N'admin', N'ITEM-003', N'Dao Tiros')
INSERT [dbo].[Product] ([productID], [userID], [itemsID], [productName]) VALUES (N'PRODUCT-007', N'admin', N'ITEM-003', N'Dao Sunhouse')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-001', N'PRODUCT-001', N'S', N'Sunhouse', 150000, N'Chất liệu an toàn: Nồi Anod Sunhouse được sản xuất trên dây chuyền công nghệ hiện đại, có thiết kế đơn giản, tinh tế, màu sắc sáng bóng, bề mặt trơn nhẵn, dễ lau chùi nhờ làm từ hợp kim nhôm.', 0, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-002', N'PRODUCT-002', N'S', N'Bisbos', 200000, N'Chất liệu an toàn: Nồi Anod Sunhouse được sản xuất trên dây chuyền công nghệ hiện đại, có thiết kế đơn giản, tinh tế, màu sắc sáng bóng, bề mặt trơn nhẵn, dễ lau chùi nhờ làm từ hợp kim nhôm.', 14, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-003', N'PRODUCT-003', N'S', N'Sunhouse', 200000, N'Chất liệu an toàn: Nồi Anod Sunhouse được sản xuất trên dây chuyền công nghệ hiện đại, có thiết kế đơn giản, tinh tế, màu sắc sáng bóng, bề mặt trơn nhẵn, dễ lau chùi nhờ làm từ hợp kim nhôm.', 15, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-004', N'PRODUCT-001', N'M', N'Sunhouse', 220000, N'Chất liệu an toàn: Nồi Anod Sunhouse được sản xuất trên dây chuyền công nghệ hiện đại, có thiết kế đơn giản, tinh tế, màu sắc sáng bóng, bề mặt trơn nhẵn, dễ lau chùi nhờ làm từ hợp kim nhôm.', 200, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-005', N'PRODUCT-001', N'XL', N'Sunhouse', 100000, N'Chất liệu an toàn: Nồi Anod Sunhouse được sản xuất trên dây chuyền công nghệ hiện đại, có thiết kế đơn giản, tinh tế, màu sắc sáng bóng, bề mặt trơn nhẵn, dễ lau chùi nhờ làm từ hợp kim nhôm.', 100, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-006', N'PRODUCT-004', N'S', N'Elmich', 80000, N'Chảo chống dính được làm bằng chất liệu inox 304 có thể sử dụng trên nhiều loại bếp: bếp ga, bếp từ, bếp hồng ngoại... ', 100, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-007', N'PRODUCT-004', N'M', N'Elmich', 90000, N'Chảo chống dính được làm bằng chất liệu inox 304 có thể sử dụng trên nhiều loại bếp: bếp ga, bếp từ, bếp hồng ngoại... ', 100, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-008', N'PRODUCT-004', N'XL', N'Elmich', 100000, N'Chảo chống dính được làm bằng chất liệu inox 304 có thể sử dụng trên nhiều loại bếp: bếp ga, bếp từ, bếp hồng ngoại... ', 100, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-009', N'PRODUCT-005', N'S', N'Korea', 120000, N'Chảo dày, chống dính tuyệt vời. Có 4 lớp phủ chống dính siêu bền.
Khi nướng thịt có ướp, sẽ có cháy trên chảo, chỉ cần dùng giấy vệ sinh lau qua là sạch.', 90, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-010', N'PRODUCT-006', N'XL', N'Tiros', 130000, N'Bộ dao inox Tiross có lưỡi dao được làm từ chất liệu inox cao cấp, không chứa chất độc hại nên đảm bảo an toàn cho sức khỏe người sử dụng. Đặc biệt, bộ sản phẩm có độ sắc bén cao, cho đường cắt mịn, đẹp mắt', 15, 1)
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [size], [brand], [prize], [productDecription], [quantity], [statusIsDelete]) VALUES (N'PRODUCTDETAIL-011', N'PRODUCT-007', N'M', N'Sunhouse', 124000, N'Lưỡi dao sắc bén nhờ ứng dụng công nghệ mài đơn đến 65% bề mặt dao, tạo góc cắt nhỏ
Lưỡi dao cứng cáp, không gỉ sét có độ bền cao, đảm bảo an toàn cho sức khỏe', 12, 1)
INSERT [dbo].[ProductImg] ([productImgID], [productID], [productURLImg]) VALUES (N'IMAGE-001', N'PRODUCT-001', N'size26cm-price350000.jpg')
INSERT [dbo].[ProductImg] ([productImgID], [productID], [productURLImg]) VALUES (N'IMAGE-002', N'PRODUCT-002', N'size32x32cm-price319000.jpg')
INSERT [dbo].[ProductImg] ([productImgID], [productID], [productURLImg]) VALUES (N'IMAGE-003', N'PRODUCT-003', N'size28cm-price989000.jpg')
INSERT [dbo].[ProductImg] ([productImgID], [productID], [productURLImg]) VALUES (N'IMAGE-004', N'PRODUCT-004', N'size20cm-price420000.jpg')
INSERT [dbo].[ProductImg] ([productImgID], [productID], [productURLImg]) VALUES (N'IMAGE-005', N'PRODUCT-005', N'size32x32cm-price355000.jpg')
INSERT [dbo].[ProductImg] ([productImgID], [productID], [productURLImg]) VALUES (N'IMAGE-006', N'PRODUCT-006', N'price790000.jpg')
INSERT [dbo].[ProductImg] ([productImgID], [productID], [productURLImg]) VALUES (N'IMAGE-007', N'PRODUCT-007', N'size16cm-price145000.jpg')
INSERT [dbo].[RoleUser] ([roleID], [roleName]) VALUES (N'ROLE1', N'ADMIN')
INSERT [dbo].[RoleUser] ([roleID], [roleName]) VALUES (N'ROLE2', N'USER')
INSERT [dbo].[Users] ([userID], [roleID], [password], [fullName], [email], [phone], [address], [statusIsDelete]) VALUES (N'admin', N'ROLE1', N'1', N'ADMIN', N'admin@gmail.com', N'0909905871', N'HCM', 1)
INSERT [dbo].[Users] ([userID], [roleID], [password], [fullName], [email], [phone], [address], [statusIsDelete]) VALUES (N'anhnt', N'ROLE2', N'123456', N'Tuấn Anh', N'tuananh@gmail.com', N'0909905871', N'Hải Phòng', 1)
INSERT [dbo].[Users] ([userID], [roleID], [password], [fullName], [email], [phone], [address], [statusIsDelete]) VALUES (N'nanaTv', N'ROLE2', N'123456', N'Nguyển Thị Na', N'na1212@gmail.com', N'0909905811', N'Hà Nội', 1)
INSERT [dbo].[Users] ([userID], [roleID], [password], [fullName], [email], [phone], [address], [statusIsDelete]) VALUES (N'nhanhn', N'ROLE2', N'123456', N'Hồng Nhân', N'nhan@gmail.com', N'0909012910', N'Vĩnh Long', 1)
INSERT [dbo].[Users] ([userID], [roleID], [password], [fullName], [email], [phone], [address], [statusIsDelete]) VALUES (N'tuntt', N'ROLE2', N'123456', N'Nguyen Thanh Thanh Tu', N'tuntt@gmail.com', N'0123933101', N'Hà Nội', 1)
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productDetailID])
REFERENCES [dbo].[ProductDetail] ([productDetailID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([itemsID])
REFERENCES [dbo].[Items] ([itemsID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[ProductImg]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[RoleUser] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [KitchenStore] SET  READ_WRITE 
GO
