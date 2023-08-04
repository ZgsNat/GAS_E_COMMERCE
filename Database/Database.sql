USE [SWP391_SE1706_G4]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Role] [int] NULL,
	[status] [bit] NOT NULL,
	[StartDate] [datetime] NULL,
	[SocialSecurity] [int] NULL,
	[Avatar] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Rating] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[CouponID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[valid_from] [datetime] NOT NULL,
	[valid_to] [datetime] NOT NULL,
	[free_check] [bit] NOT NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[value] [nvarchar](20) NOT NULL,
	[bill_condition] [bigint] NULL,
	[max_value] [bigint] NULL,
	[Status] [int] NULL,
	[Avatar] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponDetail]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponDetail](
	[CouponID] [bigint] NOT NULL,
	[Product_discounted] [bigint] NOT NULL,
	[Product_required] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC,
	[Product_discounted] ASC,
	[Product_required] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[DOB] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Display] [bit] NOT NULL,
	[Avatar] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers_Promotions]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers_Promotions](
	[PromotionID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [bigint] NULL,
	[CouponID] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[CategoryID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[NewsImage] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News_Category]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_Category](
	[CategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[Type] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[PaymentMethod] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[UsageStatus] [bit] NOT NULL,
	[CouponID] [bigint] NULL,
	[Note] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[ProductSeries] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[WarrantyDate] [datetime] NOT NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC,
	[ProductSeries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[WarrantyPeriod] [float] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[DetailProduct] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[smallImg] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImg]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImg](
	[ProductID] [bigint] NOT NULL,
	[Img] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[Img] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSeries]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSeries](
	[ProductID] [bigint] NOT NULL,
	[ProductSeries] [bigint] IDENTITY(1,1) NOT NULL,
	[sold] [bit] NULL,
	[BatchSeries] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductSeries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warranty]    Script Date: 8/4/2023 9:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warranty](
	[ProductID] [bigint] NULL,
	[ProductSeriID] [bigint] NULL,
	[CustomerID] [bigint] NULL,
	[OrderID] [bigint] NULL,
	[status] [bit] NULL,
	[malfunctionDescription] [nvarchar](200) NULL,
	[note] [nvarchar](100) NULL,
	[location] [nvarchar](100) NULL,
	[fixDate] [datetime] NULL,
	[fixPrice] [int] NULL,
	[fixQuantity] [int] NULL,
	[productseries] [bigint] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (1, N'Nguyễn Xuân Thắng', N'0965121507', N'thang@gmail.com', N'123', N'HN', 124, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (2, N'Đàm Vũ Tuấn Minh', N'0123456789', N'minh@gmail.com', N'202CB962AC59075B964B07152D234B70', N'HN', 24, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (7, N'Cát Bá Lân', N'0123456798', N'lan@gmail.com', N'202CB962AC59075B964B07152D234B70', N'HN', 234, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (8, N'Nguyễn Thái Thịnh', N'5987342651', N'thinh@gmail.com', N'202CB962AC59075B964B07152D234B70', N'HN', 34, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (9, N'Trần Sỹ Cao Thiên', N'1234567890', N'thien@gmail.com', N'202CB962AC59075B964B07152D234B70', N'HN', 234, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (10, N'Ngô Bá Duy', N'9876543210', N'duy@gmail.com', N'202CB962AC59075B964B07152D234B70', N'HN', 234, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (11, N'Bùi Đức Anh', N'1029384756', N'danh@gmail.com', N'202CB962AC59075B964B07152D234B70', N'hn', 25, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (15, N'Vũ Thị Ngọc Ánh', N'2468013579', N'anh@gmail.com', N'202CB962AC59075B964B07152D234B70', N'hn', 135, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (16, N'Đỗ Quang Huy', N'5757575757', N'huy@gmail.com', N'202CB962AC59075B964B07152D234B70', N'hn', 1, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (17, N'Trần Văn Tùng', N'3692581470', N'tung@gmail.com', N'202CB962AC59075B964B07152D234B70', N'hn', 0, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (20, N'Nguyễn Quang Minh', N'0956121407', N'admin@gmail.com', N'202CB962AC59075B964B07152D234B70', N'HN', 0, 1, NULL, NULL, N'Default.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (21, N'Cát Bá Lân', N' 0965126941', N'lancbhe170162@fpt.edu.vn', N'202CB962AC59075B964B07152D234B70', N' 4/6, Thanh Vị, Sơn Lộc, Sơn Tây, Hà Nội', 12456, 1, NULL, NULL, N'image_1687976520542.jpg')
GO
INSERT [dbo].[Admin] ([AdminID], [AdminName], [PhoneNumber], [Email], [Password], [Address], [Role], [status], [StartDate], [SocialSecurity], [Avatar]) VALUES (22, N'Thịnh Nguyễn Thái', N'0963321628', N'nguyenthaithinh9876@gmail.com', N'202CB962AC59075B964B07152D234B70', N'P403, Toà D, Xuân Phương Residence, Nam Từ Liêm, Hà Nội', 6, 0, NULL, NULL, N'Default.jpg')
GO
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, N'bình ga', CAST(N'2023-05-13T10:00:00.000' AS DateTime), CAST(N'2023-05-13T10:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, N'bếp ga', CAST(N'2023-05-13T10:00:00.000' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (3, N'linh kiện bếp', CAST(N'2023-05-13T10:00:00.000' AS DateTime), NULL, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 1, 5, N'This product is amazing!', CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime), 3, 3)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (6, 1, 4, N'I really like this product!', CAST(N'2022-01-02T00:00:00.000' AS DateTime), CAST(N'2022-01-02T00:00:00.000' AS DateTime), 4, 4)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (7, 8, 3, N'It''s okay, but not my favorite', CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-01-03T00:00:00.000' AS DateTime), 5, 5)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 9, 2, N'I was disappointed with this product', CAST(N'2022-01-04T00:00:00.000' AS DateTime), CAST(N'2022-01-04T00:00:00.000' AS DateTime), 7, 7)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 12, 5, N'This is the best product I''ve ever used!', CAST(N'2022-01-05T00:00:00.000' AS DateTime), CAST(N'2022-01-05T00:00:00.000' AS DateTime), 8, 8)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 11, 1, N'Waste of money, do not buy', CAST(N'2022-01-06T00:00:00.000' AS DateTime), CAST(N'2022-01-06T00:00:00.000' AS DateTime), 11, 11)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 15, 4, N'I''m impressed with the quality', CAST(N'2022-01-07T00:00:00.000' AS DateTime), CAST(N'2022-01-07T00:00:00.000' AS DateTime), 12, 12)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 14, 3, N'It''s good, but not great', CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2022-01-08T00:00:00.000' AS DateTime), 10, 10)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 5, 2, N'I wouldn''t recommend this product', CAST(N'2022-01-09T00:00:00.000' AS DateTime), CAST(N'2022-01-09T00:00:00.000' AS DateTime), 9, 9)
GO
INSERT [dbo].[Comment] ([CommentID], [ProductID], [Rating], [Content], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 5, 3, N'It''s fine for the price', CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-10T00:00:00.000' AS DateTime), 9, 9)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (1, N'MAGIAMGIA10', N'Giam 10% cho don hàng tren 500.000d', CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 1, 10, CAST(N'2023-05-13T11:09:16.430' AS DateTime), CAST(N'2023-05-13T11:09:16.430' AS DateTime), 2, 2, N'10%', 500000, 0, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (2, N'MAGIAMGIA20', N'Giam 20% cho don hàng trên 1.000.000d', CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 1, 20, CAST(N'2023-05-13T11:09:16.430' AS DateTime), CAST(N'2023-05-13T11:09:16.430' AS DateTime), 2, 2, N'20%', 1000000, 0, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (3, N'MAGIAMGIA30', N'Giam 30% cho don hàng trên 1.500.000d', CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 1, 15, CAST(N'2023-05-13T11:09:16.430' AS DateTime), CAST(N'2023-05-13T11:09:16.430' AS DateTime), 2, 2, N'30%', 1500000, 0, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (4, N'MAGIAMGIA50', N'Giam 50.000d cho don hàng trên 500.000d', CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 1, 23, CAST(N'2023-05-13T11:09:16.430' AS DateTime), CAST(N'2023-05-13T11:09:16.430' AS DateTime), 2, 2, N'50000', 500000, 0, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (5, N'MAGIAMGIA100', N'Giam 100.000d cho don hàng trên 1.000.000d', CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 0, 49, CAST(N'2023-05-13T11:09:16.430' AS DateTime), CAST(N'2023-05-13T11:09:16.430' AS DateTime), 2, 2, N'100000', 1000000, 0, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (9, N'MAGIAMGIA15', N'Gi?m 15% cho don hàng trên 700.000d', CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 1, 70, CAST(N'2023-05-13T11:09:16.430' AS DateTime), CAST(N'2023-05-13T11:09:16.430' AS DateTime), 2, 2, N'15%', 700000, 100000, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (10, N'MAGIAMGIA25', N'Gi?m 25% cho don hàng trên 1.200.000d', CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 1, 5, CAST(N'2023-05-13T11:09:16.430' AS DateTime), CAST(N'2023-05-13T11:09:16.430' AS DateTime), 2, 2, N'25%', 1200000, 200000, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (14, N'VALENTINE22', N'Giảm 5% cho tất cả đơn hàng', CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-07-01T00:00:00.000' AS DateTime), 1, 9, CAST(N'2023-05-13T00:00:00.000' AS DateTime), NULL, 2, NULL, N'5%', 0, 0, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (15, N'VALENTINE', N'Giảm 10% cho bình ga khi mua cùng bếp ga', CAST(N'2023-06-30T00:00:00.000' AS DateTime), CAST(N'2023-07-08T00:00:00.000' AS DateTime), 1, 11, CAST(N'2023-06-29T14:47:31.000' AS DateTime), NULL, 17, NULL, N'10%', 0, 500000, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (16, N'123132312', N'Đồ ', CAST(N'2023-07-26T00:00:00.000' AS DateTime), CAST(N'2023-07-26T00:00:00.000' AS DateTime), 1, 3, CAST(N'2023-07-26T02:21:39.000' AS DateTime), NULL, 17, NULL, N'10%', 222222, 10000, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (17, N'423', N'Giam gia', CAST(N'2023-07-30T00:00:00.000' AS DateTime), CAST(N'2023-07-26T00:00:00.000' AS DateTime), 1, 5, CAST(N'2023-07-26T02:27:37.000' AS DateTime), NULL, 17, NULL, N'10%', 222222, 10000, 1, N'VoucherDefault.jpg')
GO
INSERT [dbo].[Coupon] ([CouponID], [Name], [Message], [valid_from], [valid_to], [free_check], [Quantity], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [value], [bill_condition], [max_value], [Status], [Avatar]) VALUES (18, N'MAGIAMGIA2', N'giam 10% cho toan bo san pham', CAST(N'2023-07-27T00:00:00.000' AS DateTime), CAST(N'2023-07-30T00:00:00.000' AS DateTime), 1, 10, CAST(N'2023-07-26T10:30:54.000' AS DateTime), NULL, 17, NULL, N'10%', 1000000, 10000, 1, N'VoucherDefault.jpg')
GO
SET IDENTITY_INSERT [dbo].[Coupon] OFF
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (1, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (2, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (3, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (4, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (5, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (9, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (10, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (14, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (15, 0, 0)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 1, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 5, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 8, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 9, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 10, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 11, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 12, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 13, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 14, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 15, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 18, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (16, 19, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (17, 5, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (18, 8, 1)
GO
INSERT [dbo].[CouponDetail] ([CouponID], [Product_discounted], [Product_required]) VALUES (18, 9, 1)
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (3, N'Trần Thị Nhàn', N'0912345678', N'tranthanhan@gmail.com', N'123', N'Số 10, ngõ 123, đường Nguyễn Khánh Toàn, quận Cầu Giấy, Hà Nội', CAST(N'1999-08-30' AS Date), CAST(N'2016-05-24T23:52:16.000' AS DateTime), 0, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (4, N' Lê Văn Huyền', N'0987654321', N'levanhuyen@yahoo.com', N'123', N'Số 23, đường Tô Hiệu, quận Hai Bà Trưng, Hà Nội', CAST(N'1999-09-29' AS Date), CAST(N'2018-02-05T05:08:53.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (5, N'Ngô Quang Vinh', N'0967890123', N'ngovinhquang@hotmail.com', N'123', N'Số 45, ngõ 56, đường Lê Trọng Tấn, quận Thanh Xuân, Hà Nội', CAST(N'2000-03-03' AS Date), CAST(N'2016-10-22T21:11:49.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (6, N'Phạm Thị Tuyết', N'0888888888', N'phamtuyett@gmail.com', N'123', N'Số 15, ngách 32, ngõ 78, đường Trần Thái Tông, quận Nam Từ Liêm, Hà Nội', CAST(N'2002-04-12' AS Date), CAST(N'2020-10-15T03:16:08.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (7, N'Vũ Thị Lan Anh', N'0898765432', N'vuthilananh@gmail.com', N'123', N'Số 78, đường Ngọc Hồi, quận Hoàng Mai, Hà Nội', CAST(N'2002-10-25' AS Date), CAST(N'2020-09-09T10:39:41.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (8, N'Đỗ Xuân Minh', N'0976543210', N'doxuanminh@outlook.com', N'123', N'Số 120, ngõ 86, đường Nguyễn Chí Thanh, quận Đống Đa, Hà Nội', CAST(N'2003-04-07' AS Date), CAST(N'2018-08-17T06:42:12.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (9, N'Hoàng Văn Khánh', N'0943210765', N'hoangvankhanh@gmail.com', N'123', N'Số 4, ngõ 27, đường Văn Cao, quận Ba Đình, Hà Nội', CAST(N'2003-05-19' AS Date), CAST(N'2018-02-23T11:46:29.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (10, N'Nguyễn Thị Thùy Dung', N'0954321098', N'nguyenthithuydung@gmail.com', N'123', N'Số 35, đường Đặng Tiến Đông, quận Cầu Giấy, Hà Nội', CAST(N'2003-08-26' AS Date), CAST(N'2023-04-15T17:24:57.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (11, N'Bùi Tiến Đạt', N'0932109876', N'buitiendat@yahoo.com', N'123', N'Số 67, ngõ 45, đường Lê Văn Lương, quận Thanh Xuân, Hà Nội', CAST(N'2003-10-21' AS Date), CAST(N'2020-04-11T07:16:34.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (12, N'Trần Minh Quânn    ', N'0923456789', N'tranminhquan@hotmail.com', N'25855D915F959367E4CD0F6C58720A13', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', CAST(N'2005-02-24' AS Date), CAST(N'2017-09-08T21:09:58.000' AS DateTime), 1, N'image_1690108086504.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (13, N'ZgsTNathan        ', N'0963321628', N'nguyenthaithinh9876@gmail.com', N'25855D915F959367E4CD0F6C58720A13', N'Tòa D, Xuân Phương Residence', CAST(N'2003-11-01' AS Date), CAST(N'2023-06-13T01:41:53.000' AS DateTime), 1, N'image_1690302579037.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (16, N'Nguyen Thai Thinh K17HL  ', N'0983297648', N'thinhnthe170395@fpt.edu.vn', N'C0049FAD4D9FAFC34635384D764521A4', N'', CAST(N'1900-01-01' AS Date), CAST(N'2023-06-13T13:15:50.000' AS DateTime), 1, N'image_1690341417216.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (17, N'Thai Thinh ', N'0984507289', N'thinhtuan2792003@gmail.com', N'45991717EB242BC2C1036B3D7DDC5399', N'P403, Toà D, Xuân Phương Residence, Nam Từ Liêm, Hà Nội', CAST(N'1900-01-01' AS Date), CAST(N'2023-06-13T13:16:25.000' AS DateTime), 1, N'Default.jpg')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (20, N'Cat Ba Lan K17 HL', NULL, N'lancbhe170162@fpt.edu.vn', N'9FC493B515CD637366498CD5C8C0A9CE', NULL, NULL, CAST(N'2023-06-26T14:46:02.000' AS DateTime), 1, N'https://lh3.googleusercontent.com/a/AAcHTtek2qDmaUmBKOhNbKzTI-FcahtLq_pr4pRgBA_5=s96-c')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Email], [Password], [Address], [DOB], [RegistrationDate], [Display], [Avatar]) VALUES (21, N'balan meo', N'', N'meobalan711@gmail.com', N'38F8B6EF11A557DF089CABD99A6088F6', N'', CAST(N'1900-01-01' AS Date), CAST(N'2023-06-29T13:21:04.000' AS DateTime), 1, N'image_1688019697768.jpg')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers_Promotions] ON 
GO
INSERT [dbo].[Customers_Promotions] ([PromotionID], [CustomerID], [CouponID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status]) VALUES (1, 6, 18, CAST(N'2023-07-26T10:34:14.000' AS DateTime), NULL, 17, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Customers_Promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (39, N'Thông tin gas và giá gas hôm nay 25/3/2023', 1, CAST(N'2023-03-25T01:18:44.447' AS DateTime), CAST(N'2023-07-23T00:20:25.390' AS DateTime), 1, 17, N'image_1690046425389.jpg', N'<h2 style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><strong>Th&ocirc;ng tin gas v&agrave; gi&aacute; gas thế giới 25/3</strong></h2>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; gas thế giới trong phi&ecirc;n giao dịch h&ocirc;m nay 25/3/2023 tăng 2,88% l&ecirc;n mức 2,216 USD/mmBTU đối với hợp đồng kh&iacute; gas tự nhi&ecirc;n giao th&aacute;ng 4/2023 v&agrave;o l&uacute;c 19h34 theo giờ Việt Nam.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Dự b&aacute;o gi&aacute; gas th&aacute;ng 4 ở mức 558 USD/tấn theo Saudi Aramco, con số n&agrave;y thấp hơn th&aacute;ng 3 l&agrave; 172 USD/tấn, th&ocirc;ng tin cập nhật l&uacute;c 16h38 ng&agrave;y 24/3/2023 giờ CT.</span></p>
<p><a style="color: #0088cc; text-decoration: none;" href="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-25-3-2023-1.png"><img id="attachment_8310" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;" src="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-25-3-2023-1.png" sizes="100vw" srcset="https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-25-3-2023-1.png 500w, https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-25-3-2023-1-300x187.png 300w" alt="" width="500" /></a></p>
<div id="attachment_8310" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;">
<p id="caption-attachment-8310" class="wp-caption-text" style="margin: 0px 0px 10px;">Th&ocirc;ng tin gas v&agrave; gi&aacute; gas h&ocirc;m nay 25/3/2023</p>
</div>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Theo Reuters, gi&aacute; kh&iacute; đốt tự nhi&ecirc;n kỳ hạn nh&iacute;ch tăng khoảng 2% v&agrave;o phi&ecirc;n giao dịch h&ocirc;m qua (thứ S&aacute;u ng&agrave;y 24/3) do c&aacute;c dự b&aacute;o x&aacute;c nhận rằng t&igrave;nh h&igrave;nh thời tiết diễn biến lạnh hơn b&igrave;nh thường trong hai tuần sắp tới, điều n&agrave;y khiến nhu cầu sưởi ấm cao hơn cho đến thời điểm đầu th&aacute;ng 4.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">NatGasWeather cho biết dữ liệu t&igrave;nh h&igrave;nh thời tiết đ&atilde; trở lại lạnh hơn trong phi&ecirc;n giao dịch v&agrave;o h&ocirc;m thứ S&aacute;u gi&uacute;p tạo ra một c&uacute; h&iacute;ch đ&aacute;ng kể cho hợp đồng kỳ hạn.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Đợt tăng gi&aacute; n&agrave;y diễn ra song song với những kỳ vọng về lượng kh&iacute; đốt tự nhi&ecirc;n h&oacute;a lỏng (LNG) tại c&aacute;c nh&agrave; m&aacute;y xuất khẩu sẽ chạm mức cao kỷ lục trong th&aacute;ng 3 sau khi nh&agrave; m&aacute;y xuất khẩu ở Texas l&agrave; Freeport LNG hoạt động trở lại v&agrave;o th&aacute;ng 2.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Nh&agrave; m&aacute;y xuất khẩu của Freeport LNG đ&atilde; thu h&uacute;t v&agrave;o khoảng 1,6 tỷ feet khối kh&iacute; mỗi ng&agrave;y v&agrave;o h&ocirc;m thứ S&aacute;u (tăng từ mức 1,5 bcf/ng&agrave;y v&agrave;o thứ Năm 23/3), theo như dữ liệu của Refinitiv. Freeport LNG cho biết v&agrave;o ng&agrave;y 8/3 rằng, họ đưa ra dự đo&aacute;n về d&ograve;ng kh&iacute; nạp sẽ tăng khi nh&agrave; m&aacute;y hoạt động tối đa c&ocirc;ng suất trong thời gian tới.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Tuy nhi&ecirc;n, c&aacute;c nguồn th&ocirc;ng tin quen thuộc với nh&agrave; m&aacute;y cho biết, nh&agrave; m&aacute;y Freeport LNG đang hủy một v&agrave;i l&ocirc; h&agrave;ng do một số vấn đề của ba đo&agrave;n t&agrave;u h&oacute;a lỏng của nh&agrave; m&aacute;y v&agrave; c&oacute; thể sẽ mất nhiều thời gian hơn để cơ ở c&oacute; thể hoạt động trở lại b&igrave;nh thường.</span></p>
<h2 style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><strong>Gi&aacute; gas trong nước</strong></h2>
<p><a style="color: #0088cc; text-decoration: none;" href="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-25-3-2023-2.jpg"><img id="attachment_8311" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;" src="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-25-3-2023-2.jpg" sizes="100vw" srcset="https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-25-3-2023-2.jpg 500w, https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-25-3-2023-2-300x225.jpg 300w" alt="" width="500" /></a></p>
<div id="attachment_8311" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;">
<p id="caption-attachment-8311" class="wp-caption-text" style="margin: 0px 0px 10px;">Th&ocirc;ng tin gas v&agrave; gi&aacute; gas h&ocirc;m nay 25/3/2023</p>
</div>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; gas b&aacute;n lẻ trong nước th&aacute;ng 3 được chốt ở con số giảm đ&aacute;ng kể gần 16.000 VNĐ mỗi b&igrave;nh d&acirc;n dụng 12kg v&igrave; gi&aacute; thế giới CP giảm đến 60 USD/tấn so với th&aacute;ng 2 (th&aacute;ng 2 l&agrave; 790 USD/tấn, th&aacute;ng 3 l&agrave; 730 USD/tấn).</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; gas b&aacute;n lẻ c&aacute;c sản phẩm b&igrave;nh gas Petrolimex tại H&agrave; Nội th&aacute;ng 3 l&agrave;: Đối với b&igrave;nh 12kg gi&aacute; 464.700 VNĐ v&agrave; b&igrave;nh 48kg gi&aacute; 1.858.600 VNĐ/b&igrave;nh 48kg.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Tr&ecirc;n đ&acirc;y l&agrave; những th&ocirc;ng tin gas v&agrave; gi&aacute; gas mới nhất h&ocirc;m nay 25/3/2023 m&agrave; ch&uacute;ng t&ocirc;i gửi đến để bạn đọc c&oacute; thể nắm được thị trường.</span></p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (40, N'Thông tin gas và giá gas hôm nay 6/4/2023', 1, CAST(N'2023-04-06T01:19:45.213' AS DateTime), CAST(N'2023-06-12T15:29:10.897' AS DateTime), 1, 17, N'image_1686558550893.jpg', N'<h2 style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><strong>Gi&aacute; gas trong nước</strong></h2>
<p><a style="color: #0088cc; text-decoration: none;" href="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-6-4-2023-2.jpg"><img id="attachment_8387" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;" src="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-6-4-2023-2.jpg" sizes="100vw" srcset="https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-6-4-2023-2.jpg 500w, https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-6-4-2023-2-300x280.jpg 300w" alt="" width="500" /></a></p>
<div id="attachment_8387" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;">
<p id="caption-attachment-8387" class="wp-caption-text" style="margin: 0px 0px 10px;">Th&ocirc;ng tin gas v&agrave; gi&aacute; gas h&ocirc;m nay 6/4/2023</p>
</div>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">V&agrave;o ng&agrave;y đầu ti&ecirc;n của th&aacute;ng 4, h&agrave;ng loạt c&aacute;c c&ocirc;ng ty kinh doanh gas lớn trong nước đ&atilde; đưa ra th&ocirc;ng b&aacute;o về t&igrave;nh h&igrave;nh gi&aacute; gas b&aacute;n lẻ trong nước th&aacute;ng n&agrave;y giảm mạnh đến gần 60.000 VNĐ mỗi b&igrave;nh d&acirc;n dụng 12kg.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">L&yacute; do được đưa ra l&agrave; v&igrave; gi&aacute; thế giới CP th&aacute;ng 4 được chốt ở 550 USD/tấn (th&aacute;ng 3 l&agrave; 730 USD/tấn c&oacute; nghĩa giảm mạnh 180 USD/tấn).</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; gas b&igrave;nh Petrolimex b&aacute;n lẻ tại thị trường H&agrave; Nội th&aacute;ng 4 l&agrave;: 405.300 VNĐ/b&igrave;nh 12kg v&agrave; 1.621.000 VNĐ/b&igrave;nh 48kg.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Tr&ecirc;n đ&acirc;y l&agrave; những th&ocirc;ng tin gas v&agrave; gi&aacute; gas mới nhất h&ocirc;m nay 6/4/2023 m&agrave; ch&uacute;ng t&ocirc;i gửi đến để bạn đọc c&oacute; thể nắm được thị trường.</span></p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (41, N'Thông tin giá gas thế giới 6/4', 1, CAST(N'2023-04-06T01:20:22.300' AS DateTime), CAST(N'2023-06-12T15:28:41.357' AS DateTime), 1, 17, N'image_1686558521356.jpg', N'<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; gas thế giới trong phi&ecirc;n giao dịch h&ocirc;m nay 6/4/2023 giảm 3,20% xuống c&ograve;n 2,086 USD/mmBTU đối với hợp đồng kh&iacute; gas tự nhi&ecirc;n giao th&aacute;ng 5/2023 v&agrave;o l&uacute;c 22h40 theo giờ Việt Nam.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Dự b&aacute;o gi&aacute; gas th&aacute;ng 5 ở mức 562 USD/tấn theo Saudi Aramco, con số n&agrave;y cao hơn th&aacute;ng 4 l&agrave; 12 USD/tấn, th&ocirc;ng tin cập nhật l&uacute;c 8h28 ng&agrave;y 6/4/2023.</span></p>
<p><a style="color: #0088cc; text-decoration: none;" href="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-6-4-2023-1.jpg"><img id="attachment_8386" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;" src="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-6-4-2023-1.jpg" sizes="100vw" srcset="https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-6-4-2023-1.jpg 500w, https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-6-4-2023-1-300x200.jpg 300w" alt="" width="500" /></a></p>
<div id="attachment_8386" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;">
<p id="caption-attachment-8386" class="wp-caption-text" style="margin: 0px 0px 10px;">Th&ocirc;ng tin gas v&agrave; gi&aacute; gas h&ocirc;m nay 6/4/2023</p>
</div>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Theo NGI, gi&aacute; kỳ hạn kh&iacute; đốt tự nhi&ecirc;n chịu &aacute;p lực rất lớn trong hầu hết năm 2023 t&iacute;nh đến thời điểm n&agrave;y do thời tiết &ocirc;n h&ograve;a c&ugrave;ng lượng sản xuất lớn, gi&aacute; đ&atilde; t&igrave;m thấy xu hướng tăng trong phi&ecirc;n thứ hai li&ecirc;n tiếp v&agrave;o ng&agrave;y thứ Tư (5/4) khi c&aacute;c chuy&ecirc;n gia giao dịch tập trung v&agrave;o sức mạnh xuất khẩu c&ugrave;ng những kỳ vọng về b&aacute;o c&aacute;o h&agrave;ng tồn kho tăng gi&aacute;. Tuy nhi&ecirc;n, h&ocirc;m nay gi&aacute; lại đi xuống.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Sản xuất v&agrave;o h&ocirc;m qua được giữ ở mức dưới 100 Bcf/ngay, đ&acirc;y l&agrave; mức ti&ecirc;u chuẩn trong những tuần trở lại đ&acirc;y, trong bối cảnh c&oacute; những sự kiện bảo tr&igrave; ngắn hạn, đặc biệt l&agrave; ở khu vực Đ&ocirc;ng Bắc. Theo ước t&iacute;nh của Wood Mackenzie, sản lượng khu vực đ&atilde; giảm khoảng 970 MMcf/ng&agrave;y v&agrave;o h&ocirc;m thứ Tư, do việc sửa chữa v&agrave; n&acirc;ng cấp ở v&ugrave;ng Pennsylvania dự kiến sẽ đạt mức đỉnh trong tuần n&agrave;y.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Một điều đ&aacute;ng ch&uacute; &yacute;, khối lượng kh&iacute; nạp tại cơ sở Freeport LNG đang phục hồi gần đ&acirc;y đ&atilde; đứng đầu với mức 2 Bcf/ng&agrave;y. Nh&agrave; m&aacute;y n&agrave;y sẽ hoạt động ở mức c&ocirc;ng suất tối đa l&agrave; 2,4 Bcf/ng&agrave;y trong tương lai.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Nh&igrave;n chung, mức nạp kh&iacute; LNG dao động quanh mức 14 Bcf/ng&agrave;y v&agrave; gần mức kỷ lục v&agrave;o h&ocirc;m thứ Hai tuần n&agrave;y, được hỗ trợ bởi Freeport. Tuy nhi&ecirc;n, xuất khẩu cũng đ&atilde; giảm xuống c&ograve;n 13,3 Bcf/ng&agrave;y v&agrave;o h&ocirc;m qua, đ&acirc;y l&agrave; một điều dễ hiểu bởi c&ocirc;ng t&aacute;c bảo tr&igrave; đang diễn ra.</span></p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (42, N'Thông tin gas 11/5', 1, CAST(N'2023-05-11T01:21:15.567' AS DateTime), CAST(N'2023-06-12T15:28:20.603' AS DateTime), 1, 17, N'image_1686558500602.jpg', N'<p><a style="color: #0088cc; text-decoration: none;" href="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-2.jpg"><img id="attachment_8438" class="wp-caption aligncenter image_resized" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;" src="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-2.jpg" sizes="100vw" srcset="https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-2.jpg 500w, https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-2-300x300.jpg 300w, https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-2-150x150.jpg 150w" alt="" width="500" /></a></p>
<div id="attachment_8438" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;">
<p id="caption-attachment-8438" class="wp-caption-text" style="margin: 0px 0px 10px;">Th&ocirc;ng tin gas v&agrave; gi&aacute; gas h&ocirc;m nay 11/5/2023</p>
</div>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; gas b&aacute;n lẻ trong nước th&aacute;ng 5 tăng nhẹ hơn 1.000 VNĐ mỗi b&igrave;nh d&acirc;n dụng 12kg so với th&aacute;ng 4 v&igrave; gi&aacute; CP th&aacute;ng n&agrave;y ở mức 555 USD/tấn, cao hơn th&aacute;ng trước 5 USD/tấn.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; gas b&igrave;nh Petrolimex b&aacute;n lẻ tại H&agrave; Nội th&aacute;ng 5 l&agrave;: 406.600 VNĐ/b&igrave;nh 12kg v&agrave; 1.626.300 VNĐ/b&igrave;nh 48kg.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Tr&ecirc;n đ&acirc;y l&agrave; những th&ocirc;ng tin gas v&agrave; gi&aacute; gas mới nhất h&ocirc;m nay 11/5/2023 m&agrave; ch&uacute;ng t&ocirc;i gửi đến để bạn đọc c&oacute; thể nắm được thị trường.</span></p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (43, N'Thông tin giá gas thế giới 11/5', 3, CAST(N'2023-05-11T01:21:43.350' AS DateTime), CAST(N'2023-06-12T15:27:56.397' AS DateTime), 1, 17, N'image_1686558476395.jpg', N'<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; gas thế giới trong phi&ecirc;n giao dịch h&ocirc;m nay 11/5/2023 giảm 0,64% xuống c&ograve;n 2,177 USD/mmBTU đối với hợp đồng kh&iacute; gas tự nhi&ecirc;n giao th&aacute;ng 6/2023 v&agrave;o l&uacute;c 15h41 giờ Việt Nam.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Dự b&aacute;o gi&aacute; gas th&aacute;ng 6 ở mức 508,5 USD/tấn theo Saudi Aramco, con số n&agrave;y thấp hơn th&aacute;ng 5 l&agrave; 46,5 USD/tấn, th&ocirc;ng tin cập nhật l&uacute;c 20h27 ng&agrave;y 10/5/2023 giờ CT.</span></p>
<p><a style="color: #0088cc; text-decoration: none;" href="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-1.jpg"><img id="attachment_8437" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;" src="http://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-1.jpg" sizes="100vw" srcset="https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-1.jpg 500w, https://gaspetrolimex.vn/assets/thong-tin-gas-va-gia-gas-hom-nay-11-5-2023-1-300x168.jpg 300w" alt="" width="500" /></a></p>
<div id="attachment_8437" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;">
<p id="caption-attachment-8437" class="wp-caption-text" style="margin: 0px 0px 10px;">Th&ocirc;ng tin gas v&agrave; gi&aacute; gas h&ocirc;m nay 11/5/2023</p>
</div>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Theo th&ocirc;ng tin từ Oilprice.com, thời tiết m&ugrave;a Xu&acirc;n diễn biến &ocirc;n h&ograve;a với nhu cầu kh&iacute; đốt thấp kết hợp với việc bảo tr&igrave; đường ống đ&atilde; khiến gi&aacute; kh&iacute; đốt tự nhi&ecirc;n giao ngay tại trung t&acirc;m Waha ở ph&iacute;a T&acirc;y Texas xuống con số ấm trong tuần n&agrave;y.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Lần cuối c&ugrave;ng gi&aacute; giao dịch tại s&agrave;n Waha giảm xuống dưới mức 0 USD đ&oacute; ch&iacute;nh l&agrave; v&agrave;o th&aacute;ng 10 năm ngo&aacute;i do gi&aacute; giao ngay đang phải đối mặt với những &aacute;p lực từ sự kết hợp kh&ocirc;ng may của thời tiết ấm &aacute;p tr&aacute;i m&ugrave;a, sản xuất ph&aacute;t triển mạnh v&agrave; hạn chế c&ocirc;ng suất vận chuyển đi.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Hiện tại, &aacute;p lực giảm gi&aacute; đến từ nhu cầu thấp hơn trong t&igrave;nh h&igrave;nh thời tiết &ocirc;n h&ograve;a v&agrave; tăng cường c&ocirc;ng việc bảo tr&igrave; đường ống dẫn kh&iacute; đốt trong giai đoạn mức ti&ecirc;u thụ thấp.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Gi&aacute; kh&iacute; đốt tự nhi&ecirc;n chuẩn của Mỹ tại s&agrave;n Henry Hub cho kết quả giảm v&agrave;o đầu ng&agrave;y thứ Tư (9/5) trong bối cảnh nhu cầu thấp sau khi tăng 1% l&ecirc;n con số cao nhất trong một tuần v&agrave;o h&ocirc;m thứ Ba ng&agrave;y 8/5.&nbsp;</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Xuất khẩu kh&iacute; đốt tự nhi&ecirc;n từ Canada sang Mỹ đang ở mức thấp nhất trong v&ograve;ng 25 th&aacute;ng l&agrave; 6,7 Bcf/ng&agrave;y v&agrave;o h&ocirc;m thứ Ba, theo th&ocirc;ng tin của Refinitiv.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Theo NGI, từ ng&agrave;y 9/5 đến ng&agrave;y 15/5, nhu cầu kh&iacute; đốt tự nhi&ecirc;n của Mỹ dự đo&aacute;n dao động ở mức thấp. Nhu cầu nước n&agrave;y sẽ ở mức nhẹ v&agrave;o những ng&agrave;y tới trong bối cảnh nhiệt độ &ocirc;n h&ograve;a dễ chịu mặc d&ugrave; dự kiến c&oacute; mưa r&agrave;o v&agrave; gi&ocirc;ng b&atilde;o xảy ra.</span></p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (44, N'Thông tin cơ bản về máy hóa hơi gas', 4, CAST(N'2023-06-01T01:22:19.893' AS DateTime), CAST(N'2023-06-22T10:46:12.997' AS DateTime), 1, 1, N'image_1687405501325.jpg', N'<h2 style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><strong>M&aacute;y h&oacute;a hơi gas l&agrave; g&igrave;?</strong></h2>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">M&aacute;y h&oacute;a hơi gas, c&ograve;n được gọi l&agrave; Vaporizer trong tiếng Anh, l&agrave; một thiết bị được sử dụng để tạo nhiệt trong qu&aacute; tr&igrave;nh l&agrave;m h&oacute;a hơi LPG. Hiện nay, theo quy định tại nước ta, m&aacute;y h&oacute;a hơi gas được ph&eacute;p lắp đặt ở ngo&agrave;i trời trong khoảng c&aacute;ch 1.5m theo cả bốn hướng, được gọi l&agrave; V&ugrave;ng 1. Trong khoảng từ tr&ecirc;n 1.5m đến dưới 3m theo cả bốn hướng được gọi l&agrave; V&ugrave;ng 2. Nếu m&aacute;y h&oacute;a hơi được lắp đặt trong ph&ograve;ng h&oacute;a hơi, th&igrave; căn ph&ograve;ng đ&oacute; v&agrave; c&aacute;c ph&ograve;ng b&ecirc;n cạnh sẽ kh&ocirc;ng được coi l&agrave; V&ugrave;ng 1 trừ khi kh&ocirc;ng loại trừ phần hơi.</span></p>
<figure class="image"><img id="attachment_8455" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;" src="http://gaspetrolimex.vn/assets/may-hoa-hoi-gas-1.jpg" sizes="100vw" srcset="https://gaspetrolimex.vn/assets/may-hoa-hoi-gas-1.jpg 500w, https://gaspetrolimex.vn/assets/may-hoa-hoi-gas-1-245x300.jpg 245w" alt="" width="500" /></figure>
<div id="attachment_8455" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;">
<p id="caption-attachment-8455" class="wp-caption-text" style="margin: 0px 0px 10px;">M&aacute;y h&oacute;a hơi gas</p>
</div>
<h2 style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><strong>Cấu tạo của m&aacute;y ho&aacute; hơi gas</strong></h2>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">M&aacute;y h&oacute;a hơi gas th&ocirc;ng thường được thiết kế để truyền nhiệt gi&aacute;n tiếp th&ocirc;ng qua m&ocirc;i trường nước. Hệ thống gia nhiệt trong bồn chứa c&oacute; chức năng để l&agrave;m bay hơi LPG lỏng để phục vụ việc nấu nướng v&agrave; điều chỉnh nhiệt độ của nước.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Một m&aacute;y h&oacute;a hơi gas thường c&oacute; c&aacute;c th&agrave;nh phần ch&iacute;nh sau đ&acirc;y:</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">&ndash; Van ngăn c&aacute;ch giữa LPG lỏng v&agrave; đường hơi.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">&ndash; Van an to&agrave;n được kết nối trực tiếp với kh&ocirc;ng gian chứa LPG hơi. Van an to&agrave;n được thiết kế với l&ograve; xo n&eacute;n trực tiếp hoặc tương đương, kh&ocirc;ng thể tự động điều chỉnh, v&agrave; được chế tạo để đảm bảo chức năng giảm &aacute;p của van kh&ocirc;ng bị ảnh hưởng bởi bất kỳ hư hỏng n&agrave;o của c&aacute;c bộ phận kh&aacute;c.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">&ndash; Van cắt khẩn cấp được lắp v&agrave;o phần đầu của m&aacute;y h&oacute;a hơi gas, vị tr&iacute; n&agrave;y dễ nh&igrave;n thấy, dễ tiếp cận v&agrave; dễ thao t&aacute;c để c&oacute; thể xử l&yacute; nhanh ch&oacute;ng trong t&igrave;nh huống khẩn cấp.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">&ndash; Van tự động điều khiển: Đối với m&aacute;y h&oacute;a hơi gas, th&agrave;nh phần n&agrave;y rất quan trọng để điều khiển để ngăn chặn LPG từ việc tr&agrave;n v&agrave;o kh&ocirc;ng gian ống.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">&ndash; Một số thiết bị kh&aacute;c bao gồm: Thiết bị đo v&agrave; b&aacute;o mực nước, thiết bị b&aacute;o nhiệt, đồng hồ đo &aacute;p suất ở đầu ra của m&aacute;y h&oacute;a hơi.</span></p>
<h2 style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><strong>Một số m&aacute;y ho&aacute; hơi phổ biến d&ugrave;ng cho LPG</strong></h2>
<figure class="image"><img id="attachment_8456" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;" src="http://gaspetrolimex.vn/assets/may-hoa-hoi-gas-2.jpg" sizes="100vw" srcset="https://gaspetrolimex.vn/assets/may-hoa-hoi-gas-2.jpg 500w, https://gaspetrolimex.vn/assets/may-hoa-hoi-gas-2-293x300.jpg 293w" alt="" width="500" /></figure>
<div id="attachment_8456" class="wp-caption aligncenter" style="-webkit-text-stroke-width: 0px; background-color: #ffffff; clear: both; color: #333333; display: block;">
<p id="caption-attachment-8456" class="wp-caption-text" style="margin: 0px 0px 10px;">M&aacute;y h&oacute;a hơi gas</p>
</div>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">M&aacute;y h&oacute;a hơi Gas LPG MS-EV50: L&agrave; một sản phẩm được nhập khẩu từ H&agrave;n Quốc v&agrave; thuộc thương hiệu nổi tiếng Ms Eng tr&ecirc;n thị trường. M&aacute;y h&oacute;a hơi gas n&agrave;y sử dụng nguồn điện để tạo nước n&oacute;ng v&agrave; gia nhiệt LPG một c&aacute;ch an to&agrave;n v&agrave; tiết kiệm thời gian. Thiết kế của m&aacute;y cũng rất nhỏ gọn v&agrave; mang đến vẻ đẹp thẩm mỹ cao.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">M&aacute;y h&oacute;a hơi Gas LPG tự nhi&ecirc;n: L&agrave; một loại m&aacute;y h&oacute;a hơi được sử dụng để biến LPG lỏng từ chai hoặc bồn chứa c&ocirc;ng nghiệp th&agrave;nh dạng hơi. M&aacute;y n&agrave;y cung cấp nhiệt lượng để l&agrave;m n&oacute;ng nước phục vụ cho qu&aacute; tr&igrave;nh h&oacute;a hơi LPG. Loại m&aacute;y n&agrave;y thường được lắp đặt trong c&aacute;c hệ thống ph&acirc;n phối gas trung t&acirc;m v&agrave; hệ thống lưu trữ.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">M&aacute;y h&oacute;a hơi Jinu JEVS-100:&nbsp; L&agrave; một m&aacute;y h&oacute;a hơi gas phổ biến được sử dụng tại c&aacute;c nh&agrave; h&agrave;ng v&agrave; khu nghỉ dưỡng để điều khiển c&aacute;c hệ thống gas lớn. Loại m&aacute;y n&agrave;y c&oacute; c&ocirc;ng suất ổn định, tiết kiệm gas tốt v&agrave; kh&ocirc;ng gặp sự cố bay gas kh&ocirc;ng mong muốn.</span></p>
<p style="-webkit-text-stroke-width: 0px; background-color: #ffffff; color: #333333;"><span style="font-weight: 400;">Tr&ecirc;n đ&acirc;y l&agrave; một số th&ocirc;ng tin cơ bản về m&aacute;y h&oacute;a hơi gas m&agrave; ch&uacute;ng t&ocirc;i gửi đến để bạn đọc c&oacute; thể hiểu th&ecirc;m về d&ograve;ng sản phẩm n&agrave;y.</span></p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (45, N'Giới thiệu', 6, CAST(N'2023-06-17T22:24:05.827' AS DateTime), NULL, 1, NULL, N'image_1687015445826.jpg', N'<div class="total-news" style="box-sizing: border-box; padding: 0px; margin: 20px 0px; text-align: justify; font-style: italic; color: #333333; font-family: Tahoma; font-size: 14px;">
<p style="box-sizing: border-box; padding: 0px; margin: 0px; line-height: 1.5;">Với kinh nghiệm hoạt động hơn 20 năm trong lĩnh vực Gas v&agrave; bếp gas H&agrave; Th&agrave;nh đ&atilde; tạo được uy t&iacute;n v&agrave; sự tin tưởng của Qu&yacute; Kh&aacute;ch h&agrave;ng. Ngay từ khi mới th&agrave;nh lập, Gas &amp; Bếp gas H&agrave; Th&agrave;nh đ&atilde; đặt ra v&agrave; lu&ocirc;n hướng tới mục:</p>
<div id="eJOY__extension_root" style="all: unset;">&nbsp;</div>
</div>
<ol style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cam kết b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cam kết b&aacute;n gi&aacute; thấp hơn gi&aacute; b&aacute;n lẻ của h&atilde;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Phương thức giao h&agrave;ng, lắp đặt v&agrave; thanh to&aacute;n Nhanh - Thuận tiện</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Tư vấn cho Kh&aacute;ch h&agrave;ng những sản phẩm ph&ugrave; hợp với chi ph&iacute; hợp l&yacute;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Sửa chữa v&agrave; bảo h&agrave;nh sản phẩm tại nh&agrave; kh&aacute;ch h&agrave;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Thường xuy&ecirc;n tổ chức c&aacute;c chương tr&igrave;nh khuyến mại hấp dẫn</li>
</ol>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">&nbsp;</p>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: inherit; line-height: 1.5; color: #283897; font-size: 16px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">C&aacute;c sản phẩm c&ocirc;ng ty cung cấp:​</strong></h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">B&igrave;nh gas&nbsp;&amp; Linh kiện của c&aacute;c h&atilde;ng uy t&iacute;n: Petro gas, Petrolimex, Petrovietnam, Shell gas, Total gaz, ..</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Bếp gas: Bếp gas &acirc;m,&nbsp;bếp gas dương,&nbsp;bếp gas đơn,&nbsp;bếp gas c&ocirc;ng nghiệp, bếp gas du lịch, bếp gas sinh vi&ecirc;n, bếp gas kết hợp điện .
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; line-height: 1.5;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Bếp gas ch&iacute;nh h&atilde;ng với mức gi&aacute; hấp dẫn</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Gồm c&aacute;c thương hiệu:&nbsp;Bếp gas Rinnai, bếp gas Paloma, bếp gas Canzy, bếp gas Binova, bếp gas Sunhouse, bếp gas Latino, bếp gas Giovani, ...</li>
</ul>
</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">M&aacute;y h&uacute;t m&ugrave;i c&aacute;c h&atilde;ng: Giovani, Rinnai, Sunhouse, Binova, Sevilla, Abbaka, Canzy, Benza, Fagor,...</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;"><a style="box-sizing: border-box; padding: 0px; margin: 0px; color: #337ab7;">Bếp điện</a>,&nbsp;<a style="box-sizing: border-box; padding: 0px; margin: 0px; color: #337ab7;">bếp từ</a>,<a style="box-sizing: border-box; padding: 0px; margin: 0px; color: #337ab7;">&nbsp;b​ếp điện từ</a></li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Phụ kiện nh&agrave; bếp&nbsp;kh&aacute;c.( tủ nấu cơm c&ocirc;ng nghiệp, bếp c&ocirc;ng nghiệp, nước uống tinh khiết, l&ograve; vi s&oacute;ng, m&aacute;y lọc nước, nồi cơm gas, b&igrave;nh n&oacute;ng lạnh gas).</li>
</ul>
<p>&nbsp;</p>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">Với uy t&iacute;n l&acirc;u d&agrave;i c&ugrave;ng sự tận t&acirc;m phục vụ, ch&uacute;ng t&ocirc;i lu&ocirc;n cố gắng hết m&igrave;nh hướng tới phương ch&acirc;m:</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;" align="center"><strong style="box-sizing: border-box; padding: 0px; margin: 0px; font-weight: bold;"><em style="box-sizing: border-box; padding: 0px; margin: 0px;">"Sản phẩm ch&iacute;nh h&atilde;ng - Gi&aacute; cạnh tranh - Giao h&agrave;ng tận nơi"</em></strong>.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;" align="center">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">Xin ch&acirc;n th&agrave;nh cảm ơn v&agrave; rất mong nhận được những &yacute; kiến đ&oacute;ng g&oacute;p để ch&uacute;ng t&ocirc;i phục vụ Qu&yacute; kh&aacute;ch h&agrave;ng tốt hơn.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px; font-weight: bold;">Th&ocirc;ng tin chi tiết vui l&ograve;ng li&ecirc;n hệ:</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px; font-weight: bold;">C&Ocirc;NG TY CỔ PHẦN GAS &amp; BẾP GAS H&Agrave; TH&Agrave;NH -&nbsp;</strong>Đơn vị uy t&iacute;n&nbsp;chuy&ecirc;n cung cấp loại gas v&agrave; bếp (bếp gas, bếp điện, bếp từ ), m&aacute;y h&uacute;t kh&oacute;i khử m&ugrave;i, thiết bị nh&agrave; bếp&nbsp;với sản phẩm uy t&iacute;n, chất lượng, dịch vụ chuy&ecirc;n nghiệp, gi&aacute; rẻ nhất Việt Nam.</p>
</div>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (46, N'Lịch sử hình thành', 6, CAST(N'2023-06-17T22:24:49.497' AS DateTime), NULL, 1, NULL, N'image_1687015489497.jpg', N'<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><em style="box-sizing: border-box; padding: 0px; margin: 0px;">10 năm h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển, Gas &amp; Bếp gas H&agrave; Th&agrave;nh ng&agrave;y c&agrave;ng vững mạnh trong lĩnh vực kinh doanh Gas v&agrave; c&aacute;c thiết bị nh&agrave; bếp. Ngay từ khi mới th&agrave;nh lập, Gas &amp; Bếp gas H&agrave; Th&agrave;nh đ&atilde; đặt ra v&agrave; lu&ocirc;n hướng tới mục ti&ecirc;u:</em></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ol style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cam kết b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cam kết b&aacute;n gi&aacute; thấp hơn gi&aacute; b&aacute;n lẻ của h&atilde;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Phương thức giao h&agrave;ng, lắp đặt v&agrave; thanh to&aacute;n Nhanh - Thuận tiện</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Tư vấn cho Kh&aacute;ch h&agrave;ng những sản phẩm ph&ugrave; hợp với chi ph&iacute; hợp l&yacute;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Sửa chữa v&agrave; bảo h&agrave;nh sản phẩm tại nh&agrave; kh&aacute;ch h&agrave;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Thường xuy&ecirc;n tổ chức c&aacute;c chương tr&igrave;nh khuyến mại hấp dẫn</li>
</ol>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Đến nay, C&ocirc;ng ty Gas &amp; Bếp gas H&agrave; Th&agrave;nh lu&ocirc;n nhận được sự t&iacute;n nhiệm của kh&aacute;ch h&agrave;ng v&agrave; đối t&aacute;c.&nbsp;</p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (47, N'Tầm nhìn & Sứ mệnh', 6, CAST(N'2023-06-17T22:25:39.927' AS DateTime), NULL, 1, NULL, N'image_1687015539925.jpg', N'<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">TẦM NH&Igrave;N</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Bằng kh&aacute;t vọng ti&ecirc;n phong c&ugrave;ng chiến lược đầu tư - ph&aacute;t triển bền vững,&nbsp;<strong style="box-sizing: border-box; padding: 0px; margin: 0px;">H&Agrave; TH&Agrave;NH</strong>&nbsp;phấn đấu trở th&agrave;nh C&ocirc;ng ty chuy&ecirc;n cung cấp kh&iacute; h&oacute;a lỏng&nbsp;gas LPG v&agrave; thiết bị ng&agrave;nh gas, thiết bị nh&agrave; bếp cao cấp h&agrave;ng đầu tại H&Agrave; NỘI&nbsp;&nbsp;v&agrave; Việt Nam, hướng đến một Tập đo&agrave;n mang đẳng cấp trong Nước v&agrave; mở rộng ra thị trường Quốc Tế.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">GAS H&Agrave; TH&Agrave;NH</strong>&nbsp;mong muốn tạo n&ecirc;n một thương hiệu Việt, thể hiện tầm v&oacute;c tr&iacute; tuệ v&agrave; niềm tự h&agrave;o Việt Nam.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">SỨ MỆNH</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Đối với kh&aacute;ch h&agrave;ng:</strong>&nbsp;Cung cấp c&aacute;c sản phẩm - dịch vụ với chất lượng ch&iacute;nh h&atilde;ng v&agrave; am hiểu s&acirc;u sắc nhu cầu vốn c&oacute; của kh&aacute;ch h&agrave;ng; mang t&iacute;nh hữu &iacute;ch v&agrave; An to&agrave;n. B&ecirc;n cạnh gi&aacute; trị chất lượng vượt trội, trong mỗi sản phẩm - dịch vụ đều chứa đựng những th&ocirc;ng điệp văn h&oacute;a, nhằm thỏa m&atilde;n tối đa nhu cầu ch&iacute;nh đ&aacute;ng của kh&aacute;ch h&agrave;ng.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Đối với cổ đ&ocirc;ng v&agrave; đối t&aacute;c:</strong>&nbsp;Đề cao tinh thần hợp t&aacute;c c&ugrave;ng ph&aacute;t triển; cam kết trở th&agrave;nh &ldquo;Người đồng h&agrave;nh số 1&rdquo; của c&aacute;c đối t&aacute;c v&agrave; cổ đ&ocirc;ng; lu&ocirc;n gia tăng c&aacute;c gi&aacute; trị đầu tư hấp dẫn v&agrave; bền vững.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Đối với nh&acirc;n vi&ecirc;n:</strong>&nbsp;X&acirc;y dựng m&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, năng động, s&aacute;ng tạo v&agrave; nh&acirc;n văn; tạo điều kiện thu nhập cao v&agrave; cơ hội ph&aacute;t triển c&ocirc;ng bằng cho tất cả nh&acirc;n vi&ecirc;n.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Đối với x&atilde; hội:</strong>&nbsp;H&agrave;i h&ograve;a lợi &iacute;ch doanh nghiệp với lợi &iacute;ch x&atilde; hội; đ&oacute;ng g&oacute;p t&iacute;ch cực v&agrave;o c&aacute;c hoạt động hướng về cộng đồng, thể hiện tinh thần tr&aacute;ch nhiệm c&ocirc;ng d&acirc;n v&agrave; niềm tự h&agrave;o d&acirc;n tộc.</li>
</ul>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">GI&Aacute; TRỊ CỐT L&Otilde;I:</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; background-color: #ffffff;" align="center"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">"T&Iacute;N - T&Acirc;M - TR&Iacute; "</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; background-color: #ffffff;" align="center">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">T&iacute;n: H&agrave; Th&agrave;nh&nbsp;</strong>bảo vệ chữ T&iacute;n như bảo vệ danh dự của ch&iacute;nh m&igrave;nh; Lu&ocirc;n chuẩn bị đầy đủ năng lực thực thi v&agrave; nỗ lực hết m&igrave;nh để đảm bảo đ&uacute;ng cam kết.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">T&acirc;m: H&agrave; Th&agrave;nh</strong>&nbsp;đặt chữ T&acirc;m l&agrave;m nền tảng; Duy tr&igrave; đạo đức; Lấy kh&aacute;ch h&agrave;ng l&agrave;m trung t&acirc;m.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Tr&iacute;: H&agrave; Th&agrave;nh</strong>&nbsp;&nbsp;coi s&aacute;ng tạo l&agrave; sức sống, l&agrave; đ&ograve;n bẩy ph&aacute;t triển; Đề cao tinh thần d&aacute;m nghĩ, d&aacute;m l&agrave;m; Chủ trương x&acirc;y dựng một "doanh nghiệp học tập".</li>
</ul>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Bạn c&oacute; biết hơn 50% kh&aacute;ch h&agrave;ng lựa chọn H&agrave; Th&agrave;nh l&agrave; nh&agrave; cung cấp thiết bị nh&agrave; bếp v&agrave; hệ thống gas chuy&ecirc;n nghiệp?</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Tr&ecirc;n thị trường hiện nay c&oacute; rất nhiều c&aacute;c cửa h&agrave;ng thiết bị ng&agrave;nh Gas v&agrave; đồ d&ugrave;ng bếp, tuy nhi&ecirc;n do sự đ&ograve;i hỏi về cạnh tranh m&agrave; c&oacute; rất nhiều cửa h&agrave;ng nhỏ lẻ đ&atilde; sử dụng c&aacute;c sản phẩm b&igrave;nh gas k&eacute;m chất lượng cũng như c&aacute;c thiết bị nh&agrave; bếp nh&aacute;i, giả mạo cung ứng cho kh&aacute;ch h&agrave;ng. H&agrave;nh động n&agrave;y l&agrave; rất nguy hiểm v&agrave; c&oacute; đe dọa cao đến sự an to&agrave;n của người sử dụng, c&aacute;c cửa h&agrave;ng quy m&ocirc;, chất lượng th&igrave; gi&aacute; cả kh&aacute; cao m&agrave; người c&oacute; thu nhập thấp rất e ngại khi mua sắm. Thấu hiểu nhu cầu n&agrave;y của kh&aacute;ch h&agrave;ng n&ecirc;n&nbsp;<strong style="box-sizing: border-box; padding: 0px; margin: 0px;">H&agrave; Th&agrave;nh&nbsp;</strong>đ&atilde; ra đời v&agrave; hoạt động bền bỉ suốt 20 năm qua với ti&ecirc;u ch&iacute; đem đến cho kh&aacute;ch h&agrave;ng c&aacute;c sản phẩm thiết bị nh&agrave; bếp v&agrave; hệ thống gas an to&agrave;n tiết kiệm cho mọi nh&agrave;.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">C&aacute;c thiết bị nh&agrave; bếp do&nbsp;<strong style="box-sizing: border-box; padding: 0px; margin: 0px;">H&agrave; Th&agrave;nh</strong>&nbsp;cung cấp l&agrave; d&ograve;ng sản phẩm chất lượng, c&oacute; uy t&iacute;n trong nước hoặc nhập khẩu trực tiếp từ nước ngo&agrave;i, thiết kế hiện đại, đẳng cấp với đủ loại c&aacute;c sản phẩm thiết bị nh&agrave; bếp như bếp gas, bếp từ, bếp điện từ, m&aacute;y h&uacute;t m&ugrave;i, m&aacute;y sấy b&aacute;t - rửa b&aacute;t, m&aacute;y lọc nước, l&ograve; nướng, chậu v&ograve;i, c&aacute;c đồ gia dụng... c&oacute; gi&aacute; th&agrave;nh tốt nhất, đảm bảo c&acirc;n đối ng&acirc;n s&aacute;ch gia đ&igrave;nh.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Với loại sản phẩm đặc th&ugrave; l&agrave; b&igrave;nh Gas, ch&uacute;ng t&ocirc;i lu&ocirc;n kiểm định chặt chẽ đảm bảo h&agrave;ng ch&iacute;nh h&atilde;ng 100% c&oacute; độ bền cao, an to&agrave;n khi sử dụng. Qu&yacute; kh&aacute;ch khi đổi b&igrave;nh gas hoặc lắp đặt hệ thống gas sẽ được nh&acirc;n vi&ecirc;n ch&uacute;ng t&ocirc;i tư vấn cho c&aacute;ch sử dụng hiệu quả, tiết kiệm năng lượng tối ưu, đồng thời đảm bảo an to&agrave;n khi sử dụng.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Đồng thời, c&aacute;c kh&aacute;ch h&agrave;ng sẽ được hỗ trợ thường xuy&ecirc;n từ<strong style="box-sizing: border-box; padding: 0px; margin: 0px;">&nbsp;H&agrave; Th&agrave;nh&nbsp;</strong>&nbsp;với ch&iacute;nh s&aacute;ch bảo h&agrave;nh chu đ&aacute;o v&agrave; khuyến m&atilde;i hấp dẫn d&agrave;nh cho kh&aacute;ch h&agrave;ng mới, kh&aacute;ch h&agrave;ng th&acirc;n thiết với c&aacute;c ưu đ&atilde;i giảm gi&aacute;, qu&agrave; tặng hữu &iacute;ch.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Ch&iacute;nh v&igrave; những ưu điểm v&agrave; ch&iacute;nh s&aacute;ch chăm s&oacute;c kh&aacute;ch h&agrave;ng tối ưu của m&igrave;nh m&agrave; ch&uacute;ng t&ocirc;i đ&atilde; trở th&agrave;nh người bạn th&acirc;n thiết của c&aacute;c gia đ&igrave;nh, trở th&agrave;nh nh&agrave; b&aacute;n lẻ thiết bị nh&agrave; bếp c&oacute; đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng tin cậy tr&ecirc;n thị trường.&nbsp;<strong style="box-sizing: border-box; padding: 0px; margin: 0px;">H&agrave; Th&agrave;nh&nbsp;</strong>đ&atilde; v&agrave; đang kh&ocirc;ng ngừng ph&aacute;t triển, mở rộng mạng lưới để trở th&agrave;nh nh&agrave; cung cấp thiết bị nh&agrave; bếp cao cấp h&agrave;ng đầu tại Việt Nam, hướng đến một Tập đo&agrave;n mang đẳng cấp trong nước v&agrave; quốc tế.</p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (48, N'Liên hệ', 6, CAST(N'2023-06-17T22:26:09.103' AS DateTime), NULL, 1, NULL, N'image_1687015569102.jpg', N'', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (49, N'Hướng dẫn mua hàng', 7, CAST(N'2023-06-17T22:26:50.473' AS DateTime), NULL, 1, NULL, N'image_1687015610474.jpg', N'<div class="total-news" style="box-sizing: border-box; padding: 0px; margin: 20px 0px; text-align: justify; font-style: italic; color: #333333; font-family: Tahoma; font-size: 14px;">
<p style="box-sizing: border-box; padding: 0px; margin: 0px; line-height: 1.5;">Sản phẩm được b&aacute;n trực tiếp tại cửa h&agrave;ng. Kh&aacute;ch h&agrave;ng c&oacute; thể gọi điện hoặc đặt mua qua website, ch&uacute;ng t&ocirc;i sẽ xử l&yacute; trong thời gian sớm nhất dựa tr&ecirc;n th&ocirc;ng tin kh&aacute;ch h&agrave;ng cung cấp.</p>
</div>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Mua h&agrave;ng ONLINE:</strong>&nbsp;Để mua h&agrave;ng tr&ecirc;n Website nhanh ch&oacute;ng bạn l&agrave;m theo c&aacute;c bước sau:</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Bước 1: Chọn sản phẩm</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Bạn v&agrave;o Website v&agrave; t&igrave;m c&aacute;c sản phẩm cần mua, để nhanh ch&oacute;ng bạn chọn c&aacute;c Danh mục tương ứng ở g&oacute;c tr&aacute;i Website.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Nếu bạn muốn t&igrave;m kiếm sản phẩm n&agrave;o đ&oacute; m&agrave; đ&atilde; biết t&ecirc;n hoặc khoảng gi&aacute; c&oacute; thể d&ugrave;ng c&ocirc;ng cụ t&igrave;m kiếm.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Sau khi chọn được sản phẩm, bạn click v&agrave;o n&uacute;t&nbsp;<span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #ff0000;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Th&ecirc;m v&agrave;o giỏ h&agrave;ng</strong></span>&nbsp;tương ứng với sản phẩm cần mua.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Bước 2: Đặt h&agrave;ng</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">Bạn c&oacute; thể đặt h&agrave;ng theo c&aacute;c c&aacute;ch sau:</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Gọi điện thoại đặt h&agrave;ng tới số Hotline tr&ecirc;n website</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Chat với nick Hỗ trợ trực tuyến v&agrave; Y&ecirc;u cầu đặt h&agrave;ng</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Đặt mua tr&ecirc;n Website</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">Bạn n&ecirc;n điền đầy đủ v&agrave; ch&iacute;nh x&aacute;c th&ocirc;ng tin để ch&uacute;ng t&ocirc;i c&oacute; thể li&ecirc;n hệ được với bạn sớm nhất.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Bước 3: Ho&agrave;n tất</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Sau khi nhận được đơn h&agrave;ng, nh&acirc;n vi&ecirc;n C&ocirc;ng ty sẽ x&aacute;c thực th&ocirc;ng tin, kiểm tra lại h&agrave;ng v&agrave; li&ecirc;n hệ lại với bạn.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Kh&aacute;ch h&agrave;ng tiến h&agrave;nh thanh to&aacute;n trực tiếp, chuyển tiền v&agrave;o t&agrave;i khoản của C&ocirc;ng ty, hoặc chuyển tiền qua nh&agrave; xe.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Sau khi x&aacute;c nhận th&ocirc;ng tin kh&aacute;ch h&agrave;ng v&agrave; nhận được tiền, ch&uacute;ng t&ocirc;i sẽ tiến h&agrave;nh chuyển h&agrave;ng sớm nhất cho Q&uacute;y kh&aacute;ch.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Bước 4: Nhận h&agrave;ng.</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Qu&yacute; kh&aacute;ch sẽ nhận được h&agrave;ng tại nh&agrave; nếu Qu&yacute; kh&aacute;ch ở nội th&agrave;nh H&agrave; nội.</p>
<p>&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px;">- Nếu ch&uacute;ng t&ocirc;i gửi h&agrave;ng Ph&aacute;t chuyển nhanh EMS Qu&yacute; kh&aacute;ch sẽ nhận sau 24h đến 48h.</p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (50, N'Phương thức vận chuyển', 7, CAST(N'2023-06-17T22:27:13.397' AS DateTime), NULL, 1, NULL, N'image_1687015633398.jpg', N'<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Vận chuyển nội th&agrave;nh h&agrave; nội.</strong></h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Miễn ph&iacute; vận chuyển đối với những đơn h&agrave;ng trong nội th&agrave;nh H&agrave; Nội. (Thời gian vận chuyển trong 24h)</li>
</ul>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Vận chuyển ngoại th&agrave;nh h&agrave; nội.</strong></h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Ph&iacute; vận chuyển&nbsp;t&ugrave;y theo khoảng c&aacute;ch vận chuyển nh&acirc;n vi&ecirc;n sẽ b&aacute;o gi&aacute; cho kh&aacute;ch h&agrave;ng.</li>
</ul>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Vận chuyển c&aacute;c tỉnh kh&aacute;c</strong></h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">T&ugrave;y đơn vị vận chuyển, ch&uacute;ng t&ocirc;i sẽ b&aacute;o gi&aacute; vận chuyển cho qu&yacute; kh&aacute;ch!</li>
</ul>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (51, N'Phương thức thanh toán ', 7, CAST(N'2023-06-17T22:27:44.853' AS DateTime), NULL, 1, NULL, N'image_1687015664854.jpg', N'<h2 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #d9271a; font-size: 20px; background-color: #ffffff; text-align: center;"><span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #ff0000;">Phương thức thanh to&aacute;n tại Gas &amp; Bếp gas H&agrave; Th&agrave;nh</span></h2>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Khi qu&yacute; kh&aacute;ch mua h&agrave;ng của Gas &amp; Bếp gas H&agrave; Th&agrave;nh, qu&yacute; kh&aacute;ch c&oacute; thể thanh to&aacute;n bằng c&aacute;c h&igrave;nh thức như sau:&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Thanh to&aacute;n bằng tiền mặt</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Thanh to&aacute;n bằng chuyển khoản</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">C&aacute;c h&igrave;nh thức kh&aacute;c</li>
</ul>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #006400;">1. Thanh to&aacute;n bằng tiền mặt​</span></h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<h4 style="box-sizing: border-box; padding: 0px; margin: 0px; font-family: Tahoma; line-height: 1.5; color: #333333; font-size: 14px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Thanh to&aacute;n trực tiếp tại C&ocirc;ng ty</strong></h4>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng thanh to&aacute;n trực tiếp tại c&ocirc;ng ty ngay khi mua h&agrave;ng tại c&aacute;c&nbsp;<a style="box-sizing: border-box; padding: 0px; margin: 0px; background-color: transparent; color: #337ab7; text-decoration-line: none;" href="http://bepgashathanh.vn/He-thong-cua-hang-58.html">Hệ thống cửa h&agrave;ng của Gas &amp; Bếp Gas H&agrave; Th&agrave;nh</a></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Trụ sở giao dịch:</strong>&nbsp;Số 124 - 126 Khương Đ&igrave;nh, Thanh xu&acirc;n, H&agrave; Nội</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Ngay khi qu&yacute; kh&aacute;ch thanh to&aacute;n xong, nh&acirc;n vi&ecirc;n kế to&aacute;n sẽ gửi lại qu&yacute; kh&aacute;ch h&oacute;a đơn t&agrave;i ch&iacute;nh v&agrave; nh&acirc;n vi&ecirc;n kinh doanh sẽ hướng dẫn qu&yacute; kh&aacute;ch h&igrave;nh thức giao nhận h&agrave;ng.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<h4 style="box-sizing: border-box; padding: 0px; margin: 0px; font-family: Tahoma; line-height: 1.5; color: #333333; font-size: 14px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Thanh to&aacute;n tại điểm giao h&agrave;ng</strong></h4>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Qu&yacute; kh&aacute;ch thanh to&aacute;n cho nh&acirc;n vi&ecirc;n giao nhận Gas &amp; Bếp gas H&agrave; Th&agrave;nh to&agrave;n bộ hoặc phần c&ograve;n lại của gi&aacute; trị đơn h&agrave;ng đ&atilde; mua (nếu đ&atilde; đặt cọc)</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">H&igrave;nh thức thanh to&aacute;n n&agrave;y chỉ thực hiện với c&aacute;c đơn h&agrave;ng c&oacute; địa chỉ giao h&agrave;ng tại nội th&agrave;nh th&agrave;nh phố H&agrave; Nội</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Nếu địa điểm giao h&agrave;ng ngay tại nơi thanh to&aacute;n, nh&acirc;n vi&ecirc;n giao h&agrave;ng của ch&uacute;ng t&ocirc;i sẽ thu tiền khi giao h&agrave;ng.</li>
</ul>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #006400;">2. Thanh to&aacute;n bằng chuyển khoản</span></h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Th&ocirc;ng tin chi tiết vui l&ograve;ng li&ecirc;n hệ&nbsp;<span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #ff0000;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">043 556.56.96</strong></span>&nbsp;hoặc&nbsp;<span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #ff0000;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">0966.865.788 - 0989.083.113&nbsp;</strong></span>để được tư vấn cụ thể v&agrave; giải đ&aacute;p mọi thắc mắc!</p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (52, N'Chính sách đổi hàng', 8, CAST(N'2023-06-17T22:30:46.573' AS DateTime), NULL, 1, NULL, N'image_1687015846574.jpg', N'<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Kh&aacute;ch h&agrave;ng chỉ c&oacute; thể đổi sản phẩm khi đ&aacute;p ứng đủ 04 điều kiện sau:</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Phải c&oacute; h&oacute;a đơn mua h&agrave;ng.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Sản phẩm phải c&ograve;n nguy&ecirc;n vẹn, nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng v&agrave; chưa sửa chữa.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Sản phẩm đ&atilde; mua kh&ocirc;ng qu&aacute; 03 ng&agrave;y.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Sản phẩm kh&ocirc;ng mua trong thời gian khuyến mại v&agrave; giảm gi&aacute;. Lưu &yacute;:
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; line-height: 1.5;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Kh&aacute;ch h&agrave;ng chỉ c&oacute; thể đổi sang sản phẩm kh&aacute;c bằng hoặc cao hơn gi&aacute; trị sản phẩm đ&atilde; mua v&agrave; thanh to&aacute;n số tiền ch&ecirc;nh lệch.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cửa h&agrave;ng kh&ocirc;ng ho&agrave;n trả lại tiền dưới bất kỳ h&igrave;nh thức n&agrave;o.</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cửa h&agrave;ng chỉ hỗ trợ tối đa một sản phẩm được đổi một lần, kh&ocirc;ng hỗ trợ đổi h&agrave;ng đối với sản phẩm đ&atilde; đổi một lần trước đ&oacute;</li>
</ul>
</li>
</ul>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (53, N'Chính sách bảo hành', 8, CAST(N'2023-06-17T22:31:10.457' AS DateTime), NULL, 1, NULL, N'image_1687015870455.jpg', N'<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Trong qu&aacute; tr&igrave;nh sử dụng nếu sản phẩm bị lỗi, qu&yacute; kh&aacute;ch vui l&ograve;ng mang sản phẩm lỗi đến cửa h&agrave;ng Gas &amp; Bếp gas H&agrave; Th&agrave;nh để được hỗ trợ.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; background-color: #ffffff;" align="center">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; background-color: #ffffff;" align="center">--------------------------*****-------------------------</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; background-color: #ffffff;" align="center">&nbsp;</p>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; background-color: #ffffff; text-align: center;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Cửa h&agrave;ng gas &amp; Bếp gas H&agrave; Th&agrave;nh</strong></h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; background-color: #ffffff;" align="center">Địa chỉ: Số 124 - 126 Khương Đ&igrave;nh, Thanh xu&acirc;n, H&agrave; Nội</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; background-color: #ffffff;" align="center">Điện thoại:&nbsp;<span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #ff0000;">043 556.56.96</span></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; background-color: #ffffff;" align="center">Hotline:&nbsp;<span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #ff0000;">0966.865.788 - 0989.083.113</span></p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (54, N'Chính sách chất lượng', 8, CAST(N'2023-06-17T22:31:30.133' AS DateTime), NULL, 1, NULL, N'image_1687015890132.jpg', N'<h2 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #d9271a; font-size: 20px; text-align: justify; background-color: #ffffff;">Gas &amp; Bếp gas H&agrave; Th&agrave;nh cam kết:</h2>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ol style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cam kết b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cam kết b&aacute;n gi&aacute; thấp hơn gi&aacute; b&aacute;n lẻ của h&atilde;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Phương thức giao h&agrave;ng, lắp đặt v&agrave; thanh to&aacute;n Nhanh - Thuận tiện</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Tư vấn cho Kh&aacute;ch h&agrave;ng những sản phẩm ph&ugrave; hợp với chi ph&iacute; hợp l&yacute;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Sửa chữa v&agrave; bảo h&agrave;nh sản phẩm tại nh&agrave; kh&aacute;ch h&agrave;ng&nbsp;</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Thường xuy&ecirc;n tổ chức c&aacute;c chương tr&igrave;nh khuyến mại hấp dẫn</li>
</ol>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Với uy t&iacute;n l&acirc;u d&agrave;i c&ugrave;ng sự tận t&acirc;m phục vụ, ch&uacute;ng t&ocirc;i lu&ocirc;n cố gắng hết m&igrave;nh hướng tới phương ch&acirc;m:</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">&nbsp;</p>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: inherit; line-height: 1.5; color: #283897; font-size: 16px; text-align: center;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">"Sản phẩm ch&iacute;nh​ h&atilde;ng - Gi&aacute; cạnh tranh - Giao h&agrave;ng tận nơi".</strong></h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Xin ch&acirc;n th&agrave;nh cảm ơn v&agrave; rất mong nhận được những &yacute; kiến đ&oacute;ng g&oacute;p để ch&uacute;ng t&ocirc;i phục vụ Qu&yacute; kh&aacute;ch h&agrave;ng tốt hơn.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Th&ocirc;ng tin chi tiết vui l&ograve;ng li&ecirc;n hệ:</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">C&Ocirc;NG TY CỔ PHẦN GAS &amp; BẾP GAS H&Agrave; TH&Agrave;NH</strong>&nbsp;-&nbsp;Đơn vị uy t&iacute;n&nbsp;chuy&ecirc;n cung cấp loại gas v&agrave; bếp (bếp gas, bếp điện, bếp từ ), m&aacute;y h&uacute;t kh&oacute;i khử m&ugrave;i, thiết bị nh&agrave; bếp&nbsp;với sản phẩm uy t&iacute;n, chất lượng, dịch vụ chuy&ecirc;n nghiệp, gi&aacute; rẻ nhất Việt Nam.</p>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Trụ sở giao dịch:&nbsp;số 124 -126 Khương Đ&igrave;nh, Thanh xu&acirc;n, H&agrave; Nội</div>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Hotline:&nbsp;<span style="box-sizing: border-box; padding: 0px; margin: 0px; color: #ff0000;">0966.865.788 - 0969.065.755</span></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Email: hagas.thietbibepcaocap@gmail.com</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Website:&nbsp;www.bepgashathanh.vn</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Rất mong được phục vui qu&yacute; kh&aacute;ch!</p>
</div>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (55, N'Chính sách bảo mật', 8, CAST(N'2023-06-17T22:31:46.290' AS DateTime), NULL, 1, NULL, N'image_1687015906290.jpg', N'<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Khi kh&aacute;ch h&agrave;ng truy cập v&agrave;o website n&agrave;y, trang web sẽ tự động lưu địa chỉ IP c&ugrave;ng với t&ecirc;n miền. Ch&uacute;ng t&ocirc;i cũng sử dụng c&aacute;c c&ocirc;ng cụ kiểm tra như "cookie". Một t&agrave;i khoản cookie sẽ lưu trữ dữ liệu m&agrave; server của website gửi đến tr&igrave;nh duyệt của bạn khi bạn truy cập v&agrave;o trang web, việc sử dụng chức năng n&agrave;y sẽ gi&uacute;p ch&uacute;ng t&ocirc;i hỗ trợ v&agrave; t&igrave;m hiểu nhu cầu, thị hiếu của kh&aacute;ch h&agrave;ng khi truy cập v&agrave;o website của ch&uacute;ng t&ocirc;i.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Ch&uacute;ng t&ocirc;i cũng kết hợp th&ocirc;ng tin về địa chỉ IP v&agrave; t&ecirc;n miền của bạn c&ugrave;ng với c&aacute;c th&ocirc;ng tin kh&aacute;c m&agrave; bạn cung cấp.&nbsp; C&aacute;c th&ocirc;ng tin n&agrave;y được cung cấp qua những&nbsp; email bạn gửi cho ch&uacute;ng t&ocirc;i, hoặc c&aacute;c th&ocirc;ng tin bạn điền khi muốn đăng k&yacute;, &yacute; kiến phản hồi, những y&ecirc;u cầu được hỗ trợ, trả lời phiếu điều tra hoặc tham gia v&agrave;o c&aacute;c hoạt động khuyến mại.</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Thu thập th&ocirc;ng tin c&aacute; nh&acirc;n v&agrave; c&aacute;c th&ocirc;ng tin người d&ugrave;ng kh&aacute;c</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Th&ocirc;ng tin được thu thập th&ocirc;ng qua website của ch&uacute;ng t&ocirc;i sẽ gi&uacute;p ch&uacute;ng t&ocirc;i:&nbsp;</strong></p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px; font-size: 14px; line-height: 1.5; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Hỗ trợ kh&aacute;ch h&agrave;ng khi mua sản phẩm của Gas &amp; Bếp gas H&agrave; Th&agrave;nh</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Giải đ&aacute;p thắc mắc kh&aacute;ch h&agrave;ng</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Cung cấp cho bạn th&ocirc;ng tin về c&aacute;c sản phẩm mới tr&ecirc;n Website của ch&uacute;ng t&ocirc;i</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Xem x&eacute;t v&agrave; n&acirc;ng cấp nội dung v&agrave; giao diện của Website</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Thực hiện c&aacute;c bản khảo s&aacute;t kh&aacute;ch h&agrave;ng</li>
<li style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px 30px; line-height: 21px;">Thực hiện c&aacute;c hoạt động quảng b&aacute; li&ecirc;n quan đến c&aacute;c sản phẩm v&agrave; dịch vụ của Gas &amp; Bếp gas H&agrave; Th&agrave;nh</li>
</ul>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Th&ocirc;ng tin chỉ được tiết lộ cho b&ecirc;n thứ ba trong những trường hợp đặc biệt khi c&oacute; sự y&ecirc;u cầu của luật ph&aacute;p hoặc nh&agrave; chức tr&aacute;ch c&oacute; thẩm quyền. Đặc biệt, ch&uacute;ng t&ocirc;i kh&ocirc;ng cho thu&ecirc; hoặc b&aacute;n th&ocirc;ng tin của bạn cho bất kỳ đối t&aacute;c thứ ba .</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; font-size: 14px; line-height: 21px; color: #333333; font-family: Tahoma; text-align: justify; background-color: #ffffff;">Khi bạn gửi th&ocirc;ng tin c&aacute; nh&acirc;n của bạn cho ch&uacute;ng t&ocirc;i, bạn đ&atilde; đồng &yacute; với c&aacute;c điều khoản m&agrave; ch&uacute;ng t&ocirc;i đ&atilde; n&ecirc;u ở tr&ecirc;n. Ch&uacute;ng t&ocirc;i cam kết rằng những th&ocirc;ng tin m&agrave; bạn đ&atilde; cung cấp cho ch&uacute;ng t&ocirc;i sẽ được bảo mật v&agrave; được sử dụng để đem lại lợi &iacute;ch tối đa cho bạn. Gas &amp; Bếp gas H&agrave; Th&agrave;nh sẽ nỗ lực để đảm bảo th&ocirc;ng tin của bạn được giữ b&iacute; mật. Tuy nhi&ecirc;n do hạn chế về mặt kỹ thuật, kh&ocirc;ng một dữ liệu n&agrave;o c&oacute; thể được truyền tr&ecirc;n đường truyền internet m&agrave; c&oacute; thể được bảo mật 100%. Do vậy, ch&uacute;ng t&ocirc;i kh&ocirc;ng thể đưa ra một cam kết chắc chắn rằng th&ocirc;ng tin bạn cung cấp cho ch&uacute;ng t&ocirc;i sẽ được bảo mật một c&aacute;ch tuyệt đối an to&agrave;n, v&agrave; ch&uacute;ng t&ocirc;i kh&ocirc;ng thể chịu tr&aacute;ch nhiệm trong trường hợp c&oacute; sự truy cập tr&aacute;i ph&eacute;p th&ocirc;ng tin c&aacute; nh&acirc;n của bạn. Nếu bạn kh&ocirc;ng đồng &yacute; với c&aacute;c điều khoản như đ&atilde; m&ocirc; tả ở tr&ecirc;n, Ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn kh&ocirc;ng n&ecirc;n gửi th&ocirc;ng tin đến cho ch&uacute;ng t&ocirc;i.&nbsp;</p>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (56, N'Bếp cảm ứng từ - xu hướng sử dụng bếp hiện đại', 4, CAST(N'2023-06-26T23:00:57.360' AS DateTime), CAST(N'2023-07-23T00:19:41.733' AS DateTime), 1, 17, N'image_1690046381729.jpg', N'<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Đem lại an to&agrave;n tuyệt đối cho người d&ugrave;ng</strong></h3>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">Hầu hết c&aacute;c loại bếp điện từ đều c&oacute; nguồn gốc xuất xứ từ Ch&acirc;u &Acirc;u lu&ocirc;n đảm bảo chất lượng tốt nhất, c&oacute; khả năng chịu lực chịu nhiệt cao. So với c&aacute;c loại bếp ga v&agrave; c&aacute;c loại bếp th&ocirc;ng thường kh&aacute;c th&igrave; bếp điện từ c&oacute; t&iacute;nh an to&agrave;n rất cao. L&yacute; giải cho điều n&agrave;y l&agrave; v&igrave; bếp c&oacute; nhiều chức năng kh&aacute;c nhau với việc cảnh b&aacute;o nhiệt lượng dư, chế độ tự động ngắt, bộ điều khiển kh&oacute;a an to&agrave;n đối với trẻ nhỏ...</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; background-color: #ffffff; text-align: center;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; background-color: #ffffff; text-align: center;"><img id="anh" style="box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; vertical-align: middle; max-width: 100%; height: auto;" title="l&yacute; do 
n&ecirc;n chọn bếp từ" src="http://bepgashathanh.vn/imgs/ly-do-nen-chon-bep-tu-33.jpg" alt="ly do nen chon bep 
tu" width="650" height="396" align="center" /></div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; background-color: #ffffff; text-align: center;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; background-color: #ffffff; text-align: center;"><em style="box-sizing: border-box; padding: 0px; margin: 0px;">Bếp điện từ thiết kế sang trọng, hiện đại &nbsp;</em></div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Tốt cho sức khỏe con người v&agrave; th&acirc;n thiện với m&ocirc;i trường</strong></h3>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">Bếp điện từ sử dụng năng lượng điện l&agrave; ch&iacute;nh, tia hồng ngoại c&oacute; t&aacute;c dụng tốt cho sức khỏe của mọi người, tr&aacute;nh kh&ocirc;ng l&agrave;m kh&ocirc; da m&agrave; c&oacute; khả năng giảm đau. Bếp nấu bằng điện n&ecirc;n kh&ocirc;ng c&oacute; kh&oacute;i như bếp gas hay bếp than, kh&ocirc;ng đốt ch&aacute;y oxy n&ecirc;n khả năng ch&aacute;y nổ ho&agrave;n to&agrave;n kh&ocirc;ng c&oacute;.</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">Đem lại hiệu quả nấu nướng cao&nbsp; &nbsp; &nbsp; &nbsp;</strong></h3>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">Bếp điện từ lu&ocirc;n được đ&aacute;nh gi&aacute; cao về hiệu suất nấu chiếm h&agrave;ng đầu so với bếp gas v&igrave; bếp điện từ l&ecirc;n tới 90% v&agrave; tiết kiệm đến 50% năng lượng cũng như thời gian nấu nướng trong khi bếp gas chỉ đạt 40 &ndash; 50% hiệu quả nấu nướng, thậm ch&iacute; thời gian gấp 2 lần nhi&ecirc;n liệu so với bếp điện từ. V&igrave; vậy đ&acirc;y cũng l&agrave; một trong những l&yacute; do ch&iacute;nh để người ti&ecirc;u d&ugrave;ng thay thế dần những chiếc bếp gas bằng bếp điện từ.</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">Nếu sử dụng&nbsp;<em style="box-sizing: border-box; padding: 0px; margin: 0px;"><a style="box-sizing: border-box; padding: 0px; margin: 0px; background-color: transparent; color: #337ab7; text-decoration-line: none;" href="http://bepgashathanh.vn/Bep-dien-tu.html">bếp điện từ</a></em>&nbsp;th&igrave; cũng n&ecirc;n lựa chọn nồi nấu ph&ugrave; hợp nhất l&agrave; nồi inox c&oacute; t&iacute;nh thu nhiệt nhanh, tỏa nhiệt đầu, chống ch&aacute;y kh&eacute;t lại tiết kiệm thời gian đun nấu. Lời khuy&ecirc;n d&agrave;nh cho bạn n&ecirc;n chọn xoong nồi inox với đ&aacute; y phẳng ph&ugrave; hợp, hạn chế c&aacute;c loại nồi tr&ograve;n v&igrave; n&oacute; được thiết kế ph&ugrave; hợp với t&iacute;nh năng ri&ecirc;ng của n&oacute;.</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; background-color: #ffffff; text-align: center;"><img id="anh" style="box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; vertical-align: middle; max-width: 100%; height: auto;" src="http://bepgashathanh.vn/imgs/bep-tu-dep-20.jpg" alt="bếp từ đẹp" width="700" height="630" align="center" /></div>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: Tahoma; line-height: 1.5; color: #283897; font-size: 16px; text-align: justify; background-color: #ffffff;"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">T&iacute;nh thẩm mỹ m&agrave; bếp cảm ứng từ mang lại cho ph&ograve;ng bếp hiện đại</strong></h3>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">Nhiều sản phẩm&nbsp;<a style="box-sizing: border-box; padding: 0px; margin: 0px; background-color: transparent; color: #337ab7; text-decoration-line: none;" href="http://bepgashathanh.vn/Bep-dien-tu.html"><strong style="box-sizing: border-box; padding: 0px; margin: 0px;">bếp điện từ</strong></a>&nbsp;sang trọng với c&ocirc;ng nghệ mới nhất được &aacute;p dụng được người ti&ecirc;u d&ugrave;ng hiện nay thoải m&aacute;i lựa chọn v&agrave; tin d&ugrave;ng.&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">&nbsp;</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">Với những ưu điểm cũng như t&iacute;nh năng tuyệt vời m&agrave; bếp từ mang lại, bạn đ&atilde; sẵn s&agrave;ng sắm ngay cho gia đ&igrave;nh m&igrave;nh một sản phẩm bếp từ hiện đại, sang trọng, an to&agrave;n n&agrave;y chưa? Li&ecirc;n hệ ngay với ch&uacute;ng t&ocirc;i để được tư vấn, b&aacute;o gi&aacute; tốt nhất nh&eacute;.</div>
<div style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px; color: #333333; font-family: Tahoma; font-size: 14px; text-align: justify; background-color: #ffffff;">
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">_______</p>
<h3 style="box-sizing: border-box; padding: 0px; margin: 20px 0px 0px; font-family: inherit; line-height: 1.5; color: #283897; font-size: 16px;">C&ocirc;ng ty thiết bị nh&agrave; bếp Gas &amp; Bếp gas H&agrave; Th&agrave;nh</h3>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Địa chỉ: Số 124 Khương Đ&igrave;nh, Thanh xu&acirc;n, H&agrave; Nội -</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">MST/DKKD/QĐTL: 0106099662</p>
<p style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; line-height: 21px;">Điện thoại:0243 556.56.96</p>
</div>', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (63, N'Phone', 10, NULL, NULL, 1, NULL, NULL, N'0963321729', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (64, N'Email', 10, NULL, NULL, 1, NULL, NULL, N'gasvietnam@gmail.com', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (66, N'Address', 10, NULL, NULL, NULL, NULL, NULL, N'Khu Công nghệ cao Hòa Lạc – Km29 Đại lộ Thăng Long, Thạch Thất, TP. Hà Nội', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (67, N'banner1', 11, NULL, NULL, NULL, NULL, N'image_1689050097223.jpg', N'active', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (68, N'banner2', 11, NULL, NULL, NULL, NULL, N'image_1689050107151.jpg', N'active', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (69, N'banner3', 11, NULL, NULL, NULL, NULL, N'image_1689050121813.jpg', N'active', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (70, N'b1', 11, NULL, NULL, NULL, NULL, N'image_1689050505972.jpg', N'active', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (97, N'Home', 9, NULL, NULL, NULL, NULL, NULL, N'Home', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (98, N'Demo', 9, NULL, NULL, NULL, NULL, NULL, N'showcart', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (99, N'Voucher', 9, NULL, NULL, NULL, NULL, NULL, N'v', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (100, N'Shop', 9, NULL, NULL, NULL, NULL, NULL, N'shop', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (101, N'Purchase History', 9, NULL, NULL, NULL, NULL, NULL, N'history', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (102, N'News', 9, NULL, NULL, NULL, NULL, NULL, N'Tin-tuc', NULL)
GO
INSERT [dbo].[News] ([NewsID], [Title], [CategoryID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [NewsImage], [Content], [Summary]) VALUES (103, N'Thông tin gas và giá gas hôm nay 17-5-2023', 1, CAST(N'2023-07-26T10:41:33.233' AS DateTime), NULL, 17, NULL, N'image_1690342893232.jpg', N'<p><em><strong><img src="uploads/image_1690342852318.jpg" alt="" width="100" height="133" />sdsdssdsds</strong></em></p>', N'âsa')
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[News_Category] ON 
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (1, N'Giá ga mới nhất hôm nay', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 1, 3)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (2, N'Tin tức khuyến mãi', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 1, 3)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (3, N'Tin tức Thị trường gas', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 1, 3)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (4, N'Tin tức mẹo hay', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 1, 3)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (5, N'Món ngon mỗi ngày', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 1, 3)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (6, N'Thông tin công ty', NULL, NULL, NULL, 2)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (7, N'Hỗ trợ khách hàng', NULL, NULL, NULL, 2)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (8, N'Chính sách', NULL, NULL, NULL, 2)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (9, N'Header', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (10, N'Contact', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[News_Category] ([CategoryID], [CategoryName], [CreatedDate], [ModifiedDate], [CreatedBy], [Type]) VALUES (11, N'Banner', NULL, NULL, NULL, 4)
GO
SET IDENTITY_INSERT [dbo].[News_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (12, 10, CAST(N'2023-05-01T10:30:00.000' AS DateTime), 986600, 1, 0, 0, NULL, N'Ðon hàng d?u tiên c?a khách hàng 1', N'Nguyễn Thị Thùy Dung', N'0954321098', N'Số 35, đường Đặng Tiến Đông, quận Cầu Giấy, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (13, 12, CAST(N'2023-05-02T14:25:00.000' AS DateTime), 813200, 0, 1, 0, NULL, N'Ðã giao hàng cho khách hàng 1', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (14, 3, CAST(N'2023-05-03T11:15:00.000' AS DateTime), 280000, 1, 0, 0, NULL, N'Ðon hàng d?u tiên c?a khách hàng 2', N'Trần Thị Nhàn', N'0965126941', N'Số 10, ngõ 123, đường Nguyễn Khánh Toàn, quận Cầu Giấy, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (15, 4, CAST(N'2023-05-04T16:45:00.000' AS DateTime), 2540600, 1, 1, 0, NULL, N'Ðã giao hàng cho khách hàng 2', N' Lê Văn Huyền', N'0987654321', N'Số 23, đường Tô Hiệu, quận Hai Bà Trưng, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (16, 5, CAST(N'2023-05-05T09:00:00.000' AS DateTime), 320000, 0, 0, 0, 1, N'Ðon hàng s? d?ng mã gi?m giá', N'Ngô Quang Vinh', N'0967890123', N'Số 45, ngõ 56, đường Lê Trọng Tấn, quận Thanh Xuân, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (17, 6, CAST(N'2023-05-06T13:10:00.000' AS DateTime), 3613200, 1, 0, 0, NULL, N'Ðon hàng d?u tiên c?a khách hàng 3', N'Phạm Thị Tuyết', N'0888888888', N'Số 15, ngách 32, ngõ 78, đường Trần Thái Tông, quận Nam Từ Liêm, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (18, 7, CAST(N'2023-05-07T15:20:00.000' AS DateTime), 813200, 1, 0, 0, NULL, N'Ðon hàng d?u tiên c?a khách hàng 4', N'Vũ Thị Lan Anh', N'0898765432', N'Số 78, đường Ngọc Hồi, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (19, 8, CAST(N'2023-05-08T12:30:00.000' AS DateTime), 1219800, 0, 2, 0, NULL, N'Ðã huỷ don hàng c?a khách hàng 4', N'Đỗ Xuân Minh', N'0976543210', N'Số 120, ngõ 86, đường Nguyễn Chí Thanh, quận Đống Đa, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (20, 9, CAST(N'2023-05-09T09:45:00.000' AS DateTime), 2582900, 1, 1, 0, NULL, N'Ðã giao hàng cho khách hàng 5', N'Hoàng Văn Khánh', N'0943210765', N'Số 4, ngõ 27, đường Văn Cao, quận Ba Đình, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (21, 10, CAST(N'2023-05-10T17:00:00.000' AS DateTime), 406600, 0, 1, 1, NULL, N'Ðã sử dụng xong don hàng c?a khách hàng 5', N'Nguyễn Thị Thùy Dung', N'0954321098', N'Số 35, đường Đặng Tiến Đông, quận Cầu Giấy, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (22, 12, CAST(N'2023-06-24T22:16:11.000' AS DateTime), 1760000, 1, 0, 0, NULL, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (23, 12, CAST(N'2023-06-24T22:42:26.000' AS DateTime), 606100, 1, 0, 0, 14, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 29000)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (24, 12, CAST(N'2023-06-25T23:55:32.000' AS DateTime), 1341780, 0, 0, 0, NULL, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (25, 12, CAST(N'2023-06-26T00:18:11.000' AS DateTime), 424897, 0, 0, 0, 14, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 20330)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (26, 12, CAST(N'2023-06-26T00:21:09.000' AS DateTime), 402534, 0, 0, 0, 14, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 40660)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (27, 12, CAST(N'2023-06-26T00:26:02.000' AS DateTime), 447260, 0, 0, 0, NULL, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (28, 12, CAST(N'2023-06-26T00:28:01.000' AS DateTime), 424897, 0, 0, 0, 14, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 20330)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (29, 12, CAST(N'2023-06-26T00:29:32.000' AS DateTime), 447260, 0, 0, 0, NULL, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (30, 12, CAST(N'2023-06-26T00:31:37.000' AS DateTime), 447260, 0, 0, 0, NULL, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (31, 12, CAST(N'2023-06-26T12:39:56.000' AS DateTime), 447260, 1, 0, 0, NULL, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (32, 12, CAST(N'2023-06-26T12:49:55.000' AS DateTime), 447260, 1, 0, 0, NULL, N'', N'Trần Minh Quân', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (33, 16, CAST(N'2023-07-23T02:03:08.000' AS DateTime), 7656000, 0, 0, 0, NULL, N'', N'Thịnh Nguyễn Thái', N'0963321628', N'P403, Toà D, Xuân Phương Residence, Nam Từ Liêm, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (34, 12, CAST(N'2023-07-23T17:22:34.000' AS DateTime), 1056000, 0, 0, 0, NULL, N'', N'Trần Minh Quânn', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (35, 12, CAST(N'2023-07-24T14:18:30.000' AS DateTime), 3130710, 0, 0, 0, NULL, N'', N'Trần Minh Quânn', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (36, 12, CAST(N'2023-07-24T14:28:58.000' AS DateTime), 1789040, 0, 0, 0, NULL, N'', N'Trần Minh Quânn', N'0923456789', N'Số 98, đường Nguyễn Khuyến, quận Hoàng Mai, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (37, 13, CAST(N'2023-07-25T23:32:09.000' AS DateTime), 19678230, 0, 0, 0, NULL, N'', N'ZgsTNathan', N'0963321628', N'Tòa D, Xuân Phương Residence', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (38, 16, CAST(N'2023-07-26T01:48:53.000' AS DateTime), 1554520, 0, 0, 0, NULL, N'', N'Thịnh Nguyễn Thái', N'0963321628', N'P403, Toà D, Xuân Phương Residence, Nam Từ Liêm, Hà Nội', 0)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PurchaseDate], [TotalPrice], [PaymentMethod], [Status], [UsageStatus], [CouponID], [Note], [Name], [Phone], [Address], [Discount]) VALUES (39, 16, CAST(N'2023-07-26T10:22:28.000' AS DateTime), 805068, 1, 0, 0, 1, N'', N'Thinh THAI Nguyen', N'0963321619', N'P403, Toà D, Xuân Phương Residence, Nam Từ Liêm, Hà Nội', 81320)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (12, 1, N'2', 1, 406600, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (12, 15, N'185', 1, 580000, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (13, 1, N'18', 1, 406600, CAST(N'2023-12-13T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (13, 1, N'3', 1, 813200, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (14, 10, N'68', 1, 280000, CAST(N'2024-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (15, 5, N'1', 1, 406600, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (15, 12, N'104', 1, 2134000, CAST(N'2024-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (16, 9, N'56', 1, 320000, CAST(N'2024-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (17, 1, N'4', 2, 813200, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (17, 13, N'130', 1, 2800000, CAST(N'2024-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (18, 5, N'35', 2, 813200, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (19, 1, N'5', 3, 1219800, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (20, 1, N'6', 1, 406600, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (20, 8, N'48', 1, 1626300, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (20, 14, N'165', 1, 550000, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (21, 1, N'7', 1, 406600, CAST(N'2023-12-13T10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (22, 11, N'89', 1, 0, CAST(N'2024-06-24T22:16:11.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (23, 15, N'186', 1, 0, CAST(N'2024-06-24T22:42:27.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (24, 1, N'8', 1, 0, CAST(N'2024-06-25T23:55:32.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (24, 1, N'9', 1, 0, CAST(N'2024-06-25T23:55:32.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (24, 5, N'36', 1, 0, CAST(N'2024-06-25T23:55:32.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (25, 1, N'10', 1, 0, CAST(N'2024-06-26T00:18:12.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (26, 1, N'11', 1, 0, CAST(N'2024-06-26T00:21:09.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (27, 1, N'12', 1, 0, CAST(N'2024-06-26T00:26:02.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (28, 1, N'13', 1, 0, CAST(N'2024-06-26T00:28:01.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (29, 1, N'14', 1, 0, CAST(N'2024-06-26T00:29:32.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (30, 1, N'15', 1, 406600, CAST(N'2024-06-26T00:31:37.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (31, 1, N'16', 1, 406600, CAST(N'2024-06-26T12:39:56.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (32, 1, N'17', 1, 406600, CAST(N'2024-06-26T12:49:55.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (33, 10, N'69', 1, 280000, CAST(N'2024-07-23T02:03:08.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (33, 10, N'70', 1, 280000, CAST(N'2024-07-23T02:03:08.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (33, 11, N'90', 1, 1600000, CAST(N'2024-07-23T02:03:08.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (33, 11, N'91', 1, 1600000, CAST(N'2024-07-23T02:03:08.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (33, 11, N'92', 1, 1600000, CAST(N'2024-07-23T02:03:08.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (33, 11, N'93', 1, 1600000, CAST(N'2024-07-23T02:03:08.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (34, 9, N'57', 1, 320000, CAST(N'2024-07-23T17:22:34.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (34, 9, N'58', 1, 320000, CAST(N'2024-07-23T17:22:34.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (34, 9, N'59', 1, 320000, CAST(N'2024-07-23T17:22:34.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (35, 5, N'37', 1, 406600, CAST(N'2024-07-24T14:18:30.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (35, 5, N'38', 1, 406600, CAST(N'2024-07-24T14:18:30.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (35, 5, N'39', 1, 406600, CAST(N'2024-07-24T14:18:30.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (35, 8, N'49', 1, 1626300, CAST(N'2024-07-24T14:18:30.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (36, 5, N'40', 1, 406600, CAST(N'2024-07-24T14:28:58.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (36, 5, N'41', 1, 406600, CAST(N'2024-07-24T14:28:58.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (36, 5, N'42', 1, 406600, CAST(N'2024-07-24T14:28:58.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (36, 5, N'43', 1, 406600, CAST(N'2024-07-24T14:28:58.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (37, 8, N'0', 1, 1626300, CAST(N'2024-07-25T23:32:09.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (37, 8, N'50', 1, 1626300, CAST(N'2024-07-25T23:32:09.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (37, 8, N'51', 1, 1626300, CAST(N'2024-07-25T23:32:09.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (37, 8, N'52', 1, 1626300, CAST(N'2024-07-25T23:32:09.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (37, 8, N'53', 1, 1626300, CAST(N'2024-07-25T23:32:09.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (37, 8, N'54', 1, 1626300, CAST(N'2024-07-25T23:32:09.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (37, 8, N'55', 1, 1626300, CAST(N'2024-07-25T23:32:09.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (38, 1, N'18', 1, 406600, CAST(N'2024-07-26T01:48:53.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (38, 5, N'44', 1, 406600, CAST(N'2024-07-26T01:48:53.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (38, 9, N'60', 1, 320000, CAST(N'2024-07-26T01:48:53.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (38, 10, N'71', 1, 280000, CAST(N'2024-07-26T01:48:53.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (39, 5, N'45', 1, 406600, CAST(N'2024-07-26T10:22:28.000' AS DateTime), 0)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductSeries], [Quantity], [Price], [WarrantyDate], [Status]) VALUES (39, 5, N'46', 1, 406600, CAST(N'2024-07-26T10:22:28.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (1, N'Bình Gas petrolimex 12kg van ngang', 1, 406600, 100, 1, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-06-15T13:21:57.000' AS DateTime), 1, 17, N'<p>&ndash; Kh&iacute; gas h&oacute;a lỏng trong b&igrave;nh c&oacute; trọng lượng l&agrave; 12kg. &ndash; Sản phẩm kh&iacute; gas được chiết nạp bằng m&aacute;y n&ecirc;n c&oacute; độ ch&iacute;nh x&aacute;c cao. &ndash; Chất lượng kh&iacute; gas nhập khẩu được kiểm định bởi c&ocirc;ng ty</p>', 1, N'image_1686810117348.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (5, N'Bình gas Petrolimex 12kg van chụp', 1, 406600, 100, 1, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-06-15T13:22:08.000' AS DateTime), 1, 17, N'<p>B&igrave;nh gas Petrolimex 12kg van chụp l&agrave; sản phẩm ti&ecirc;u biểu của thương hiệu Petrolimex nổi tiếng to&agrave;n quốc. Đ&acirc;y l&agrave; thương hiệu cung cấp năng lượng phục vụ cho nhu cầu sinh hoạt v&agrave; sản xuất của người ti&ecirc;u d&ugrave;ng Việt Nam. Sản phẩm b&igrave;nh gas Petrolimex van chụp cũng được thương hiệu n&agrave;y cam kết l&agrave; an to&agrave;n, ch&iacute;nh h&atilde;ng, đảm bảo chất lượng v&agrave; độ an to&agrave;n cho người sử dụng v&igrave; trước khi được đưa ra thị trường, mọi b&igrave;nh gas đều được kiểm tra v&agrave; đ&aacute;nh gi&aacute; nghi&ecirc;m ngặt về trọng lượng, chất lượng gas để phục vụ nhu cầu của người ti&ecirc;u d&ugrave;ng một c&aacute;ch ho&agrave;n hảo nhất.</p>', 1, N'image_1686810128482.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (8, N'Bình gas công nghiệp Petrolimex 48kg', 1, 1626300, 50, 1, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-07-26T09:08:37.000' AS DateTime), 1, 1, N'<p>Sản phẩm n&agrave;y từ khi được đưa ra thị trường đ&atilde; nhanh ch&oacute;ng chiếm được cảm t&igrave;nh của người ti&ecirc;u d&ugrave;ng bởi danh tiếng của thương hiệu, chất lượng gas, trọng lượng gas được c&acirc;n đầy đủ, đồng thời lại tuyệt đối an to&agrave;n cho sức khỏe của người sử dụng.</p>', 1, N'image_1690337317550.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (9, N'Bếp gas đơn Sunhouse', 2, 320000, 20, 2, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-06-15T13:22:55.000' AS DateTime), 1, 17, N'<p>Trung t&acirc;m của ch&uacute;ng t&ocirc;i nhận thi c&ocirc;ng, lắp đặt c&aacute;c hệ thống gi&agrave;n gas c&ocirc;ng nghiệp cho c&aacute;c nh&agrave; h&agrave;ng, kh&aacute;ch sạn v&agrave; c&aacute;c c&ocirc;ng tr&igrave;nh đ&ocirc; thị cũng như bếp ăn c&ocirc;ng nghiệp, khu chế xuất, trường học, bệnh viện,&hellip; ***(c&oacute; thể một số nơi mọi người c&oacute; thể viết l&agrave; d&agrave;n gas c&ocirc;ng nghiệp)</p>', 1, N'image_1686810175037.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (10, N'Bếp gas đơn Sakura', 2, 280000, 20, 2, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-06-15T13:23:06.000' AS DateTime), 1, 17, N'<p>Bao gồm Bếp đơn k&iacute;nh () Gi&aacute;: 350.000 Van gas cầu tr&igrave; : Gi&aacute; 95.000 ( Xem h&igrave;nh b&ecirc;n dưới b&agrave;i viết) D&acirc;y gas l&otilde;i th&eacute;p chống chuột h&agrave;n quốc : 75.000 B&igrave;nh gas petrolimex 12 kg : 450.000 Vỏ gas petrolimex : 250.000</p>', 1, N'image_1686810186067.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (11, N'BẾP GAS ĐÔI HALSAN HS-300M', 2, 1600000, 10, 2, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-06-15T13:23:17.000' AS DateTime), 1, 17, N'<p>Bếp gas đơn k&iacute;nh nanosa Khả năng tề gia nội trợ lu&ocirc;n được đ&aacute;nh gi&aacute; l&agrave; một trong những ti&ecirc;u ch&iacute; kh&ocirc;ng thể thiếu của người phụ nữ, d&ugrave; l&agrave; thời phong kiến khắc nghiệt hay cả thời hiện đại với quan niệm c&oacute; phần tho&aacute;ng v&agrave; mở hơn. V&agrave; để trổ t&agrave;i bếp n&uacute;c &ldquo;thần sầu&rdquo; của m&igrave;nh, chị em phụ nữ kh&ocirc;ng thể kh&ocirc;ng nhờ đến sự hỗ trợ của c&aacute;c thiết bị nh&agrave; bếp gia đ&igrave;nh, v&iacute; dụ như bếp gas đơn k&iacute;nh.</p>', 1, N'image_1686810197504.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (12, N'BẾP GAS ĐÔI HALSAN S-500', 2, 2134000, 5, 2, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-06-15T13:23:28.000' AS DateTime), 1, 17, N'<p>D&ugrave; bếp gas &acirc;m hiện nay đang ng&agrave;y c&agrave;ng phổ biến trong mỗi gia đ&igrave;nh nhưng c&aacute;c mẫu bếp gas đơn vẫn chưa bao giờ đ&aacute;nh mất vị thế của m&igrave;nh trong thị trường c&aacute;c thiết bị nh&agrave; bếp. Với vẻ ngo&agrave;i gọn g&agrave;ng, tiện dụng, dễ vận chuyển v&agrave; c&oacute; gi&aacute; cả phải chăng, bếp gas đơn Rinnai vẫn tiếp tục l&agrave; sự lựa chọn số một cho những căn hộ c&oacute; diện t&iacute;ch hẹp hoặc c&aacute;c ph&ograve;ng trọ sinh vi&ecirc;n.</p>', 1, N'image_1686810208002.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (13, N'BẾP GAS  M HAI ĐẦU ĐỐT HALSAN HS-1102', 2, 2800000, 5, 2, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-06-15T13:23:40.000' AS DateTime), 1, 17, N'<p>D&ugrave; bếp gas &acirc;m hiện nay đang ng&agrave;y c&agrave;ng phổ biến trong mỗi gia đ&igrave;nh nhưng c&aacute;c mẫu bếp gas đơn vẫn chưa bao giờ đ&aacute;nh mất vị thế của m&igrave;nh trong thị trường c&aacute;c thiết bị nh&agrave; bếp. Với vẻ ngo&agrave;i gọn g&agrave;ng, tiện dụng, dễ vận chuyển v&agrave; c&oacute; gi&aacute; cả phải chăng, bếp gas đơn Rinnai vẫn tiếp tục l&agrave; sự lựa chọn số một cho những căn hộ c&oacute; diện t&iacute;ch hẹp hoặc c&aacute;c ph&ograve;ng trọ sinh vi&ecirc;n.</p>', 1, N'image_1686810220579.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (14, N'Van điều áp gas tự động Reca', 3, 550000, 20, 1, CAST(N'2021-05-13T10:00:00.000' AS DateTime), CAST(N'2023-06-15T13:23:55.000' AS DateTime), 1, 17, N'<p>Van điều &aacute;p LPG c&oacute; t&ecirc;n l&agrave; ReCa được thiết kế sử dụng cho c&aacute;c thiết bj ti&ecirc;u thụ gas trong gia đ&igrave;nh ở &aacute;p suất v&agrave; c&ocirc;ng suất nhỏ tần 1.3kg/h van điều &aacute;p c&oacute; thể sử dụng cho tất cả c&aacute;c loại b&igrave;nh gas c&oacute; van đ&oacute;ng mở bằng tay ( gọi l&agrave; van ngang ) những lưu &yacute; khi sử dụng van điều &aacute;p &ndash; B&igrave;nh gas lu&ocirc;n để ở tư thế thẳng đứng &ndash; khi sử dụng van điều &aacute;p để ngo&agrave;i trời phải c&oacute; m&aacute;i che, tr&aacute;nh mưa nắng &ndash; chỉ sử dụng nước x&agrave; ph&ograve;ng để t&igrave;m chỗ r&ograve; gas tuyệt đối kh&ocirc;ng d&ugrave;ng bặt lửa để t&igrave;m D&acirc;y gas l&agrave; loại cao su thi&ecirc;n nhi&ecirc;n nhập khẩu từ SINGAPORE</p>', 1, N'image_1686810235912.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (15, N'Kệ để bếp gas tiện dụng giá rẻ', 3, 580000, 21, 1, CAST(N'2023-05-13T10:00:00.000' AS DateTime), CAST(N'2023-07-26T09:17:21.000' AS DateTime), 1, 1, N'<p>Bếp gas đơn Rinnai được trang bị hệ thống đ&aacute;nh lửa Magneto hoạt động nhờ hai b&uacute;a cơ va đập để tạo ra tia lửa, gi&uacute;p ch&uacute;ng ta đ&aacute;nh lửa nhanh v&agrave; nhạy hơn, duy tr&igrave; ngọn lửa ổn định v&agrave; kh&ocirc;ng hề g&acirc;y ra t&igrave;nh trạng tắt lửa đột ngột l&agrave;m gi&aacute;n đoạn qu&aacute; tr&igrave;nh nấu nướng. Đ&acirc;y cũng l&agrave; hệ thống th&ocirc;ng dụng, dễ sử dụng v&agrave; cực bền, được kh&ocirc;ng &iacute;t người y&ecirc;u th&iacute;ch.</p>', 1, N'image_1690337339792.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (16, N'hello world2', 3, 4327700, 1011, 1, CAST(N'2023-06-20T15:15:43.000' AS DateTime), CAST(N'2023-06-20T15:16:14.000' AS DateTime), 1, 1, N'<p>dsdqd13</p>', 0, N'image_1687248974664.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (17, N'hello world4', 2, 455161, 190, 6, CAST(N'2023-06-22T13:53:15.000' AS DateTime), CAST(N'2023-07-26T03:16:40.000' AS DateTime), 1, 1, N'<p>dsdqewe</p>', 0, N'image_1687416795180.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (18, N'Thịnh Nguyễn Thái', 1, 407700, 190, 6, CAST(N'2023-07-25T22:43:53.000' AS DateTime), NULL, 1, NULL, N'<p>faafaa</p>', 0, N'image_1690299833623.jpg')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (19, N'hello world', 1, 455161, 13, 6, CAST(N'2023-07-25T22:45:46.000' AS DateTime), NULL, 1, NULL, N'', 0, N'')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Quantity], [WarrantyPeriod], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [DetailProduct], [Status], [smallImg]) VALUES (20, N'Thai Thinh', 1, 407700, 13, 6, CAST(N'2023-07-26T03:19:57.000' AS DateTime), NULL, 1, NULL, N'', 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (1, N'pID1_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (1, N'pID1_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (1, N'pID1_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (5, N'pID5_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (5, N'pID5_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (5, N'pID5_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (8, N'pID8_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (8, N'pID8_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (8, N'pID8_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (9, N'pID9_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (9, N'pID9_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (9, N'pID9_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (10, N'pID10_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (10, N'pID10_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (10, N'pID10_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (11, N'pID11_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (11, N'pID11_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (11, N'pID11_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (12, N'pID12_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (12, N'pID12_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (12, N'pID12_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (13, N'pID13_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (13, N'pID13_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (13, N'pID13_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (14, N'pID14_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (14, N'pID14_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (14, N'pID14_3.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (15, N'pID15_1.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (15, N'pID15_2.jpg')
GO
INSERT [dbo].[ProductImg] ([ProductID], [Img]) VALUES (15, N'pID15_3.jpg')
GO
SET IDENTITY_INSERT [dbo].[ProductSeries] ON 
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 1, 1, N'Batch1', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 2, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 3, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 4, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 5, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 6, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 7, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 8, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 9, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 10, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 11, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 12, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 13, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 14, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 15, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 16, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 17, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 18, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 19, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 20, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 21, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 22, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 23, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 24, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 25, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 26, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 27, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 28, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 29, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 30, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 31, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 32, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 33, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, 34, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 35, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 36, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 37, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 38, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 39, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 40, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 41, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 42, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 43, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 44, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 45, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 46, 1, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, 47, 0, N'Batch10', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 48, 1, N'Batch12', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 49, 1, N'Batch12', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 50, 1, N'Batch12', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 51, 1, N'Batch12', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 52, 1, N'Batch12', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 53, 1, N'Batch12', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 54, 1, N'Batch12', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (8, 55, 1, N'Batch12', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 56, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 57, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 58, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 59, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 60, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 61, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 62, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 63, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 64, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 65, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 66, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (9, 67, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 68, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 69, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 70, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 71, 1, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 72, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 73, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 74, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 75, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 76, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 77, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 78, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 79, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 80, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 81, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 82, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 83, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 84, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 85, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 86, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 87, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (10, 88, 0, N'Batch123', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 89, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 90, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 91, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 92, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 93, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 94, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 95, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 96, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 97, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 98, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 99, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 100, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 101, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 102, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (11, 103, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 104, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 105, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 106, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 107, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 108, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 109, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 110, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 111, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 112, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 113, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 114, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 115, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 116, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 117, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 118, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 119, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 120, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 121, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 122, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 123, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 124, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 125, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 126, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 127, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 128, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (12, 129, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 130, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 131, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 132, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 133, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 134, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 135, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 136, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 137, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 138, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 139, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 140, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 141, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 142, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 143, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 144, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 145, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 146, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 147, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 148, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 149, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 150, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 151, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 152, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 153, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 154, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 155, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 156, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 157, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 158, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 159, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 160, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 161, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 162, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 163, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (13, 164, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 165, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 166, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 167, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 168, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 169, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 170, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 171, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 172, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 173, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 174, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 175, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 176, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 177, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 178, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 179, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 180, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 181, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 182, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 183, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (14, 184, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 185, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 186, 1, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 187, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 188, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 189, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 190, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 191, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 192, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 193, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 194, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 195, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 196, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 197, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 198, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 199, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[ProductSeries] ([ProductID], [ProductSeries], [sold], [BatchSeries], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (15, 200, 0, N'Batch', CAST(N'2023-05-14T10:30:00.000' AS DateTime), NULL, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductSeries] OFF
GO
INSERT [dbo].[Warranty] ([ProductID], [ProductSeriID], [CustomerID], [OrderID], [status], [malfunctionDescription], [note], [location], [fixDate], [fixPrice], [fixQuantity], [productseries]) VALUES (1, 7, 10, 21, 1, N'Bình ga bị rò khí', N'Đổi cho khách bình mới', N'Cơ sở 1', CAST(N'2023-12-16T10:00:00.000' AS DateTime), 0, 0, NULL)
GO
INSERT [dbo].[Warranty] ([ProductID], [ProductSeriID], [CustomerID], [OrderID], [status], [malfunctionDescription], [note], [location], [fixDate], [fixPrice], [fixQuantity], [productseries]) VALUES (5, 1, 4, 15, 1, N'Bình ga bị rò khí', N'Đổi cho khách bình mới', N'Cơ sở 1', CAST(N'2023-05-14T10:30:00.000' AS DateTime), 0, 0, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__85FB4E38190455A0]    Script Date: 8/4/2023 9:30:40 PM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__A9D10534E5FC4CA8]    Script Date: 8/4/2023 9:30:40 PM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534875A44F0]    Script Date: 8/4/2023 9:30:40 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534BF29E5E3]    Script Date: 8/4/2023 9:30:40 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ((1)) FOR [Role]
GO
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ('Default.jpg') FOR [Avatar]
GO
ALTER TABLE [dbo].[Coupon] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Coupon] ADD  DEFAULT ('VoucherDefault.jpg') FOR [Avatar]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [Display]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ('Default.jpg') FOR [Avatar]
GO
ALTER TABLE [dbo].[Customers_Promotions] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [UsageStatus]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductSeries] ADD  DEFAULT ((0)) FOR [sold]
GO
ALTER TABLE [dbo].[Warranty] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Customers_Promotions]  WITH CHECK ADD FOREIGN KEY([CouponID])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[Customers_Promotions]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[News_Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CouponID])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductImg]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductSeries]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD FOREIGN KEY([ProductSeriID])
REFERENCES [dbo].[ProductSeries] ([ProductSeries])
GO
