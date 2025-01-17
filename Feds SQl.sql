USE [Feds]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_Id] [int] IDENTITY(1,1) NOT NULL,
	[Total_price] [float] NOT NULL,
	[Date] [date] NOT NULL,
	[User_id] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Province] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brandd]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brandd](
	[Category_id] [int] NOT NULL,
	[Brand_Name] [nvarchar](50) NOT NULL,
	[Brand_Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Brandd] PRIMARY KEY CLUSTERED 
(
	[Brand_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Contact_id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Email] [nvarchar](255) NULL,
	[Subject] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[Product_id] [int] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Date] [date] NOT NULL,
	[Rating] [int] NOT NULL,
	[Bill_Id] [int] NOT NULL,
	[Img] [nvarchar](max) NULL,
	[Feedback_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__FeedBack__CD399318B703511E] PRIMARY KEY CLUSTERED 
(
	[Feedback_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Order_quantity] [int] NOT NULL,
	[Bill_id] [int] NOT NULL,
	[Real_time_price] [date] NOT NULL,
	[Payment] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[Product_id] [int] NOT NULL,
	[Price] [float] NULL,
	[Date_start] [date] NULL,
	[Date_end] [date] NULL,
	[Sale] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Product_name] [nvarchar](max) NOT NULL,
	[Product_img] [nvarchar](100) NULL,
	[User_Id] [int] NOT NULL,
	[Brand_id] [int] NOT NULL,
	[Status] [nvarchar](20) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Category]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category](
	[Category_id] [int] IDENTITY(1,1) NOT NULL,
	[Category_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Product_Category] PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[Product_id] [int] NOT NULL,
	[RAM] [nvarchar](max) NULL,
	[ROM] [nvarchar](50) NULL,
	[Size] [nvarchar](max) NULL,
	[Battery] [nvarchar](50) NULL,
	[Weight] [nvarchar](max) NULL,
	[Color] [nvarchar](50) NULL,
	[Decription] [nvarchar](max) NULL,
	[CPU] [nvarchar](max) NULL,
	[Wattage] [nvarchar](50) NULL,
	[Status] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_Id] [int] NOT NULL,
	[Role_Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settings](
	[Role_Id] [int] NULL,
	[View] [bit] NULL,
	[Buy] [bit] NULL,
	[FeedBack] [bit] NULL,
	[Sell] [bit] NULL,
	[Edit] [bit] NULL,
	[Delete] [bit] NULL,
	[Create] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/30/2024 12:53:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[User_name] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone_number] [varchar](50) NULL,
	[Role_id] [int] NOT NULL,
	[Avarta] [varchar](50) NOT NULL,
	[isBanned] [bit] NULL,
	[gender] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (4, 22000000, CAST(N'2024-05-25' AS Date), 93, N'Hà Nội', N'Đang Xử Lý', NULL, NULL, NULL)
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (5, 22000000, CAST(N'2024-05-25' AS Date), 93, N'Hà Nội', N'Hoàn Thành', NULL, NULL, NULL)
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (6, 38080000, CAST(N'2024-07-15' AS Date), 93, N'asasa', N'Hoàn Thành', N'Tỉnh Bà Rịa - Vũng Tàu', N'Huyện Châu Đức', N'Xã Bình Giã')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (7, 545490000, CAST(N'2024-07-15' AS Date), 93, N'sadasads', N'Hoàn Thành', N'Tỉnh Bắc Kạn', N'Huyện Chợ Đồn', N'Thị trấn Bằng Lũng')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (8, 14740000, CAST(N'2024-07-18' AS Date), 8, N'sadasads', N'Hoàn Thành', N'Tỉnh Bà Rịa - Vũng Tàu', N'Thị xã Phú Mỹ', N'Phường Phước Hoà')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (9, 23400000, CAST(N'2024-07-18' AS Date), 5, N'sadadas', N'Chờ xử lý', N'Tỉnh Bà Rịa - Vũng Tàu', N'Huyện Châu Đức', N'Xã Bình Ba')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (10, 63522000, CAST(N'2024-07-18' AS Date), 5, N'asdasdas', N'Hoàn Thành', N'Tỉnh Bắc Kạn', N'Huyện Bạch Thông', N'Xã Cao Sơn')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (11, 51990000, CAST(N'2024-07-18' AS Date), 5, N'hahah', N'Chờ xử lý', N'Tỉnh An Giang', N'Huyện An Phú', N'Thị trấn An Phú')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (12, 59280000, CAST(N'2024-07-18' AS Date), 5, N'asdasdsa', N'Chờ xử lý', N'Tỉnh An Giang', N'Thành phố Châu Đốc', N'Xã Vĩnh Châu')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (13, 22690000, CAST(N'2024-07-18' AS Date), 5, N'tesst', N'Đang Giao Hàng', N'Tỉnh An Giang', N'Huyện An Phú', N'Xã Khánh An')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (14, 29832000, CAST(N'2024-07-18' AS Date), 101, N'Ha Noi', N'Chờ xử lý', N'Tỉnh Vĩnh Long', N'Huyện Bình Tân', N'Xã Tân An Thạnh')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (15, 63522000, CAST(N'2024-07-18' AS Date), 101, N'test1', N'Hoàn Thành', N'Tỉnh Bà Rịa - Vũng Tàu', N'Huyện Long Điền', N'Thị trấn Long Hải')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (16, 51990000, CAST(N'2024-07-18' AS Date), 101, N'Mua hang', N'Chờ Xử Lý', N'Tỉnh Nam Định', N'Huyện Xuân Trường', N'Xã Xuân Vinh')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (17, 215718000, CAST(N'2024-07-18' AS Date), 101, N'abdre', N'Hoàn Thành', N'Tỉnh Bà Rịa - Vũng Tàu', N'Huyện Long Điền', N'Xã An Nhứt')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (18, 279708000, CAST(N'2024-07-18' AS Date), 101, N'hahah', N'Hoàn Thành', N'Tỉnh Bà Rịa - Vũng Tàu', N'Huyện Long Điền', N'Thị trấn Long Hải')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (19, 1643410000, CAST(N'2024-07-18' AS Date), 101, N'hahah', N'Hoàn Thành', N'Tỉnh An Giang', N'Huyện An Phú', N'Xã Khánh Bình')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (20, 87171000, CAST(N'2024-07-19' AS Date), 101, N'thôn 1', N'Hoàn Thành', N'Tỉnh Bà Rịa - Vũng Tàu', N'Huyện Châu Đức', N'Xã Bàu Chinh')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (21, 559350000, CAST(N'2024-07-19' AS Date), 101, N'Thôn nào đó', N'Hoàn Thành', N'Tỉnh Bắc Giang', N'Huyện Hiệp Hòa', N'Xã Danh Thắng')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (22, 15290000, CAST(N'2024-07-19' AS Date), 101, N'hahah', N'Hoàn Thành', N'Tỉnh Bắc Giang', N'Huyện Lạng Giang', N'Xã Hương Sơn')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (23, 37290000, CAST(N'2024-07-19' AS Date), 101, N'Thon may', N'Hoàn Thành', N'', N'', N'')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (24, 23400000, CAST(N'2024-07-19' AS Date), 101, N'Thon', N'Hoàn Thành', N'Tỉnh Bắc Giang', N'Huyện Hiệp Hòa', N'Xã Danh Thắng')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (25, 24554000, CAST(N'2024-07-19' AS Date), 101, N'hahah', N'Hoàn Thành', N'', N'', N'')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (26, 374910000, CAST(N'2024-07-19' AS Date), 101, N'Xóm 5 mới', N'Hủy', N'Tỉnh Nam Định', N'Huyện Xuân Trường', N'Xã Xuân Vinh')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (27, 29832000, CAST(N'2024-07-26' AS Date), 5, N'ád', N'Chờ xử lý', N'áds', N'ádas', N'ádas')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (28, 5352000, CAST(N'2024-07-26' AS Date), 5, N'sads', N'Đã Hủy', N'', N'', N'')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (29, 26952000, CAST(N'2024-07-27' AS Date), 5, N'aaa', N'Chờ xử lý', N'Tỉnh Bạc Liêu', N'Huyện Hoà Bình', N'Xã Vĩnh Hậu A')
INSERT [dbo].[Bill] ([Bill_Id], [Total_price], [Date], [User_id], [Address], [Status], [Province], [District], [Country]) VALUES (30, 41592000, CAST(N'2024-07-27' AS Date), 5, N's', N'Chờ xử lý', N'Tỉnh An Giang', N'Huyện Châu Phú', N'Xã Bình Chánh')
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Brandd] ON 

INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (3, N'Daikin', 1)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (3, N'Panasonic', 2)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (3, N'LG', 8)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (3, N'Samsung', 9)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (4, N'Xiaomi', 10)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (4, N'Samsung', 11)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (4, N'Sony', 12)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (4, N'Hisense', 13)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (4, N'Casper', 14)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (10, N'Samsung', 15)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (10, N'Ipad', 16)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (10, N'Xiaomi', 17)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (10, N'Lenovo', 18)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (10, N'Oppo', 19)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (5, N'Xiaomi', 20)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (5, N'Apple Watch', 21)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (5, N'Amazfit', 22)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (5, N'
Garmin', 23)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (5, N'
Befit', 24)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (5, N'Samsung
', 25)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Daikin', 26)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Inverter', 27)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Kangaroo', 28)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Xiaomi', 29)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Ecovas', 30)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Toshiba', 31)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Sunhouse', 32)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Kachi', 33)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Buheung', 34)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Ezviz', 35)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Levoit', 36)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Cuckoo', 37)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Sharp', 38)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Phillips', 39)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Casper', 40)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (8, N'Hòa Phát', 41)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (2, N'Laptop dell', 42)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (2, N'Laptop HP', 43)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (2, N'Laptop Acer', 44)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (2, N'MacBook', 45)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (2, N'Microsoft Sureface', 46)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (1, N'IPhone', 47)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (1, N'Samsung', 48)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (1, N'Oppo', 49)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (1, N'Xiaomi', 50)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (1, N'Realme', 52)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (9, N'Điện thoại ', 53)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (9, N'Laptop', 54)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (9, N'Tablet', 55)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (6, N'Apple', 58)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (6, N'Innostyle', 59)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (6, N'logitech', 60)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (6, N'Khác ', 61)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (7, N'PC Gaming', 62)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (7, N'PC Văn phòng', 63)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (7, N'PC Đồ Họa', 64)
INSERT [dbo].[Brandd] ([Category_id], [Brand_Name], [Brand_Id]) VALUES (4, N'LG', 65)
SET IDENTITY_INSERT [dbo].[Brandd] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (1, 96, N'trong1@gmail.com', N'Reply Subject 6', N'0933666777', N'1111', CAST(N'2024-07-18T23:34:32.467' AS DateTime), N'Đã gửi', NULL)
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (2, 96, N'vductrong2003@gmail.com', N'Subject 6', N'0933666777', N'Cam on shop nha', CAST(N'2024-07-18T23:34:52.600' AS DateTime), N'Đã gửi', NULL)
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (3, 96, N'trong@gmail.com', N'Sub 5', N'0999999999', N'Cam on nhieu nha', CAST(N'2024-07-18T23:35:55.797' AS DateTime), N'Chưa gửi', NULL)
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (4, NULL, N'test@gmail.com', N'Test 1 phát', N'0999111222', N'Test 1 chút thôi, hahaha', CAST(N'2024-07-18T23:36:26.033' AS DateTime), N'Chưa gửi', N'Toi la Tester')
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (5, NULL, N'trong1@gmail.com', N'Reply Subject 6', N'0933666777', N'aaa', CAST(N'2024-07-18T23:43:35.500' AS DateTime), N'Chưa gửi', N'AA')
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (6, NULL, N'trongvdhe171724@fpt.edu.vn', N'ABC', N'0933666777', N'aaa', CAST(N'2024-07-19T00:27:30.460' AS DateTime), N'Chưa gửi', N'999')
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (7, NULL, N'trong1@gmail.com', N'Reply Subject 6', N'0933666777', N'aaaaa', CAST(N'2024-07-19T01:24:32.473' AS DateTime), N'Chưa gửi', N'123')
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (8, NULL, N'trong1@gmail.com', N'Reply Subject 6', N'0999999999', N'aaaaa', CAST(N'2024-07-19T01:25:46.320' AS DateTime), N'Chưa gửi', N'Hung')
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (9, 101, N'trong1@gmail.com', N'Reply Subject 6', N'0933666777', N'ssss', CAST(N'2024-07-19T01:26:22.880' AS DateTime), N'Chưa gửi', NULL)
INSERT [dbo].[Contact] ([Contact_id], [User_Id], [Email], [Subject], [Phone], [Message], [Date], [Status], [Name]) VALUES (10, 1, N'example@example.com', N'Subject Example', N'123-456-7890', N'Message Example', CAST(N'2024-07-19T03:05:59.083' AS DateTime), N'Chưa gửi', N'Example Name')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (2, N'Sản phẩm đẹp', CAST(N'2024-06-03' AS Date), 5, 4, N'samsung-inverter-15-hp-ar13cyfaawknsv638243251184782267.jpg', 1, N'Hiện')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (2, N'sadasdasd', CAST(N'2024-06-03' AS Date), 2, 4, N'7.jpg', 2, N'Hiện')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (2, N'ưadwqewqe', CAST(N'2024-06-04' AS Date), 5, 4, N'01-1020x570 (1).jpg', 3, N'Ẩn')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (2, N'san phan kha on ', CAST(N'2024-06-06' AS Date), 5, 4, N'QR_Code.png', 4, N'Hiện')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (2, N'sản phẩm ok ', CAST(N'2024-06-07' AS Date), 4, 4, N'ede54ffd246d4796b5bcf58dc1c4c372.png', 5, N'Ẩn')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (2, N'sadasd', CAST(N'2024-06-03' AS Date), 4, 4, N'2-chieu-lg-inverter-1-hp-b10end1-2.jpg', 6, N'Hiện')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (2, N'sdsada', CAST(N'2024-06-03' AS Date), 3, 4, N'01-1020x570 (1).jpg', 7, N'Ẩn')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (2, N'sadhjhgasdhjdaks', CAST(N'2024-06-28' AS Date), 4, 4, N'39.jpg', 8, N'Hiện')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (3, N'sdsasdaasd', CAST(N'2024-06-28' AS Date), 2, 4, N'01-1020x570 (1).jpg', 9, N'Hiện')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (4, N'wqeqweqw', CAST(N'2024-06-28' AS Date), 2, 4, N'dqweqqweqwe', 11, N'Hiện')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (444, N'Tam on', CAST(N'2024-06-28' AS Date), 4, 4, N'ewrwr', 12, N'Ẩn')
INSERT [dbo].[FeedBack] ([Product_id], [Comment], [Date], [Rating], [Bill_Id], [Img], [Feedback_Id], [Status]) VALUES (444, N'sadsadasdadssasdadsa', CAST(N'2024-07-15' AS Date), 3, 4, N'b928e5429d6347dd81e39e4e0df2d25a.png', 13, N'Ẩn')
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (2, 2, 11, 4, CAST(N'2024-05-25' AS Date), N'Online')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (4, 3, 9, 4, CAST(N'2024-05-25' AS Date), N'Online')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (5, 446, 1, 5, CAST(N'2024-07-15' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (6, 444, 1, 6, CAST(N'2024-07-15' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (7, 2, 10, 7, CAST(N'2024-07-15' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (8, 5, 1, 7, CAST(N'2024-07-15' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (9, 487, 2, 8, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (10, 337, 2, 9, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (11, 3, 1, 10, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (12, 4, 1, 10, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (13, 2, 1, 11, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (14, 5, 1, 12, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (15, 4, 1, 12, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (16, 337, 1, 8, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (17, 459, 1, 8, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (18, 3, 1, 14, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (19, 3, 1, 15, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (20, 4, 1, 15, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (21, 2, 1, 16, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (22, 2, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (23, 258, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (24, 150, 2, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (25, 206, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (26, 204, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (27, 209, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (28, 210, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (29, 151, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (30, 149, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (31, 337, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (32, 338, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (33, 339, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (34, 4, 1, 17, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (35, 3, 2, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (36, 2, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (37, 87, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (38, 88, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (39, 89, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (40, 415, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (41, 416, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (42, 417, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (43, 419, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (44, 420, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (45, 418, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (46, 149, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (47, 150, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (48, 151, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (49, 152, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (50, 155, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (51, 156, 1, 18, CAST(N'2024-07-18' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (52, 204, 1, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (53, 205, 1, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (54, 206, 1, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (55, 210, 1, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (56, 209, 1, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (57, 207, 12, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (58, 212, 4, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (59, 234, 2, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (60, 233, 3, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (61, 236, 2, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (62, 225, 11, 19, CAST(N'2024-07-18' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (63, 4, 1, 20, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (64, 2, 1, 20, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (65, 261, 1, 20, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (66, 3, 15, 21, CAST(N'2024-07-19' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (67, 207, 1, 22, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (68, 3, 1, 23, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (69, 337, 2, 24, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (70, 150, 4, 25, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (71, 155, 4, 25, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (72, 156, 2, 25, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (73, 3, 2, 26, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (74, 207, 9, 26, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (75, 337, 7, 26, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (76, 338, 5, 26, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (77, 339, 4, 26, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (78, 342, 1, 26, CAST(N'2024-07-19' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (79, 3, 1, 27, CAST(N'2024-07-26' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (80, 261, 1, 28, CAST(N'2024-07-26' AS Date), N'tienmat')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (81, 4, 1, 29, CAST(N'2024-07-27' AS Date), N'VNPay')
INSERT [dbo].[Order] ([Order_id], [Product_id], [Order_quantity], [Bill_id], [Real_time_price], [Payment]) VALUES (82, 2, 1, 30, CAST(N'2024-07-27' AS Date), N'tienmat')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (2, 51990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (3, 37290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (4, 33690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (5, 25590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (6, 24390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (7, 22000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (8, 25300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (9, 16490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (11, 36990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (12, 29990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (13, 13600000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (14, 21490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (15, 25600000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (16, 14490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (18, 12990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (19, 14290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (20, 28990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (21, 32990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (22, 12390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (23, 19900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (24, 10690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (25, 9900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (26, 31000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (27, 34900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (28, 29000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (29, 23499000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (30, 14700000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (31, 29990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (32, 19490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (33, 41990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (34, 13490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (35, 12490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (37, 21690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (38, 12490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (39, 25990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (41, 7500000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (42, 17190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (43, 29000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (44, 32990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (45, 25990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (46, 32990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (47, 54490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (48, 18200000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (49, 44990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (51, 55990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (52, 31990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (53, 52000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (55, 23990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (56, 60000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (57, 24500000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (58, 32990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (61, 15990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (62, 26900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (63, 21000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (64, 42990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (65, 38000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (66, 46890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (67, 29490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (69, 34230000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (70, 78000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (71, 45490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (72, 25490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (73, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (74, 120990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (75, 120990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (76, 14690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (77, 10490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (78, 11999000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (79, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (80, 14690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (81, 27990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (82, 29990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (83, 14490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (84, 124500000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (85, 13990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (86, 28490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (87, 29000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (88, 23990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (89, 18790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (90, 22490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (91, 8590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (92, 16390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (94, 13490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (95, 42490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (96, 9990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (97, 11990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (98, 19290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (99, 27090000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (100, 18990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (104, 19290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (106, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (107, 9690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (109, 24990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (110, 33490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (111, 6290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (113, 18990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (114, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (116, 33990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (118, 12990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (120, 18990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
GO
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (121, 42490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (122, 22490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (123, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (124, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (125, 6290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (126, 3690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (127, 22490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (128, 6290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (129, 18990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (130, 3690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (131, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (132, 46490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (133, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (134, 24990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (135, 4690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (136, 3250000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (138, 12990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (140, 2190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (142, 2190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (143, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (144, 6290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (145, 6990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (146, 2345000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (147, 6000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (148, 10490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (149, 6199000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (150, 549000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (151, 6990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (152, 4790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (155, 4990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (156, 1199000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (157, 2990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (158, 1329000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (159, 529000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (160, 1139000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (161, 2320000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (162, 529000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (163, 4999000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (164, 1729000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (165, 795000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (167, 1890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (168, 1290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (169, 1290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (170, 1290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (171, 1290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (172, 999000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (173, 1290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (174, 599000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (175, 599000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (176, 899000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (177, 899000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (178, 899000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (179, 899000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (180, 17990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (181, 21490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (182, 13300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (183, 1890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (184, 1290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (185, 790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (186, 22990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (187, 799000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (188, 375000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (189, 319000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (190, 319000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (191, 319000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (192, 1299000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (193, 1299000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (194, 729000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (195, 2229000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (196, 3790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (197, 1450000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (198, 390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (199, 750000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (201, 490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (202, 4409000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (203, 360000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (204, 14390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (205, 17490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (206, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (207, 15290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (209, 21690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (210, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (212, 24790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (213, 18790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (214, 11690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (215, 13590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (216, 6990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (217, 16890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (219, 9190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (220, 23190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (221, 18690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (223, 29490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (224, 15490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (225, 105390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (226, 18690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (227, 15490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (228, 30090000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (229, 21790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (230, 14890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (232, 21990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
GO
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (233, 15190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (234, 9590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (235, 21590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (236, 20590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (237, 949000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (238, 1860000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (240, 599000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (241, 850000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (242, 390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (257, 10490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (258, 8990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (261, 6690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (263, 2000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (264, 1190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (265, 1190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (266, 1190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (267, 1290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (268, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (269, 6790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (270, 4790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (271, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (272, 4500000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (273, 3390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (274, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (275, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (277, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (278, 6790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (279, 1290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (280, 8990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (281, 1990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (282, 1090000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (283, 1090000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (284, 1250000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (285, 1090000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (286, 1250000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (287, 8990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (289, 7300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (290, 6160000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (337, 11700000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (338, 12900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (339, 9300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (415, 8890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (341, 18800000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (342, 19800000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (343, 15100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (344, 8800000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (345, 15100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (346, 10200000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (347, 10700000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (291, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (292, 1590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (293, 3990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (294, 3990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (296, 24690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (297, 24690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (298, 22310000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (299, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (300, 24690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (301, 18990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (302, 17990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (304, 17370000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (305, 24690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (306, 13690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (308, 17990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (309, 13690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (310, 11670000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (311, 11670000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (312, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (314, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (315, 11670000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (316, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (317, 9390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (318, 8390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (319, 8390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (320, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (321, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (322, 7490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (323, 7490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (324, 1430000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (325, 1430000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (327, 1190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (328, 1190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (329, 1190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (330, 1490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (331, 2450000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (332, 5790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (333, 4390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (334, 4390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (336, 2590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (288, 2590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (348, 10300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (349, 18700000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (350, 18200000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (351, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (352, 18600000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (353, 10200000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (354, 10400000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (356, 16200000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (357, 17500000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (358, 17000000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
GO
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (359, 14600000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (340, 19900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (360, 12100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (361, 14900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (362, 19300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (363, 9700000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (364, 14500000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (365, 9900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (366, 8200000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (367, 19300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (368, 13800000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (369, 16200000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (370, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (371, 13900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (372, 13900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (373, 13900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (374, 13800000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (375, 13800000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (376, 13800000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (377, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (378, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (379, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (380, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (381, 11100000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (382, 19300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (383, 19300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (384, 19300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (385, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (386, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (387, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (389, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (390, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (391, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (392, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (393, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (394, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (395, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (396, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (397, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (398, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (399, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (400, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (401, 17300000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (402, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (416, 10490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (404, 9590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (405, 9590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (406, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (407, 9590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (408, 9590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (409, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (410, 9590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (411, 20990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (412, 2590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (413, 2590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (414, 2590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (388, 9590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (417, 11490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (418, 11990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (419, 14990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (420, 3990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (421, 4990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (422, 5690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (423, 12990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (424, 5790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (425, 14590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (426, 11090000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (427, 15290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (428, 7490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (429, 39890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (430, 31890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (432, 74990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (433, 55790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (434, 5790000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (435, 4590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (436, 11990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (437, 23990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (438, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (440, 6490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (441, 42900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (443, 24890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (444, 21990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (445, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (446, 16090000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (447, 9700000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (448, 24290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (449, 31490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (450, 8390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (451, 9500000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (452, 4990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (453, 6490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (454, 2390000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (455, 4990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (456, 12990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (457, 6990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (458, 5490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (459, 10990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (460, 11490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (461, 15490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (462, 6890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
GO
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (463, 9990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (464, 2990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (465, 5690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (466, 5890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (467, 5490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (468, 3990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (469, 7490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (470, 16490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (471, 2190000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (472, 8490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (473, 7990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (474, 9900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (475, 29900000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (476, 22490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (477, 5490000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (478, 1990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (479, 2290000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (480, 1090000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (481, 2690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (482, 1990000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (483, 3690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (485, 2890000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (486, 2690000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (487, 7370000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (488, 7370000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (489, 4151510, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (490, 12020360, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (491, 11020360, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (492, 13284810, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (493, 22020460, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (494, 21020000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (495, 37180880, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (496, 35048640, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (497, 29751810, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (498, 29751811, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (499, 26929650, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (500, 21259040, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (501, 19373200, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (502, 13906200, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (503, 41332830, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (504, 39332830, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (505, 8256050, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (506, 8256050, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (507, 27358100, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (509, 27734300, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (510, 27082000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (511, 25828000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (512, 26831420, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (513, 25757380, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (514, 19729600, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (515, 15671700, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (516, 18249000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (517, 16207730, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (518, 13992000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (519, 12534500, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (520, 8941020, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (521, 9545000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
INSERT [dbo].[Price] ([Product_id], [Price], [Date_start], [Date_end], [Sale]) VALUES (335, 2590000, CAST(N'2024-05-01' AS Date), CAST(N'2024-12-30' AS Date), 20)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (2, 4, N'Dell Alienware M18 R1 AMD', N'Dell Alienware M18 R1 AMD.jpg', 2, 42, N'active', CAST(N'2024-07-15' AS Date))
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (3, -4, N'Dell Precision 5680', N'dell-precision-5680-gen-13th-1692262813.jpg', 2, 42, N'active', CAST(N'2024-07-15' AS Date))
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (4, 14, N'Dell Gaming G16 7630', N'dell-gaming-g16-7630-1679560798.jpg', 2, 42, N'active', CAST(N'2024-07-15' AS Date))
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (5, 18, N'Dell Gaming G16 7620', N'dell-gaming-g16-7620-1676600915.jpg', 2, 42, N'active', CAST(N'2024-07-15' AS Date))
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (6, 20, N'Dell Gaming G15 5511', N'dell-gaming-g15-5511-1641196802.jpg', 2, 42, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (7, 20, N'Dell Gaming G15 55167', N'dell-gaming-g15-5515-1634108883.jpg', 2, 42, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (8, 30, N'Dell Latitude 13 5340', N'dell-latitude-13-5340-2023-1702116835.jpg', 2, 42, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (9, 24, N'Dell Precision 5570', N'dell-precision-5570-gen-12th-1655347307.jpg', 2, 42, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (11, 25, N'Dell Alienware X14 R1', N'dell-alienware-x14-r1-gen-12th-1652432118.jpg', 2, 42, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (12, 21, N'Dell Inspiron 7435 2', N'dell-inspiron-7435-2-in-1-amd-1684119040.jpg', 2, 42, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (13, 23, N'Dell Latitude 14 7440', N'dell-latitude-14-7440-2023-1702110230.jpg', 2, 42, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (14, 22, N'Hp Spectre X360 14', N'hp-spectre-x360-14-2024-nightfall-black-1705650060.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (15, 21, N'Hp Spectre X360 16', N'hp-spectre-x360-16-2024-nightfall-black-1705646366.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (16, 22, N'Hp Elitebook 845 G8 ', N'hp-elitebook-845-g8-2021-1703845179.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (18, 22, N'HP Pavilion X360 14', N'hp-pavilion-14-x360-2-in-1-2022-1701423247.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (19, 22, N'HP Laptop 14s DR5000TU', N'hp-laptop-14s-dr5000tu-2022-1701247116.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (20, 23, N'HP ZBook Power 15 G8', N'hp-zbook-power-15-g8-mobile-workstation-new-1698287317.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (21, 24, N'HP ZBook Fury 15 G8', N'hp-zbook-fury-15-g8-model-2021-mobile-workstation-1698222265.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (22, 22, N'HP laptop 17-CP0700DE', N'hp-laptop-17-cp0700dx-2021-1693540333.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (23, 22, N'HP Laptop 17-BY4061NR', N'hp-laptop-17-by4061nr-2021-1693539776.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (24, 22, N'HP Laptop 17-BY4062CL', N'hp-laptop-17-by4062cl-2021-1693537904.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (25, 22, N'HP Laptop 17-CN0273ST', N'hp-laptop-17-cn0273st-2021-1695202791.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (26, 22, N'HP ZBook Firefly 16 G9', N'hp-zbook-firefly-16-g9-1692841272.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (27, 22, N'HP ZBook Power G9', N'hp-zbook-power-g9-1692803247.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (28, 22, N'HP Pavilion 14-DV2097NR', N'hp-pavilion-14-dv2097nr-2022-1692764359.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (29, 22, N'Hp Omen 16', N'hp-omen-16-2023-1688719040.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (30, 22, N'HP Pavilion Laptop 14', N'hp-pavilion-laptop-14-dv0071cl-1660979218.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (31, 22, N'HP Omen 17', N'hp-omen-17-2023-1679625061.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (32, 22, N'HP Victus 15', N'hp-victus-15-fa0031dx-gen-12th-1657104034.jpg', 2, 43, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (33, 22, N'Acer Nitro 16 Phoenix AMD', N'acer-nitro-16-phoenix-amd-2023-1699004932.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (34, 22, N'Acer Aspire 5 A517', N'acer-aspire-5-a517-2021-1693878849.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (35, 22, N'Acer Spin 3 SP313', N'acer-spin-3-sp313-2021-1693879444.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (37, 22, N'Acer Predator Helios 16 Neo', N'acer-predator-helios-16-neo-2023-1694504627.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (38, 22, N'Acer Swift 3 SF314', N'acer-swift-3-sf314-512-52mz-1678846936.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (39, 22, N'Acer Predator Helios 300', N'acer-predator-helios-300-ph315-55-1678677849.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (41, 22, N'Acer Aspire 5 A515', N'acer-aspire-5-a515-2021-1694159519.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (42, 22, N'Acer Nitro 5 Tiger', N'acer-nitro-5-tiger-2022-1699426065.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (43, 22, N'Acer Nitro 5 Tiger', N'acer-nitro-5-2022-chinh-hang-1671876057.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (44, 22, N'Acer Nitro 5 AN515', N'acer-nitro-5-2021-1633749241.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (45, 22, N'Acer Nitro 16 Phoenix', N'acer-nitro-16-phoenix-2023-1685434389.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (46, 22, N'Acer Nitro 17 Phoenix', N'acer-nitro-17-phoenix-2023-1685672123.jpg', 2, 44, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (47, 22, N'Macbook Air 13', N'macbook-air-13-2022-m2-ram-16gb-ssd-2tb-10gpu-new-1698834746.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (48, 22, N'Macbook Air 13 inch', N'macbook-air-13-inch-2020-m1-8gb-512gb-like-new-1698632802.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (49, 22, N'Macbook Air 2023 15', N'1072-0-1689836924.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (51, 22, N'iMac 2021 24 inch', N'929-0-1685933884.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (52, 22, N'Macbook Air 13 2022', N'972-1-1677207718.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (53, 22, N'Macbook Pro 16', N'macbook-pro-16-m1-max-10-core-gpu-32-core-64gb8tb-new-1641356201.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (55, 22, N'Mac Mini 2020', N'mac-mini-2020-m1-16gb-256gb-new-1619672384.jpeg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (56, 22, N'MHLV3 – iMac Pro 2023', N'mhlv3-imac-pro-2020-27-inch-5k-xeon-w-32gb-1tb-vega-56-new-1609753828.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (57, 22, N'iMac 2020', N'imac-2020-27-inch-retina-5k-mxwu2-new-1601003076.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (58, 22, N'Macbook Pro 13', N'919-0-1600859730.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (61, 22, N'Macbook Air 13 inch', N'919-0-1600859730.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (62, 22, N'Macbook Pro 16', N'macbook-pro-16-m1-pro-10-core-gpu-16-core-16gb512gb-new-1635753487.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (63, 22, N'Macbook Air 13 inch', N'919-0-1602125187.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (64, 22, N'Macbook Pro 14', N'macbook-pro-16-m1-pro-10-core-gpu-16-core-16gb512gb-new-1635753487.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (65, 22, N'Macbook Pro 14 2023', N'macbook-pro-14-2023-m3-8-cpu-10-gpu-8gb-512gb-new-1699871153.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (66, 22, N'MacBook Pro 14 2023', N'1032-1-1683277451.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (67, 22, N'Macbook Pro 13', N'macbook-pro-13-2022-m2-8gb-256gb-new-1656994695.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (69, 22, N'Macbook Pro 16 ', N'macbook-pro-16-inch-2019-mvvj2-mvvl2-core-i7-26-16gb-512gb-like-new-1601092287.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (70, 22, N'MacBook Pro 16 2023 ', N'macbook-pro-14-2023-m3-8-cpu-10-gpu-8gb-512gb-new-1699871153.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (71, 22, N'Macbook Pro 14 ', N'macbook-pro-14-2023-m3-8-cpu-10-gpu-8gb-512gb-new-1699871153.jpg', 2, 45, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (72, 22, N'Surface Laptop Go 3', N'surface-laptop-go-3-core-i5-16gb-256gb-newseal-1700549046.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (73, 22, N'Surface Go 4', N'surface-go-4-intel-n200-ram-8gb-ufs-256-new-1698458862.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (74, 22, N'Surface Studio 2 Plus', N'surface-studio-2-plus-1698337318.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (75, 22, N'Surface Laptop Studio 2', N'surface-laptop-studio-2-core-i7-64gb-2tb-rtx-4050ti-new-1698332295.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (76, 22, N'Surface Pro X SQ2 ', N'surface-pro-x-sq2-ram-16gb-ssd-256gb-refurbished-1687595503.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (77, 22, N'Surface Go 3 ', N'surface-go-3-pentium-6500y-wifi-4gb-ram-64gb-emmc-new-1633579186.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (78, 22, N'Surface Laptop 3 [15]', N'surface-laptop-3-15-amd-ryzen-5-8gb-256gb-99-1626872013.jpeg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (79, 22, N'Used - Surface Book 2', N'used-surface-book-2-15-inch-1622796687.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (80, 22, N'Surface Book 3', N'surface-book-3-core-i5-8gb-256gb-13-inch-99-1611372801.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (81, 22, N'Surface Book 3', N'surface-book-3-core-i5-8gb-256gb-13-inch-newseal-1601021898.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (82, 22, N'Surface Book 3', N'surface-book-3-core-i7-16gb-256gb-15-inch-newseal-1601019742.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (83, 22, N'Surface Go 2', N'surface-go-2-core-m3-8gb-128gb-lte-newseal-1610869934.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (84, 22, N'Surface Studio 2', N'surface-studio-2-chinh-hang-gia-tot-nhat-1572948512.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (85, 22, N'Surface Pro X SQ1', N'surface-pro-x-sq1-8gb-256gb-new-1673334354.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (86, 22, N'Surface Pro 9', N'surface-go-3-pentium-6500y-wifi-4gb-ram-64gb-emmc-new-1633579186.jpg', 2, 46, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (87, 21, N'iPhone 15 Pro Max 256GB', N'1575380003.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (88, 21, N'iPhone 15 Pro 128GB', N'652491871.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (89, 21, N'iPhone 15 128GB', N'66855595.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (90, 22, N'iPhone 15 Plus 128GB', N'1745831617.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (91, 22, N'iPhone 11 64GB', N'286885732.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (92, 22, N'iPhone 14 128GB', N'406597056.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (94, 22, N'iPhone 13 128GB', N'767471342.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (95, 22, N'iPhone 15 Pro Max 1TB', N'1876151840.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (96, 22, N'iPhone 11 128GB', N'1611398233.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (97, 22, N'iPhone 12 64GB', N'664861462.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (98, 22, N'iPhone 14 Plus 128GB', N'134891339.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (99, 22, N'iPhone 14 Plus 512GB', N'1482560238.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (100, 22, N'iPhone 13 256GB', N'1657054481.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (104, 22, N'iPhone 12 Pro Max 512GB', N'2146519032.jpeg', 2, 47, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (106, 22, N'Samsung Galaxy A35 5G 8/128GB', N'453375084.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (107, 22, N'Samsung Galaxy A55 5G 8/128GB', N'1855371051.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (109, 22, N'Samsung Galaxy S24 Plus 12/256GB', N'1221270165.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (110, 22, N'Samsung Galaxy S24 Ultra 12/512GB', N'1824424047.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (111, 22, N'Samsung Galaxy A25 5G 6/128GB', N'807587865.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (113, 22, N'Samsung Galaxy Z Flip5 5G 256GB', N'866852622.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (114, 22, N'Samsung Galaxy S21 FE 5G 8/128GB', N'480714543.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (116, 22, N'Samsung Galaxy Z Fold5 5G 256GB', N'1126150247.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (118, 22, N'Samsung Galaxy Z Flip4 5G 128GB', N'1702322800.jpeg', 2, 48, N'active', NULL)
GO
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (120, 22, N'Samsung Galaxy Z Flip5 5G 512GB', N'1779417149.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (121, 22, N'Samsung Galaxy Z Fold5 5G 1TB', N'1556903871.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (122, 22, N'Samsung Galaxy S23 Ultra 12/512GB', N'454532618.jpeg', 2, 48, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (123, 22, N'OPPO Reno10 5G 256GB', N'1524794905.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (124, 22, N'OPPO A78', N'194471278.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (125, 22, N'OPPO Reno8 T', N'514761814.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (126, 22, N'OPPO A18 128GB', N'1441296004.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (127, 22, N'OPPO Find N3 Flip', N'555351562.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (128, 22, N'OPPO A58 6/128GB', N'1098281398.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (129, 22, N'OPPO FIND N2 FLIP', N'872461878.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (130, 22, N'OPPO A17K', N'255571316.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (131, 22, N'OPPO Reno10 5G 128GB', N'1897918319.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (132, 22, N'OPPO Find N3
', N'151041254.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (133, 22, N'OPPO Reno11 F 5G', N'1157376729.jpeg', 2, 49, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (134, 22, N'Xiaomi 14 (12+256)', N'125286504.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (135, 22, N'Xiaomi Redmi Note 13 (6+128)', N'489565993.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (136, 22, N'Xiaomi Redmi 13C (6+128)', N'449457769.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (138, 22, N'Xiaomi 13T 12/256GB', N'706985611.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (140, 22, N'Redmi A2 2/32GB', N'2007918917.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (142, 22, N'Xiaomi Redmi A2+ (3+64)', N'2130479104.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (143, 22, N'Xiaomi Redmi Note 12 Pro 5G 8/256GB', N'1227033916.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (144, 22, N'Xiaomi Redmi Note 12 Pro (8+256)', N'1253805826.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (145, 22, N'Xiaomi Redmi Note 13 Pro (8+128)', N'1626908743.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (146, 22, N'Xiaomi Redmi A3 (4+128)', N'473893694.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (147, 22, N'Xiaomi Redmi Note 11 Pro 5G', N'819262804.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (148, 22, N'Xiaomi Redmi Note 13 Pro Plus 5G (8+256)', N'1794791707.jpeg', 2, 50, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (149, 28, N'Tai nghe AirPods Pro 2023 USB-C
', N'1.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (150, 23, N'Tai nghe EarPods 2023 USB-C
', N'2.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (151, 28, N'Tai nghe AirPods Pro 2022
', N'3.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (152, 29, N'Tai nghe AirPods 3 2022 Hộp sạc dây
', N'4.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (155, 25, N'Tai nghe Beats Fit Pro True Wireless Earbuds
', N'5.jpg
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (156, 27, N'Dây sạc Apple Magsafe Charger to USB-C Cable 1m
', N'6.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (157, 30, N'Đế sạc đôi MagSafe Duo Charger
', N'7.jpg
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (158, 30, N'Củ sạc Apple Power Adapter 67W Type-C
', N'8.jpg
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (159, 30, N'Khăn lau màn hình cao cấp Polishing Cloth
', N'9.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (160, 30, N'Cáp USB-C to Magsafe 3 Cable Apple 2m
', N'10.jpg
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (161, 30, N'Củ sạc Apple Power Adapter 140W Type-C
', N'11.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (162, 30, N'Cáp USB-C to Lightning Apple Cable 1m 2021
', N'12.jpeg
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (163, 30, N'Tai nghe AirPods 3 2021 Hộp sạc không dây
', N'13.jpg
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (164, 30, N'Bao da iPad Mini 8.3 2021 Smart Folio
', N'14.jpg
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (165, 30, N'Ốp lưng iPhone 13 Clear Case with MagSafe
', N'15.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (167, 30, N'Ốp lưng iPhone 13 Pro Max Leather Case with MagSafe
', N'16.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (168, 30, N'Pin sạc dự phòng Magsafe Wekome WP-365 15W 10,000mAh
', N'17.jpg
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (169, 30, N'Pin sạc dự phòng Magsafe QC 3.0/PD 20.5W 10000mAh Yoobao
', N'18.jpg
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (170, 30, N'Pin sạc dự phòng Magsafe Innostyle PowerMag Switch 2in1 QC/PD 20W 10000mAh
', N'19.jpg
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (171, 30, N'Pin sạc dự phòng Magsafe Innostyle PowerMag Slim QC 3.0/PD 20W 10000mAh
', N'20.jpg
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (172, 30, N'Pin sạc dự phòng Innostyle 10000mAh Magsafe 3.0/PD 22.5W
', N'21.webp
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (173, 30, N'Pin sạc dự phòng Magsafe Innostyle PowerMag 15W 2in1 QC/PD 20W 10000mAh
', N'22.webp
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (174, 30, N'Pin sạc dự phòng Aukey Basix Slim PB-N99 10000mAh
', N'23.webp
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (175, 30, N'Pin sạc dự phòng Innostyle PowerGo Smart Ai 10000mAh
', N'24.webp
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (176, 30, N'Pin sạc dự phòng Innostyle Powermax QC3.0/PD 20W 10000mAh
', N'25.webp
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (177, 30, N'Pin sạc dự phòng UmeTravel 10000mAh TRIP10000 Quick Charge
', N'26.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (178, 30, N'Pin sạc dự phòng UmeTravel 10000 mAh SKY10000 Quick Charge
', N'27.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (179, 30, N'Pin sạc dự phòng Belkin 10000mAh BPB011
', N'28.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (180, 30, N'Máy Chơi Game Cầm Tay ASUS ROG Ally Ryzen Z1 Extreme
', N'29.webp
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (181, 30, N'Máy chơi Game cầm tay MSI Claw A1M 049VN Ultra 7 155H/16GB/512GB/7"FHD/Win 11
', N'30.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (182, 30, N'Máy chơi game Sony PlayStation 5 Slim (PS5 Slim)
', N'31.webp
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (183, 30, N'MSI Claw Docking Station (with USB-C Cable)
', N'32.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (184, 30, N'Túi đựng máy chơi game MSI Claw (dây đeo, miếng dán cường lực, móc khóa, túi đựng)
', N'33.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (185, 30, N'Hộp Đựng Du Lịch ASUS ROG Ally
', N'34.webp
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (186, 30, N'Máy chơi Game cầm tay Lenovo Legion GO - 8APU1 AMD Ryzen Z1 Extreme/16GB/512GB/8.8" WQXGA/Win11
', N'35.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (187, 30, N'Đế sạc tay cầm PS5 Sony DualSense Charging Station 
', N'36.webp
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (188, 30, N'Chuột không dây quang Microsoft 1850 
', N'37.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (189, 30, N'Chuột không dây Logitech M221
', N'38.webp
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (190, 30, N'Chuột không dây Logitech M220
', N'39.jpg
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (191, 30, N'Chuột không dây Logitech M171
', N'40.jpg
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (192, 30, N'Bàn phím Bluetooth Logitech MX Keys S Fullsize
', N'41.jpg
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (193, 30, N'Bàn phím Bluetooth Logitech K380s
', N'42.jpg
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (194, 30, N'Bàn phím cơ không dây EDRA EK398L Beta xám trắng Red switch
', N'43.webp
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (195, 30, N'Bàn phím cơ gaming có dây Apex 3 SteelSeries
', N'44.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (196, 30, N'Bàn phím cơ gaming có dây Apex 7 TKL Red switch SteelSeries
', N'45.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (197, 30, N'Bàn phím cơ gaming có dây Apex 3 TKL SteelSeries
', N'46.jpg
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (198, 30, N'Bàn phím Game có dây Zadez G-850K Gen 2
', N'47.png
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (199, 30, N'Bàn phím cơ có dây iCore ICK10
', N'48.png
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (201, 30, N'Củ sạc nhanh Belkin 25W USB-C chuẩn PD/PPS 1 cổng
', N'49.png
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (202, 30, N'Sạc nhanh Magsafe không dây 3in1 Belkin 15W
', N'50.jpg
', 8, 59, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (203, 30, N'Củ sạc nhanh Anker 20W Powerport III A2633 
', N'51.webp
', 8, 61, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (204, 28, N'PC CPS Gaming G02 i3 12100F / 8GB - 256GB / RTX 3050
', N'52.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (205, 29, N'PC CPS Gaming G14
', N'53.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (206, 28, N'Máy tính All In One văn phòng MSI PRO-AP242-12M-213VN
', N'54.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (207, 8, N'PC CPS Gaming G01 i3 12100F / 8GB - 256GB / GTX 1650
', N'55.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (209, 28, N'PC Asus Rog Strix G10DK-R5600G003W
', N'56.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (210, 28, N'Máy tính AIO ASUS A3202WBAK-WA101W
', N'57.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (212, 26, N'PC CPS Gaming G06 i5 12400F / 8GB - 256GB / RTX 3060
', N'58.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (213, 30, N'PC CPS Đồ Hoạ D01 i5 12400F / 16GB - 256GB / GTX 1650
', N'59.webp
', 8, 64, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (214, 30, N'PC CPS văn phòng S04 i5 12400 / 8GB - 240GB
', N'60.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (215, 47, N'PC văn phòng Dell Inspiron 3020MT
', N'61.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (216, 27, N'PC CPS văn phòng S01 R3 4300G / 8GB - 240GB
', N'62.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (217, 34, N'PC CPS Gaming G04 i5 12400F / 8GB - 256GB / GTX 1650
', N'63.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (219, 61, N'PC CPS văn phòng S02 i3 12100 / 8GB - 240GB
', N'64.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (220, 20, N'PC CPS Đồ Hoạ D02 i5 12400F / 16GB - 256GB / RTX 3060
', N'65.webp
', 8, 64, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (221, 27, N'PC CPS Gaming G05 i3 12100F / 8GB - 256GB / RTX 3060
', N'66.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (223, 18, N'PC CPS Đồ Hoạ D04 i7 13700F / 16GB - 500GB / RTX 4060
', N'67.webp
', 8, 64, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (224, 14, N'PC CPS Gaming G03 R5 4500 / 8GB - 256GB / GTX 1650
', N'68.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (225, 44, N'PC CPS Gaming G16
', N'69.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (226, 82, N'PC CPS Gaming G05 i3 12100F / 8GB - 256GB / RTX 3060
', N'70.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (227, 45, N'PC CPS Gaming G03 R5 4500 / 8GB - 256GB / GTX 1650
', N'71.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (228, 82, N'PC CPS Gaming G15
', N'72.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (229, 69, N'PC CPS Gaming G07 i5 12400F / 8GB - 256GB / RTX 4060
', N'73.webp
', 8, 62, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (230, 70, N'PC CPS Gaming G09 i3 12100F / 8GB - 256GB / RX 6600
', N'74.webp
', 8, 62, N'active', NULL)
GO
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (232, 16, N'Máy tính văn phòng All In One Asus A5402WVAK-WA014W
', N'75.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (233, 63, N'PC văn phòng Asus S500SE-513400035W
', N'76.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (234, 26, N'PC CPS văn phòng S03 R5 5600G / 8GB - 240GB
', N'77.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (235, 29, N'Máy tính All In One văn phòng ASUS A3402WBAT-WA187W
', N'78.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (236, 38, N'Máy tính văn phòng All In One ASUS A3402WBAK-WA604W
', N'79.webp
', 8, 63, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (237, 37, N'Chuột Gaming không dây Logitech G304 Lightspee
', N'80.webp
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (238, 68, N'Chuột Apple Magic Mouse 2021 MK2E3
', N'81.webp
', 8, 58, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (240, 51, N'Chuột có dây Gaming Logitech G102 LightSync Gen 2
', N'82.webp
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (241, 84, N'Chuột không dây Logitech Signature M650 Size M
', N'83.webp
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (242, 84, N'Chuột không dây Logitech M331
', N'84.webp
', 8, 60, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (257, 22, N'realme 11 Pro', N'1466642003.jpeg', 8, 52, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (258, 88, N'Đồng hồ thông minh Amazfit T-Rex Ultra 47.3mm
', N'amazfit-t-rex-1.jpg
', 9, 22, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (261, 18, N'Đồng hồ thông minh Garmin Forerunner 165 43mm
', N'garmin-forerunner-165-xam-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (263, 45, N'Vòng đeo tay thông minh Mi Band 8 Pro
', N'mi-band-8-pro-trang-1-1.jpg
', 9, 20, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (264, 87, N'Vòng tay thông minh Samsung Galaxy Fit3
', N'samsung-galaxy-fit3-hong-hc-1.jpg
', 9, 25, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (265, 62, N'Đồng hồ thông minh BeFit Active 2
', N'befit-active-2-den-hc-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (266, 73, N'Đồng hồ thông minh BeFit WatchFit
', N'befit-watch-fit-tim-1-2.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (267, 96, N'Đồng hồ thông minh Garmin Forerunner 965
', N'garmin-forerunner-965-trang-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (268, 22, N'Đồng hồ thông minh Garmin Forerunner 165 Music 
', N'garmin-forerunner-165-music-xanh-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (269, 96, N'Đồng hồ thông minh Apple Watch SE 2022 GPS 44mm viền nhôm dây thể thao
', N'apple-watch-se-2022-44mm-vien-nhom-trang-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (270, 67, N'Đồng hồ thông minh Samsung Galaxy Watch5
', N'samsung-galaxy-watch-5-40-mm-bac-1.jpg
', 9, 25, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (271, 80, N'Đồng hồ thông minh Garmin Lily 2 Classic
', N'garmin-lily-2-classic-day-da-nau-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (272, 33, N'Đồng hồ thông minh Garmin Forerunner 55
', N'garmin-forerunner-55-day-silicone-den-1-3.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (273, 50, N'Đồng hồ thông minh Xiaomi Watch S3
', N'xiaomi-watch-s-3-den-2-1.jpg
', 9, 20, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (274, 38, N'Đồng hồ thông minh Garmin Forerunner 265 Music
', N'garmin-forerunner-265-trang-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (275, 91, N'Đồng hồ thông minh Garmin Lily 2 Classic 34mm dây vải
', N'garmin-lily-2-classic-day-vai-nau-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (277, 61, N'Đồng hồ thông minh Xiaomi Redmi Watch 4 47.5mm dây silicone
', N'xiaomi-redmi-watch-4-den-1-1.jpg
', 9, 20, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (278, 33, N'Đồng hồ thông minh Garmin Lily 2
', N'garmin-lily-2-kem-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (279, 90, N'Vòng đeo tay thông minh Mi Band 8
', N'mi-band-8-vang-glr-1.jpg
', 9, 20, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (280, 30, N'Đồng hồ thông minh Samsung Galaxy Watch5 Pro LTE 45mm Đen
', N'sam-sung-galaxy-watch-5-pro-lte-1.jpg
', 9, 25, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (281, 82, N'Đồng hồ thông minh Xiaomi Redmi Watch 3
', N'redmi-watch-3-trang-11.jpg
', 9, 20, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (282, 79, N'Vòng đeo tay thông minh Mi Band 7 Pro
', N'vong-tay-mi-band-7-pro-2.jpg
', 9, 20, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (283, 41, N'Đồng hồ thông minh Xiaomi Redmi Watch 3 Active
', N'redmi-watch-3-active-xam-1-1.jpg
', 9, 20, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (284, 26, N'Đồng hồ thông minh Garmin Venu 2
', N'den-org-org.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (285, 56, N'Đồng hồ thông minh BeFit B3
', N'dong-ho--thong-minh-befit-b3-vang-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (286, 20, N'Đồng hồ thông minh Xiaomi Watch 2 Pro
', N'xiaomi-watch-2-pro-1-2.jpg
', 9, 20, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (287, 96, N'Đồng hồ thông minh Samsung Galaxy Watch4
', N'smartwatch-samsung-galaxy-watch-4-vang-hong-1.jpg
', 9, 25, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (288, 70, N'Đồng hồ thông minh Garmin Venu SQ 2 Music
', N'garmin-venu-sq-2-music-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (289, 89, N'Đồng hồ thông minh Garmin Venu SQ 2
', N'garmin-venu-sq-2-day-silicone-xanh-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (290, 15, N'Đồng hồ thông minh BeFit B4
', N'befit-beu-b4-hong-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (291, 75, N'Đồng hồ thông minh BeFit Sporty 2 Pro
', N'befit-sporty-2-pro-nau-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (292, 21, N'Đồng hồ thông minh Amazfit T-Rex 2
', N'amazfit-t-rex-2-den-bac-2-1.jpg
', 9, 22, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (293, 99, N'Đồng hồ thông minh Garmin Lily
', N'garmin-lily-day-silicone-kem-0.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (294, 76, N'Đồng hồ thông minh Garmin Epix Pro Gen
', N'garmin-epix-pro-gen-2-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (296, 60, N'Đồng hồ thông minh Garmin Fenix 7X Pro Solar Titanium
', N'garmin-fenix-7x-pro-solar-titanium-xam-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (297, 59, N'Đồng hồ thông minh Garmin Fenix 7 Pro Solar Titanium
', N'garmin-fenix-7-pro-solar-titanium-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (298, 45, N'Đồng hồ thông minh Apple Watch Ultra 2 GPS + Cellular
', N'apple-watch-ultra-lte-49mm-vien-titanium-day-ocean-trang-1-2.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (299, 23, N'Đồng hồ thông minh Apple Watch Ultra 2 GPS + Cellular
', N'apple-watch-ultra-lte-49mm-vien-titanium-day-trail-size-m-l-xam-10.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (300, 72, N'Đồng hồ thông minh Apple Watch Series 9 GPS + Cellular
', N'apple-watch-s9-lte-41mm-vien-thep-khong-gi-day-silicone-xanh-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (301, 41, N'Đồng hồ thông minh Garmin Fenix 7X Solar Titanium
', N'garmin-fenix-7x-solar-titanium-den-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (302, 46, N'Đồng hồ thông minh Garmin Golf Approach S70
', N'garmin-golf-approach-s70-day-silicone3.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (304, 97, N'Đồng hồ thông minh Apple Watch Series 9 GPS
', N'apple-watch-s9-lte-45mm-vien-nhom-day-silicone-trang-starlight-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (305, 10, N'Đồng hồ thông minh Apple Watch Series 9 GPS + Cellular
', N'apple-watch-s9-lte-45mm-vien-nhom-day-silicone-day-ngan-xanh-den-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (306, 45, N'Đồng hồ thông minh Apple Watch Series 9 GPS + Cellular 41mm viền nhôm dây thể thao
', N'apple-watch-s9-lte-41mm-vien-nhom-day-silicone-hong-1-3.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (308, 9, N'Đồng hồ thông minh Apple Watch Series 9
', N'apple-watch-s9-lte-41mm-vien-nhom-day-vai-hong-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (309, 28, N'Đồng hồ thông minh Garmin Venu 3
', N'garmin-venu-3-day-silicone-trang-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (310, 61, N'Đồng hồ thông minh Garmin Venu 3S
', N'garmin-venu-3s-day-silicone-vang-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (311, 41, N'Đồng hồ thông minh Garmin Forerunner 265S
', N'garmin-forerunner-265s-hong-day-silicone-1.jpg
', 9, 23, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (312, 92, N'Đồng hồ thông minh Apple Watch Series 9 GPS 45mm viền nhôm dây thể thao
', N'apple-watch-s9-45mm-vien-nhom-day-silicone-xanh-duong-nhat-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (314, 21, N'Đồng hồ thông minh Apple Watch Series 9 GPS 45mm viền nhôm dây thể thao size S/M
', N'apple-watch-s9-45mm-vien-nhom-day-silicone-day-ngan-hong-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (315, 93, N'Đồng hồ thông minh Apple Watch Series 9 GPS viền nhôm dây vải 
', N'apple-watch-s9-45mm-vien-nhom-day-vai-xanh-den-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (316, 13, N'Đồng hồ thông minh Apple Watch Series 9 GPS viền nhôm dây thể thao
', N'apple-watch-s9-41mm-vien-nhom-day-silicone-trang-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (317, 60, N'Đồng hồ thông minh Apple Watch SE 2023 GPS + Cellular viền nhôm dây thể thao
', N'apple-watch-se-lte-2023-44mm-vien-nhom-day-silicone-xanh-duong-nhat-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (318, 43, N'Đồng hồ thông minh Apple Watch SE 2023 GPS + Cellular  viền nhôm dây thể thao size S/M
', N'apple-watch-se-lte-2023-44mm-vien-nhom-day-silicone-xanh-trang-starlight-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (319, 21, N'Đồng hồ thông minh Samsung Galaxy Watch5 Pro
', N'sam-sung-galaxy-watch-5-pro-xam-1.jpg
', 9, 25, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (320, 57, N'Đồng hồ thông minh Apple Watch SE 2022 GPS + Cellular  viền nhôm dây thể thao
', N'apple-watch-se-2022-lte-44mm-den-xanh-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (321, 38, N'Đồng hồ thông minh Samsung Galaxy Watch6 Classic LTE
', N'samsung-galaxy-watch6-classic-lte-47mm-den-1.jpg
', 9, 25, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (322, 6, N'Đồng hồ thông minh Apple Watch SE 2023 GPS + Cellular viền nhôm dây vải
', N'apple-watch-se-lte-2023-40mm-vien-nhom-day-vai-trang-starlight-1.jpg
', 9, 21, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (323, 14, N'Đồng hồ thông minh BeFit Sporty 2
', N'befit-sporty-2-phien-ban-dac-biet-mau-nau-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (324, 94, N'Đồng hồ thông minh BeFit WatchS
', N'befit-watch-s-day-nam-cham-xam-cam-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (325, 87, N'Đồng hồ thông minh BeFit WatchS dây silicone
', N'befit-watch-s-day-silicone-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (327, 31, N'Đồng hồ thông minh BeFit Watch Ultra 
', N'befit-watch-ultra-day-silicone-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (328, 22, N'Đồng hồ thông minh BeFit Watch Ultra S 
', N'befit-watch-ultra-s-day-silicone-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (329, 62, N'Đồng hồ thông minh BeFit Hunter1
', N'dong-ho-thong-minh-befit-hunter1-48mm-xam-hc-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (330, 24, N'Đồng hồ thông minh BeFit B3s
', N'befit-b3s-den-1.jpg
', 9, 24, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (331, 95, N'Đồng hồ thông minh Amazfit Balance 46mm dây nylon
', N'amazfit-balance-day-xam-1.jpg
', 9, 22, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (332, 8, N'Đồng hồ thông minh Amazfit Cheetah Round
', N'amazfit-cheetah-round-1.jpg
', 9, 22, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (333, 19, N'Đồng hồ thông minh Amazfit Cheetah Square
', N'amazfit-cheetah-square-1-1.jpg
', 9, 22, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (334, 45, N'Đồng hồ thông minh Amazfit Active Edge
', N'amazfit-active-edge-den-hc-1.jpg
', 9, 22, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (335, 35, N'Đồng hồ thông minh Amazfit Active Edge
', N'amazfit-active-hong-hc-1.jpg
', 9, 22, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (336, 25, N'Đồng hồ thông minh Amazfit Bip 5
', N'amazfit-bip-5-hong-1.jpg
', 9, 22, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (337, 28, N'Máy lạnh Daikin Inverter 1 HP ATKB25YVMV
', N'daikin-inverter-1-hp-atkb25yvmv-1-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (338, 67, N'Máy lạnh Daikin Inverter 1 HP ATKF25YVMV
', N'daikin-inverter-1-hp-atkf25yvmv-1-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (339, 53, N'Máy lạnh Daikin Inverter 1.5 HP ATKB35YVMV
', N'daikin-inverter-1-5-hp-atkb35yvmv-1-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (340, 69, N'Máy lạnh Daikin Inverter 1.5 HP ATKF35YVMV 
', N'daikin-inverter-1-5-hp-atkf35yvmv-1-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (341, 73, N'Máy lạnh Daikin Inverter 1.5 HP FTKY35WMVMV
', N'daikin-inverter-1-hp-ftky25wmvmv31.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (342, 90, N'Máy lạnh Daikin Inverter 2 HP FTKF50XVMV
', N'may-lanh-daikin-inverter-2-hp-ftkf50xvmv-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (343, 31, N'Máy lạnh Daikin Inverter 2 chiều 1 HP ATHF25XVMV
', N'may-lanh-daikin-inverter-2-chieu-1-hp-athf25xvmv-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (344, 94, N'Máy lạnh Daikin Inverter 1.5 HP ATKF35XVMV
', N'may-lanh-daikin-inverter-15-hp-atkf35xvmv-3.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (345, 24, N'Máy lạnh Daikin Inverter 2 chiều 1.5 HP ATHF35XVMV
', N'daikin-inverter-2-chieu-15-hp-athf35xvmv-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (346, 77, N'Máy lạnh Daikin Inverter 2 HP FTKY50WVMV 
', N'daikin-inverter-2-hp-ftky50wvmv1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (347, 83, N'Máy lạnh Daikin Inverter 2.5 HP FTKF60XVMV
', N'may-lanh-daikin-inverter-25-hp-ftkf60xvmv-0.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (348, 66, N'Máy lạnh Daikin Inverter 1 HP FTKZ25VVMV 
', N'daikin-inverter-1hp-ftkz25vvmv-1-1-org.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (349, 62, N'Máy lạnh 2 chiều Daikin Inverter 2.5 HP FTHF60VAVMV 
', N'may-lanh-daikin-inverter-2-5-hp-fthf60vavmv-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (350, 59, N'Máy lạnh 2 chiều Daikin Inverter 2 HP FTHF50VAVMV
', N'may-lanh-daikin-inverter-2-hp-fthf50vavmv-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (351, 24, N'Máy lạnh Daikin Inverter 1.5 HP FTKZ35VVMV
', N'daikin-inverter-15-hp-ftkz35vvmv-2.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (352, 24, N'Máy lạnh Daikin Inverter 2 HP FTKZ50VVMV 
', N'daikin-inverter-2-hp-ftkz50vvmv-2.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (353, 52, N'Máy lạnh Daikin Inverter 2.5 HP FTKY60WVMV
', N'daikin-inverter-25-hp-ftky60wvmv1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (354, 93, N'Máy lạnh 2 chiều Daikin Inverter 3 HP FTHF71VAVMV 
', N'may-lanh-daikin-inverter-3-hp-fthf71vavmv-1.jpg
', 9, 1, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (356, 88, N'Máy lạnh Panasonic Inverter 1.5 HP CU/CS-PU12AKH-8 
', N'panasonic-inverter-1-5-hp-cu-cs-pu12akh-81.jpg
', 9, 2, N'active', NULL)
GO
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (357, 99, N'Máy lạnh Panasonic Inverter 1.5 HP CU/CS-XU12ZKH-8 
', N'may-lanh-panasonic-inverter-15-hp-cu-cs-xu12zkh-81-1.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (358, 50, N'Máy lạnh Panasonic Inverter 2 HP CU/CS-PU18AKH-8
', N'panasonic-inverter-2-hp-cu-cs-pu18akh-8-fix-1.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (359, 24, N'Máy lạnh Panasonic Inverter 1 HP CU/CS-PU9AKH-8 
', N'panasonic-inverter-1-hp-cu-cs-pu9akh-8top-tskt1.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (360, 11, N'Máy lạnh Panasonic Inverter 1 HP CU/CS-XU9ZKH-8
', N'may-lanh-panasonic-inverter-1-hp-cu-cs-xu9zkh-81-1.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (361, 97, N'Máy lạnh 2 chiều Panasonic Inverter 1 HP CU/CS-YZ9AKH-8
', N'panasonic-inverter-1-hp-cu-cs-yz9akh-8-1.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (362, 44, N'Máy lạnh Panasonic Inverter 2 HP CU/CS-XU18ZKH-8
', N'may-lanh-panasonic-inverter-2-hp-cu-cs-xu18zkh-81-2.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (363, 75, N'Máy lạnh 2 chiều Panasonic Inverter 1.5 HP CU/CS-YZ12AKH-8 
', N'panasonic-inverter-1-5-hp-cu-cs-yz12akh-8638481082377450477.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (364, 73, N'Máy lạnh Panasonic Inverter 2.5 HP CU/CS-PU24AKH-8 
', N'panasonic-inverter-2-5-hp-cu-cs-pu24akh-8638473457643178617.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (365, 98, N'Máy lạnh 2 chiều Panasonic Inverter 1 HP CU/CS-YZ9WKH-8 
', N'panasonic-cu-cs-yz9wkh-8-1-2-org.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (366, 71, N'Máy lạnh 2 chiều Panasonic Inverter 2 HP CU/CS-YZ18AKH-8 
', N'panasonic-inverter-2-hp-cu-cs-yz12akh-8-note-fix.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (367, 44, N'Máy lạnh 2 chiều Panasonic Inverter 1.5 HP CU/CS-YZ12WKH-8 
', N'panasonic-cu-cs-yz12wkh-8-1-1-org.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (368, 18, N'Máy lạnh Panasonic Inverter 1.5 HP CU/CS-XU12XKH-8
', N'panasonic-cu-cs-xu12xkh-8-2-2.jpg
', 9, 2, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (369, 4, N'Máy lạnh LG Inverter 1 HP V10WIN1
', N'lg-inverter-1-hp-v10win1638454075126384413--fix-1020x571-1.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (370, 96, N'Máy lạnh LG Inverter 1.5 HP V13WIN1 
', N'lg-inverter-1-5-hp-v13win1638454076983075979.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (371, 80, N'Máy lạnh LG Inverter 1 HP V10API1
', N'lg-v10api1-160621-0150370.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (372, 90, N'Máy lạnh LG Inverter 1.5 HP V13API1
', N'lg-v13api1-160621-0149550.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (373, 87, N'Máy lạnh LG Inverter 2 HP V18WIN1
', N'lg-inverter-2-hp-v18win1638473936271371561.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (374, 13, N'Máy lạnh LG Inverter 1 HP V10APFP 
', N'may-lanh-lg-inverter-1-hp-v10apfp1.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (375, 67, N'Máy lạnh LG Inverter 1.5 HP V13APFP
', N'lg-inverter-15-hp-v13apfp-1.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (376, 14, N'Máy lạnh LG Inverter 2.5 HP V24WIN1 
', N'vi-vn-lg-inverter-2-5-hp-v24win1-1.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (377, 97, N'Máy lạnh 2 chiều LG Inverter 1.5 HP B13END1
', N'2-chieu-lg-inverter-15-hp-b13end1-2.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (378, 35, N'Máy lạnh LG Inverter 1.5 HP V13WIN1 
', N'may-lanh-lg-inverter-15-hp-v13win2.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (379, 89, N'Máy lạnh LG Inverter 1 HP V10WIN1
', N'may-lanh-lg-inverter-10-hp-v10win1.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (380, 61, N'Máy lạnh LG Inverter 1 HP V10APFUV 
', N'lg-v10apfuv-1-1-org.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (381, 90, N'Máy lạnh 2 chiều LG Inverter 1 HP B10END1 
', N'2-chieu-lg-inverter-1-hp-b10end1-2.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (382, 40, N'Máy lạnh âm trần LG Inverter 3 HP ZTNQ30GNLE0 
', N'may-lanh-am-tran-lg-ztnq30gnle0638083611849261944.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (383, 44, N'Máy lạnh tủ đứng LG Inverter 4 HP ZPNQ36GR5A0 
', N'may-lanh-tu-dung-lg-zpnq36gr5a0638086014807407175.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (384, 60, N'Máy lạnh âm trần LG Inverter 4 HP ZTNQ36GNLA0
', N'may-lanh-am-tran-lg-ztnq36gnla0638083634501951647.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (385, 78, N'Máy lạnh LG Inverter 1.5 HP V13APIB
', N'lg-inverter-1-5-hp-v13apib638478731659364242.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (386, 17, N'Máy lạnh tủ đứng LG Inverter 5 HP ZPNQ48LT3A0 (3 Pha) 
', N'may-lanh-tu-dung-lg-inverter-5-hp-zpnq48lt3a0-3-pha638141238300662292.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (387, 67, N'Máy lạnh âm trần LG Inverter 2 HP ZTNQ18GPLA0
', N'01-1020x570.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (388, 78, N'Máy lạnh âm trần LG Inverter 4 HP ZTNQ36LNLA0 (3 Pha)
', N'may-lanh-am-tran-lg-ztnq36lnla0-3-pha638141237300507625.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (389, 28, N'Máy lạnh tủ đứng LG Inverter 4 HP ZPNQ36LR5A0 (3 Pha) 
', N'may-lanh-tu-dung-lg-zpnq36lr5a0-3-pha638126754521284809.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (390, 65, N'Máy lạnh âm trần LG Inverter 2.5 HP ZTNQ24GPLA0 
', N'may-lanh-am-tran-lg-ztnq24gpla0638083583183760108.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (391, 98, N'Máy lạnh âm trần LG 5 HP ATNQ48GMLE7 (3 pha)  
', N'am-tran-lg-5-hp-atnq48gmle7-3-pha637910557879854315.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (392, 15, N'Máy lạnh âm trần LG Inverter 5 HP ZTNQ48GMLA0
', N'may-lanh-am-tran-lg-ztnq48gmla0638084373013969146.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (393, 20, N'Máy lạnh âm trần LG Inverter 5 HP ZTNQ48LMLA0 (3 Pha) 
', N'may-lanh-am-tran-lg-inverter-5-hp-ztnq48lmla0-(3-pha)638146653551129643.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (394, 98, N'Máy lạnh âm trần 1 hướng LG Inverter 1.5 HP ZTNQ12GULA0
', N'am-tran-1-huong-lg-inverter-1-5-hp-ztnq12gula0638470846676512413.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (395, 76, N'Máy lạnh âm trần 1 hướng LG Inverter 2 HP ZTNQ18GTLA0
', N'am-tran-1-huong-lg-inverter-2-hp-ztnq18gtla0638470850095992272.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (396, 50, N'Máy lạnh âm trần 1 hướng LG Inverter 2.5 HP ZTNQ24GTLA0 
', N'am-tran-1-huong-lg-inverter-2-5-hp-ztnq24gtla0638470851554839426.jpg
', 9, 8, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (397, 66, N'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV
', N'samsung-inverter-1-hp-ar10dyhzawknsv638454021266048608.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (398, 83, N'Máy lạnh Samsung Inverter 1.5 HP AR13DYHZAWKNSV
', N'samsung-inverter-1-5-hp-ar13dyhzawknsv638470830599734050.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (399, 86, N'Máy lạnh Samsung Wind-Free Inverter 1 HP AR10CYFAAWKNSV
', N'1-1020x570.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (400, 78, N'Máy lạnh Samsung Wind-Free Inverter 1.5 HP AR13CYFAAWKNSV
', N'samsung-inverter-15-hp-ar13cyfaawknsv638243251184782267.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (401, 73, N'Máy lạnh Samsung Wind-Free Inverter 2 HP AR18CYFCAWKNSV
', N'samsung-inverter-2-hp-ar18cyfcawknsv-1.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (402, 49, N'Máy lạnh Samsung Inverter 1.5 HP AR13TYHYCWKNSV
', N'samsung-ar13tyhycwknsv-1-1-org.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (403, 78, N'Máy lạnh Samsung Wind-Free Inverter 1 HP AR10CYECAWKNSV
', N'samsung-inverter-1-hp-ar10cyecawknsv638481083627686138.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (404, 24, N'Máy lạnh Samsung Wind-Free Inverter 1 HP AR10CYHAAWKNSV 
', N'may-lanh-samsung-inverter-1-hp-ar10cyhaawknsv1-1.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (405, 43, N'Máy lạnh Samsung Wind-Free Inverter 1.5 HP AR13TYGCDWKNSV
', N'samsung-ar13tygcdwknsv-1-1-org.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (406, 92, N'Máy lạnh tủ đứng Samsung Inverter 5 HP AC048BNPDKC/TC 3 Pha
', N'tu-dung-samsung-inverter-5-hp-ac048bnpdkc-tc638453279211603789.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (407, 55, N'Máy lạnh Samsung Wind-Free Inverter 1 HP AR10TYGCDWKNSV 
', N'samsung-ar10tygcdwknsv-1-3-org.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (408, 67, N'Máy lạnh âm trần 1 hướng Samsung Inverter 2.5 HP AC071TN1DKC/EA 
', N'01-1020x570 .jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (409, 68, N'Máy lạnh âm trần 1 hướng Samsung Wind-Free Inverter 1.5 HP AC035TN1DKC/EA
', N'am-tran-1-huong-samsung-inverter-1-5-hp-ac035tn1dkc-ea638392672048203526.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (410, 50, N'Máy lạnh âm trần Samsung Inverter 3.5 HP AC100TN4DKC/EA 
', N'am-tran-samsung-inverter-3-5-hp-ac100tn4dkc-ea638380154779602610.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (411, 54, N'Máy lạnh tủ đứng Samsung Inverter 3 HP AC030BNPDKC/TC 
', N'tu-dung-samsung-inverter-3-hp-ac030bnpdkc-tc638453278034692537.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (412, 76, N'Máy lạnh âm trần 360 độ Samsung Inverter 3.5 HP AC100TN4PKC/EA (3 pha)
', N'1-1020x570-2.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (413, 48, N'Máy lạnh âm trần 360 độ Samsung Inverter 3.5 HP AC100TN4PKC/EA (3 pha)
', N'1-1020x570 .jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (414, 64, N'Máy lạnh âm trần Cassette 360 độ Samsung Inverter 4 HP AC120TN4PKC/EA 
', N'am-tran-360-do-samsung-inverter-4-hp-ac120tn4pkc-fix-1020x570.jpg
', 9, 9, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (415, 29, N'Smart Tivi Samsung Crystal UHD 4K 43 inch UA43AU7002
', N'Smart Tivi Samsung Crystal UHD 4K 43 inch UA43AU7002.webp', 6, 11, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (416, 29, N'Smart Tivi Samsung UHD 4K 55 inch UA55AU7700
', N'Smart Tivi Samsung Crystal UHD 4K 65 inch UA65AU7002(3).webp', 6, 11, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (417, 29, N'Smart Tivi Samsung Crystal UHD 4K 65 inch UA65AU7002
', N'Smart Tivi Samsung QLED 4K 55 inch QA55Q60B.webp', 6, 11, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (418, 29, N'Smart Tivi Samsung QLED 4K 55 inch QA55Q60B
', N'Smart Tivi Samsung QLED 4K 65 inch QA65Q60B(2).webp', 6, 11, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (419, 29, N'Smart Tivi Samsung QLED 4K 65 inch QA65Q60B
', N'Smart Tivi Samsung UHD 4K 55 inch UA55AU7700(2).webp', 6, 11, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (420, 29, N'Xiaomi Google Tivi A 32 inch HD
', N'Xiaomi Google Tivi A 32 inch HD(1).webp', 6, 10, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (421, 30, N'Xiaomi Mi TV A2 43 inch
', N'Xiaomi Google Tivi A 43 inch FHD.webp', 6, 10, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (422, 30, N'Xiaomi Google Tivi A 43 inch FHD
', N'Xiaomi Google Tivi A Pro 65 inch 4K(1).webp', 6, 10, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (423, 30, N'Xiaomi Google Tivi A Pro 65 inch 4K
', N'Xiaomi Mi TV A2 43 inch.webp', 6, 10, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (424, 30, N'Xiaomi Mi TV P1 43 inch
', N'Xiaomi Mi TV P1 43 inch.webp', 6, 10, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (425, 30, N'Google Tivi Sony 4K 55 inch KD-55X77L
', N'google-tivi-mini-led-sony-4k-75-inch-k-75xr70-1.jpg', 6, 12, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (426, 30, N'Google Tivi Sony 4K 43 inch KD-43X77L
', N'google-tivi-oled-sony-4k-55-inch-55a80l-2.jpg', 6, 12, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (427, 30, N'Google Tivi Sony 4K 55 inch KD-55X80K
', N'x77l.jpg', 6, 12, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (428, 30, N'Google Tivi Sony 32 inch KD-32W830K
', N'x77l.jpg', 6, 12, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (429, 30, N'Google Tivi OLED Sony 4K 55 inch XR-55A80L
', N'android-sony-4k-55-inch-kd-55x80k-2.jpg', 6, 12, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (430, 30, N'Google Tivi Sony 4K 65 inch XR-65X90L
', N'google-tivi-sony-4k-65-inch-xr-65x90l-0.jpg', 6, 12, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (432, 30, N'Google Tivi Mini LED Sony 4K 75 inch K-75XR70
', N'sony-2k-32inch-kd-32w830k-1.jpg', 6, 12, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (433, 30, N'Google Tivi Sony 4K 85 inch K-85S30
', N'android-sony-4k-55-inch-kd-55x80k-2.jpg', 6, 13, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (434, 30, N'Hisense Google Tivi UHD 4K 43 inch 43A6500H', N'10056960-tivi-google-hisense-4k-55-inch-55a6500k-1.jpg', 6, 13, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (435, 30, N'Android Tivi Hisense Full HD 40 inch 40A4200G
', N'android-tivi-hisense-full-hd-40-inch-40a4200g-1.jpg', 6, 13, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (436, 30, N'Google Tivi ULED Hisense 4K 55 inch 55U6K
', N'10056782-google-tivi-uled-hisense-4k-55inch-55uk6-1.jpg', 6, 13, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (437, 30, N'Smart Tivi ULED Mini-LED Hisense 4K 65 inch 65U7K
', N'10056786-google-tivi-mini-uled-hisense-4k-65inch-65u7k-1.jpg', 6, 13, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (438, 30, N'Smart Tivi Casper A Series 4K 55 inch 55UGA610
', N'10052862-smart-tivi-casper-4k-50-inch-50uw6000.jpg', 6, 14, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (440, 30, N'Smart Tivi Casper 4K 50 inch 50UW6000
', N'10053526-smart-tivi-casper-a-series-4k-55-inch-55uga610-1.jpg', 6, 14, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (441, 30, N'Smart Tivi Casper OLED 4K 55 inch 55CGS810
', N'10054848-smart-tivi-casper-oled-4k-55-inch-55cgs810.jpg', 6, 14, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (443, 30, N'Smart Tivi OLED LG 4K 55 inch 55A3PSA
', N'smart-tivi-oled-lg-4k-55-inch-55a3psa-1.jpg', 6, 65, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (444, 29, N'Samsung Galaxy Tab S9 Ultra 12GB 256GB
', N'samsung-galaxy-tab-s6-lite-1.webp', 6, 15, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (445, 30, N'Samsung Galaxy Tab S6 Lite 2024
', N'ss-tab-s9-ultra_1_.webp', 6, 15, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (446, 29, N'Samsung Galaxy Tab S9 Wifi 8GB 128GB
', N'samsung-galaxy-tab-s9-fe-mint-3.webp', 6, 15, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (447, 30, N'iPad Gen 10 10.9 inch 2022 Wifi 64GB
', N'ipad-10-9-inch-2022.webp', 6, 16, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (448, 30, N'iPad Pro 11 inch 2022 M2 Wifi + 5G 128GB 
', N'ipad-pro-13-select-wifi-spacegray-202210-02_1_1.webp', 6, 16, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (449, 30, N'iPad Pro 12.9 inch 2022 M2 Wifi 256GB
', N'ipad-pro-13-select-202210_3_1.webp', 6, 16, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (450, 30, N'Xiaomi Pad 6 8GB 128GB
', N'xiaomi-mi-pad-6-8gb-128gb_4__3.webp', 6, 17, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (451, 30, N'Xiaomi Redmi Pad 2022
', N'dfd_1__1.webp', 6, 17, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (452, 30, N'Xiaomi Redmi Pad SE 6GB 128GB
', N'redmi-pad-se-xanh.webp', 6, 17, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (453, 30, N'Máy Tính Bảng Lenovo Tab M11 8GB 128GB ZADB0162VN
', N'may-tinh-bang-lenovo-tab-m8-gen-4.webp', 6, 18, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (454, 30, N'Máy Tính Bảng Lenovo Tab M8 Gen 4 3GB 32GB ZABV0108VN
', N'may-tinh-bang-lenovo-tab-m11-8gb-128gb.webp', 6, 18, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (455, 30, N'OPPO Pad Air 4GB-64GB
', N'oppo-pad-2-xam-1-1.jpg', 6, 19, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (456, 30, N'Máy tính bảng OPPO Pad 2
', N'oppo-pad-neo-xam-1.jpg', 6, 19, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (457, 30, N'Máy tính bảng OPPO Pad Neo WiFi 
', N'Mo-ta-san-pham-oppo-pad-air-1.webp', 6, 19, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (458, 50, N'Máy lạnh Casper 1 HP (9000 BTU) TC-09IS35
', N'638389259233462222_casper-tc-09is35-1.webp
', 5, 40, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (459, 49, N'Máy lạnh Daikin 1 HP (9200 BTU) ATKF25YVMV
', N'638479132947641774_daikin-atkf-25-35-2024-a1.webp
', 5, 26, N'active', NULL)
GO
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (460, 50, N'Máy lạnh Casper Inverter 2 HP (18500 BTU) GC-18IS33
', N'638369509080178289_casper-gc-18is33-4.webp
', 5, 40, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (461, 50, N'Máy lạnh 2 chiều Daikin Inverter 1.5 HP (12300 BTU) ATHF35XVMV
', N'638504507558017930_daikin-inverter-1-hp-athf25xvmv-1.webp
', 5, 26, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (462, 50, N'Máy lạnh Casper Inverter 1.5 HP (12000 BTU) GC-12IS35 
', N'638369522458678564_casper-gc-5.webp
', 5, 40, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (463, 50, N'Tủ lạnh Casper Inverter side by side 458 lít RS-460PG
', N'638481827715787856_casper-458-lit-rs-460pg-1.webp
', 5, 40, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (464, 50, N'Tủ lạnh Casper Inverter một cửa 95 lít RO-95PG
', N'638476653528600861_casper-95-lit-ro-95pg-1.webp
', 5, 40, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (465, 50, N'Tủ lạnh Toshiba Inverter 194 lít GR-RT252WE-PMV(52)
', N'638509277356514846_toshiba-194-lit-gr-rt252we-pmv52-2.webp
', 5, 31, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (466, 50, N'Máy giặt cửa trước Casper Inverter 9.0 Kg WF-9VG1
', N'638473009797779155_casper-80-kg-wf-8vg1-1.webp
', 5, 40, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (467, 50, N'Máy giặt cửa trước Casper Inverter 8.0 Kg WF-8VG1
', N'638473009798507872_casper-80-kg-wf-8vg1-2.webp
', 5, 30, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (468, 50, N'Máy giặt cửa trên Casper Inverter 8.5 Kg WT-85NG1
', N'638472413576899957_casper-85-kg-wt-85ng1-3.webp
', 5, 40, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (469, 50, N'Máy giặt cửa trước Toshiba Inverter 9.5 Kg TW-BK105S3V(SK)
', N'72343240982309480239_toshiba_9.5kg.webp
', 5, 31, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (470, 50, N'Robot hút bụi lau nhà Ecovacs Deebot T20 Omni DLX23
', N'638182878661005970_robot-hut-bui-lau-nha-ecovacs-deebot-t20-omni-dlx23-3.webp
', 5, 30, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (471, 50, N'Robot hút bụi lau nhà Xiaomi Vacuum E5
', N'638488773736135586_xiaomi-robot-vacuum-e5-3.webp
', 5, 29, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (472, 50, N'Robot hút bụi lau nhà Ecovacs Deebot Ozmo T8 Max Plus (DLX11-61+)
', N'637987444373211596_robot-hut-bui-lau-nha-ecovacs-deebot-t8-max-plus-trang-dlx11-61-2.webp
', 5, 30, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (473, 50, N'Robot hút bụi Xiaomi Robot Vacuum X10
', N'638144068286016888_robot-hut-bui-xiaomi-robot-vacuum-x10-4.webp
', 5, 29, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (474, 50, N'Máy hút bụi lau nhà cầm tay Xiaomi Truclean W10 Pro
', N'638132902250103975_xiaomi-truclean-w10-pro-5.webp
', 5, 29, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (475, 50, N'Robot hút bụi lau nhà Ecovacs Deebot X2 Combo
', N'638451550921357319_robot-hut-bui-lau-nha-ecovacs-deebot-x2-omni-combo-1.webp
', 5, 30, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (476, 50, N'Robot hút bụi lau nhà Ecovacs Deebot X2 OMNI
', N'638279473706813104_robot-hut-bui-lau-nha-ecovacs-deebot-x2-omni-den-1.webp
', 5, 30, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (477, 50, N'Robot hút bụi Xiaomi Robot Vacuum S10
', N'638144061147042408_robot-hut-bui-xiaomi-robot-vacuum-s10-5.webp
', 5, 29, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (478, 50, N'Máy lọc không khí Kangaroo KG30AP1
', N'637605876090707688_may-loc-khong-khi-kangaroo-kg30ap1-a1.webp
', 5, 28, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (479, 50, N'Máy lọc không khí Xiaomi Mi AP 4 Lite
', N'637805301073356477_may-loc-khong-khi-xiaomi-mi-ap-4-lite-trang-4.webp
', 5, 29, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (480, 50, N'Máy lọc không khí xông tinh dầu Levoit LV-H128
', N'638264106767911782_may-loc-khong-khi-xong-tinh-dau-levoit-lv-h128-3.webp
', 5, 36, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (481, 50, N'Máy lọc không khí Kangaroo KG38AP
', N'637605944540708449_kangaroo-kg38ap-ct2.webp
', 5, 28, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (482, 50, N'Máy lọc không khí Levoit Core 300
', N'638264133355512795_may-loc-khong-khi-levoit-core-300-2.webp
', 5, 36, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (483, 50, N'Máy lọc không khí Levoit Core 300
Máy lọc không khí Xiaomi Mi AP 4
', N'637805292575532475_may-loc-khong-khi-xiaomi-mi-ap-4-trang-1.webp
', 5, 29, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (485, 50, N'Máy lọc không khí chống dị ứng thú cưng Levoit Vital 100S
', N'638264149787117384_may-loc-khong-khi-chong-di-ung-thu-cung-levoit-vital-100s-2.webp
', 5, 36, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (486, 50, N'Máy lọc không khí Kangaroo KG36AP2
', N'638012809176295406_may-loc-khong-khi-kangaroo-kg36ap2-5.webp
', 5, 28, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (487, 8, N'Samsung Galaxy S22 5G 128GB cũ giá rẻ
', N'638474836807561499_image_1711886880739817.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (488, 10, N'Samsung Galaxy S22 5G 128GB cũ giá rẻ
', N'638473217200624957_image_17117249200610696.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (489, 10, N'Samsung Galaxy A34 5G cũ giá rẻ 
', N'638465283026621252_image_17109315026580215.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (490, 20, N'Samsung Galaxy Z Flip5 5G 256GB cũ giá rẻ
', N'638502469288736443_image_17146501288679624.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (491, 20, N'Samsung Galaxy Z Flip5 5G 256GB cũ giá rẻ
', N'638515436366853557_image_17159468366897957.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (492, 20, N'Samsung Galaxy Z Flip5 5G 256GB cũ giá rẻ
', N'638407358851826956_image_17051390851879497.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (493, 20, N'Samsung Galaxy Z Fold5 5G 256GB cũ giá rẻ
', N'638502470878958094_image_17146502878911597.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (494, 20, N'Samsung Galaxy Z Fold5 5G 256GB cũ giá rẻ
', N'638504351402473941_image_17148383402411887.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (495, 20, N'iPhone 15 Pro Max 1TB cũ giá rẻ
', N'638509544427011108_image_17153576426964255.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (496, 20, N'iPhone 15 Pro 1TB cũ giá rẻ
', N'638448964724456863_image_17092996724377349.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (497, 10, N'iPhone 14 Pro Max 1TB cũ giá rẻ 
', N'638153757570937811_image_167977895708205.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (498, 15, N'iPhone 14 Pro Max 1TB cũ giá rẻ
', N'638230312784346539_image_168743447843268.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (499, 17, N'iPhone 15 Plus 512GB cũ giá rẻ
', N'638492868872472007_image_17136900872507349.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (500, 18, N'iPhone 15 256GB cũ giá rẻ
', N'638509499879016140_image_17153531879014458.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (501, 10, N'iPhone 14 Pro 256GB cũ giá rẻ
', N'638443595737634450_image_17087627737714883.webp
', 5, 53, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (502, 11, N'MacBook Air 13 inch M1 2020 8CPU 7GPU 8GB/256GB cũ giá rẻ
', N'638377189842838206_image_17021221842790132.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (503, 11, N'MacBook Pro 16 inch M1 Pro 2021 10CPU 16GPU 16GB/512GB cũ giá rẻ
', N'638351274664701817_image_1699530666441607.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (504, 11, N'MacBook Pro 16 inch M1 Pro 2021 10CPU 16GPU 16GB/512GB cũ giá rẻ
', N'638335764638328051_image_16979796638323296.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (505, 11, N'Laptop Asus Vivobook A1403ZA-LY153W i3 1220P/8GB/512GB/14"WUXGA/Win 11 cũ giá rẻ
', N'638438714101636840_image_17082746101649705.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (506, 11, N'Laptop Asus Vivobook A1403ZA-LY153W i3 1220P/8GB/512GB/14"WUXGA/Win 11 cũ giá rẻ
', N'638424095482643852_image_17068127482580125.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (507, 11, N'Laptop Asus Zenbook UX5401ZAS-KN070W i7 12700H/16GB/1TB/14.0"WQ OLED TOUCH/Win 11 cũ giá rẻ
', N'638425603764947814_image_17069635765003652.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (509, 11, N'Laptop Asus Zenbook UX5401ZAS-KN070W i7 12700H/16GB/1TB/14.0"WQ OLED TOUCH/Win 11 cũ giá rẻ
', N'638489670500037060_image_17133702499685151.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (510, 11, N'Laptop Lenovo Gaming Legion 5 15ARH7H R5 6600H/16GB/512GB/15.6"WQHD/NVIDIA RTX 3060 6GB/Win11 cũ giá rẻ
', N'638328963959496447_image_1697299595954981.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (511, 11, N'Laptop Microsoft Surface Pro 7 i7 1065G7/16GB/256GB SSD/12.3"Touch/Win 10 cũ giá rẻ
', N'638462626977442081_image_17106658977389158.webp
', 5, 54, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (512, 11, N'iPad Pro 11 2022 M2 WiFi 512GB cũ giá rẻ
', N'638510500126954249_image_171545321269435.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (513, 11, N'iPad Pro 12.9 2022 M2 WiFi 128GB cũ giá rẻ 
', N'638510509751413794_image_17154541751366448.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (514, 11, N'Samsung Galaxy Tab S8 Ultra 5G cũ giá rẻ
', N'638189613904777265_image_168336459047023.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (515, 11, N'Samsung Galaxy Tab S8 Plus 5G cũ giá rẻ
', N'638137351852237718_image_16781383852036.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (516, 11, N'Samsung Galaxy Tab S9 Wifi 256GB cũ giá rẻ
', N'638500197351753251_image_17144229351730312.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (517, 11, N'Samsung Galaxy Tab S9 Wifi 256GB cũ giá rẻ
', N'638403316632984830_image_17047348632973528.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (518, 11, N'iPad mini 6 2021 8.3 inch WiFi 5G 64GB cũ giá rẻ
', N'638378124899445493_image_1702215689946147.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (519, 11, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 256GB cũ giá rẻ
', N'638477609046324959_image_17121641046360962.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (520, 11, N'iPad Gen 10 2022 10.9 inch WiFi 64GB cũ giá rẻ
', N'638466948359444472_image_17110980359416887.webp
', 5, 55, N'active', NULL)
INSERT [dbo].[Product] ([Product_id], [Quantity], [Product_name], [Product_img], [User_Id], [Brand_id], [Status], [Date]) VALUES (521, 11, N'iPad Gen 10 2022 10.9 inch WiFi 64GB cũ giá rẻ
', N'638467402608504669_image_1711143460851973.webp
', 5, 55, N'active', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Category] ON 

INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (1, N'Điện Thoại')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (2, N'Laptop')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (3, N'Máy Lạnh')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (4, N'Tivi')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (5, N'Đồng Hồ Thông Minh')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (6, N'Phụ Kiện')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (7, N'PC')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (8, N'Hàng Gia Dụng')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (9, N'Hàng Cũ')
INSERT [dbo].[Product_Category] ([Category_id], [Category_name]) VALUES (10, N'Máy Tính Bảng')
SET IDENTITY_INSERT [dbo].[Product_Category] OFF
GO
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (2, N'16GB, DDR5, 5200 MT/s', NULL, N'16″ QHD+ (2560*1600) 165Hz, WVA, Anti- Glare, 100% sRGB, 300 nits', N'pin 4-cell 64 Whr và pin 6-cell 97 Whr.', N'	4.04 kg', N'Đen', N'Chiếc laptop gaming mới của Dell được trang bị bộ vi xử lý AMD Ryzen 7000 series với các tùy chọn bao gồm: AMD Ryzen™ 7 7745HX, AMD Ryzen™ 9 7845HX và AMD Ryzen™ 9 7945HX. Kiến trúc kết hợp mới nhất của AMD kết hợp với các tính năng hàng đầu trong ngành mang đến sức mạnh vượt trội để chơi game hay thiết kế đồ họa.', N'Intel® Core™ i5-13450HX (10 cores, 16 Threads, 20 MB cache, turbo up to 4.60GHz)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (3, N'	LPDDR5', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'pin 4-cell 64 Whr và pin 6-cell 97 Whr.', N'	1.91 kg', N'Bạc', N'Laptop Dell Precision 16 5680 có ngoại hình không quá khác biệt so với người tiền nhiệm trước đó. Ngoại hình đơn giản với tông màu bạc làm chủ đạo, khiến cho tổng thể máy tính trở nên hiện đại, thanh lịch.  Vỏ ngoài máy tính được làm bằng chất liệu nhôm nguyên khối cứng cáp, bền bỉ với logo Dell quen thuộc, nổi bật chính giữa phần mặt A. ', N'Intel® Core™ i7-12800H vPro 24 MB cache, 14 cores, 20 threads, 2.40 GHz to 4.80 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (4, N'1TB SSD M.2 PCIe PCIE G4X4', NULL, N'16", QHD+ 2560x1600, 165Hz, Non-Touch, 100% DCI-P3, 3ms, ComfortView Plus, NVIDIA G-SYNC + DDS', N'Li-on 6 Cell 86 WHrs', N'2.85kg', N'Bạc', N'Dell Gaming G16 7630 - Sản phẩm vừa được Dell cho ra mắt với rất nhiều những nâng cấp đáng kể. Từ một thiết kế hiện đại, thời trang, mức độ hoàn thiện cao, ngoại hình không thua kém những Dell AlienWare cao cấp. Màn hình chất lượng cao, độ phân giải lên đến 2K, không gian màu điện ảnh 100% DCI-P3. Hiệu năng bứt phá cực khủng, hơn hết mức giá bạn phải bỏ ra để sở hữu cực kỳ phải chăng', N'Intel® Core™ i7-12800H vPro 24 MB cache, 14 cores, 20 threads, 2.40 GHz to 4.80 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (5, N'16GB DDR5 4800 MHz', NULL, N'16″ QHD+ (2560*1600) 165Hz, WVA, Anti- Glare, 100% sRGB, 300 nits', N'56 Wh Lithium-Ion', N'2.44 kg', N'Đen', N'Dell Gaming G16 7620 2022 là đại diện cho thế hệ Laptop Gaming mới, tiếp nối những thành công của những chiếc G15 cực kỳ thành công trước đây. Hiệu năng máy được Update lên một tầm cao mới với CPU Intel thế hệ 12 mới. Cùng Card đồ họa rời GeForce RTX™ 3050 Ti - nâng tầm trải nghiệm đồ họa, hầu như không ngán bất cứ tựa Game kinh điển nào', N'Intel® Core™ i5-13450HX (10 cores, 16 Threads, 20 MB cache, turbo up to 4.60GHz)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (6, N'16GB DDR5 3800 MHz', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 cell  56 Wh', N'2.43kg', N'Đỏ', N'Mẫu Laptop Gaming thế hệ 11 mới nhất của Dell vừa được cho ra mắt cách đây không lâu. Với thiết kế đậm chất Gaming nhưng lại vô cùng tinh tế, có thể mang làm việc ở môi trường công sở. Hiệu năng mạnh mẽ không cần bàn cãi', N'Intel® Core™ i7-1165G7 (4-Core, 12MB Cache, up to 4.7GHz Max Turbo Frequency)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (7, N'16GB(2x8GB) DDR5 4800MHz, Max: 32GB, Two slots
Ổ cứng: 512GB SSD M.2 PCIe', NULL, N'15.6 inch FHD (1920x1080) 165Hz, 3ms, sRGB-100%, ComfortViewPlus, NVIDIA GSYNC+ DDS DisplayPin: 6 Cell 86 WHrs', N'56 Wh Lithium-Ion', N'2.65 Kg', N'Đen', N'Mẫu Laptop Gaming thế hệ 11 mới nhất của Dell vừa được cho ra mắt cách đây không lâu. Với thiết kế đậm chất Gaming nhưng lại vô cùng tinh tế, có thể mang làm việc ở môi trường công sở. Hiệu năng mạnh mẽ không cần bàn cãi', N'Intel® Core™ i5-13450HX (10 cores, 2.4GHz (4 CPUs), ~2.5GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (8, N'16GB', NULL, N'13.3 inch', N'Li-on 6 Cell 86 WHrs', N'1.18Kg', N'Đen', N'Dell Latitude E7270 là mẫu laptop nhỏ gọn, thanh lịch nhưng rất bền bỉ, phù hợp với những người có nhu cầu thường xuyên di chuyển', N'1135G7', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (494, N'12GB
', N'256GB
', N'7.6 inch
', N'4500mAh
', N'189g
', N'Xanh
', N'Phụ kiện: Hộp, sạc adapter
', N'A17 Pro 3nm
', N'30W
', N'Trầy xước ít
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (499, N'6GB
', N'512GB
', N'6.7 inch
', N'4500mAh
', N'221g
', N'Tím 
', N'Phụ kiện: Hộp, sạc adapter
', N'Apple A16 Bionic 6 nhân
', N'25W
', N'Máy đẹp ít xước 
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (502, N'8GB
', N'SSD 256GB
', N'6.1 inch
', N'6000mAh
', N'2.219kg
', N'Xám
', N'Phụ kiện: Hộp máy, Sạc
', N'Apple M1 Max với 10CPU, 32GPU
', N'80W
', N'Trầy xước mặt C
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (9, N'16GB DDR5 Bus 4800 MHz', NULL, N'15.6" FHD+ 1920 x 1200, 60Hz, 500 nits, non-touch,w/Prem Panel Guar, 100% sRGB', N'3 Cell, 56 Wh, Lithium Ion', N'2.1kg', N'Xám', N'Thêm một mẫu máy trạm cực kỳ ấn tượng đến từ thương hiệu Dell. Chiếc Laptop lần này có thiết kế vô cùng đặc biệt, khi màn hình chỉ 14 inch cực kỳ hiếm thấy trên những chiếc Workstation. Hứa hẹn mang đến cuộc cách mạng mới cho những khách hàng làm những công việc đòi hỏi kỹ thuật cao, đặc biệt là nữ giới.', N'Intel® Core™ i7-12800H vPro 24 MB cache, 14 cores, 20 threads, 2.40 GHz to 4.80 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (11, N'16GB DDR4 2666MHz', NULL, N'17.3" FHD 1920x1080px 144Hz', N'4 Cell Battery, 60WHr', N'2.56Kg', N'Đen', N'Giá rẻ - Một cơ hội tuyệt vời để bạn có thể sở hữu được một mẫu Laptop Gaming cao cấp bậc nhất ở thời điểm ra mắt. Sở hữu một thiết kế tương lai, không có dấu hiệu lỗi thời, hiệu năng cực khủng, kết hợp cùng một màn hình chuẩn đồ họa với tần số quét khủng 144hz. Và còn rất nhiều những ưu điểm đáng sở hữu trên Siêu Phẩm Gaming giá rẻ này', N'Intel® Core™ i7-9750H CPU @ 2.6GHz up to 4.5GHz, 12MB', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (12, N'16GB DDR4 3200MHz', NULL, N'15.6″ FHD (1920 x 1080) Truelife Multi-Touch ', N'53 Wh Lithium-Ion', N'1.9 kg', N'Đen', N'Nếu bạn đang tìm một mẫu Laptop 2-in-1, màn hình cảm ứng, kích thước lớn, đa năng với nhiều cách sử dụng khác nhau bên cạnh đó là một hiệu năng mạnh mẽ. Thì bạn không nên bỏ qua mẫu Laptop Dell Inspiron', N'Intel® Core™ i7-1165G7 (4-Core, 12MB Cache, up to 4.7GHz Max Turbo Frequency)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (13, N'8GB DDR4 Bus 2400 MHz', NULL, N'13.3" Full HD, IPS, 90% sRGB, sáng 310 nits', N' 4-cell 60 Wh', N'1.3 kg', N'Xám', N'sở hữu thiết kế tinh giản nhưng vô cùng cứng cáp và chắc chắn. Bao phủ máy là một lớn sơn nhám màu đen chống trượt. Vỏ máy được hoàn thiện từ hợp kim Magie vô cùng chắc chắn. Trong quá trình sử dụng bạn sẽ không thấy sự ọp ẹp.', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (14, N'16GB LPDDR4x-4266 MHz RAM (onboard)', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'Li-on 6 Cell 86 WHrs', N'1.9 kg', N'Đen', N'Vẻ ngoài đẹp mắt với khung máy được gia công bằng chất liệu nhôm nguyên khối, chắc chắn, bền bỉ. Chính giữa phần mặt lưng là logo “HP” được cách điệu vô cùng độc đáo, cuốn hút. Bên cạnh đó, HP Spectre có độ hoàn thiện cao với những họa tiết hình tam giác dùng để trang trí khe loa trên thân máy.', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (15, N'16GB DDR4 3200MHz', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'3 Cell, 56 Wh, Lithium Ion', N'	2 Kg', N'Đen', N'HP Spectre X360 16 (2022) là chiếc máy tính xách tay 2 in 1 có thiết kế mỏng nhẹ, cao cấp, sang trọng đi kèm hiệu năng mạnh mẽ giúp nó chạy mượt mọi tác vụ văn phòng. Không quá khi nói, Spectre X360 16 là chiếc Ultrabook đáng mua nhất ở thời điểm hiện nay', N'Intel® Core™ i7-1260P Processor 18M Cache, up to 4.70 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (16, N'16GB DDR4-3200 SDRAM', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'53 Wh Lithium-Ion', N'	1,37 kg', N'Xám', N'Hp Elitebook 845 G8 (2021) là chiếc Ultrabook tầm trung được nhiều người dùng ưa chuộng bởi thiết kế sang trọng, thanh lịch, màn hình đủ sắc nét và hiệu năng được nâng cấp mạnh mẽ nhờ AMD Ryzen 5, đáp ứng tốt nhu cầu học tập và làm việc cơ bản của người dùng', N'AMD Ryzen™ 5 PRO 5650U APU (2.3 GHz base clock, up to 4.2 GHz max boost clock, 19 MB L2+L3 cache, 6 cores)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (506, N'16GB
', N'SSD 512GB
', N'14.0 inch, 90Hz
', N'7000mAh
', N'1.4kg
', N'Bạc
', N'Phụ kiện: Hộp máy, Sạc
', N'Intel i7 12700H
', N'100W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (511, N'16GB
', N'SSD 256GB
', N'15.6 inch, 160Hz
', N'5000mAh
', N'1.29kg
', N'Đen
', N'Phụ kiện: Hộp máy, Sạc
', N'Intel I7 1065G7
', N'70W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (488, N'12GB
', N'128GB
', N'6.1 inch
', N'3700 mAh
', N'167g
', N'Tím 
', N'Phụ kiện: Hộp, sạc adapter
', N'Snapdragon 8 Gen 1
', N'30W
', N'Trầy xước ít
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (18, N'8GB DDR4 3200', NULL, N'14" diagonal, FHD (1920 x 1080), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, 250 nits, 45% NTSC', N'53 Wh Lithium-Ion', N'	1,51 kg', N'Đen', N'Máy tính để bàn All in one HP mang đến giải pháp mới cho doanh nghiệp và văn phòng. Tiết kiệm diện tích & hiệu năng ổn định, máy tính tích hợp All in One đang trở thành cứu tinh cho giới văn phòng ở thời điểm hiện tại.', N'Intel® Core™ i5-1235U (up to 4.4 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (19, N'16GB DDR5 Bus 4800 MHz', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'Li-on 6 Cell 86 WHrs', N'2.56Kg', N'Đen', N'Máy tính để bàn All in one HP mang đến giải pháp mới cho doanh nghiệp và văn phòng. Tiết kiệm diện tích & hiệu năng ổn định, máy tính tích hợp All in One đang trở thành cứu tinh cho giới văn phòng ở thời điểm hiện tại.', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (20, N'16GB DDR5 Bus 4800 MHz', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'Li-on 6 Cell 86 WHrs', N'2.56Kg', N'Đen', N'Máy tính để bàn All in one HP mang đến giải pháp mới cho doanh nghiệp và văn phòng. Tiết kiệm diện tích & hiệu năng ổn định, máy tính tích hợp All in One đang trở thành cứu tinh cho giới văn phòng ở thời điểm hiện tại.', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (21, N'16GB DDR5 Bus 4800 MHz', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'Li-on 6 Cell 86 WHrs', N'2.56Kg', N'Đen', N'Nếu bạn đang tìm một mẫu Laptop 2-in-1, màn hình cảm ứng, kích thước lớn, đa năng với nhiều cách sử dụng khác nhau bên cạnh đó là một hiệu năng mạnh mẽ. Thì bạn không nên bỏ qua mẫu Laptop Dell Inspiron', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (22, N'16GB DDR5 Bus 4800 MHz', NULL, N'15.6″ FHD (1920 x 1080) Truelife Multi-Touch ', N'Li-on 6 Cell 86 WHrs', N'2.56Kg', N'Đen', N'Nếu bạn đang tìm một mẫu Laptop 2-in-1, màn hình cảm ứng, kích thước lớn, đa năng với nhiều cách sử dụng khác nhau bên cạnh đó là một hiệu năng mạnh mẽ. Thì bạn không nên bỏ qua mẫu Laptop Dell Inspiron', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (23, N'16GB DDR5 Bus 4800 MHz', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'Li-on 6 Cell 86 WHrs', N'2.56Kg', N'Đen', N'Nếu bạn đang tìm một mẫu Laptop 2-in-1, màn hình cảm ứng, kích thước lớn, đa năng với nhiều cách sử dụng khác nhau bên cạnh đó là một hiệu năng mạnh mẽ. Thì bạn không nên bỏ qua mẫu Laptop Dell Inspiron', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (24, N'16GB DDR5 Bus 4800 MHz', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'Li-on 6 Cell 86 WHrs', N'2.56Kg', N'Đen', N'Nếu bạn đang tìm một mẫu Laptop 2-in-1, màn hình cảm ứng, kích thước lớn, đa năng với nhiều cách sử dụng khác nhau bên cạnh đó là một hiệu năng mạnh mẽ. Thì bạn không nên bỏ qua mẫu Laptop Dell Inspiron', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (519, N'3GB
', N'256GB
', N'8.3 inch, IPS LCD, 60Hz
', N'19.3Wh
', N'500g
', N'Bạc
', N'Phụ kiện: Hộp máy, Cáp USB, Pin
', N'Apple A13 Bionic
', N'20W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (491, N'8GB
', N'256GB
', N'6.7 inch
', N'4400mAh
', N'250g
', N'Xám
', N'Phụ kiện: Hộp máy, không tai nghe
', N'Snapdragon 8 Gen 2
', N'50W
', N'Trầy xước ít
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (521, N'4GB
', N'64GB
', N'10.2 inch, IPS LCD, 60Hz
', N'10Wh
', N'477g
', N'Hồng
', N'Phụ kiện: Hộp máy, Cáp USB
', N'Apple A14 Bionic
', N'15W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (25, N'16GB DDR5 Bus 4800 MHz', NULL, N'15.6″ FHD (1920 x 1080) Truelife Multi-Touch ', N' 4-cell 60 Wh', N'2.56Kg', N'Xám', N'tiết kiệm không gian chứa mọi thứ bạn cần trong một thiết bị nhỏ gọn chứa đựng cả máy tính, màn hình cảm ứng sẽ giúp công việc của bạn thuận tiện và mới mẻ hơn. Với thiết kế màu đen, bạn sẽ thấy nó tương đồng như một mẫu iMac đẳng cấp.', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (26, N'8GB DDR4 Bus 2400 MHz', NULL, N'15.6″ FHD (1920 x 1080) Truelife Multi-Touch ', N' 4-cell 60 Wh', N'2.56Kg', N'Xám', N'tiết kiệm không gian chứa mọi thứ bạn cần trong một thiết bị nhỏ gọn chứa đựng cả máy tính, màn hình cảm ứng sẽ giúp công việc của bạn thuận tiện và mới mẻ hơn. Với thiết kế màu đen, bạn sẽ thấy nó tương đồng như một mẫu iMac đẳng cấp.', N'Intel® Core™ i7-1355U (up to 5.0 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (27, N'8GB DDR4 Bus 2400 MHz', NULL, N'15.6″ FHD (1920 x 1080) Truelife Multi-Touch ', N' 4-cell 60 Wh', N'2.56Kg', N'Xám', N'tiết kiệm không gian chứa mọi thứ bạn cần trong một thiết bị nhỏ gọn chứa đựng cả máy tính, màn hình cảm ứng sẽ giúp công việc của bạn thuận tiện và mới mẻ hơn. Với thiết kế màu đen, bạn sẽ thấy nó tương đồng như một mẫu iMac đẳng cấp.', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (28, N'8GB DDR4 Bus 2400 MHz', NULL, N'15.6″ FHD (1920 x 1080) Truelife Multi-Touch ', N' 4-cell 60 Wh', N'2.56Kg', N'Xám', N'sở hữu màn hình tràn viền InfinityEdge đường viền 8mm mở ra góc nhìn cực rộng tới màn hình, giúp bạn tập trung hơn vào nội dung trước mắt, tăng năng suất và hiệu quả', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (29, N'16GB DDR5 Bus 4800 MHz', NULL, N'15.6″ FHD (1920 x 1080) Truelife Multi-Touch ', N' 4-cell 60 Wh', N'2.56Kg', N'Xám', N'sở hữu màn hình tràn viền InfinityEdge đường viền 8mm mở ra góc nhìn cực rộng tới màn hình, giúp bạn tập trung hơn vào nội dung trước mắt, tăng năng suất và hiệu quả', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (30, N'16GB DDR5 Bus 4800 MHz', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N' 4-cell 60 Wh', N'2.56Kg', N'Xám', N'sở hữu màn hình tràn viền InfinityEdge đường viền 8mm mở ra góc nhìn cực rộng tới màn hình, giúp bạn tập trung hơn vào nội dung trước mắt, tăng năng suất và hiệu quả', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (31, N'16GB DDR5 Bus 4800 MHz', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N' 4-cell 60 Wh', N'2.56Kg', N'Xám', N'sở hữu màn hình tràn viền InfinityEdge đường viền 8mm mở ra góc nhìn cực rộng tới màn hình, giúp bạn tập trung hơn vào nội dung trước mắt, tăng năng suất và hiệu quả', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (32, N'16GB DDR5 Bus 4800 MHz', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N' 4-cell 60 Wh', N'2.56Kg', N'Xám', N'sở hữu màn hình tràn viền InfinityEdge đường viền 8mm mở ra góc nhìn cực rộng tới màn hình, giúp bạn tập trung hơn vào nội dung trước mắt, tăng năng suất và hiệu quả', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (33, N'16GB DDR5 Bus 4800 MHz', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N' 4-cell 60 Wh', N'	1,51 kg', N'Xám', N'card đồ họa thuộc kiến trúc Ampere mới nhất, lý tưởng cho game thủ và nhà sáng tạo nội dung. Hiệu năng chơi game của RTX 3050 tương đương với GTX 1660 trước đây, cho phép bạn chơi tốt hầu hết các game ở độ phân giải Full HD', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (501, N'6GB
', N'256GB
', N'6.1 inch
', N'6000mAh
', N'2.219kg
', N'Xám
', N'Phụ kiện: Hộp máy, Sạc
', N'Apple M1 Max với 10CPU, 32GPU
', N'80W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (517, N'8GB
', N'256GB
', N'11.0 inch, Dymamic Amoled, 120Hz
', N'8000mAh
', N'500g
', N'Xám
', N'Phụ kiện: Hộp máy, Cáp USB
', N'Snapdragon 8 Gen 3
', N'80W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (34, N'16GB DDR5 Bus 4800 MHz', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N' 4-cell 60 Wh', N'	1,51 kg', N'Đỏ', N'card đồ họa thuộc kiến trúc Ampere mới nhất, lý tưởng cho game thủ và nhà sáng tạo nội dung. Hiệu năng chơi game của RTX 3050 tương đương với GTX 1660 trước đây, cho phép bạn chơi tốt hầu hết các game ở độ phân giải Full HD', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (35, N'16GB DDR5 Bus 4800 MHz', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N' 4-cell 60 Wh', N'	1,51 kg', N'Đỏ', N'card đồ họa thuộc kiến trúc Ampere mới nhất, lý tưởng cho game thủ và nhà sáng tạo nội dung. Hiệu năng chơi game của RTX 3050 tương đương với GTX 1660 trước đây, cho phép bạn chơi tốt hầu hết các game ở độ phân giải Full HD', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (37, N'16GB DDR5 Bus 4800 MHz', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'pin 4-cell 64 Whr và pin 6-cell 97 Whr.', N'	1,51 kg', N'Đỏ', N'card đồ họa thuộc kiến trúc Ampere mới nhất, lý tưởng cho game thủ và nhà sáng tạo nội dung. Hiệu năng chơi game của RTX 3050 tương đương với GTX 1660 trước đây, cho phép bạn chơi tốt hầu hết các game ở độ phân giải Full HD', N'Core i5-7200U CPU @ 2.50GHz (4 CPUs), ~2.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (38, N'16GB(2x8GB) DDR5 4800MHz, Max: 32GB, Two slots
Ổ cứng: 512GB SSD M.2 PCIe', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'pin 4-cell 64 Whr và pin 6-cell 97 Whr.', N'	1,51 kg', N'Đỏ', N'Sự phối hợp nhịp nhàng của hệ thống này trong phần khung máy thiết kế công thái học giúp nhiệt lượng luôn được giải phóng nhanh chóng, đảm bảo sức mạnh tốt ưu của hiệu năng', N'Intel® Core™ i7-1165G7 (4-Core, 12MB Cache, up to 4.7GHz Max Turbo Frequency)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (39, N'16GB(2x8GB) DDR5 4800MHz, Max: 32GB, Two slots
Ổ cứng: 512GB SSD M.2 PCIe', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'pin 4-cell 64 Whr và pin 6-cell 97 Whr.', N'	1,51 kg', N'Đỏ', N'Sự phối hợp nhịp nhàng của hệ thống này trong phần khung máy thiết kế công thái học giúp nhiệt lượng luôn được giải phóng nhanh chóng, đảm bảo sức mạnh tốt ưu của hiệu năng', N'Intel® Core™ i7-1165G7 (4-Core, 12MB Cache, up to 4.7GHz Max Turbo Frequency)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (41, N'16GB(2x8GB) DDR5 4800MHz, Max: 32GB, Two slots
Ổ cứng: 512GB SSD M.2 PCIe', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'pin 4-cell 64 Whr và pin 6-cell 97 Whr.', N'	1,51 kg', N'Đỏ', N'Sự phối hợp nhịp nhàng của hệ thống này trong phần khung máy thiết kế công thái học giúp nhiệt lượng luôn được giải phóng nhanh chóng, đảm bảo sức mạnh tốt ưu của hiệu năng', N'Intel® Core™ i7-1165G7 (4-Core, 12MB Cache, up to 4.7GHz Max Turbo Frequency)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (42, N'8GB DDR4 3200', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'pin 4-cell 64 Whr và pin 6-cell 97 Whr.', N'	1,51 kg', N'Đỏ', N'Sự phối hợp nhịp nhàng của hệ thống này trong phần khung máy thiết kế công thái học giúp nhiệt lượng luôn được giải phóng nhanh chóng, đảm bảo sức mạnh tốt ưu của hiệu năng', N'Intel® Core™ i7-1260P Processor 18M Cache, up to 4.70 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (43, N'8GB DDR4 3200', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'pin 4-cell 64 Whr và pin 6-cell 97 Whr.', N'	1,51 kg', N'Bạc', N'Máy đi theo ngôn ngữ vuông vắn, hiện đại và gọn gàng hơn với viền màn hình siêu mỏng, bàn phím tràn sát ra cạnh bên máy. Các đường cắt cũng được làm khỏe khoắn, mạnh mẽ hơn', N'Intel® Core™ i7-1260P Processor 18M Cache, up to 4.70 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (44, N'8GB DDR4 3200', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Bạc', N'Máy đi theo ngôn ngữ vuông vắn, hiện đại và gọn gàng hơn với viền màn hình siêu mỏng, bàn phím tràn sát ra cạnh bên máy. Các đường cắt cũng được làm khỏe khoắn, mạnh mẽ hơn', N'Intel® Core™ i7-1260P Processor 18M Cache, up to 4.70 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (45, N'8GB DDR4 3200', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Bạc', N'Máy đi theo ngôn ngữ vuông vắn, hiện đại và gọn gàng hơn với viền màn hình siêu mỏng, bàn phím tràn sát ra cạnh bên máy. Các đường cắt cũng được làm khỏe khoắn, mạnh mẽ hơn', N'Intel® Core™ i7-1260P Processor 18M Cache, up to 4.70 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (46, N'8GB DDR4 3200', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Bạc', N'Máy đi theo ngôn ngữ vuông vắn, hiện đại và gọn gàng hơn với viền màn hình siêu mỏng, bàn phím tràn sát ra cạnh bên máy. Các đường cắt cũng được làm khỏe khoắn, mạnh mẽ hơn', N'Intel® Core™ i7-1260P Processor 18M Cache, up to 4.70 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (47, N'8GB of onboard 2133MHz LPDDR3 memory', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Bạc', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'1.6GHz dual-core i5-8210Y, (4MB Cache, Upto 3.6GHz)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (48, N'8GB of onboard 2133MHz LPDDR3 memory', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Bạc', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'1.6GHz dual-core i5-8210Y, (4MB Cache, Upto 3.6GHz)1.6GHz dual-core i5-8210Y, (4MB Cache, Upto 3.6GHz)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (49, N'8GB of onboard 2133MHz LPDDR3 memory', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Bạc', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'1.6GHz dual-core i5-8210Y, (4MB Cache, Upto 3.6GHz)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (51, N'16GB 2666MHz DDR4 memory', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Đen nâu', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'3.3GHz 6-core 10th-generation Intel Core i5 processor Turbo Boost up to 4.8GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (52, N'8GB of onboard 2133MHz LPDDR3 memory', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Đen nâu', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'3.3GHz 6-core 10th-generation Intel Core i5 processor Turbo Boost up to 4.8GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (53, N'16GB', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Đen nâu', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'1.6GHz dual-core i5-8210Y, (4MB Cache, Upto 3.6GHz)', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (55, N'16GB', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'3 Cell, 56 Wh, Lithium Ion', N'2.85kg', N'Đen nâu', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'Apple M1 PRO chip with 10-core CPU with 8 performance cores and 2 efficiency cores', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (56, N'	LPDDR5', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'53 Wh Lithium-Ion', N'2.85kg', N'Đen nâu', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N' 3.3GHz 6-core 10th-generation Intel Core i5 processor Turbo Boost up to 4.8GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (57, N'	LPDDR5', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'53 Wh Lithium-Ion', N'2.85kg', N'Đen nâu', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N' 3.3GHz 6-core 10th-generation Intel Core i5 processor Turbo Boost up to 4.8GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (58, N'16GB 2666MHz DDR4 memory', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'53 Wh Lithium-Ion', N'2.85kg', N'Đen nâu', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'1.6GHz dual-core i5-8210Y, (4MB Cache, Upto 3.6GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (61, N'16GB 2666MHz DDR4 memory', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'53 Wh Lithium-Ion', N'2.85kg', N'Đen nâu', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N' 3.3GHz 6-core 10th-generation Intel Core i5 processor Turbo Boost up to 4.8GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (62, N'16GB 2666MHz DDR4 memory', NULL, N'15.6 Inch (1920 x 1080); WVA; 120Hz; Anti-Glare', N'53 Wh Lithium-Ion', N'2.85kg', N'Đen bóng', N'mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N' 3.3GHz 6-core 10th-generation Intel Core i5 processor Turbo Boost up to 4.8GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (63, N'16GB 2666MHz DDR4 memory', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'53 Wh Lithium-Ion', N'2.85kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N' 3.3GHz 6-core 10th-generation Intel Core i5 processor Turbo Boost up to 4.8GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (64, N'32GB', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'53 Wh Lithium-Ion', N'2.85kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'Apple M1 MAX chip with 10-core CPU with 8 performance cores and 2 efficiency cores', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (65, N'32GB', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'53 Wh Lithium-Ion', N'2.43kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'Apple M1 MAX chip with 10-core CPU with 8 performance cores and 2 efficiency cores', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (66, N'32GB', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'3 cell  56 Wh', N'2.43kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'Apple M1 MAX chip with 10-core CPU with 8 performance cores and 2 efficiency cores', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (67, N'32GB', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'3 cell  56 Wh', N'2.43kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'Apple M1 MAX chip with 10-core CPU with 8 performance cores and 2 efficiency cores', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (69, N'8GB DDR4 3200', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'3 cell  56 Wh', N'2.43kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'Apple M1 MAX chip with 10-core CPU with 8 performance cores and 2 efficiency cores', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (70, N'8GB DDR4 3200', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'3 cell  56 Wh', N'2.43kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'Apple M1 MAX chip with 10-core CPU with 8 performance cores and 2 efficiency cores', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (71, N'8GB DDR4 3200', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'3 cell  56 Wh', N'2.43kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'Apple M1 MAX chip with 10-core CPU with 8 performance cores and 2 efficiency cores', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (72, N'8GB DDR4 3200', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'3 cell  56 Wh', N'2.43kg', N'Đen bóng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'12th Gen Intel Core i7-1255U processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (441, NULL, NULL, N'55inch
', N'160W
', N'25.9kg
', N'Đen
', N'Smart Tivi Casper OLED 4K 55 inch 55CGS810 với thiết kế tràn viền vô cùng ấn tượng, cùng độ dày cạnh TV siêu mỏng chỉ 0.5cm. Nhờ đó, mẫu tivi mới này có thể mang đến trải nghiệm xem hoàn hảo, xóa nhòa mọi ranh giới. Kích thước màn hình 55 inch, phù hợp lắp đặt tại các không gian phòng khách, phòng ngủ, nhà bếp. Chân đế tivi vững chắc, sang trọng tinh tế, hứa hẹn sẽ nâng tầm không gian sống mà bạn trưng bày. Hình ảnh hiển thị trên chiếc tivi Casper 55 inch rõ nét đến từng chi tiết, nâng cấp trải nghiệm xem của bạn lên một tầm cao mới nhờ vào độ phân giải màn hình 4K UHD. Không chỉ sở hữu độ phân giải cao, dòng tivi này còn tích hợp những công nghệ hình ảnh hiện đại sẽ khiến bạn mãn nhãn với hình ảnh và thước phim sống động, ngoạn mục như rạp chiếu phim tại nhà. Công nghệ tấm nền OLED Pixel Self-Dimming với hàng triệu điểm ảnh phát sáng độc lập trên tivi 55 inch mang đến màu đen thuần túy, tăng cường màu sắc và độ tương phản ở vùng sáng. Ngoài ra, công nghệ này còn giúp bạn thưởng thức nội dung trên tivi hoàn hảo hơn, không bị lệch màu khi nhìn nghiêng, đảm bảo góc nhìn siêu rộng. Công nghệ âm thanh vòm Dolby Atmos mang lại trải nghiệm âm thanh sống động từ mọi hướng tựa Rạp hát, lấp đầy không gian với chiều sâu đáng kinh ngạc. Hứa hẹn chiếc tivi này sẽ nâng tầm trải nghiệm xem cho mọi thành viên trong gia đình bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (443, NULL, NULL, N'55inch
', N'160W
', N'14.3kg
', N'Đen
', N'Smart Tivi OLED LG 4K 55 inch 55A3PSA mang đến trải nghiệm nghe nhìn mãn nhãn với khung hình chi tiết, màu sắc chân thật được tạo nên từ màn hình OLED, bộ xử lý α7 Gen6 AI 4K tân tiến, cho bạn thưởng thức hình ảnh, âm thanh chuẩn điện ảnh với công nghệ Dolby Vision, Dolby Atmos, công nghệ AI Sound Pro tối ưu âm thanh theo nội dung, giải trí đậm chất cá nhân cùng hệ điều hành webOS 23. Mẫu Smart tivi LG này có vẻ ngoài tinh giản, gọn gàng, màn hình 55 inch, trang trí hài hòa và kết nối liền mạch với các món đồ nội thất sang trọng khác trong ngôi nhà bạn. Trang bị màn hình OLED với các pixel tự động phát sáng tối ưu chất đen sâu trong từng khung hình, màu sắc hiển thị toàn diện, nguyên bản với những sắc độ đa dạng. AI Sound Pro tăng chất lượng âm thanh lên chuẩn 5.1.2, công nghệ còn tối ưu hóa chất âm theo nội dung để bạn cảm nhận được sự chân thực trong từng chương trình, bộ phim mình tận hưởng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (73, N'16GB LPDDR5x', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'3 cell  56 Wh', N'2.43kg', N'Trắng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'12th Gen Intel Core i7-1255U processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (446, N'8 GB
', N'128 GB
', N'11 inches
', N'8400mAh
', N'0.85kg
', N'Xanh
', N'Samsung Galaxy Tab S9 Wifi là mẫu máy tính bảng Samsung thuộc series S9 vừa được hãng giới thiệu tại sự kiện Galaxy Unpacked 2023 vừa qua. Theo thông tin được hãng công bố, đây là mẫu tablet cao cấp sở hữu thiết kế sang trọng cùng với hiệu năng sử dụng vượt trội. Về thiết kế, máy tính bảng sở hữu một thiết kế nguyên khối với khung viền kim loại được hoàn thiện vuông vức sang trọng. Bốn góc trên thiết bị được bo cong nhẹ nhàng nhờ đó vừa đảm bảo tính thẩm mỹ cao lại vừa mang lại khả năng cần nắm chắc chắn cho người dùng. Máy có hai lựa chọn màu sắc cho người dùng là be và xám than chì. Samsung Galaxy Tab S9 series là series tablet đầu tiên được Samsung trang bị chuẩn kháng nước. Theo đó, Samsung Galaxy Tab S9 Wifi sẽ sở hữu chuẩn kháng nước và bụi bẩn IP68. Không chỉ trên máy tính bảng mà Samsung còn trang bị chỉ sống kháng nước này lên bút SPen. Bút SPen trên Tab S9 với nhiều cải tiến với đầu bút nhạy hơn nhờ đó giúp mang lại các thao tác nhấp hiệu quả. Bút còn được trang bị tính năng sạc 2 chiều cùng khả năng gắn bằng nam châm vô cùng tiện lợi.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (447, N'4 GB
', N'64 GB
', N'10.9 inches
', N'7587 mAh
', N'0.85kg
', N'Bạc
', N'Máy tính bảng iPad 10.9 inch 2022 được thiết kế lại hoàn toàn với bộ tứ màu sắc đậm hơn gây ấn tượng mạnh hơn. Các đường nét tinh tế được đẽo gọt cẩn thận với những đường cong hoàn hảo, mặt sau logo Apple nổi bật thể hiện rõ phong cách truyền thống của Apple. iPad 10.9 inch 2022 được tích hợp màn hình Liquid Retina kích thước 10.9 inch vừa phải, cho màu sắc hình ảnh vô cùng sống động, bắt mắt người xem. Công nghệ True Tone tinh chỉnh màu sắc, ánh sáng để bạn dễ dàng theo dõi các dạng nội dung trong mọi điều kiện ánh sáng. iPad 10.9 inch 2022 được tích hợp camera sau rộng 12MP, cho phép lưu giữ hình ảnh đẹp với nội dung 4K. Các công nghệ kèm theo hỗ trợ chụp và chỉnh sửa ảnh rõ ràng sắc nét nhất. Camera trước siêu rộng 12MP cho khung hình trở nên hoàn hảo hơn khi thực hiện Facetime, quay video tự sướng. Máy ảnh sẽ tự động điều chỉnh để nhân vật chính nằm chính giữa ảnh với công nghệ Center Stage.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (74, N'16GB LPDDR5x', NULL, N'14" diagonal FHD IPS eDP anti-glare WLED-backlit bent, 250 nits, 45% NTSC for HD camera (1920 x 1080', N'3 cell  56 Wh', N'2.43kg', N'Trắng', N'Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.', N'12th Gen Intel Core i7-1255U processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (75, N'32GB (DDR4)', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'3 cell  56 Wh', N'2.43kg', N'Trắng', N'Surface đậm chất hiện đại với phần khung được làm từ vỏ nhôm cao cấp. Chất liệu này đem lại vẻ sang trọng cho chiếc máy, đồng thời mang lại độ bền bỉ cao, hoàn toàn yên tâm mang đi bất cứ đâu mà không gặp vấn đề gì. Hơn nữa, chiếc laptop này đi cùng hai tùy chọn màu sắc nhôm đen và bạc mờ, cho bạn lựa chọn.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (76, N'32GB (DDR4)', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'3 cell  56 Wh', N'2.43kg', N'Trắng', N'Surface đậm chất hiện đại với phần khung được làm từ vỏ nhôm cao cấp. Chất liệu này đem lại vẻ sang trọng cho chiếc máy, đồng thời mang lại độ bền bỉ cao, hoàn toàn yên tâm mang đi bất cứ đâu mà không gặp vấn đề gì. Hơn nữa, chiếc laptop này đi cùng hai tùy chọn màu sắc nhôm đen và bạc mờ, cho bạn lựa chọn.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (448, N'8 GB
', N'128 GB
', N'11 inches
', N'7538 mAh
', N'0.85kg
', N'Bạc
', N'Nhìn chung chiếc iPad này có phần thiết kế cũng tương tự như những thế hệ tiền nhiệm đi trước. Với thiết kế nhỏ gọn cùng với chất liệu bền bỉ thì đây là một sản phẩm vô cùng chất lượng do đó người dùng có thể trải nghiệm một cách thoải mái mà không sợ hư hại. Phiên bản lần này là một bảng nâng cấp toàn diện khi chiếc iPad Pro 11 2022 M2 Wifi 5G 128GB được nâng lên một tầm cao mới. Với sự hỗ trợ của nhiều công nghệ và chức năng khác nhau đây là một sản phẩm rất đáng sử dụng. iPad sử dụng công nghệ True Tone, giúp người dùng trải nghiệm tốt khi độ hiển thị màu sắc ổn định, chân thực. Từ đó các bạn có thể chỉnh sửa mọi hình ảnh, video một cách nhanh chóng. Ngoài ra với tốc độ làm mới nhanh 120Hz của iPad sẽ giúp bạn thao tác nhanh chóng và mượt mà hơn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (450, N'8 GB
', N'128 GB
', N'11 inches
', N'8840 mAh
', N'0.85kg
', N'Xám
', N'Xiaomi Pad 6 sở hữu thiết kế tương tự như phiên bản tiền nhiệm của chúng. Máy có thiết kế chắc chắn và vô cùng mỏng nhẹ. Bạn có thể cầm bằng 1 tay nhẹ nhàng để di chuyển tới khắp nơi. Phần viền cứng cáp nhờ được làm bằng khung kim loại và được bo cong mềm mại để mang lại sự tinh tế và thanh lịch. Xiaomi Pad 6 vẫn giữ nguyên kích thước 11 inch như trên người anh em Pad 5. Tấm nền chất lượng kết hợp với độ phân giải 2,8K mang tới khả năng hiển thị vô cùng sống động. Đặc biệt, trên mẫu mới này Xiaomi cũng trang bị công nghệ HDR10 giúp cho mọi chi tiết trở nên bắt mắt. Xiaomi Pad 6 sở hữu cấu hình vô cùng mạnh mẽ nhờ con chip Snapdragon 870. Mọi tác vụ đồ họa chuyên nghiệp hay các game phổ biến đều được xử lý nhanh gọn và mượt mà. Bạn có thể thoải mái làm việc, học tập với các tác vụ nặng về đồ hoạ hay video một cách trơn tru nhất.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (454, N'3 GB
', N'32 GB
', N'8.0 inches
', N'5100 mAh
', N'0.76kg
', N'Xám
', N'Chiếc máy tính bảng giá rẻ Lenovo Tab M8 Gen 4 gây ấn tượng với người tiêu dùng bởi dung lượng bộ nhớ 32GB, màn hình 8 inch và khả năng xử lý thao tác khá ổn định, mượt mà và nhanh chóng. Máy tính bảng Lenovo Tab M8 Gen 4 được đánh giá là chiếc tablet giá rẻ có hiệu năng ổn định với MediaTek Helio A22, xử lý tác vụ mượt mà với tốc độ 2GHz. Lenovo Tab M8 Gen 4 cũng sở hữu RAM 3GB và bộ nhớ trong có dung lượng 32G, khá thích hợp để đáp ứng các nhu cầu sử dụng cơ bản như xem phim, đọc sách, lướt web hoặc chơi được các tựa game nhẹ. Là dòng máy tính bảng thuộc phân khúc giá rẻ Lenovo Tab M8 Gen 4 được trang bị màn hình 8 inch cùng độ phân giải Full HD phù hợp cho việc giải trí cũng như học tập ngay trên máy. Ngoài ra mọi thao tác trên màn hình cũng diễn ra vô cùng liền mạch nhờ vào tính năng cảm ứng đa điểm tiện lợi.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (77, N'32GB (DDR4)', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'3 cell  56 Wh', N'2.43kg', N'Trắng', N'Surface đậm chất hiện đại với phần khung được làm từ vỏ nhôm cao cấp. Chất liệu này đem lại vẻ sang trọng cho chiếc máy, đồng thời mang lại độ bền bỉ cao, hoàn toàn yên tâm mang đi bất cứ đâu mà không gặp vấn đề gì. Hơn nữa, chiếc laptop này đi cùng hai tùy chọn màu sắc nhôm đen và bạc mờ, cho bạn lựa chọn.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (78, N'32GB (DDR4)', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'3 cell  56 Wh', N'2.43kg', N'Trắng', N'Surface đậm chất hiện đại với phần khung được làm từ vỏ nhôm cao cấp. Chất liệu này đem lại vẻ sang trọng cho chiếc máy, đồng thời mang lại độ bền bỉ cao, hoàn toàn yên tâm mang đi bất cứ đâu mà không gặp vấn đề gì. Hơn nữa, chiếc laptop này đi cùng hai tùy chọn màu sắc nhôm đen và bạc mờ, cho bạn lựa chọn.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (79, N'32GB (DDR4)', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'56 Wh Lithium-Ion', N'	1.91 kg', N'Trắng', N'Surface đậm chất hiện đại với phần khung được làm từ vỏ nhôm cao cấp. Chất liệu này đem lại vẻ sang trọng cho chiếc máy, đồng thời mang lại độ bền bỉ cao, hoàn toàn yên tâm mang đi bất cứ đâu mà không gặp vấn đề gì. Hơn nữa, chiếc laptop này đi cùng hai tùy chọn màu sắc nhôm đen và bạc mờ, cho bạn lựa chọn.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (80, N'16GB LPDDR4x RAM', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'56 Wh Lithium-Ion', N'	1.91 kg', N'Trắng', N'Surface đậm chất hiện đại với phần khung được làm từ vỏ nhôm cao cấp. Chất liệu này đem lại vẻ sang trọng cho chiếc máy, đồng thời mang lại độ bền bỉ cao, hoàn toàn yên tâm mang đi bất cứ đâu mà không gặp vấn đề gì. Hơn nữa, chiếc laptop này đi cùng hai tùy chọn màu sắc nhôm đen và bạc mờ, cho bạn lựa chọn.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (81, N'16GB LPDDR4x RAM', NULL, N'13.5" diagonal, WUXGA+ (1920 x 1280), multitouch-enabled, IPS, edge-to-edge glass, micro-edge, anti-reflection Corning® Gorilla® Glass NBT™, Low Blue Light, 400 nits, 100% sRGB', N'56 Wh Lithium-Ion', N'	1.91 kg', N'Trắng', N'Surface đậm chất hiện đại với phần khung được làm từ vỏ nhôm cao cấp. Chất liệu này đem lại vẻ sang trọng cho chiếc máy, đồng thời mang lại độ bền bỉ cao, hoàn toàn yên tâm mang đi bất cứ đâu mà không gặp vấn đề gì. Hơn nữa, chiếc laptop này đi cùng hai tùy chọn màu sắc nhôm đen và bạc mờ, cho bạn lựa chọn.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (82, N'16GB LPDDR4x RAM', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'56 Wh Lithium-Ion', N'	1.91 kg', N'Trắng', N'Surface đậm chất hiện đại với phần khung được làm từ vỏ nhôm cao cấp. Chất liệu này đem lại vẻ sang trọng cho chiếc máy, đồng thời mang lại độ bền bỉ cao, hoàn toàn yên tâm mang đi bất cứ đâu mà không gặp vấn đề gì. Hơn nữa, chiếc laptop này đi cùng hai tùy chọn màu sắc nhôm đen và bạc mờ, cho bạn lựa chọn.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (83, N'16GB LPDDR4x RAM', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'56 Wh Lithium-Ion', N'	1.91 kg', N'Trắng', N'Microsoft cho biết laptop Surface có thể sử dụng được 10 giờ 30 phút cho một lần sạc, thấp hơn so với con số 13 giờ 30 phút được công bố với thế hệ 6. Có lẽ nhà sản xuất đã rút ngắn bớt để tiết kiệm chi phí. Tuy vậy với thế hệ 7 tốc độ sạc rất nhanh lên đến 80% trong 1 giờ qua cổng Surface Connector.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (84, N'16GB LPDDR4x RAM', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'56 Wh Lithium-Ion', N'	1.91 kg', N'Trắng', N'Microsoft cho biết laptop Surface có thể sử dụng được 10 giờ 30 phút cho một lần sạc, thấp hơn so với con số 13 giờ 30 phút được công bố với thế hệ 6. Có lẽ nhà sản xuất đã rút ngắn bớt để tiết kiệm chi phí. Tuy vậy với thế hệ 7 tốc độ sạc rất nhanh lên đến 80% trong 1 giờ qua cổng Surface Connector.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (85, N'16GB LPDDR4x RAM', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'56 Wh Lithium-Ion', N'	1.91 kg', N'Trắng', N'Microsoft cho biết laptop Surface có thể sử dụng được 10 giờ 30 phút cho một lần sạc, thấp hơn so với con số 13 giờ 30 phút được công bố với thế hệ 6. Có lẽ nhà sản xuất đã rút ngắn bớt để tiết kiệm chi phí. Tuy vậy với thế hệ 7 tốc độ sạc rất nhanh lên đến 80% trong 1 giờ qua cổng Surface Connector.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (86, N'16GB LPDDR4x RAM', NULL, N'16-inch diagonal, UHD+ (3840 x 2400), OLED, multitouch-enabled, UWVA, edge-to-edge glass, micro-edge, anti-reflection Corning Gorilla Glass NBT', N'56 Wh Lithium-Ion', N'	1.91 kg', N'Trắng', N'Microsoft cho biết laptop Surface có thể sử dụng được 10 giờ 30 phút cho một lần sạc, thấp hơn so với con số 13 giờ 30 phút được công bố với thế hệ 6. Có lẽ nhà sản xuất đã rút ngắn bớt để tiết kiệm chi phí. Tuy vậy với thế hệ 7 tốc độ sạc rất nhanh lên đến 80% trong 1 giờ qua cổng Surface Connector.', N'11th Gen Intel® Core™ i7-11370H processor', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (96, N'	4 GB', N'128GB', N'	IPS LCD, 6.1", Liquid Retina HD', N'	3110 mAh', N'189 gram', N'Đen', N'Thiết kế iPhone 11 không khác nhiều so với các thông tin được rò rỉ trước đó. Và điều khiến tôi thất vọng nhất trong thiết kế là mặt trước. Apple vẫn trung thành với màn hình “tai thỏ”. Trong khi đó các dòng điện thoại cao cấp Android đã sử dụng màn hình notch, màn hình không viền vô cùng ấn tượng. Ngoài ra, một điểm trừ nữa trong thiết kế iPhone 11 là các cạnh viền vẫn còn rất dày tương tự iPhone XR.', N'Apple A13 Bionic 6 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (98, N'6 GB', N'128GB', N'	OLED Super Retina XDR; 6.7inch; Độ phân giải 2778 x 1284 pixel ở 458 ppi; kính cường lực Ceramic Shield', N'	Lên đến 26h phát video liên tục', N'221 gram', N'BLue', N'iPhone 14 Plus được trang bị màn hình có kích thước 6.7 inch ngang bằng với 14 Pro Max. Điều này là quyết định đúng đắn của Apple khi người dùng thường ưu tiên lựa chọn những sản phẩm có kích thước màn hình lớn để thuận tiện hơn khi làm việc và giải trí.', N'	Apple A15 Bionic', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (99, N'6 GB', N'512GB', N'	OLED Super Retina XDR; 6.7inch; Độ phân giải 2778 x 1284 pixel ở 458 ppi; kính cường lực Ceramic Shield', N'	Lên đến 26h phát video liên tục', N'221 gram', N'BLue', N'iPhone 14 Plus được trang bị màn hình có kích thước 6.7 inch ngang bằng với 14 Pro Max. Điều này là quyết định đúng đắn của Apple khi người dùng thường ưu tiên lựa chọn những sản phẩm có kích thước màn hình lớn để thuận tiện hơn khi làm việc và giải trí.', N'	Apple A15 Bionic', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (100, N'	4GB', N'256GB', N'OLED; 1170 x 2532 Pixels; 6.1"; Tần số quét 60 Hz; Độ sáng tối đa 1200 nits; Kính cường lực Ceramic Shield', N'3240 mAh; Li-Ion', N'200 gram', N'Mid Night', N'iPhone 13 256GB, một trong những siêu phẩm mới của "nhà Táo" sẽ đem đến trải nghiệm thú vị cho người dùng. Với màu sắc mới, camera nhiều thay đổi, vi xử lý A15 Bionic mạnh mẽ hơn, pin lâu hơn,… là những gì iPhone 13 sở hữu và chinh phục được những vị khách khó tính nhất.', N'Apple A15 Bionic 6 nhân; Tốc độ CPU: 3.22 GHz; Apple GPU 4 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (104, N'	6 GB', N'512GB', N'	6.7'''', 2796 x 1290 pixel , Super Retina XDR 120 Hz, Tấm nền OLED, Dynamic Island, Màn hình HDR, Công nghệ ProMotion, Always-On Display', N'	3110 mAh', N'221 gram', N'Titan Tự Nhiên', N'iPhone 12 được trang bị chip xử lý A14 Bionic, mạng 5G. Ở những quốc gia chưa có 5G, bạn hoàn toàn có thể dễ dàng chuyển sang dùng LTE. iPhone 12 đã đánh dấu một khởi đầu mới, khai sinh ra thế hệ sản phẩm mỏng, vuông vắn và được đánh giá cao.', N'	Apple A15 Bionic 6 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (106, N'8GB', N'128GB', N'6.6'''', 1080 x 2340 (FHD+), Super AMOLED', N'	5000 mAh 25 W Li-po', N'189 gram', N'Trắng', N'Samsung Galaxy A35 5G là mẫu smartphone tầm trung mới của Samsung vừa được trình làng. Thiết bị gây ấn tượng không chỉ bởi thiết kế thời trang, bắt mắt mà còn ở hiệu suất ổn định với con chip Exynos 1380, hứa hẹn sẽ đem lại cho người dùng những trải nghiệm mượt mà.', N'	Exynos 1380', NULL, NULL)
GO
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (107, N'8GB', N'128GB', N'6.6'''', 1080 x 2400 (FHD+), Super AMOLED', N'	5000 mAh 25 W Li-po', N'189 gram', N'Đen', N'Samsung đã trang bị cho Galaxy A55 5G khung kim loại cao cấp sau nhiều năm sử dụng khung viền hoàn toàn bằng nhựa polycarabonate, và đây được đánh giá là một nâng cấp mạnh mẽ, mang tới trải nghiệm thiết kế cao cấp cho người dùng. Đặc biệt, thiết bị còn được trang bị các công nghệ chụp ảnh tiên tiến, bảo mật nâng cao Knox Vault sẽ giúp người dùng tận hưởng những điều tuyệt vời nhất.', N'	Exynos 1480', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (109, N'12GB', N'256GB', N'	6.7" Dynamic AMOLED 2X', N'	4900 mAh, Li-Ion', N'221 gram', N'Đen', N'Galaxy S24 Plus là một trong 3 phiên bản mới nhất thuộc thuộc dòng Galaxy S24 Series vừa được giới thiệu vào ngày 18/1 vừa qua. Thiết bị nhận được nhiều sự quan tâm khi sở hữu diện mạo bắt mắt, hiệu năng nổi bật với con chip mới được tích hợp nhiều tính năng AI thông minh cùng khả năng nhiếp ảnh được cải thiện, giúp đáp ứng tốt nhu cầu ngày càng cao của người dùng trong cuộc sống hiện đại.', N'	Exynos 2400 For Galaxy', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (110, N'12GB', N'512GB', N'	6.8" Dynamic AMOLED 2X', N'	5000 mAh, Li-Ion', N'221 gram', N'Gray', N'Samsung đã chính thức ra mắt Galaxy S24 Ultra và các biến thể S24,S24 Plus. Là phiên bản cao cấp nhất trong bộ ba Galaxy S năm nay, S24 Ultra nhận được rất nhiều nâng cấp và cải tiến mới.', N'	Snapdragon® 8 Gen 3 for Galaxy', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (97, N'	4GB', N'64GB', N'OLED; Super Retina XDR display; 1170 x 2532 Pixels; 6.1"', N'2815 mAh, Li-Ion;', N'189 gram', N'Đen', N'iPhone 12 được trang bị chip xử lý A14 Bionic, mạng 5G. Ở những quốc gia chưa có 5G, bạn hoàn toàn có thể dễ dàng chuyển sang dùng LTE. iPhone 12 đã đánh dấu một khởi đầu mới, khai sinh ra thế hệ sản phẩm mỏng, vuông vắn và được đánh giá cao.', N'	Apple A14 Bionic 6 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (111, N'6GB', N'128GB', N'6.5" - Tần số quét 120 Hz', N'	5000 mAh, 25 W', N'189 gram', N'Blue', N'Samsung Galaxy A25 5G là chiếc smartphone vô cùng nổi bật với hàng loạt công nghệ mới. Thiết kế nổi bật, màn hình 120Hz, camera 50MP mang lại những trải nghiệm tuyệt vời cho người dùng. Đặc biệt, chip Exynos 1280 5nm cho hiệu năng mạnh mẽ đáp ứng tốt mọi nhu cầu sử dụng', N'	Exynos 1280 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (144, N'8 GB', N'256 GB', N'	AMOLED; 6.67"; Full HD+ (1080 x 2400 Pixels); 120 Hz; 1100 nits', N'	5000 mAh (typ); 67 W', N'211 gram', N'Blue', N'Redmi Note 12 Pro 4G là mẫu smartphone tầm trung được ra mắt tại Việt Nam năm 2023. Thiết bị sở hữu nhiều ưu điểm sáng giá như thiết kế sang trọng, hiện đại, hiệu năng mạnh mẽ, màn hình 120Hz siêu mượt, pin trâu và camera 108MP xịn sò. Đây sẽ là sự lựa chọn hoàn hảo dành cho các bạn học sinh, sinh viên trong năm nay.', N'	Qualcomm® Snapdragon 732G', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (150, NULL, NULL, NULL, NULL, NULL, NULL, N'Thế hệ AirPods Pro 2 được cải tiến nhằm chuyên nghiệp hóa trải nghiệm người dùng theo cách trọn vẹn hơn. Sự hiện diện của chip H2 giúp sản phẩm xử lý âm thanh xuất sắc, những nâng cấp về kỹ nghệ chống ồn, công nghệ xuyên âm và thời lượng pin cho cảm nhận vượt trội so với phiên bản AirPods Pro đầu tiên.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (151, NULL, NULL, NULL, NULL, N'50.8 g
', N'Trắng
', N'Thế hệ AirPods Pro 2 được cải tiến nhằm chuyên nghiệp hóa trải nghiệm người dùng theo cách trọn vẹn hơn. Sự hiện diện của chip H2 giúp sản phẩm xử lý âm thanh xuất sắc, những nâng cấp về kỹ nghệ chống ồn, công nghệ xuyên âm và thời lượng pin cho cảm nhận vượt trội so với phiên bản AirPods Pro đầu tiên.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (152, NULL, NULL, N'54.4 x 21.38 x 46.40 mm
', NULL, N'37.91 g
', N'Trắng
', N'Phiên bản AirPods 3 hộp sạc dây đem đến lựa chọn với mức giá phải chăng và mô hình hoạt động quen thuộc khi chỉ hỗ trợ sạc cáp qua cổng Lightning. Ngoài ra, sản phẩm sở hữu mọi công nghệ tương tự như phiên bản AirPods 3 tiêu chuẩn, đem đến trải nghiệm đeo thoải mái, khả năng tương tác linh hoạt và chất âm sẽ khiến bạn vừa lòng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (155, NULL, NULL, NULL, NULL, NULL, N'Đen
', N'Là thế hệ tai nghe bluetooth mới của thương hiệu lừng danh Beats, phiên bản tai nghe Fit Pro True Wireless Earbuds cho thấy sự hòa trộn hiệu quả giữa yếu tố thời trang, phong cách và trải nghiệm chất âm chuẩn phòng thu. Sản phẩm được tích hợp chip H1, công nghệ khử ồn chủ động ANC và ghi nhận thời lượng pin tối đa là một ngày khi kết hợp với hộp sạc.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (156, NULL, NULL, NULL, NULL, N'80 g
', N'Trắng
', N'Phát huy công nghệ sạc được Apple sáng tạo và hỗ trợ trên các dòng iPhone thế hệ mới, bộ cáp sạc MagSafe Charger to USB-C tận dụng cơ chế từ tính độc đáo để tự động cố định chặt vào mặt lưng máy và truyền tải năng lượng nhanh chóng. Sự gọn nhẹ, tiện lợi cùng khả năng tương thích tuyệt vời với iPhone là những ưu điểm xuất sắc của sản phẩm này.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (157, NULL, NULL, NULL, NULL, N'300 g
', N'Trắng
', N'Đế sạc đôi MagSafe Duo Charger giúp người dùng cung cấp năng lượng cho AirPods, Apple Watch và iPhone theo cách đơn giản nhất. Đặc biệt, đế sạc không dây này còn hỗ trợ sạc hai thiết bị của Apple cùng lúc.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (158, NULL, NULL, NULL, NULL, N'300 g
', N'Trắng
', N'Vừa sạc nhanh hiệu quả nhưng vẫn đảm bảo an toàn tuyệt đối dành cho dòng MacBook đời từ MacBook Pro 13 (2016) trở lên của, cục Sạc 67W USB-C Power Adapter đáp ứng hoàn hảo cho công việc sạc pin của các sản phẩm Apple.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (159, NULL, NULL, NULL, NULL, NULL, N'Trong suốt
', N'Khăn lau màn hình cao cấp Polishing Cloth là khăn lau chính hãng của Apple, có thể lau sạch và đánh bóng màn hình các sản phẩm như iPhone, MacBook, iPad, Apple Watch và nhiều đồ dùng công nghệ khác của bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (160, NULL, NULL, NULL, NULL, N'80 g
', N'Trắng
', N'Là giải pháp chính hãng của Apple trong việc truyền tải thông tin, đồng bộ hóa dữ liệu và hỗ trợ sạc pin cho iPhone, iPad, sợi cáp USB-C to Lightning chiều dài 1 mét sẽ giúp bạn rất nhiều trong quá trình trải nghiệm các thiết bị di động thông minh mang logo Táo khuyết. Đặc biệt là trong trường hợp muốn tận dụng cơ chế sạc nhanh.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (161, NULL, NULL, NULL, NULL, N'360 g
', N'Trắng
', N'Được sản xuất chính hãng bởi Apple, bộ sạc 140W USB-C Power Adapter ghi nhận khả năng sạc nhanh cho MacBook Pro 16 inch (2021) và nhiều sản phẩm nằm trong hệ sinh thái của Táo khuyết. Nhờ công nghệ điều tiết dòng điện thông minh, thiết bị này sẽ giúp bạn có thể nạp năng lượng vừa an toàn, vừa hiệu quả.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (162, NULL, NULL, NULL, NULL, N'30 g
', N'Trắng
', N'Là giải pháp chính hãng của Apple trong việc truyền tải thông tin, đồng bộ hóa dữ liệu và hỗ trợ sạc pin cho iPhone, iPad, sợi cáp USB-C to Lightning chiều dài 1 mét sẽ giúp bạn rất nhiều trong quá trình trải nghiệm các thiết bị di động thông minh mang logo Táo khuyết. Đặc biệt là trong trường hợp muốn tận dụng cơ chế sạc nhanh.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (258, NULL, NULL, N'40mm
', N'462mAh
', NULL, N'Vàng
', N'Đồng hồ thông minh Amazfit T-Rex Ultra với đa dạng chế độ luyện tập, hệ thống định vị toàn cầu cũng có độ chính xác cao và một dung lượng pin lớn chắc chắn sẽ hỗ trợ tốt hơn cho người dùng là vận động viên hoặc yêu thích thể thao.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (261, NULL, NULL, N'47mm
', N'477mAh
', NULL, N'Xám
', N'Đồng hồ thể thao chuyên nghiệp Garmin sử dụng dây silicone với độ bền vượt trội, bề mặt mềm mịn mang lại sự thoải mái cho người đeo. Bên cạnh đó, chất liệu silicone cũng hạn chế bám bẩn, nếu bị dính bẩn thì bạn có thể làm sạch dễ dàng với nước.Mặt kính cường lực hóa học tăng cường khả năng chống nứt vỡ, mang đến độ bền bỉ ấn tượng cho Forerunner 165. Bạn có thể yên tâm tập luyện hay tham gia các hoạt động thể thao ngoài trời mà không lo hư hại đồng hồ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (403, NULL, NULL, N'79cm
', NULL, N'8kg
', N'Trắng
', N'"Máy lạnh Samsung Wind-Free Inverter 1 HP AR10CYECAWKNSV có khả năng thổi luồng gió dễ chịu, tránh gây cảm giác lạnh buốt nhờ sử dụng công nghệ Wind-Free độc quyền của hãng. Hơn nữa, người dùng có thể điều khiển và kiểm soát máy lạnh từ xa dễ dàng qua ứng dụng trên điện thoại. Ngoài ra, thiết kế phần nắp máy lạnh với 23.000 lỗ nhỏ li ti lạ mắt được dùng để thổi hơi lạnh ra ngoài một cách nhẹ nhàng, tránh buốt.

Thiết kế
Dàn lạnh:

- Dàn lạnh có kiểu dáng hiện đại với gam màu trắng tinh tế. Mặt trước dàn lạnh có họa tiết nhiều lỗ nhỏ li ti tạo nên độ nhám cho người dùng khi sờ. Chất liệu vỏ máy bền bỉ và chống biến dạng trong suốt thời gian sử dụng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (164, NULL, NULL, NULL, NULL, N'100 g
', N'Đen
', N'Smart Folio cho iPad mini mỏng và nhẹ, có chức năng bảo vệ mặt trước của thiết bị. Smart Folio tự động đánh thức iPad mini khi mở ra và chuyển máy về chế độ ngủ khi đóng lại. Smart Folio gắn kết bằng nam châm và bạn có thể dễ dàng gấp theo nhiều cách khác nhau để tạo thành chân đế cho máy khi đọc, xem, gõ phím hoặc gọi FaceTime.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (165, NULL, NULL, NULL, NULL, N'75 g
', N'Trong suốt
', N'Nếu bạn đang tìm kiếm một giải pháp bảo vệ cho iPhone 13 do chính Apple thiết kế và sản xuất thì bộ ốp lưng Clear Case with MagSafe là sự lựa chọn hợp lý nhất. Sản phẩm có vẻ ngoài trong suốt, giúp bạn khoe được vẻ đẹp của thiết bị, đồng thời đảm bảo chống sốc và chống xước tốt cho iPhone 13.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (167, NULL, NULL, NULL, NULL, N'120 g
', N'Nâu
', N'Thay vì tìm kiếm những mẫu ốp lưng do các bên thứ ba sản xuất cho iPhone 13 Pro Max, tại sao bạn không lựa chọn sản phẩm được chính Apple thiết kế và hoàn thiện với chất lượng cao nhất như bộ Leather Case with MagSafe? Không chỉ đảm bảo tính vừa vặn chuẩn xác, chiếc ốp lưng da còn có thể tăng thêm tính sang trọng cho chiếc điện thoại.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (168, NULL, NULL, N'105 x 67 x 19 mm
', N'10000 mAh
', N'182 g
', N'Xanh rêu
', N'Pin sạc dự phòng MagSafe Wekome WP-365 15W 10.000mAh không chỉ là một nguồn năng lượng dự phòng đáng tin cậy, mà còn mang đến cho bạn những tính năng tiện ích và thiết kế độc đáo để hỗ trợ tối đa trong việc duy trì năng lượng cho các thiết bị di động của bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (169, NULL, NULL, N'98x86x23 mm
', N'10000 mAh
', N'300 g
', N'Xanh
', N'Sạc dự phòng Yoobao Magsafe QC 3.0/PD 20.5W 10.000 mAh là một sản phẩm đa chức năng với nhiều tính năng nổi bật. Từ khả năng sạc nhanh không dây MagSafe cho đến hệ thống bảo vệ đa lớp và thiết kế nhỏ gọn an toàn, sản phẩm này sẽ đáp ứng nhu cầu sạc pin với hiệu suất tối ưu trong mọi tình huống.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (170, NULL, NULL, N'106x69.2x17.2 mm
', N'10000 mAh
', N'190 g
', N'Xanh
', N'Pin sạc dự phòng Innostyle PowerMag Switch 2-in1 10.000 mAh là một phụ kiện hoàn hảo cho người dùng muốn tận dụng tối đa công nghệ MagSafe để tăng thời gian sử dụng trên các mẫu iPhone mới nhất. Sản phẩm nổi bật với kích thước nhỏ gọn và công nghệ sạc nhanh tiên tiến.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (171, NULL, NULL, N'7 x 11 x 1.7 cm
', N'10000 mAh
', N'190 g
', N'Trắng
', N'Innostyle PowerMag Slim là pin sạc dự phòng Magsafe, cho phép bạn sạc lại dễ dàng các mẫu iPhone mới nhất của Apple một cách tự do thực sự nhờ công nghệ sạc không dây tích hợp
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (172, NULL, NULL, N'109*69*16,5 mm
', N'10000 mAh
', N'188 g
', N'Đen
', N'Bên cạnh thiết kế nhỏ gọn, Inostyle Powergo Magnectic còn nổi bật với khả năng tương thích công nghệ sạc MagSafe của Apple để bạn có thể sạc lại dễ dàng cho iPhone 12 và 13 Series.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (173, NULL, NULL, N'106x69.2x17.2 mm
', N'10000 mAh
', N'198 g
', N'Đen
', N'Sạc dự phòng Innostyle PowerMag 15W 2 in 1 Stand 10000 mAh PD 20W có rất nhiều tính năng nổi bật để cung cấp trải nghiệm thú vị và tuyệt vời cho người dùng trong quá trình sạc pin trên iPhone.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (174, NULL, NULL, N'139.5 x 69.4 x 16.2 mm
', N'10000 mAh
', N'223 g
', N'Đen
', N'Với kích thước nhỏ gọn và dung lượng lên đến 10000mAh, pin sạc dự phòng Aukey Basix Slim PB-N99 10000mAh sẽ cho phép bạn sạc lại điện thoại thông minh hoặc máy tính bảng ở bất cứ nơi đâu.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (175, NULL, NULL, N'9 x 3 x 16.5 mm
', N'10000 mAh
', N'217 g
', N'Đen
', N'Với thiết kế nhỏ gọn như một smartphone, hỗ trợ hai cổng nguồn ra USB-A và ghi nhận dung lượng pin lên tới 10.000 mAh, sản phẩm pin sạc dự phòng PowerGo Smart AI Innostyle sẽ hỗ trợ rất nhiều cho bạn trong quá trình sử dụng điện thoại, đặc biệt là cho những chuyến đi xa và cần duy trì nguồn năng lượng cho nhiều thiết bị thông minh.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (176, NULL, NULL, N'7 x 13.5 x 1.4 cm
', N'10000 mAh
', N'220 g
', N'Trắng
', N'Với Innostyle Powermax QC3.0/PD 20W 10000mAh, bạn có thể quên đi nỗi lo hết pin mỗi khi đi ra ngoài. Không chỉ có thiết kế nhỏ gọn, pin sạc dự phòng này còn có nhiều cổng sạc nhanh, dung lượng lớn và đèn LED hiển thị trạng thái tiện lợi.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (177, NULL, NULL, N'86 x 63 x 24 mm
', N'10000 mAh
', N'190 g
', N'Xanh dương
', N'Gây ấn tượng nhờ thiết kế hiện đại, có khả năng hỗ trợ sạc nhanh và sở hữu dung lượng pin lớn, bộ pin sạc dự phòng UMETRAVEL TRIP10000 là một trong những giải pháp hiệu quả nhất để đáp ứng nhu cầu sạc pin cơ động cho smartphone và tablet của bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (178, NULL, NULL, N'59.7 x 79 x 25 mm
', N'10000 mAh
', N'180 g
', N'Xanh
', N'Đến từ thương hiệu nổi danh uy tín trong lĩnh vực sản xuất phụ kiện, UMETRAVEL SKY10000 đem tới những công nghệ hiện đại nhất để đảm bảo sự tiện lợi và an toàn trong quá trình sạc pin. Dung lượng 10.000 mAh kết hợp với màn hình theo dõi phần trăm pin giúp bạn an tâm sạc và sử dụng với điện thoại/máy tính bảng mọi lúc mọi nơi.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (179, NULL, NULL, NULL, NULL, NULL, N'Xanh
', N'Belkin BPB001 với dung lượng 10.000 mAh có thể cung cấp đủ pin cho smartphone hoạt động tới 40 giờ ở những tác vụ cơ bản. Bộ sạc dự phòng này được thiết kế và sản xuất để có thể sạc cùng lúc cho ba thiết bị trong một thời điểm nhờ ba cổng đầu ra. Ngoài ra, bạn cũng dễ dàng nắm bắt được dung lượng pin còn lại trong máy thông qua đèn LED mà nhà sản xuất tích hợp.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (180, N'16 GB
', N'512 GB
', N'28.0 x 11.1 x 2.12 ~ 3.24 cm
', NULL, N'608 g
', N'Trắng
', N'ROG Ally Ryzen Z1 Extreme sẽ đem lại trải nghiệm gaming tuyệt vời nhờ sức mạnh từ chip Ryzen Z1 kết hợp cùng màn hình Full HD 120Hz. Chiếc máy chơi game gọn gàng này chạy hệ điều hành Windows 11, có hệ thống tản nhiệt Zero Gravity mát mẻ và yên tĩnh. Thiết kế công thái học khiến cho quá trình cầm nắm và thao tác trở nên thuận tiện, thoải mái.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (181, N'16 GB
', N'512 GB
', N'294 x 117 x 21.2 mm
', NULL, N'675 g
', N'Đen
', N'Ẩn bên trong thiết kế công thái học nịnh mắt của MSI Claw A1M là bộ vi xử lý Intel Core Ultra 7 155H với sức mạnh cực đỉnh. Màn hình Full HD rộng 7 inch đạt tần số quét 120Hz sẽ trình diễn những khuôn hình cực kỳ mượt mà, mãn nhãn. Trải nghiệm pin dài lâu hứa hẹn giúp người xem đắm chìm trong những phút giây giải trí dài lâu ấn tượng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (182, N'16GB
', N'1TB
', NULL, NULL, NULL, N'Trắng
', N'Với cấu hình phần cứng mạnh mẽ và nhiều tính năng đi kèm, Sony PlayStation 5 Slim hứa hẹn mang đến trải nghiệm chơi game tuyệt vời, sống động đến từng khung hình. Tất cả đảm bảo game thủ sẽ được trải nghiệm các tựa game yêu thích một cách trọn vẹn nhất.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (183, NULL, NULL, NULL, NULL, N'100 g
', N'Đen
', N'Cùng kiếm tìm trải nghiệm gaming hoàn hảo nhất trên Lenovo Legion GO. Sản phẩm được trang bị màn hình 8.8 inch QHD với tần số quét 144Hz mãn nhãn, kết hợp cùng chip AMD Ryzen Z1 Extreme mạnh mẽ, cơ chế tản nhiệt tối ưu và thiết kế tay cầm TrueStrike có thể tách rời linh hoạt.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (184, NULL, NULL, NULL, NULL, N'200 g
', N'Đen
', N'Cùng kiếm tìm trải nghiệm gaming hoàn hảo nhất trên Lenovo Legion GO. Sản phẩm được trang bị màn hình 8.8 inch QHD với tần số quét 144Hz mãn nhãn, kết hợp cùng chip AMD Ryzen Z1 Extreme mạnh mẽ, cơ chế tản nhiệt tối ưu và thiết kế tay cầm TrueStrike có thể tách rời linh hoạt.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (185, NULL, NULL, NULL, NULL, N'310 g
', N'Đen
', N'Cùng kiếm tìm trải nghiệm gaming hoàn hảo nhất trên Lenovo Legion GO. Sản phẩm được trang bị màn hình 8.8 inch QHD với tần số quét 144Hz mãn nhãn, kết hợp cùng chip AMD Ryzen Z1 Extreme mạnh mẽ, cơ chế tản nhiệt tối ưu và thiết kế tay cầm TrueStrike có thể tách rời linh hoạt.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (186, NULL, NULL, NULL, NULL, N'640 g
', N'Xám
', N'Cùng kiếm tìm trải nghiệm gaming hoàn hảo nhất trên Lenovo Legion GO. Sản phẩm được trang bị màn hình 8.8 inch QHD với tần số quét 144Hz mãn nhãn, kết hợp cùng chip AMD Ryzen Z1 Extreme mạnh mẽ, cơ chế tản nhiệt tối ưu và thiết kế tay cầm TrueStrike có thể tách rời linh hoạt.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (187, NULL, NULL, NULL, NULL, NULL, NULL, N'Đế sạc DualSense Charging Station là một phụ kiện thiết yếu giúp bạn sạc pin và bảo quản các tay cầm DualSense của máy chơi game PlayStation 5 một cách tiện lợi. Sản phẩm có rất nhiều tính năng thú vị và hấp dẫn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (188, NULL, NULL, N'10 x 63 x 3.8 mm
', NULL, N'90 g
', N'Xanh
', N'Đến từ thương hiệu nổi danh Microsoft, sản phẩm chuột không dây Microsoft 1850 sở hữu thiết kế đơn giản vừa tay cầm, được trang trang bị nhiều tính năng ưu việt, có độ ổn định cao và khả năng tương thích tuyệt vời với máy tính Windows của bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (87, N'8GB', N'256GB', N'6.7'''', 2796 x 1290 pixel , Super Retina XDR 120 Hz, Tấm nền OLED, Dynamic Island, Màn hình HDR, Công nghệ ProMotion, Always-On Display', N'	4422 mAh', N'221 gram', N'Titan Xanh', N'iPhone 15 Pro Max có khung viền làm từ chất liệu titan loại 5 thay thế cho khung thép không gỉ trên iPhone 14 Pro Max. Vì titan nhẹ hơn thép không gỉ đến 40% nên thay đổi này giúp trọng lượng 15 Pro Max giảm 19 grams so với phiên bản tiền nhiệm. Ngoài giảm trọng lượng, chất liệu titan còn mang lại một số ưu điểm khác như: Tăng độ bền của khung, hạn chế tình trạng mất màu theo thời gian; Bảo vệ điện thoại tốt hơn trong trường hợp va đập bất ngờ; Tăng tính thẩm mỹ cho thiết bị', N'Apple A17 Pro Bionic', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (88, N'8GB', N'128GB', N'6.7'''', 2796 x 1290 pixel , Super Retina XDR 120 Hz, Tấm nền OLED, Dynamic Island, Màn hình HDR, Công nghệ ProMotion, Always-On Display', N'	3500 mAh', N'221 gram', N'Titan Xanh', N'Titan loại 5 hay Titan Grade 5 là vật liệu cao cấp được ứng dụng trong ngành hàng không vũ trụ nhờ sở hữu độ bền bỉ, chịu lực vượt trội và đặc biệt là trọng lượng nhẹ. Năm 2023 đánh dấu lần đầu tiên nhà Táo áp dụng Titan loại 5 làm khung viền cho sản phẩm iPhone và iPhone 15 Pro 128GB là một trong những phiên bản may mắn được áp dụng. Nhờ sự nâng cấp này iPhone 15 Pro 128GB sẽ sở hữu trọng lượng nhẹ hơn tới 9 gram so với iPhone 14 Pro 128GB', N'Apple A17 Pro Bionic', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (89, N'6GB', N'128GB', N'6.1'''', Super Retina XDR, Tấm nền OLED, Dynamic Island, Màn hình HDR, Tỷ lệ tương phản 2.000.000:1', N'3349 mAh', N'200 gram', N'Xanh Lá', N'iPhone 15 ấn tượng hơn về trọng lượng nhẹ, cảm giác cầm nắm vừa tay, thoải mái, đồng thời, chất lượng ảnh chụp không kém cạnh so với iPhone 14 Pro. Tuy nhiên, màn hình và chất lượng hiển thị iPhone 14 Pro có ưu thế hơn với công nghệ Pro Motion, tần số quét 120Hz nên cảm giác lướt mượt mà hơn, chế độ Always On Display cũng là điểm cộng của chiếc smartphone này.', N'	Apple A16 Bionic 6 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (90, N'	6GB', N'128GB', N'6.7'''', Super Retina XDR, Tấm nền OLED, Dynamic Island, Màn hình HDR', N'	4383 mAh', N'221 gram', N'Đen', N'iPhone 15 Plus 128GB đánh dấu việc Dynamic Island lần đầu xuất hiện trên một phiên bản iPhone cơ bản, thay thế cho màn hình tai thỏ truyền thống. Dynamic Island không chỉ giúp tiết kiệm không gian hiển thị màn hình mà còn hỗ trợ người dùng tương tác và truy cập nhanh vào nhiều tác vụ. Ứng dụng này hỗ trợ nhiều công việc khác nhau, từ hiển thị thông báo, nghe nhạc, đến quản lý cuộc gọi, đồng hồ bấm giờ,... mang lại sự thuận tiện tối đa cho người dùng.', N'Chip A16 Bionic, GPU 5 lõi', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (91, N'	4 GB', N'64GB', N'	IPS LCD, 6.1", Liquid Retina HD', N'	3110 mAh', N'189 gram', N'Đen', N'Thiết kế iPhone 11 không khác nhiều so với các thông tin được rò rỉ trước đó. Và điều khiến tôi thất vọng nhất trong thiết kế là mặt trước. Apple vẫn trung thành với màn hình “tai thỏ”. Trong khi đó các dòng điện thoại cao cấp Android đã sử dụng màn hình notch, màn hình không viền vô cùng ấn tượng. Ngoài ra, một điểm trừ nữa trong thiết kế iPhone 11 là các cạnh viền vẫn còn rất dày tương tự iPhone XR.', N'Apple A13 Bionic 6 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (92, N'	6 GB', N'128GB', N'	OLED; 6.1"; 2532 x 1170 pixel; 460 ppi; Kính cường lực Ceramic Shield', N'	3279 mAh; 20 W', N'189 gram', N'Tím', N'Pin Lithium-ion của iPhone 14 với thời lượng pin kéo dài cả ngày cùng khả năng phát lại video liên tục lên đến 20 giờ. Đây là thời lượng sử dụng pin tốt nhất của dòng iPhone nhà "Táo khuyết" từ trước đến nay. Với sự cố gắng cải thiện thời lượng pin của Apple sau mỗi lần ra mắt, các iFans sẽ không ngần ngại mà sắm cho mình một chiếc ngay khi iPhone 14 được lên kệ.', N'	Apple A15 Bionic; CPU 6 nhân với 2 nhân hiệu suất và 4 nhân hiệu quả; Apple GPU 5 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (94, N'	4 GB', N'128GB', N'	OLED; 1170 x 2532 Pixels; 6.1"; Tần số quét 60 Hz; Độ sáng tối đa 1200 nits; Kính cường lực Ceramic Shield', N'3240 mAh; Li-Ion', N'221 gram', N'Xanh Lá', N'iPhone 13 đã chính thức ra mắt toàn cầu ngày 14.09 và chính thức lên kệ tại thị trường Việt Nam ngày 22.10 vừa rồi. Năm nay Apple trang bị sức mạnh cấu hình cho iPhone 13 con chip hoàn toàn mới A15 Bionic được nâng cấp thay vì con chip A14 Bionic trên iPhone 12. Chip này được xây dựng trên tiến trình 5nm+, sử dụng 15 tỷ bóng bán dẫn cho hiệu năng vượt trội không có bất kỳ smartphone hiện tại nào sánh kịp.', N'Apple A15 Bionic 6 nhân; Tốc độ CPU: 3.22 GHz; Apple GPU 4 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (95, N'	8GB', N'1TB', N'	6.7'''', 2796 x 1290 pixel , Super Retina XDR 120 Hz, Tấm nền OLED, Dynamic Island, Màn hình HDR, Công nghệ ProMotion, Always-On Display', N'	4422 mAh', N'221 gram', N'Titan Tự Nhiên', N'iPhone 15 Pro Max 1TB được trang bị chip A17 Pro hoàn toàn mới sản xuất theo tiến trình 3nm cho phép gia tăng hiệu suất CPU thêm 10%. Con chip mới cũng được nâng cấp Pro-class GPU 6 nhân với hiệu năng cao hơn 20% cùng công nghệ dò tia mới nhanh hơn 4 lần cho phép trải nghiệm chơi game/sử dụng các ứng dụng thực tế ảo trở nên chân thực hơn.', N'Apple A17 Pro Bionic', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (189, NULL, NULL, N'99 x 60 x 39 mm
', NULL, N'78 g
', N'Đen
', N'Nhằm để giảm thiểu những sự phiền toái và giới hạn khoảng cách do chuột máy tính có dây thì chuột không dây Logitech M221 được ra đời. Với công nghệ không dây 2.4GHz, chuột Logitech M221 cho phép người dùng kết nối xa lên đến 10m.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (190, NULL, NULL, NULL, NULL, N'96 g
', N'Đen
', N'Chuột không dây Logitech M220 mang đến nhiều tính năng nổi bật để cải thiện trải nghiệm làm việc của bạn. Ngoài ra, sản phẩm có kích thước nhỏ gọn và công nghệ SilentTouch để bạn tập trung hoàn thành công việc hiệu quả hơn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (191, NULL, NULL, NULL, NULL, N'70.5 g
', N'Đen
', N'Chuột không dây Logitech M171 là một sự lựa chọn tốt với những tính năng nổi bật đáng kinh ngạc. Từ khả năng kết nối tiện lợi đến thiết kế đa dụng và khả năng điều khiển mượt mà, chuột máy tính này đem lại sự tiện nghi và hiệu suất tuyệt vời cho người dùng trong mọi tình huống.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (192, NULL, NULL, NULL, NULL, N'810 g
', N'Đen
', N'Bàn phím cơ có dây iCore ICK10 tập trung vào sự bền bỉ, hiệu suất đỉnh cao, đa dạng tính năng và tính tương thích đa nền tảng, mang lại trải nghiệm tối ưu cho cả công việc và giải trí. Với nhiều tính năng nổi bật, bàn phím cơ này sẽ mang đến trải nghiệm gõ phím và chơi game tốt nhất cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (193, NULL, NULL, NULL, NULL, N'415 g
', N'Đen
', N'Bàn phím cơ có dây iCore ICK10 tập trung vào sự bền bỉ, hiệu suất đỉnh cao, đa dạng tính năng và tính tương thích đa nền tảng, mang lại trải nghiệm tối ưu cho cả công việc và giải trí. Với nhiều tính năng nổi bật, bàn phím cơ này sẽ mang đến trải nghiệm gõ phím và chơi game tốt nhất cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (194, NULL, NULL, NULL, NULL, N'725 g
', N'Xám Trắng
', N'Bàn phím cơ có dây iCore ICK10 tập trung vào sự bền bỉ, hiệu suất đỉnh cao, đa dạng tính năng và tính tương thích đa nền tảng, mang lại trải nghiệm tối ưu cho cả công việc và giải trí. Với nhiều tính năng nổi bật, bàn phím cơ này sẽ mang đến trải nghiệm gõ phím và chơi game tốt nhất cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (195, NULL, NULL, NULL, NULL, N'807 g
', N'Đen
', N'Bàn phím cơ có dây iCore ICK10 tập trung vào sự bền bỉ, hiệu suất đỉnh cao, đa dạng tính năng và tính tương thích đa nền tảng, mang lại trải nghiệm tối ưu cho cả công việc và giải trí. Với nhiều tính năng nổi bật, bàn phím cơ này sẽ mang đến trải nghiệm gõ phím và chơi game tốt nhất cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (196, NULL, NULL, NULL, NULL, N'770 g
', N'Đen
', N'Bàn phím cơ có dây iCore ICK10 tập trung vào sự bền bỉ, hiệu suất đỉnh cao, đa dạng tính năng và tính tương thích đa nền tảng, mang lại trải nghiệm tối ưu cho cả công việc và giải trí. Với nhiều tính năng nổi bật, bàn phím cơ này sẽ mang đến trải nghiệm gõ phím và chơi game tốt nhất cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (197, NULL, NULL, NULL, NULL, N'639 g
', N'Đen
', N'Bàn phím cơ có dây iCore ICK10 tập trung vào sự bền bỉ, hiệu suất đỉnh cao, đa dạng tính năng và tính tương thích đa nền tảng, mang lại trải nghiệm tối ưu cho cả công việc và giải trí. Với nhiều tính năng nổi bật, bàn phím cơ này sẽ mang đến trải nghiệm gõ phím và chơi game tốt nhất cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (198, NULL, NULL, NULL, NULL, N'790 g
', N'Đen
', N'Bàn phím cơ có dây iCore ICK10 tập trung vào sự bền bỉ, hiệu suất đỉnh cao, đa dạng tính năng và tính tương thích đa nền tảng, mang lại trải nghiệm tối ưu cho cả công việc và giải trí. Với nhiều tính năng nổi bật, bàn phím cơ này sẽ mang đến trải nghiệm gõ phím và chơi game tốt nhất cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (199, NULL, NULL, N'385 *135*40 mm
', NULL, N'0.75 kg
', N'Đen
', N'Bàn phím cơ có dây iCore ICK10 tập trung vào sự bền bỉ, hiệu suất đỉnh cao, đa dạng tính năng và tính tương thích đa nền tảng, mang lại trải nghiệm tối ưu cho cả công việc và giải trí. Với nhiều tính năng nổi bật, bàn phím cơ này sẽ mang đến trải nghiệm gõ phím và chơi game tốt nhất cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (201, NULL, NULL, N'7.3 x 4.3 x 2.6 cm
', NULL, N'181 g
', N'Trắng
', N'Khi Apple và Samsung đã lược bỏ đi củ sạc đi kèm trong hộp bán lẻ, bạn sẽ cần phải tìm mua một củ sạc chất lượng để sạc lại iPhone và điện thoại Galaxy của bạn. Khi đó, củ sạc nhanh Belkin 25W USB-C PD 3.0 PPS sẽ là một lựa chọn đáng để quan tâm. Củ sạc này được tối ưu hoá để hoạt động hoàn hảo các thiết bị hỗ trợ USB-C PD khác.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (202, NULL, NULL, N'13.5 x 13.5 x 13 cm
', NULL, N'830 g
', N'Trắng
', N'Với Belkin Boost Charge Pro MagSafe 15W, bạn có thể sạc ba thiết bị của Apple cùng lúc qua công nghệ không dây hiện đại. Sản phẩm cũng có thiết kế tương lai với chất liệu thép không gỉ, hỗ trợ sạc nhanh và kích thước nhỏ gọn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (264, NULL, NULL, N'40mm
', N'580mAh
', NULL, N'Xám
', N'Xiaomi Band 8 Pro mang đến nhiều cải tiến vượt trội so với thế hệ tiền nhiệm, hứa hẹn sẽ là một lựa chọn tuyệt vời cho những ai đang tìm kiếm một chiếc smartband hiện đại và toàn diện. Sản phẩm có thiết kế nhỏ gọn, thích hợp với nhiều kích thước cổ tay của người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (265, NULL, NULL, N'41mm
', N'430mAh
', NULL, N'Hồng
', N'Samsung Galaxy Fit3 mang đến một trải nghiệm hoàn toàn mới so với thế hệ tiền nhiệm với màn hình lớn 1.6 inch, đi cùng nhiều tính năng tiên tiến hỗ trợ theo dõi sức khỏe và luyện tập thể thao hiệu quả. Nổi bật nhất là thời lượng pin ấn tượng, đáp ứng nhu cầu sử dụng cơ bản trong nhiều ngày liền.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (266, NULL, NULL, N'43mm
', N'452mAh
', NULL, N'Đen
', N'Đồng hồ thông minh BeFit Active 2 42mm là sự kết hợp tuyệt vời giữa thời trang và công nghệ hiện đại. Vẻ ngoài của đồng hồ phù hợp với mọi phong cách, từ cá tính đến lịch lãm. Các tính năng thông minh trên đồng hồ giúp người dùng dễ dàng theo dõi sức khỏe và hoạt động thể thao một cách hiệu quả.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (415, NULL, NULL, N'43inch 
', N'150W
', N'6.8kg
', N'Đen
', N'Thiết kế 3 cạnh không viền, Phương tiện giải trí và thư giãn dành cho cả gia đình, Công nghệ PurColor độc quyền, Bộ vi xử lý Crystal 4K đời mới, Hệ màu sống động và chi tiết, Công nghệ âm thanh Q-Symphony
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (113, N'8 GB', N'128GB', N'	Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 6.7" & Phụ 3.4"', N'	Li-Po; 3700 mAh', N'189 gram', N'Green', N'Galaxy Z Flip5 thu hút đông đảo người dùng với phong cách thiết kế gập độc đáo nhưng không kém phần thời trang, cá tính. Đi kèm đó là hiệu năng mạnh mẽ cùng hàng loạt tính năng công nghệ hiện đại, hứa hẹn sẽ giúp bạn nâng tầm trải nghiệm lên một đỉnh cao mới.', N'	Snapdragon® 8 Gen 2 dành cho Galaxy', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (114, N'8 GB', N'	128 GB', N'Infinity O; Dynamic AMOLED 2X; Full HD+ (2340 x 1080 Pixels) (FHD+) ; 6.4" - Tần số quét 120 Hz; 1200 nits; Kính cường lực Corning Gorilla Glass Victus', N'4500 mAh; Hỗ trợ sạc tối đa 25 W', N'200 gram', N'Tím', N'Samsung Galaxy S21 FE 5G – Smartphone hội tụ mọi ước mơ của người dùng. Giá hợp lý, thiết kế sang chảnh ấn tượng, chụp ảnh tuyệt đỉnh, hiệu suất ngưỡng mộ, màn hình siêu chất,... hứa hẹn đem đến những trải nghiệm hoàn hảo nhất.', N'	Exynos 2100; 1 nhân 2.9 GHz, 3 nhân 2.8 GHz & 4 nhân 2.2 GHz; Mali-G78 MP14', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (116, N'12GB', N'256GB', N'	Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"', N'	Li-Po; 4400 mAh', N'211 gram', N'Vàng Gold', N'Samsung Galaxy Z Fold5 ra mắt đã khẳng định vị thế nhà sản xuất điện thoại màn hình gập tiên phong của Samsung, mạnh mẽ bứt phá mọi ranh giới và dẫn đầu với công nghệ bản lề gập Flex tiên tiến nhất. Thiết bị mở ra loạt trải nghiệm toàn diện và thời thượng nhất với 2 màn hình lớn, hiệu năng cấu hình vượt trội, bút S-Pen thông, chạy đa nhiệm tối ưu, tăng hiệu quả công việc khi sử dụng Galaxy Z Fold5.', N'Snapdragon® 8 Gen 2 dành cho Galaxy', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (118, N'8 GB', N'	128 GB', N'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLED; Chính: FHD+ (2640 x 1080 Pixels) x Phụ: (260 x 512 Pixels); Chính 6.7" & Phụ 1.9" - Tần số quét 120 Hz; 1200 nits; Chính: Ultra Thin Glass & Phụ: Corning Gorilla Glass Victus+', N'Li-Ion 3700 mAh', N'211 gram', N'Blue', N'Samsung Galaxy Z Flip4 – chiếc smartphone nắp gập xịn sò bậc nhất thị trường di động đánh dấu cho sự phát triển vượt bậc về công nghệ. Không chỉ đơn thuần là một chiếc smartphone cao cấp, Galaxy Z Flip4 còn là món phụ kiện thời trang tuyệt vời cho các quý cô trong dịp cuối năm nay.', N'	Snapdragon 8+ Gen 1 8 nhân; 1 nhân 3.18 GHz, 3 nhân 2.7 GHz & 4 nhân 2 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (120, N'8 GB', N'512GB', N'	Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 6.7" & Phụ 3.4"', N'Li-Po; 3700 mAh', N'170 gram', N'Blue', N'Galaxy Z Flip5 thu hút đông đảo người dùng với phong cách thiết kế gập độc đáo nhưng không kém phần thời trang, cá tính. Đi kèm đó là hiệu năng mạnh mẽ cùng hàng loạt tính năng công nghệ hiện đại, hứa hẹn sẽ giúp bạn nâng tầm trải nghiệm lên một đỉnh cao mới.', N'	Snapdragon® 8 Gen 2 dành cho Galaxy', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (121, N'12GB', N'1TB', N'	Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"', N'Li-Po; 4400 mAh', N'170 gram', N'Vàng Gold', N'Samsung Galaxy Z Fold5 1TB là phiên bản sở hữu dung lượng bộ nhớ cao nhất, tích hợp màn hình Dynamic AMOLED 2X cao cấp siêu sắc nét và hiệu suất xử lý tuyệt vời với trang bị chipset Snapdragon 8 Gen 2 for Galaxy. Đi kèm còn có cụm 3 camera sau nổi bật, hỗ trợ tính năng quay chụp đa dạng, chất lượng cao và viên pin 4400mAh bền bỉ, cùng sạc nhanh 25W, giúp rút ngắn thời gian sạc hiệu quả.', N'	Snapdragon® 8 Gen 2 dành cho Galaxy', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (122, N'12GB', N'512GB', N'6.8"; 3088 x 1440; 1 - 120 Hz; 1750 nits; Infinity O; Corning® Gorilla® Glass Victus® 2', N'	5000 mAh; 45 W', N'170 gram', N'Đen', N'Samsung Galaxy S23 Ultra viết tiếp huyền thoại từ người tiền nhiệm. Không hào nhoáng về diện mạo nhưng S23 Ultra vẫn thể hiện được nét đẹp bền vững theo thời gian. Đặc biệt, đem đến cho người dùng sức mạnh đỉnh cao từ camera 200MP và vi xử lý Snapdragon 8 Gen 2 độc quyền. ', N'	Snapdragon® 8 Gen 2 Mobile Platform for Galaxy (4nm); 3.36 GHz, 2.8 GHz, 2 GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (123, N'	8 GB', N'	256 GB', N'AMOLED; 6.7 inches; Full HD+ (1080 x 2412 Pixels); Màn hình đục lỗ (Nốt ruồi); 120Hz, Kính cường lực AGC DT-Star2; 1.07 tỷ màu; HDR10+, Tỷ lệ hiển thị 93%, 950 nits, Viền cong 3D', N'	5000mAh (typ); 67 W', N'200 gram', N'Blue', N'Tiếp nối sự thành công của thế hệ trước, năm nay OPPO lại tiếp tục ra mắt dòng Reno10 5G với nhiều điểm nhấn nổi bật. Trong số đó có thể kể đến như thiết kế trẻ trung, bắt mắt, màn hình sắc nét mượt mà, hiệu năng ổn định, pin lớn và camera chụp ảnh ấn tượng. Thiết bị hứa hẹn sẽ được đông đảo người dùng săn đón ngay khi lên kệ.', N'	MediaTek Dimensity 7050 5G', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (124, N'	8 GB', N'	256 GB', N'	AMOLED; 6.4"; Full HD+ (1080 x 2400 Pixels); 90 Hz; 430 nits; Màn hình đục lỗ', N'	5000 mAh; 67 W', N'221 gram', N'Green', N'OPPO A78 là mẫu smartphone tầm trung mới nhất vừa được OPPO trình làng trong thời gian qua. Thiết bị sở hữu nhiều điểm nhấn nổi bật như thiết kế sang trọng, hiện đại, màu sắc cá tính, hiệu năng ổn đáp ứng tốt nhu cầu sử dụng hàng ngày, pin lớn và camera 50 MP xịn sò. Đây sẽ là sự lựa chọn tuyệt vời giúp bạn bắt trọn xu hướng thiết kế năm nay. ', N'	Snapdragon 680 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (125, N'	8 GB', N'	256 GB', N'	AMOLED; 6.4"; Full HD+ (1080 x 2400 Pixels); 90 Hz; 430 nits; Màn hình đục lỗ', N'	5000 mAh; 67 W', N'221 gram', N'Cam', N'OPPO Reno8 T – Smartphone tầm trung mới vừa được ra mắt để lại ấn tượng tốt nhờ sở hữu nhiều tính năng cao cấp. Camera 100MP chụp ảnh siêu ngầu, thiết kế năng động trẻ trung, pin khủng 5000 mAh,… Reno8 T hứa hẹn sẽ đem đến những trải nghiệm thú vị cho người dùng.', N'	Snapdragon 680 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (126, N'	4 GB', N'128GB', N'IPS LCD 6.56" HD+', N'	5000 mAh, 10 W', N'200 gram', N'Blue', N'Tháng 10 vừa qua, OPPO đã chính thức ra mắt mẫu smartphone giá rẻ mới của hãng tại thị trường Việt Nam mang tên OPPO A18. Thiết bị gây sự chú ý với vẻ ngoài sang trọng, hiện đại, màn hình lớn mượt mà, hiệu năng ổn định và thời lượng pin lâu dài, hứa hẹn sẽ mang đến cho người dùng trải nghiệm sử dụng thú vị. ', N'	Snapdragon 680 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (127, N'12GB', N'256GB', N'AMOLED Chính 6.8" & Phụ 3.26" Full HD+', N'Li-Po 4300 mAh, 44 W', N'170 gram', N'Gold', N'OPPO Find N3 Flip là siêu phẩm gập mới nhất của OPPO vừa được trình làng tại Việt Nam cách đây không lâu. Thiết bị gây ấn tượng với vẻ ngoài trẻ trung, thời thượng, hiệu năng mạnh mẽ ổn định, camera 50 MP sắc nét cùng thiết kế bản lề cải tiến, hứa hẹn sẽ giúp trải nghiệm của người dùng được nâng lên một tầm cao mới.', N'	Snapdragon® 8 Gen 2 dành cho Galaxy', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (128, N'	4 GB', N'128GB', N'IPS LCD, 6.72 inch, Full HD+', N'5000mAh (Typ)', N'200 gram', N'Blue', N'OPPO A58 là dòng smartphone tầm trung đại diện cho sự đổi mới và sáng tạo của OPPO. Thiết bị nổi bật với thiết kế sang trọng, hiện đại, màn hình sắc nét, cấu hình ổn cùng camera xịn sò. Với những thông số này, OPPO A58 hứa hẹn sẽ đáp ứng tốt mọi nhu cầu hàng ngày của người dùng.', N'	Exynos 1480', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (129, N'8 GB', N'256GB', N'AMOLED; Màn hình chính: 6.8''''; Màn hình đục lỗ; Full HD+ (2520 x 1080 Pixels); 120 Hz; Kính siêu mỏng Ultra Thin Glass (UTG); 1200 nits. Màn hình phụ: 3.26''''; 720 x 382 Pixels; 60 Hz; Kính cường lực Gorilla Glass 5; 800 nits', N'4300 mAh (Typ); Siêu sạc nhanh SuperVOOC 44 W', N'211 gram', N'Tím', N'OPPO Find N2 Flip là siêu phẩm gập vừa được trình làng của OPPO, góp phần mở ra một kỷ nguyên gập sáng tạo thế hệ mới. Kết hợp với cấu hình mạnh mẽ, camera ấn tượng cùng viên pin lớn hứa hẹn sẽ mang đến cho bạn những trải nghiệm sử dụng tuyệt vời được gói gọn trong một thiết kế nhỏ gọn nhưng không kém phần sang trọng, cao cấp. ', N'	MediaTek Dimensity 9000+ 5G', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (130, N'	4 GB', N'128GB', N'IPS LCD 6.56" HD+', N'	5000 mAh, 10 W', N'200 gram', N'Gold', N'OPPO A17K là chiếc smartphone được nâng cấp nhiều về dung lượng pin, màn hình sắc nét và một hiệu năng ổn định. ', N'Helio G35, tối đa 2.3GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (132, N'16GB', N'512GB', N'	AMOLED Chính 7.82" & Phụ 6.31" Quad HD+ (2K+)', N'4805 mAh, 67 W', N'221 gram', N'Gold', N'OPPO Find N3 là một sản phẩm đột phá của OPPO với sự kết hợp hoàn hảo giữa vẻ ngoài hiện đại, sang trọng và cấu hình phần cứng mạnh mẽ bên trong. Hứa hẹn sẽ mang lại cho người dùng trải nghiệm sử dụng tuyệt vời.', N'Qualcomm Snapdragon® 8 Gen 2', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (131, N'8 GB', N'128 GB', N'	AMOLED; 6.7 inches; Full HD+ (1080 x 2412 Pixels); Màn hình đục lỗ (Nốt ruồi); 120Hz, Kính cường lực AGC DT-Star2; 1.07 tỷ màu; HDR10+, Tỷ lệ hiển thị 93%, 950 nits, Viền cong 3D', N'	5000mAh (typ); 67 W', N'221 gram', N'Blue', N'Tiếp nối sự thành công của thế hệ trước, năm nay OPPO lại tiếp tục ra mắt dòng Reno10 5G với nhiều điểm nhấn nổi bật. Trong số đó có thể kể đến như thiết kế trẻ trung, bắt mắt, màn hình sắc nét mượt mà, hiệu năng ổn định, pin lớn và camera chụp ảnh ấn tượng. Thiết bị hứa hẹn sẽ được đông đảo người dùng săn đón ngay khi lên kệ.', N'	MediaTek Dimensity 7050 5G', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (133, N'8 GB', N'256GB', N'AMOLED; Màn hình chính: 6.8''''; Màn hình đục lỗ; Full HD+ (2520 x 1080 Pixels); 120 Hz; Kính siêu mỏng Ultra Thin Glass (UTG); 1200 nits. Màn hình phụ: 3.26''''; 720 x 382 Pixels; 60 Hz; Kính cường lực Gorilla Glass 5; 800 nits', N'4300 mAh (Typ); Siêu sạc nhanh SuperVOOC 44 W', N'211 gram', N'Green', N'Ngay khi ra mắt, Reno11 F 5G đã trở thành tâm điểm chú ý của giới công nghệ khi sở hữu diện mạo đẹp mắt cùng nhiều tính năng công nghệ hấp dẫn trong phân khúc tầm trung.', N'	Dimensity 7050 5G', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (134, N'12GB', N'256GB', N'	AMOLED 6.36" 1.5K', N'	4610 mAh Li-Po', N'211 gram', N'Green', N'Nếu bạn đang có nhu cầu tìm một chiếc smartphone cao cấp lại có thiết kế nhỏ gọn thì Xiaomi 14 là sự lựa chọn hoàn hảo nhất. Không những có sự nâng cấp về thiết kế, màn hình, camera, hiệu năng cho tới pin & sạc của Xiaomi đều được làm chỉn chu, hứa hẹn sẽ tiếp tục tạo nên cơn sốt.', N'	Snapdragon 8 Gen 3', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (135, N'6GB', N'128GB', N'	Full HD+ (1080 x 2400 Pixels)', N'	33 W Sạc pin nhanh, Tiết kiệm pin', N'200 gram', N'Gold', N'Redmi Note 13 được kỳ vọng sẽ tạo nên cơn sốt mới tương tự như thế hệ tiền nhiệm Redmi Note 12 nhờ sở hữu vẻ ngoài hiện đại, màn hình bắt mắt, hiệu năng tốt cùng camera 108 MP ấn tượng. Hứa hẹn sẽ mang đến cho người dùng những trải nghiệm tuyệt vời trên điện thoại.', N'	4X Arm Cortex-A73 up to 2.8GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (136, N'6GB', N'128GB', N'	Full HD+ (1080 x 2400 Pixels)', N'	33 W Sạc pin nhanh, Tiết kiệm pin', N'200 gram', N'Blue', N'Xiaomi Redmi 13C là một trong những mẫu smartphone chất lượng có giá cả phải chăng được đông đảo người dùng yêu thích trên thị trường hiện nay. Đây là minh chứng thể hiện sự nỗ lực không ngừng của Xiaomi nhằm mang đến những sản phẩm tốt, giúp nâng cao trải nghiệm sử dụng của người dùng.', N'MediaTek Helio G85 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (138, N'8 GB', N'256GB', N'	AMOLED 6,67" FHD+ 20:9, 2712 x 1220', N'	4610 mAh Li-Po', N'211 gram', N'Black', N'Ngay khi ra mắt vào tháng 9/2023, Xiaomi 13T đã thu hút sự chú ý của đông đảo người dùng. Đặc biệt là với những người đam mê chụp ảnh nhờ sở hữu cụm camera hợp tác với thương hiệu sản xuất máy ảnh Leica danh tiếng. Bên cạnh đó, thiết bị cũng gây ấn tượng với thiết kế bắt mắt, màn hình sống động sắc nét, hiệu năng mạnh mẽ trong phân khúc cùng viên pin khủng, hứa hẹn sẽ mang đến cho người dùng những trải nghiệm đầy thú vị.', N'Helio G35, tối đa 2.3GHz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (140, N'	4 GB', N'32GB', N'IPS, LCD, 6.52"HD+', N'Li-Po, 5000 mAh', N'221 gram', N'Black', N'Dù thuộc phân khúc smartphone giá rẻ song Redmi A2 vẫn mang đến cho người dùng những trải nghiệm hấp dẫn như thiết kế đẹp mắt, màn hình to rõ, hiệu năng ổn định cùng thời lượng pin dài lâu. Có thể nói, đây sẽ là sự lựa chọn hoàn hảo dành cho những ai muốn sở hữu một chiếc điện thoại đơn giản nhưng làm việc vô cùng hiệu quả.', N'	MediaTek Helio G36 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (142, N'	4 GB', N'32GB', N'IPS, LCD, 6.52"HD+', N'Li-Po, 5000 mAh', N'221 gram', N'Black', N'Dù thuộc phân khúc smartphone giá rẻ song Redmi A2 vẫn mang đến cho người dùng những trải nghiệm hấp dẫn như thiết kế đẹp mắt, màn hình to rõ, hiệu năng ổn định cùng thời lượng pin dài lâu. Có thể nói, đây sẽ là sự lựa chọn hoàn hảo dành cho những ai muốn sở hữu một chiếc điện thoại đơn giản nhưng làm việc vô cùng hiệu quả.', N'	MediaTek Helio G36 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (143, N'8 GB', N'256GB', N'IPS, LCD, 6.52"HD+', N'	4610 mAh Li-Po', N'211 gram', N'White', N'Redmi Note 12 Pro là mẫu smartphone vừa được Redmi trình làng gần đây với nhiều điểm nhấn đáng chú ý. Nổi bật nhất có thể kể đến là thiết kế trẻ trung, hợp xu hướng, màn hình rực rỡ, cấu hình mạnh mẽ, camera ấn tượng, hứa hẹn sẽ đáp ứng mượt mà phần lớn nhu cầu sử dụng của bạn.', N'MediaTek Dimensity 1080 6nm', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (145, N'8 GB', N'128GB', N'AMOLED 6.67" Full HD+', N'5000 mAh, 67 W Li-Po', N'170 gram', N'Blue', N'Redmi Note 13 Pro là mẫu smartphone mới của Xiaomi vừa được ra mắt trong năm 2024. Thiết bị để lại nhiều ấn tượng trong lòng người dùng nhờ sở hữu thiết kế bắt mắt, hiệu năng tốt, camera xịn sò, pin lớn cùng giá bán phải chăng. Với những trang bị này, Redmi Note 13 Pro sẽ giúp bạn có trải nghiệm sử dụng đầy thú vị, đáp ứng mọi nhu cầu của bạn trong cuộc sống hiện đại ngày nay', N'MediaTek Helio G99-Ultra 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (146, N'4GB', N'128GB', N'IPS LCD, 6.71", HD+', N'	5000 mAh, 10 W Li-Po', N'170 gram', N'Black', N'Đầu năm 2024, Xiaomi đã giới thiệu đến người dùng một mẫu điện thoại giá rẻ mới mang tên Redmi A3. Thiết bị nổi trội với diện mạo vuông vức hiện đại, màn hình rộng rãi, cấu hình ổn định và thời lượng pin dài. Hứa hẹn sẽ đáp ứng tốt mọi nhu cầu cơ bản hàng ngày và trở thành người bạn đồng hành lý tưởng cùng bạn khám phá muôn nơi.', N'	MediaTek Helio G36 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (147, N'8GB', N'256 GB', N'	AMOLED; 6.67"; Full HD+ (1080 x 2400 Pixels); 120 Hz; 1100 nits', N'	5000 mAh (typ); 67 W', N'211 gram', N'Black', N'Xiaomi Redmi Note 11 Pro 5G hội tụ đầy đủ những điểm nhấn ấn tượng của một chiếc điện thoại tầm trung như màn hình AMOLED 120Hz, chip Snapdragon 695 mạnh mẽ hỗ trợ công nghệ 5G ưu việt, camera 108MP số một phân khúc, viên pin lớn 5.000mAh cùng sạc nhanh lên tới 67W. Sản phẩm hứa hẹn sẽ mang đến nhiều trải nghiệm thú vị, hấp dẫn cho người dùng.', N'	Snapdragon 695; 2.2ghz', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (148, N'8GB', N'256 GB', N'i	1.5K (1220 x 2712 Pixels)', N'	120W Hypercharge', N'221 gram', N'Black', N'Xiaomi Redmi Note 13 Pro Plus 5G ghi điểm với người dùng Việt khi sở hữu nhiều thông số ấn tượng. Nằm trong phân khúc tầm trung, Redmi Note 13 Pro Plus 5G hứa hẹn sẽ trở thành smartphone quốc dân trong năm 2024. ', N'MediaTek Helio G99-Ultra 8 nhân', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (149, NULL, NULL, NULL, NULL, NULL, N'Trắng
', N'AirPods Pro 2023 là một sản phẩm tai nghe true wireless được nâng cấp đáng kể so với phiên bản cũ. Các tính năng mới nổi bật như cổng sạc USB-C, khả năng chống nước IPX4, chất lượng âm thanh được cải thiện và chống ồn mạnh mẽ sẽ mang lại trải nghiệm tốt hơn cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (163, NULL, NULL, N'54.4 x 21.38 x 46.40 mm
', NULL, NULL, N'Trắng
', N'Với tai nghe AirPods 3, Apple đem đến những cải tiến hiệu quả ở cả thiết kế, thời lượng pin, chất âm và cảm ứng lực nhằm đem lại trải nghiệm sử dụng trọn vẹn trên tất cả mọi khía cạnh. Hãy thoải mái tận hưởng những công nghệ ưu việt nhất trên AirPods 3.
', NULL, NULL, NULL)
GO
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (203, NULL, NULL, N'46 x 28 x 28 mm
', NULL, N'32 g
', N'Trắng
', N'Nếu bạn đang loay hoay kiếm tìm một giải pháp sạc hiệu quả cho iPhone 12, smartphone Android hay các loại máy tính bảng trong nhà thì củ sạc nhanh Anker 20W Powerport III A2633 này là sự lựa chọn lý tưởng nhất. Thiết kế nano siêu nhỏ gọn, khả năng sạc tốc độ cao và độ an toàn đảm bảo từ thương hiệu pin sạc dự phòng hàng đầu thế giới là những mô tả ngắn gọn về sản phẩm này.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (204, N'8GB
', N'SSD 256GB PCIE
', N'365 x 200 x 426 mm
', NULL, NULL, NULL, N'PC CPS Gaming G02 là loại PC gaming dành cho các game thủ có yêu cầu cao về đồ họa. PC được chế tác từ các linh kiện chất lượng cao, cấu hình mạnh mẽ mang tới hiệu năng xuất sắc. Hãy xem đoạn mô tả dưới đây để có lựa chọn chính xác trước khi mua PC.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (205, N'8GB
', N'SSD 256GB M2 PCIe
', NULL, NULL, NULL, NULL, N' PC CPS Gaming G14 sở hữu bộ vi xử lý Intel Core i3-12100F, 8GB RAM và ổ cứng SSD 256GB để có được hiệu năng ổn định cho các mục đích làm việc, giải trí. Nhờ được trang bị card đồ hoạ rời Asus Dual GTX 1650 4G, PC Gaming G14 sẽ còn phục vụ tốt cả các tác vụ liên quan tới thiết kế, đồ hoạ. Với thùng máy Xigmatek Endorphin M II 3F, sản phẩm PC Gaming sẽ còn có được vẻ ngoài cá tính, hiện đại để khiến cho không gian sử dụng trở nên nổi bật hơn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (206, N'8GB
', N'SSD 250GB
', NULL, NULL, N'4.63 kg
', NULL, N'Máy tính AIO MSI PRO-AP242-12M-213VN trang bị bộ xử lý Intel Core i5-12400, Bộ nhớ RAM 8GB+ SSD 250GB giúp tối ưu hóa hiệu suất, tốc độ bus 3200 MHz. Màn hình 23.8 inch với độ phân giải 1920x1080 và công nghệ MSI Anti-Flicker giúp đảm bảo hình ảnh sắc nét. Với kích thước gọn nhẹ và trọng lượng chỉ 4.63 kg, dễ dàng di chuyển và sắp xếp trong không gian làm việc của bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (207, N'8GB 
', N'256GB 
', N'256GB 	365 x 200 x 426 mm
', NULL, NULL, NULL, N'PC CPS Gaming G1 sở hữu hiệu năng mạnh mẽ, cực đỉnh cùng với đó là giá thành siêu hấp dẫn. Mẫu PC gaming này là lựa chọn tuyệt vời cho những ai đam mê chơi game giải trí cũng như mong muốn có được trải nghiệm vô cùng tuyệt vời.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (209, N'8GB 
', N'512GB
', N'18.00 x 43.00 x 42.80 cm
', NULL, N'8 kg
', NULL, N'PC ASUS ROG Strix G10DK-R5600G003W tự hào khiến mình luôn nổi bật nhờ khung máy được ASUS thiết kế đặc trưng với những đường nét gọn gàng, sắc nét, cứng cáp mang đậm chất gaming tương lai.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (210, N'8GB
', N'512GB
', N'493 x 395 x 13 ~ 165 mm
', NULL, N'4.8 kg
', NULL, N'Máy tính All in One Asus A3202WBAK-WA101W với tốc độ lên đến 4.4GHz , kết hợp với 8GB DDR4 RAM 3200MHz, giúp các tác vụ nhanh chóng và mượt mà hơn. Ổ đĩa cứng 512GB M.2 NVMe PCIe 3.0 SSD cung cấp không gian lưu trữ rộng rãi và tốc độ truy xuất dữ liệu nhanh chóng. Với kích thước 49.3 x 39.5 x 1.3 ~ 16.5 cm và trọng lượng 4.80 kg , điều này giúp tiết kiệm không gian và dễ dàng di chuyển trong không gian làm việc. Card đồ họa được tích hợp trên máy là Intel UHD Graphics , cung cấp hiệu suất đồ họa cơ bản và đáng tin cậy cho các tác vụ hàng ngày.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (212, N'8GB
', N'256GB 
', N'434 × 245 × 473 mm
', NULL, NULL, NULL, N'Là một sản phẩm dành riêng cho giới Game thủ, những chiếc PC CPS Gaming G06 được nâng cấp về hiệu năng để đảm bảo trải nghiệm tuyệt vời và hoàn hảo nhất cho chủ sở hữu. Dưới đây là những thông tin hữu ích về bộ PC gaming này.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (213, N'16GB
', N'SSD 256GB
', N'365 x 200 x 426 mm
', NULL, NULL, NULL, N'Sở hữu thiết kế tối giản, tinh tế cùng hiệu năng mạnh mẽ, chuyển biệt, PC CPS đồ họa D01 sẽ mở ra tiềm năng sáng tạo vô tận cho công việc thiết kế đồ hoạ. Chi tiết về mẫu máy tính đồ họa này ra sao? Tham khảo thông tin cấu hình của PC CPS D01 dành cho đồ hoạ dưới đây nhé!
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (214, N'8GB
', N'240GB
', N'308 x 186 x 353 mm
', NULL, NULL, NULL, N'PC CPS Văn Phòng S4 chính là bộ CPU giá tốt mà bạn cần để hoàn thiện dàn PC với hiệu năng ấn tượng từ các linh kiện có chất lượng cao. Bạn chỉ cần thêm một chiếc màn hình cùng các phụ kiện như chuột, bàn phím,…bạn đã có được những trải nghiệm tuyệt hảo với PC máy tính văn phòng
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (215, N'8GB
', N'256GB 
', N'32.4 x 15.4 x 29.3 cm
', NULL, N'5 kg
', NULL, N'Nếu bạn đang tìm kiếm một thế hệ case máy tính bàn chất lượng cao, đáp ứng mượt mà được các nhu cầu công việc, giải trí hàng ngày thì PC Dell Inspiron 3020MT sẽ là gợi ý không nên bỏ qua. Với hiệu suất mạnh mẽ tới từ CPU Intel thế hệ thứ 13 kèm theo thông số RAM ổn định, mọi trải nghiệm xử lý của người dùng trên phân khúc máy tính bàn này luôn được đảm bảo về tốc độ nhanh chóng và trải nghiệm mượt mà. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (216, N'8GB
', N'SSD 240GB Sata III
', N'297 x 188 x 413 mm
', NULL, NULL, NULL, N'PC CPS Văn Phòng S1 - AMD được xem là mảnh ghép cuối, góp phần tạo nên dàn PC với hiệu năng vượt trội, đáp ứng đầy đủ các nhu cầu. Do đó, hãy cùng xem qua nhiều hơn về bộ máy tính văn phòng
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (217, N'8GB ', N'256GB 
', N'365 x 200 x 426 mm
', NULL, NULL, NULL, N'PC CPS Gaming G04 được đánh giá cao bởi tính năng và thiết kế ấn tượng của sản phẩm, nhiều khách hàng tin tưởng sử dụng trong thời gian dài để thay mới cho máy cũ hiện tại. Mẫu PC gaming này là lựa chọn hàng đầu dành cho các game thủ chuyên nghiệp mang đến quá trình hoạt động bền bỉ và mượt mà.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (219, N'8GB 
', N'240GB
', N'297 x 188 x 413 mm
', NULL, NULL, NULL, N'PC CPS văn phòng S2 là sự kết hợp những điểm ưu việt nhất giữa những linh kiện cao cấp. Từ đó, phiên bản máy tính văn phòng này sẵn sàng đáp ứng được tất cả các tiêu chí mà một người doanh nhân cần trong công việc và giải trí. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (220, N'16GB 
', N'256GB 
', N'400 x 225 x 431 mm
', NULL, NULL, NULL, N'Một trong những cấu hình máy tính đồ họa khá mạnh mẽ được build bởi CellphoneS nhận được nhiều sự quan tâm từ phía người dùng hiện nay là PC CPS đồ hoạ D02. Với hiệu suất hoạt động hàng đầu cùng thiết kế nổi trội, kiểu dáng thời thượng, dòng sản phẩm máy tính thuộc phân khúc giá tầm trung này sẽ đáp ứng được mọi nhu cầu trong công việc, giải trí của người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (221, N'8GB
', N'256GB 
', N'365 x 200 x 426 mm
', NULL, NULL, NULL, N'PC CPS Gaming G05 đem đến hiệu năng vượt trội, xử lý được mọi tựa game 3D. Bên cạnh đó PC gaming còn sở hữu thiết kế rất tinh tế, tạo nên vẻ đẹp riêng cho người dùng. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (223, N'16GB 
', N'500GB 
', N'400 x 225 x 431 mm
', NULL, NULL, NULL, N'400 x 225 x 431 mm				PC CPS đồ họa D04 là một sản phẩm máy tính đồ họa tới từ hệ thống bán lẻ công nghệ CellphoneS. Dòng máy tính này sở hữu cấu hình thật sự nổi bật cùng với ổ cứng SSD 500GB và 2 thanh RAM DDRR 8GB. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (224, N'8GB 
', N'256GB 
', N'365 x 200 x 426 mm
', NULL, NULL, NULL, N'PC CPS Gaming G03 - AMD là một sản phẩm thuộc phân khúc trung đến cao cấp, sở hữu nhiều tính năng đột phá cùng hiệu năng mạnh mẽ. Chiếc PC gaming này không chỉ đáp ứng nhu cầu cơ bản của dân văn phòng mà còn mang đến những trải nghiệm chơi game cực đã cho game thủ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (225, N'32GB
', N'SSD 500GB
', NULL, NULL, NULL, NULL, N' PC CPS Gaming G16 là case PC build sẵn với CPU Intel Core i9-14900K và VGA ASUS ROG STRIX RTX 4070 TI SUPER, mang đến trải nghiệm chơi game tuyệt vời. Ngoài ra, ổ cứng SSD 500GB và RAM 32GB đảm bảo tốc độ truy cập nhanh và xử lý dữ liệu hiệu quả. Vỏ case của sản phẩm PC Gaming này được chế tạo từ chất liệu cao cấp và hệ thống tản nhiệt hiệu quả, đảm bảo sự mát mẻ và ổn định cho các linh kiện bên trong.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (226, N'8GB 
', N'256GB 
', N'365 x 200 x 426 mm
', NULL, NULL, NULL, N'PC CPS Gaming G05 đem đến hiệu năng vượt trội, xử lý được mọi tựa game 3D. Bên cạnh đó PC gaming còn sở hữu thiết kế rất tinh tế, tạo nên vẻ đẹp riêng cho người dùng. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (227, N'8GB 
', N'256GB 
', N'365 x 200 x 426 mm
', NULL, NULL, NULL, N'PC CPS Gaming G03 - AMD là một sản phẩm thuộc phân khúc trung đến cao cấp, sở hữu nhiều tính năng đột phá cùng hiệu năng mạnh mẽ. Chiếc PC gaming này không chỉ đáp ứng nhu cầu cơ bản của dân văn phòng mà còn mang đến những trải nghiệm chơi game cực đã cho game thủ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (228, N'16GB
', N'SSD 500GB M2 PCIe
', NULL, NULL, NULL, NULL, N' PC CPS Gaming G15 sở hữu cấu hình ấn tượng với mainboard Asus Prime B760M-A DDR4 và bộ vi xử lý Intel Core i5 12400F, hỗ trợ mạnh mẽ cho nhu cầu Gaming. Đi kèm theo đó là VGA Asus Dual RTX 4060 OC 8GB cung cấp hiệu suất đồ họa xuất sắc, xử lý mọi yêu cầu phức tạp về hình ảnh. Ngoài ra, thế hệ PC Gaming này G15 này còn bao gồm thông số bộ nhớ ấn tượng với RAM 16GB DDR4 và SSD 500GB tăng tốc độ xử lý và lưu trữ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (229, N'8GB
', N'SSD 256GB
', N'401 x 225 x 431 mm
', NULL, NULL, NULL, N'PC CPS Gaming G07 là một phần không thể thiếu cho dàn PC Gaming của bạn thêm hoàn thiện hơn cả. Với thiết kế đẹp mắt, card đồ họa mạnh mẽ cùng với bộ nhớ dung lượng lớn. Bạn đã có thể thỏa sức lưu trữ dữ liệu, tải các tựa game và tận hưởng khoảng thời gian giải trí bất tận với thiết bị PC gaming này.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (230, N'8GB 
', N'256GB 
', N'386 x 200 x 411 mm
', NULL, NULL, NULL, N'PC CPS Gaming G07 là một phần không thể thiếu cho dàn PC Gaming của bạn thêm hoàn thiện hơn cả. Với thiết kế đẹp mắt, card đồ họa mạnh mẽ cùng với bộ nhớ dung lượng lớn. Bạn đã có thể thỏa sức lưu trữ dữ liệu, tải các tựa game và tận hưởng khoảng thời gian giải trí bất tận với thiết bị PC gaming này.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (232, N'8GB 
', N'512GB
', N'49 x 41.1 x 4.5 - 20.1 cm (W x H x D)
', NULL, NULL, NULL, N'Máy tính All in One Asus A5402WVAK WA014W là dòng máy để bàn chất lượng đáp ứng tốt mọi nhu cầu từ công việc cho đến giải trí. Sản phẩm máy tính văn phòng này nổi bật với những ưu điểm như thiết kế thanh lịch, hiệu năng ổn định và dung lượng lưu trữ lớn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (233, N'8GB 
', N'512GB
', N'"
09.46 x 29.27 x 33.96 cm"
', NULL, N'5 kg
', NULL, N'PC Asus S500SE - 513400035W được trang bị cấu hình mới nhất với CPU intel core i5 thế hệ 13 cùng dung lượng RAM 8GB, hỗ trợ tối đa đến 64GB. Khả năng lưu trữ của máy cũng không hề kém cạnh với 512GB SSD cùng hệ điều hành Windows 11 thế hệ mới nhất. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (234, N'8GB 
', N'240GB
', N'297 x 188 x 413 mm
', NULL, NULL, NULL, N'PC CPS Văn Phòng S3 - AMD là sự kết hợp hoàn hảo giữa linh kiện bền bỉ cùng cấu hình tối ưu. Sản phẩm máy tính văn phòng còn hỗ trợ cho những khả năng nâng cấp về sau cho các dòng phụ kiện máy tính văn phòng này.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (235, N'8GB 
', N'512GB
', N'539 x 423 x 15 ~ 165 mm
', NULL, N'"
5.4 kg"
', NULL, N'Máy tính AIO Asus A3402WBAT-WA187W hướng tới người dùng làm việc chuyên nghiệp, bởi sở hữu cấu hình cực mạnh. Bên cạnh đó, sản phẩm hỗ trợ cảm ứng và đường viền màn hình rất mỏng. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (236, N'8GB 
', N'512GB
', N'"
539 x 423 x 15 ~ 165 mm"
', NULL, N'"
5.4 kg"
', NULL, N'Máy tính AIO ASUS A3402WBAK-WA604W nổi bật như một sản phẩm đa năng với sự kết hợp hoàn hảo giữa thiết kế tinh tế, hiệu năng ấn tượng và tiện ích sử dụng đa dạng. Đây sẽ là một lựa chọn đáng xem xét khi bạn đang tìm kiếm một thiết bị đa năng và hiệu suất cao.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (237, NULL, NULL, N'Cao: 116,6 mm x Rộng: 62,15 mm x Dày: 38,2 mm
', NULL, N'99 g
', NULL, N'Chuột gaming không dây Logitech G304 Lightspeed là sản phẩm đang làm mưa làm gió trên thị trường với nhiều tính năng đặc biệt nổi bật. Với nhiều công phá mới trong thiết kế cùng mức giá thành tương đối rẻ sản phẩm chuột Logitech đã sẵn sàng để mọi người dùng trải nghiệm.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (238, NULL, NULL, N'"
2.16 x 5.71 x 11.35 cm"
', NULL, N'"
0.099 kg"
', NULL, N'Magic Mouse 2021 MK2E3 có thiết kế hiện đại với đường cong uyển chuyển tinh tế, thuộc loại chuột bluetooth không dây đáng sử dụng, mặt trên có logo Apple ẩn hiện sang trọng. Thiết kế phần chân tối ưu, trọng lượng siêu nhẹ chỉ 0.099kg giúp di chuyển dễ dàng nhanh chóng. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (240, NULL, NULL, N'Cao: 116.6 mm x Rộng: 62.15 mm x Dày: 38.2 mm
', NULL, N'"
85 g"
', NULL, N'Sở hữu công nghệ Lightsync, mang thiết kế 6 nút cổ điển cùng DPI lên đến 8.000, chuột Gaming Logitech G102 LightSync sẽ giúp bạn chinh phục mọi tựa game mà bạn yêu thích.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (241, NULL, NULL, N'Cao: 108,2 mm x Rộng: 61 mm x Dày: 38,8 mm
', NULL, N'"
101.4 g"
', NULL, N'Chuột không dây Logitech Signature M650 là mẫu chuột không dây phổ thông, mang đến trải nghiệm tuyệt vời trong từng cú click chuột. Đây sẽ là phiên bản phù hợp với đa dạng người dùng, bao gồm gamer, dân văn phòng, học sinh, sinh viên,…
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (242, NULL, NULL, NULL, NULL, N'"
90g"
', NULL, N'Nhằm giảm thiểu sự phiền toái và giới hạn khoảng cách của chuột có dây thì những chú chuột bluetooth không dây Logitech được ra đời. Với công nghệ kết nối Unifying, chuột có thể dùng cho nhiều thiết bị Wireless khác cùng hãng Logitech, chuột không dây Logitech M331 có khả năng kết nối xa lên tới 10m. Đi cùng là độ bền cao cộng thêm sự ổn định cũng như là tiết kiệm pin giúp sản phẩm này trở thành một sự lựa chọn tốt cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (257, N'8GB + 8GB', N'	256GB', N'	6.7 inch; OLED; FHD+ 2412*1080; 1.07 tỷ màu; 950nit', N'	5000 mAh; Li-Po; Sạc nhanh SuperVOOC 67W', N'221 gram', N'Green', N'realme 11 Pro sở hữu một vẻ ngoài vô cùng cao cấp với mặt lưng da cùng màn hình cong bóng bẩy đẹp mắt, hiệu năng mạnh mẽ và cụm camera cực xịn sò. Với nhiều lợi thế lớn như vậy, Realme 11 Pro sẽ trở thành một đối thủ đáng gờm trong phân khúc cận cao cấp trong nửa cuối năm nay.', N'	Chip Dimensity 7050 5G', NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (267, NULL, NULL, N'47mm
', N'460mAh
', NULL, N'Xám
', N'Đồng hồ thông minh Garmin Forerunner 965 dành cho những ai yêu thích thể thao đặc biệt là bộ môn chạy bộ với hệ thống định vị hiện đại và chế độ luyện tập chuyên nghiệp. Bên cạnh đó, thiết bị này còn được trang bị nhiều chức năng theo dõi sức khỏe, phục vụ người dùng một cách tối ưu nhất.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (268, NULL, NULL, N'43mm
', N'524mAh
', NULL, N'Xanh Ngọc
', N'Forerunner 165 Music 43mm sở hữu thiết kế bền bỉ, năng động, đi cùng màn hình AMOLED sắc nét, mang đến sự thoải mái và tiện lợi cho bạn trong mọi hoạt động. Chiếc đồng hồ này sẽ là người bạn đồng hành lý tưởng cho dù bạn đang tập luyện hay tham gia các sự kiện thể thao. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (269, NULL, NULL, N'45mm
', N'401mAh
', NULL, N'Trắng
', N'"Apple Watch SE 2022 GPS 44mm viền nhôm dây thể thao đã được giới thiệu đến người dùng trên toàn thế giới. Với những cải tiến về công nghệ, hứa hẹn sẽ mang đến cho người sử dụng những trải nghiệm tuyệt vời nhất.
Vẻ ngoài thời thượng, phù hợp với đa dạng người dùng"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (270, NULL, NULL, N'47mm
', N'471mAh
', NULL, N'Tím
', N'Đồng hồ thông minh Samsung Galaxy Watch5 40mm nổi bật với kiểu dáng trang trọng đi cùng với nhiều tiện ích thông minh. Đây cũng được xem là chiếc đồng hồ có sự kết hợp hoàn hảo giữa hiệu năng và thiết kế.Thiết kế năng động, phù hợp với đa dạng phong cách
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (271, NULL, NULL, N'40mm
', N'517mAh
', NULL, N'Nâu
', N'Lấy cảm hứng từ vẻ đẹp thanh lịch và tinh tế, Garmin Lily 2 Classic 34mm dây da mang đến cho phái đẹp một phụ kiện thời trang đẳng cấp, đồng thời là trợ thủ đắc lực giúp theo dõi sức khỏe, tập luyện đúng cách và nâng cao chất lượng cuộc sống.Sở hữu vẻ ngoài thời thượng, nhỏ gọn
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (272, NULL, NULL, N'47mm
', N'472mAh
', NULL, N'Đen
', N'Màn hình hiển thị rõ nét, chống trầy.Mặt của đồng hồ được làm từ kính cường lực hóa học bền bỉ, chống trầy xước, chịu va đập tốt. Màn hình MIP có độ phân giải 208 x 208 pixels cho khả năng hiển thị liên tục thông tin trên mặt đồng hồ trong mọi điều kiện ánh sáng mà vẫn có thể duy trì được lượng pin rất lâu. Điều này giúp tính năng dẫn đường trở nên cực kì hiệu quả.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (273, NULL, NULL, N'43mm
', N'492mAh
', NULL, N'Đen
', N'Với thiết kế sang trọng, hiện đại, tích hợp nhiều tính năng thông minh cùng một thời lượng pin dài. Xiaomi Watch S3 hứa hẹn sẽ là một lựa chọn tuyệt vời cho người dùng yêu thích công nghệ, mong muốn trải nghiệm một chiếc smartwatch đa năng. Sở hữu vẻ ngoài vừa cổ điển vừa hiện đại
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (274, NULL, NULL, N'48mm
', N'449mAh
', NULL, N'Xanh dương
', N'Phong cách mạnh mẽ, đậm chất thể thao.Đồng hồ có mặt hình tròn, khung viền bằng polyme cốt sợi vô cùng cứng cáp kết hợp cùng mặt kính cường lực Gorilla Glass 3 hạn chế trầy xước, nứt vỡ khi có va chạm ngoài ý muốn. Dây đeo bằng silicone mềm mịn, chống thấm tốt mang đến cảm giác khô thoáng cho cổ tay cả ngày dài.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (417, NULL, NULL, N'65inch
', N'160W
', N'16.4kg
', N'Đen
', N'Giải toả căng thẳng và thư giãn với nhiều chế độ giải trí thông minh, Bộ xử lý Crystal 4K, Hệ điều hành Tizen, Công nghệ PurColor, Công nghệ Motion Xcelerator, Độ phân giải 4K, Màn hình 65 inch với thiết kế 3 cạnh không viền
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (263, NULL, NULL, N'40mm
', N'580mAh
', NULL, N'Xám
', N'Xiaomi Band 8 Pro mang đến nhiều cải tiến vượt trội so với thế hệ tiền nhiệm, hứa hẹn sẽ là một lựa chọn tuyệt vời cho những ai đang tìm kiếm một chiếc smartband hiện đại và toàn diện. Sản phẩm có thiết kế nhỏ gọn, thích hợp với nhiều kích thước cổ tay của người dùng.
', NULL, N'qwe', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (277, NULL, NULL, N'45mm
', N'561mAh
', NULL, N'Đen
', N'Xiaomi không ngừng nâng cấp sản phẩm của mình nhằm mang đến những trải nghiệm hài lòng cho người dùng. Với màn hình AMOLED siêu lớn, đi cùng hệ điều hành Hyper OS mới và vô vàn tiện ích cho tập luyện, theo dõi sức khỏe,... Redmi Watch 4 sẽ là thế hệ smartwatch đáng sở hữu, nâng cấp dành cho người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (275, NULL, NULL, N'44mm
', N'469mAh
', NULL, N'Đen Vàng
', N'Phong cách thanh lịch, gọn nhẹ khi đeoVới thiết kế mặt hình tròn vừa mang hơi thở cổ điển vừa có chút gì đó năng động, hiện đại. Phần mặt đồng hồ có khối lượng 24.4 g vô cùng gọn nhẹ, các bạn nữ khi đeo lên tay sẽ không cảm thấy khó nặng nề, khó chịu trong các hoạt động. Sử dụng khung viền nhôm cao cấp hạn chế những hư hại về ngoại hình trong quá trình sử dụng.Dây đeo vải Nylon Fabric mang đến cảm giác thoải mái khi đeo, ngay cả khi bạn sử dụng trong thời gian dài. Chất liệu dây này có khả năng chống chịu tốt với các tác động bên ngoài, đảm bảo độ bền bỉ cho dây đeo trong quá trình sử dụng. Bạn có thể sử dụng trong mọi hoạt động thường ngày từ đi làm, đi chơi đến tập luyện thể thao.Điểm nhấn tạo nên sự khác biệt cho Garmin Lily 2 Classic chính là mặt hoa văn tinh tế. Mặt hoa văn được thiết kế tỉ mỉ, mang đến vẻ đẹp sang trọng và thanh lịch. Không chỉ là một thiết bị theo dõi sức khỏe thông thường, chiếc đồng hồ này còn là món phụ kiện thời trang độc đáo dành cho các bạn nữ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (278, NULL, NULL, N'50mm
', N'544mAh
', NULL, N'Kem
', N'Nâng tầm phong cách và sức khỏe cùng đồng hồ thông minh Garmin Lily 2 34mm. Thiết kế nhỏ gọn, tinh tế với mặt kính hoa văn thanh lịch cùng vô số tính năng theo dõi sức khỏe và tiện ích thông minh. Lily 2 hứa hẹn sẽ trở thành món phụ kiện thời thượng và trợ thủ sức khỏe hoàn hảo dành cho phái đẹp.Kiểu dáng nhỏ gọn, ôm trọn cổ tay
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (279, NULL, NULL, N'45mm
', N'471mAh
', NULL, N'Kem
', N'Sau thành công của Mi Band 7, hãng công nghệ Xiaomi đã cho ra mắt Mi Band 8 với nhiều tính năng theo dõi sức khỏe, hỗ trợ luyện tập thể thao đáp ứng đa dạng nhu cầu sử dụng của người dùng. Với ngoại hình hiện đại, đây cũng sẽ là một món phụ kiện thời trang hoàn hảo cho các bạn trẻ năng động.Kiểu dáng gọn nhẹ, phù hợp với mọi người dùng
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (280, NULL, NULL, N'45mm
', N'595mAh
', NULL, N'Đen
', N'Đồng hồ thông minh Samsung Galaxy Watch5 Pro LTE 45 mm là một trong những mẫu smartwatch được mong chờ nhất của nhà Samsung trong năm 2022. Với thiết kế tinh giản nhưng cao cấp, bên trong sở hữu nhiều tính năng đặc biệt, hứa hẹn sẽ là một món phụ kiện thời trang đứng đầu trong phân khúc.Kiểu dáng sang trọng, đẳng cấp thu hút mọi góc nhìn
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (281, NULL, NULL, N'50mm
', N'473mAh
', NULL, N'Trắng
', N'Xiaomi Redmi Watch 3 với thiết kế trông cực kỳ cao cấp, bên trong trang bị đa dạng các chức năng hỗ trợ luyện tập và theo dõi sức khỏe. Chưa dừng lại ở đó, chiếc đồng hồ thông minh này còn sở hữu hệ thống định vị độc lập hỗ trợ người dùng tốt hơn trong quá trình sử dụng.Kiểu dáng gọn gàng, thoải mái khi đeo
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (282, NULL, NULL, N'42mm
', N'591mAh
', NULL, N'Đen
', N'So với các thể hệ trước thì Mi Band 7 Pro có sự thay đổi lớn về mặt thiết kế. Không những thế, các chức năng bên trong cũng được nâng cấp, sở hữu hệ thống định vị tiên tiến, đa dạng chế độ thể thao và chức năng sức khỏe hiện đại chắc chắn sẽ mang đến cho người dùng những trải nghiệm tuyệt vời nhất.Thiết kế theo xu hướng, gọn nhẹ khi đeo
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (283, NULL, NULL, N'48mm
', N'420mAh
', NULL, N'Xám
', N'Xiaomi Redmi Watch 3 Active sở hữu kiểu dáng hiện đại, thời thượng, đi cùng nhiều tính năng hữu ích từ theo dõi sức khỏe đến luyện tập, hỗ trợ nghe gọi qua kết nối bluetooth,... mang đến trải nghiệm sử dụng tối ưu nhất cho người dùng.Thiết kế thời thượng, năng động phù hợp nhiều phong cách
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (284, NULL, NULL, N'49mm
', N'514mAh
', NULL, N'Đen
', N'Phong cách trẻ trung, thời thượng.Đồng hồ thông minh Garmin Venu 2 mang thiết kế năng động, hợp thời lại vô cùng tinh tế rất được lòng các bạn trẻ sành điệu ngày nay. Khung viền được làm bằng thép không gỉ không lo trầy xước, khối lượng nhẹ kết hợp cùng dây đeo silicone êm ái và vô cùng mềm mịn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (285, NULL, NULL, N'45mm
', N'414mAh
', NULL, N'Vàng
', N'Tự hào là một sản phẩm đồng hồ thông minh mang thương hiệu Việt Nam, BeFit B3 sở hữu đầy đủ những tính năng hữu ích và cần thiết như: đo nhịp tim, theo dõi giấc ngủ, chế độ luyện tập thể thao đa dạng,... với một mức giá dễ chịu mà bạn hoàn toàn có thể sở hữu.Thiết kế thời thượng, dây đeo silicone êm ái
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (286, NULL, NULL, N'42mm
', N'546mAh
', NULL, N'Đen
', N'Xiaomi Watch 2 Pro là một trong số ít đồng hồ thông minh thuộc phân khúc tầm trung được trang bị GPS độc lập và nghe gọi. Ngoài ra, thiết bị còn được trang bị nhiều tính năng hỗ trợ theo dõi sức khỏe và luyện tập thể thao đáp ứng đa dạng nhu cầu sử dụng của người dùng.Mang vẻ ngoài sang trọng, cổ điển
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (287, NULL, NULL, N'49mm
', N'416mAh
', NULL, N'Vàng Hồng
', N'Thiết kế liền mạch, sành điệu.Đồng hồ Samsung Galaxy Watch 4 có vẻ ngoài năng động, trẻ trung đầy cuốn hút với thiết kế mặt tròn quen thuộc dễ thấy ở các mẫu đồng hồ thông minh của Samsung. Đồng hồ có đường kính mặt 40 mm, màn hình 1.2 inch cùng khung viền nhôm cho khối lượng nhẹ, thoải mái đeo cả ngày dài. Ngoài ra, dây đeo silicone không thấm nước, êm nhẹ, ôm trọn cổ tay nhưng không gây khó chịu khi đổ mồ hôi lúc luyện tập.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (289, NULL, NULL, N'44mm
', N'508mAh
', NULL, N'Xanh Bạc Hà
', N'"Garmin Venu SQ 2 là mẫu đồng hồ thông minh có kiểu dáng nhỏ gọn thích hợp cho cả nam và nữ sử dụng. Bên trong thiết kế đẹp mắt là những tính năng sức khỏe, thể thao, định vị,... hỗ trợ tốt trong việc chăm sóc cơ thể của người dùng.
Phong cách tối giản, màn hình chất lượng"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (290, NULL, NULL, N'45mm
', N'476mAh
', NULL, N'Hồng
', N'"BeFit B4 thế hệ đồng hồ thông minh mang ngôn ngữ thiết kế thời thượng, trang bị nhiều tính năng hữu ích, đây sẽ là một sản phẩm phù hợp cho người dùng muốn trải nghiệm những tính năng của một chiếc smartwatch với mức giá vô cùng hợp lý.
Kiểu dáng hiện đại, kích thước màn hình lớn"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (291, NULL, NULL, N'48mm
', N'434mAh
', NULL, N'Nâu
', N'"Befit Sporty 2 Pro với thiết kế nổi bật đã thu hút được rất nhiều sự chú ý khi ra mắt. Không chỉ vậy sản phẩm còn được trang bị rất nhiều tính năng theo dõi sức khỏe, chế độ thể thao, tiện ích thông minh,... phục vụ cho người dùng trong công việc và đời sống hằng ngày.
Thiết kế bắt mắt, gọn gàng"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (292, NULL, NULL, N'43mm
', N'415mAh
', NULL, N'Đen
', N'"Amazfit T-Rex 2 thuộc dòng smartwatch thể thao của nhà Amazfit với thiết kế mạnh mẽ, độ bền vượt trội cùng hệ thống cảm biến hiện đại hỗ trợ tốt hơn trong quá trình tập luyện. Kể từ khi ra mắt sản phẩm này đã thu hút được rất nhiều sự quan tâm của người yêu công nghệ và thể thao. 
Phong cách thiết kế mạnh mẽ, cá tính
Dòng sản phẩm T-Rex luôn sở hữu mặt đồng hồ hình tròn kết hợp cùng các đường nét cứng cáp tạo nên vẻ ngoài vô cùng cá tính. Phần viền bezel được làm nhô cao vừa mang đến nét hầm hố vừa giúp bảo vệ màn hình tốt hơ"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (293, NULL, NULL, N'43mm
', N'532mAh
', NULL, N'Kem
', N'"Đồng hồ thông minh Garmin Lily dây silicone mang thiết kế sang trọng, đa dạng chức năng theo dõi sức khỏe và chế độ hướng tới những ai đang tìm kiếm một thiết bị thông minh đồng hành trong cuộc sống, nâng cao và cải thiện sức khỏe. 
Kiểu dáng thanh lịch, màn hình sắc nét
Đồng hồ thông minh Garmin Lily sở hữu mặt đồng hồ hình tròn kích thước 34.5 mm và có khối lượng nhẹ khoảng 24 gram vô cùng nhỏ gọn, phù hợp với cổ tay của các bạn nữ. Phần khung được làm từ chất liệu polyme bền chắc, có khả năng chịu sự va đập và khá nhẹ. Dây đồng hồ được làm từ silicone có độ êm ái khi đeo, không gây bí bách trong quá trình sử dụng và không thấm nước."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (294, NULL, NULL, N'49mm
', N'488mAh
', NULL, N'Đen
', N'"Chinh phục mọi môn thể thao ngoài trời cùng đồng hồ thông minh Garmin Epix Pro Gen 2 với các tính năng luyện tập nâng cao, hệ thống điều hướng vượt trội và một thời lượng pin siêu dài. Đây sẽ là một thiết bị đáp ứng hoàn hảo các nhu cầu luyện tập chuyên nghiệp của vận động viên lẫn tín đồ yêu thể thao.
Các tính năng nâng cao hiệu suất luyện tập
Bên cạnh các môn thể thao thì chiếc đồng hồ thông minh Garmin Epix này còn được trang bị nhiều tính năng hỗ trợ người dùng nâng cao hiệu suất luyện tập như: Chiến lược về nhịp độ (PacePro) sẽ xây dựng một chiến lược nhịp độ phù hợp với quãng đường và khả năng của người dùng cũng như đưa ra gợi ý về tốc độ khi chạy ở những chặng kế tiếp giúp đạt được một kết quả tốt. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (297, NULL, NULL, N'42mm
', N'411mAh
', NULL, N'Đen
', N'"Garmin Fenix 7 Pro Solar Titanium là phiên bản smartwatch mới nhất được hãng trình làng, không chỉ sở hữu những tính năng ưu việt nhất của dòng Fenix, thế hệ này được trang bị thêm những tính năng mới, hỗ trợ người dùng thể thao chuyên nghiệp nâng cao hiệu suất tập luyện của mình một cách tối ưu nhất. 
Sở hữu những tính năng thể thao cao cấp hàng đầu
Với chiếc Garmin Fenix mới nhất, hãng đã trang bị thêm hai chỉ số mới cho thiết bị gồm: Điểm sức bền (Endurance Score) đánh giá hiệu quả của việc tập luyện đối với các mức độ sức bền tổng thể. Còn với Điểm đồi (Hill Score) sẽ theo dõi mức VO2 Max và lịch sử tập luyện để đánh giá khả năng leo dốc của người dùng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (296, NULL, NULL, N'43mm
', N'538mAh
', NULL, N'Xám
', N'"Garmin không ngừng củng cố vị thế của mình trên thị trường smartwatch thể thao chuyên nghiệp, khi liên tục nâng cấp các tính năng mới cho thiết bị của mình nhằm mang lại trải nghiệm sử dụng tối ưu nhất cho người dùng, nổi bậc trong đó có chiếc Garmin Fenix 7X Pro Solar Titanium 51mm.
Đồng hồ Garmin Fenix được trang bị nhiều tính năng thể thao cao cấp và chuyên nghiệp như: Chiến lược về nhịp độ (PacePro) - cung cấp cho bạn chiến lược cụ thể về nhịp độ, Sức bền theo thời gian thực (Real-time Stamina) - tự động theo dõi hoạt động của bạn và nhắc nhở khi bạn đang gắng sức, tránh bị tình trạng quá tải và ảnh hưởng đến các cơ của bạn khi luyện tập.

Hay như với tính năng Khuyến cáo thời gian phục hồi (Recovery Time Advisor), đồng hồ sẽ thông báo sau mỗi buổi tập cho bạn biết khi nào bạn sẽ sẵn sàng cho buổi tập tiếp theo."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (298, NULL, NULL, N'48mm
', N'462mAh
', NULL, N'Trắng
', N'"Apple Watch Ultra 2 GPS + Cellular 49mm viền Titanium dây Ocean là phiên bản smartwatch thể thao cao cấp tiếp theo được Apple trình làng. Vẫn mang một thiết kế bền bỉ nhưng được nâng cấp với nội lực mạnh mẽ đến từ con chip và hệ điều hành mới, phục vụ các tín đồ thể thao một cách tối ưu nhất.
Thiết kế bền bỉ với khung Titanium, nhiều phím hỗ trợ
Apple Watch Ultra 2 mang một diện mạo thời thượng nhưng không kém phần hầm hố với khung viền Titanium siêu bền bỉ, bề mặt được phủ lớp kính Sapphire cao cấp giúp bảo vệ đồng hồ tối ưu trong mọi hoạt động. Khả năng chống chịu của đồng hồ cũng được đảm bảo với tiêu chuẩn quân đội Mỹ MIL-STD 810H."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (299, NULL, NULL, N'40mm
', N'595mAh
', NULL, N'Xám
', N'"Apple Watch Ultra 2 GPS + Cellular 49mm viền Titanium dây Trail size M/L là một trong những siêu phẩm smartwatch được Apple trình làng trong sự kiện ra mắt sản phẩm được mong chờ nhất năm vào tháng 9/2023, với nhiều nâng cấp đáng giá từ phần cứng đến phần mềm cũng như tiện ích sử dụng.
Nội lực mạnh mẽ đến từ vi xử lý lõi kép và WatchOS mới
Apple Watch Ultra 2 sở hữu hiệu năng mạnh mẽ từ CPU lõi kép Apple S9 SiP mới. Được trang bị nhiều hơn 60% bóng bán dẫn so với thế hệ Apple Watch Ultra đầu tiên nên tốc độ xử lý các tác vụ trên đồng hồ cũng nhanh hơn đáng kể. Khả năng đồ họa cũng tăng thêm 30% nhờ GPU được cải tiến. Việc trang bị Neural Engine 4 lõi mới cũng giúp những tác vụ học máy và AI vận hành nhanh hơn gấp đôi."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (300, NULL, NULL, N'46mm
', N'407mAh
', NULL, N'Xanh dương nhạt
', N'"Apple Watch Series 9 GPS + Cellular 41mm viền thép dây thể thao là phiên bản kế nhiệm của dòng Apple Watch S8, mang nhiều nâng cấp về màn hình, vi xử lý, hệ điều hành,... mang đến cho thiết bị hiệu năng mạnh mẽ và trải nghiệm sử dụng mượt mà hơn bao giờ hết.
Bền bỉ với khung viền thép, màn hình lên đến 2000 nits
Đồng hồ thông minh Apple Watch S9 được hoàn thiện từ khung viền thép không gỉ sang trọng, bền bỉ, kết hợp mặt kính Sapphire cao cấp giúp hạn chế trầy xước, bảo vệ đồng hồ tốt hơn trong các tình huống va quẹt hằng ngày."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (301, NULL, NULL, N'42mm
', N'453mAh
', NULL, N'Xám
', N'"Nếu bạn đang tìm kiếm một chiếc đồng hồ thông minh vừa có thể chinh phục mọi thử thách thể thao ngoài trời với các tính năng luyện tập cao cấp và cảm biến theo dõi sức khỏe tiên tiến,... vừa có thể là một phụ kiện đồng hành với bạn mọi nơi. Đồng hồ thông minh Garmin Fenix 7X Solar Titanium hứa hẹn sẽ đáp ứng đầy đủ các tiêu chí cho bạn.
Kiểu dáng khỏe khoắn, thoải mái khi đeo
Mặt đồng hồ 51 mm phù hợp với các bạn có cổ tay lớn, các chi tiết được làm góc cạnh tạo cảm giác mạnh mẽ khi nhìn vào. Phần viền được làm từ chất liệu Titanium vô cùng bền chắc, kính cường lực Sapphire giúp bảo vệ tốt màn hình bên trong trước những va chạm. Dây đeo silicone mềm mại, an toàn cho da và có 5 nút bấm vật lý giúp người dùng dễ dàng thao tác."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (302, NULL, NULL, N'47mm
', N'491mAh
', NULL, N'Đen
', N'"Sở hữu nhiều tiện ích cao cấp phục vụ cho nhu cầu chơi golf cùng nhiều tính năng theo dõi sức khỏe có độ chuẩn xác cao, bên cạnh đó việc nâng cấp tấm nền AMOLED sống động thay thế màn hình MiP như các thế hệ cũ, Garmin Approach Golf Approach S70 dây silicone xứng đáng là một phiên bản nâng cấp đáng giá dành cho các tín đồ môn golf.
Trợ lý Golf chuyên nghiệp ngay trên cổ tay
Đồng hồ thông minh Garmin Approach được trang bị sẵn hơn 43.000 bản đồ màu CourseView đầy đủ các sân golf trên khắp thế giới, bạn chỉ cần lựa chọn sân phù hợp và xem các thông tin về sân để có thể đạt thành tích tốt nhất."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (304, NULL, NULL, N'47mm
', N'555mAh
', NULL, N'Trắng Starlight
', N'"Apple Watch Series 9 GPS + Cellular 45mm viền nhôm dây thể thao là một trong những thiết bị được Apple giới thiệu trong sự kiện ra mắt sản phẩm “Wonderlust” năm 2023. Với những nâng cấp về hiệu năng, độ sáng màn hình, hứa hẹn là một thế hệ đồng hồ thông minh đáng sở hữu và nâng cấp của nhà Táo.
Sức mạnh đến từ S9 SiP và WatchOS 10
Chiếc Apple Watch S9 này được trang bị con chip S9 SiP lõi kép với 5.6 tỷ bóng bán dẫn nhiều hơn 60% so với S8 cho tốc độ xử lý các tác vụ nhanh hơn. Nhờ Neural Engine 4 lõi, Apple S9 mà các tác vụ sử dụng công nghệ máy học được xử lý nhanh chóng. GPU cũng được nâng cấp giúp đồ họa của đồng hồ được xử lý tốt hơn."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (305, NULL, NULL, N'42mm
', N'598mAh
', NULL, N'Xanh đen đậm
', N'"Apple Watch Series 9 GPS + Cellular 45mm viền nhôm dây thể thao size S/M có bước tiến mới về hiệu năng khi được trang bị con chip mang sức mạnh vượt trội, trải nghiệm không chạm màn hình siêu độc đáo cùng nhiều tính năng thông minh được hỗ trợ, hứa hẹn sẽ là một siêu phẩm được nhiều người săn đón. 
Thiết kế gọn nhẹ, dễ dàng vận động
Về thiết kế, Apple Watch Series 9 mang thiết kế đặc trưng của nhà Táo khuyết với vẻ ngoài đơn giản, năng động, tạo điểm nhấn cho phong cách của bạn gái và bạn trai thêm thời trang, cá tính. Cấu trúc mặt đồng hồ ổn định, hạn chế móp méo với khung viền được hoàn thiện bằng hợp kim nhôm."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (306, NULL, NULL, N'44mm
', N'520mAh
', NULL, N'Hồng
', N'"Apple Watch Series 9 GPS + Cellular 41mm viền nhôm dây thể thao nằm trong series sản phẩm mới được Apple trình làng vào tháng 9/2023 cùng với các dòng điện thoại iPhone. Mang nhiều nâng cấp đáng giá từ màn hình đến vi xử lý, hệ điều hành,... đây hứa hẹn là một trong những dòng smartwatch đáng sở hữu nhất của nhà Táo.
Diện mạo thời thượng với màn hình sáng đến 2000 nits
Apple Watch Series 9 được hoàn thiện từ khung viền hợp kim nhôm và lớp kính cường lực Ion-X đem đến sự bền bỉ, cứng cáp, bảo vệ đồng hồ tốt hơn trong các va chạm. Dây đeo làm từ chất liệu silicone mềm nhẹ, ôm tay rất tốt, không thấm mồ hôi, cho cảm giác thoải mái khi đeo.

Được trang bị màn hình có kích thước 1.9 inch cùng tấm nền OLED với độ phân giải 430 x 352 pixels mang lại khả năng hiển thị sắc nét vượt trội với hình ảnh sống động, chân thực"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (308, NULL, NULL, N'42mm
', N'469mAh
', NULL, N'Hồng
', N'"Apple Watch Series 9 GPS + Cellular 41mm viền nhôm dây vải là một trong những dòng đồng hồ thông minh được chú ý nhiều nhất của nhà Táo Khuyết trong năm 2023. Khi sở hữu kiểu dáng hiện đại, năng động, tích hợp đa dạng tính năng đặc biệt, hứa hẹn sẽ trở thành món phụ kiện phải có trong hành trang thường nhật của bạn.
Mang thiết kế tinh tế, thu hút từ ánh nhìn đầu tiên 
Apple Watch S9 có vẻ ngoài tinh giản, kết cấu gọn gàng, vững chắc với khung viền hợp kim nhôm cứng cáp, có khả năng chống biến dạng, mài mòn trong quá trình sử dụng.

Mặt kính cường lực Ion-X với thiết kế tràn cạnh sang trọng, bề mặt được làm phẳng mịn cho bạn vuốt, trượt ngón tay để tùy chỉnh đồng hồ dễ dàng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (309, NULL, NULL, N'43mm
', N'562mAh
', NULL, N'Trắng
', N'"Garmin Venu 3 là chiếc smartwatch mang kiểu dáng thời trang và năng động, được tích hợp nhiều tính năng theo dõi sức khỏe cùng thể chất giúp bạn quản lý sức khỏe và tập luyện một cách hiệu quả. Sản phẩm này sẽ là người bạn đồng hành lý tưởng cho bạn trong mọi hoạt động hằng ngày.
Phong cách thời thượng, kiểu dáng năng động
Sở hữu hình dáng mặt tròn vô cùng thanh lịch nhưng không kém phần năng động, phù hợp với nhiều phong cách của người dùng. Với khối lượng mặt chỉ 30 g, thiết bị sẽ không làm cổ tay người dùng bị mỏi hay nặng nề khi tập luyện thể thao. Phía sau mặt đồng hồ là hệ thống cảm biến và nơi cắm sạc được làm gọn gàng không gây khó chịu khi tiếp xúc với cổ tay."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (310, NULL, NULL, N'47mm
', N'579mAh
', NULL, N'Vàng
', N'"Garmin Venu 3S là một chiếc smartwatch được nhiều người yêu thích bởi sở hữu nhiều tính năng thông minh và thiết kế thời thượng. Bạn có thể thông qua chiếc đồng hồ này để theo dõi các chỉ số sức khỏe, chọn chế độ luyện tập, định vị,... với độ chính xác cao.
Phong cách năng động, thích hợp với nhiều người dùng
Đồng hồ thông minh được thiết kế theo phong cách năng động với mặt đồng hồ hình tròn thích hợp với cả nam và nữ. Kích thước mặt  41 mm với phần viền được làm mỏng cho tổng thể thêm phần thanh thoát. Cạnh phải có 3 nút điều khiển vật lý cho phép bạn truy cập nhanh một số chức năng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (311, NULL, NULL, N'41mm
', N'554mAh
', NULL, N'Hồng
', N'"Garmin Forerunner 265S là chiếc đồng hồ thông minh thể thao chuyên nghiệp được trang bị nhiều chức năng hỗ trợ luyện tập, theo dõi sức khỏe và sở hữu hệ thống định vị có độ chính xác cao. Thời gian pin kéo dài sẵn sàng đồng hành cùng người dùng trong những chuyến đi.
Kế hoạch tập luyện khoa học, hỗ trợ cải thiện thành tích
Chiếc đồng hồ thể thao chuyên nghiệp được trang bị nhiều bài tập như: 3 môn phối hợp Triathlon (chạy bộ, đạp xe, bơi lội), Yoga, Pilates, Cardio, leo núi,... cho người dùng lựa chọn tùy vào mục đích tập luyện và sở thích. Bên cạnh những bài tập được tích hợp sẵn trên đồng hồ thì bạn có thể tải về các bài tập miễn phí và chỉnh sửa lại cho phù hợp với tình trạng thể chất nhờ sự hỗ trợ của huấn luyện viên ảo Garmin Coach. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (312, NULL, NULL, N'46mm
', N'479mAh
', NULL, N'Xanh dương nhạt
', N'"Apple Watch Series 9 GPS 45mm viền nhôm dây thể thao là phiên bản smartwatch mới nhất được nhà Táo trình làng tại sự kiện Wonderlust, hứa hẹn sẽ một lần nữa khuấy đảo cộng đồng iFans và thỏa mãn những tín đồ yêu công nghệ đích thực.
Phong cách thời thượng, độ bền cao
Vẫn mang vẻ ngoài tinh tế với màn hình tràn viền và các góc được bo tròn mềm mại, Apple Watch Series 9 được hoàn thiện từ khung viền hợp kim nhôm bền bỉ, với màn hình được phủ bởi tấm kính cường lực Ion-X chống nứt vỡ, bảo vệ đồng hồ tốt hơn trước những va chạm. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (315, NULL, NULL, N'41mm
', N'404mAh
', NULL, N'Xanh đen đậm
', N'"Với thiết kế thời thượng, hiệu năng mạnh mẽ, màn hình sáng ấn tượng, hỗ trợ thao tác mới giúp người dùng trải nghiệm thiết bị không chạm vào màn hình cùng nhiều tính năng sức khỏe, an toàn hữu ích khác. Apple Watch Series 9 GPS 45mm viền nhôm dây vải đang là một trong những sản phẩm smartwatch 2023 đáng sắm nhất hiện nay. 
Ngoại hình hiện đại, tạo phong cách cá tính
Apple Watch Series 9 có diện mạo quen thuộc với mặt hình chữ nhật với các góc cạnh được làm bo cong nhẹ, kết hợp với khung viền hợp kim nhôm bóng bẩy tạo nên nét thanh lịch, cao cấp cho tổng thể thiết kế. Mặt kính cường lực Ion-X bền bỉ, được hoàn thiện vừa khít với khung viền, bề mặt phẳng, dày dặn cho bạn chạm, gõ hay vuốt đều rất thoải mái, thuận tay. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (314, NULL, NULL, N'46mm
', N'540mAh
', NULL, N'Hồng
', N'"Apple Watch Series 9 GPS 45mm viền nhôm dây thể thao size S/M là mẫu smartwatch cao cấp của nhà Apple với nhiều cải tiến về hệ thống và tính năng, hỗ trợ tốt hơn cho việc chăm sóc sức khỏe, luyện tập thể thao và sinh hoạt hằng ngày của bạn. 
Thiết kế tối giản, cao cấp trong từng chi tiết
Mẫu Apple Watch này có mặt đồng hồ hình chữ nhật kích thước 45 mm, được phủ lớp kính cường lực Ion-X mang kết cấu hình học cứng cáp giúp tăng cường độ bền và hạn chế vết xước tối đa, kết hợp khung viền được làm từ hợp kim nhôm bền bỉ bảo vệ đồng hồ tốt hơn.

Dây đeo chất liệu silicone chống thấm nước tốt, duy trì cảm giác khô thoáng cho bạn trong suốt thời gian đeo, không tạo vết hằn trên da nhờ bề mặt tiếp xúc êm ái. Các nút vật lý ở cạnh viền khung đồng hồ thông minh có độ phản hồi cao giúp bạn thao tác sử dụng thuận tiện."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (316, NULL, NULL, N'41mm
', N'411mAh
', NULL, N'Trắng Starlight
', N'"Apple Watch Series 9 GPS 41mm viền nhôm dây thể thao không chỉ là một thiết bị đồng hồ thông minh, mà còn là một phụ kiện thời trang giúp người dùng thể hiện phong cách cá nhân. Với thiết kế sang trọng, màu sắc thời thượng cùng các tính năng theo dõi sức khỏe và thể thao hiện đại, thiết bị này sẽ là người bạn đồng hành lý tưởng cho mọi hoạt động của người dùng.
Gọn nhẹ khi đeo, phong cách thời thượng
Apple Watch Series 9 sở hữu mặt đồng hồ hình chữ nhật, bo cong 4 góc tinh tế, mang lại vẻ đẹp sang trọng và thời thượng"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (317, NULL, NULL, N'42mm
', N'550mAh
', NULL, N'Xanh dương nhạt
', N'"Với thiết kế năng động, độ hoàn thiện cao, hiệu năng mạnh mẽ cùng nhiều tính năng hữu ích, Apple Watch SE 2023 GPS + Cellular 44mm viền nhôm dây thể thao là sản phẩm hoàn hảo để bạn lựa chọn trải nghiệm và cảm nhận những giá trị tuyệt vời mà một chiếc đồng hồ thông minh có thể mang đến cho mình. 
Diện mạo gọn đẹp, màn hình hiển thị rõ ràng
Chiếc Apple Watch SE 2023 này được chế tác với từng chi tiết đều toát lên nét tinh tế, sang trọng cùng với màu sắc nhã nhặn, thời trang, sản phẩm thích hợp cho cả phái mạnh và phái đẹp lựa chọn để tự tin khoe cá tính và phong cách sành điệu của bản thân. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (318, NULL, NULL, N'48mm
', N'424mAh
', NULL, N'Trắng Starlight
', N'"Ra mắt vào tháng 9/2023, Apple Watch SE 2023 GPS + Cellular 44mm viền nhôm dây thể thao size S/M đã nhanh chóng thu hút sự quan tâm của các iFans, nhờ được trang bị đa dạng tính năng chăm sóc sức khỏe tinh thần, thể chất, các bài tập thể thao, tiện ích thông minh, nghe gọi trực tiếp không cần điện thoại,... phục vụ tốt cho nhu cầu sử dụng thường nhật.
Thiết kế trẻ trung, dây silicone ngắn đeo trên cổ tay nhẹ êm
Apple Watch SE 2023 mang diện mạo đơn giản, các góc cạnh được uốn cong nhẹ nhàng, đẹp mắt. Mặt đồng hồ hình chữ nhật có kích thước 44 mm phù hợp với cổ tay của nam và nữ giới. Dây đeo cũng có kích cỡ hài hòa với mặt nên khi đeo trên tay cho cảm giác vừa vặn, thanh lịch dù bạn chọn bất kỳ phiên bản màu nào của sản phẩm."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (319, NULL, NULL, N'44mm
', N'560mAh
', NULL, N'Xám
', N'"Trong sự kiện Galaxy Unpacked 2022 diễn ra vào ngày 10/8, nhà Samsung đã gây chú ý khi cho ra mắt đồng hồ thông minh Samsung Galaxy Watch 5 Pro để thay thế cho dòng Classic. Bên cạnh thiết kế mới mẻ, chiếc smartwatch này còn sở hữu nhiều tính năng cao cấp, hứa hẹn sẽ trở thành món phụ kiện thời trang được SamFans ưa chuộng.
Thiết kế cứng cáp, độ bền vượt trội
Galaxy Watch5 Pro phiên bản 45 mm sở hữu kiểu dáng có phần nam tính với kích thước lớn, phù hợp với những ai có cổ tay to. Thiết bị đi kèm với một khung bezel cảm ứng cho phép tương tác nhanh với giao diện mà không cần phải thực hiện thao tác chạm."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (320, NULL, NULL, N'48mm
', N'551mAh
', NULL, N'"Đen Xanh

"
', N'"Nếu bạn là một tín đồ trung thành của nhà Táo hoặc đơn giản cần tìm một chiếc smartwatch có thiết kế thời thượng, nhiều tiện ích, đặc biệt là có khả năng nghe gọi trực tiếp, Apple Watch SE 2022 GPS + Cellular 44mm viền nhôm dây thể thao sẽ là một lựa chọn mà bạn không thể bỏ qua.
Thiết kế hiện đại, kiểu dáng trẻ trung, năng động
Màn hình thiết kế kiểu dáng hình chữ nhật nhưng được bo tròn ở mỗi góc tạo cảm giác mềm mại. Chất liệu kính cường lực Ion-X cho khả năng chống chịu lực tốt hơn kính cường lực thông thường rất nhiều lần. Chiếc Apple Watch này sử dụng màn hình OLED với độ phân giải 448 x 368 pixels cho độ hiển thị rực rỡ và rõ nét nhất, đồng thời tiêu thụ điện năng ít hơn giúp tiết kiệm pin hiệu quả."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (321, NULL, NULL, N'50mm
', N'568mAh
', NULL, N'Đen
', N'"Samsung Galaxy Watch6 Classic LTE 47 mm là phiên bản hoàn hảo cho người dùng muốn sở hữu một chiếc smartwatch có thiết kế sang trọng, hỗ trợ nhiều tính năng theo dõi sức khoẻ, đa dạng bài tập thể thao và các tiện ích nâng cao khác đi kèm.
Theo dõi sức khỏe chuyên nghiệp
Đồng hồ thông minh Samsung được trang bị cảm biến 3 trong 1 BioActive có các chức năng theo dõi sức khỏe như: Đo nhiệt độ trên da, đo nhịp tim, huyết áp, theo dõi giấc ngủ, điện tâm đồ, đếm số bước chân,... hỗ trợ người dùng tốt hơn trong việc chăm sóc cơ thể."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (322, NULL, NULL, N'43mm
', N'557mAh
', NULL, N'Trắng Starlight
', N'"Apple không ngừng khẳng định vị thế của mình trên thị trường smartwatch với những sản phẩm vượt trội về cả thiết kế và chất lượng. Trong đó có Apple Watch SE 2023 GPS + Cellular 40mm viền nhôm dây vải sở hữu diện mạo tinh tế, các tính năng cao cấp, khả năng nghe gọi độc lập, mang đến trải nghiệm tối ưu cho người dùng. 
Thiết kế trẻ trung, thanh lịch, màn hình OLED hiển thị chân thực
Mẫu Apple Watch SE 2023 này khoác lên mình thiết kế đậm chất nhà Táo Khuyết với mặt đồng hồ hình chữ nhật gọn đẹp, chế tác chỉn chu đến từng góc cạnh. Phiên bản này còn góp phần nâng tầm phong cách người dùng với dây đeo bằng vải nhiều màu sắc rực rỡ, thời trang cho bạn tùy chọn phù hợp với hình tượng, nhu cầu của mình."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (323, NULL, NULL, N'45mm
', N'487mAh
', NULL, N'Nâu
', N'"Trước đó, BeFit đã cho ra mắt sản phẩm đồng hồ thông minh BeFit Sporty 2 với hai màu là hồng và đen. Giờ đây hãng đã mang đến cho người dùng BeFit Sporty 2 dây da để đáp ứng nhiều sở thích của người dùng hơn.
Thiết kế tối giản, phong cách hiện đại
BeFit Sporty 2 phiên bản màu đặc biệt gồm xanh lá, đỏ, tím và nâu phù hợp với nhiều sở thích của người dùng. Dây đồng hồ được làm bằng da có độ bền cao, chống thấm mồ hôi khá tốt tạo cảm giác thoải mái cho người dùng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (324, NULL, NULL, N'41mm
', N'525mAh
', NULL, N'Xám
', N'"BeFit WatchS 45mm là chiếc đồng hồ thông minh thế hệ tiếp theo vừa được BeFit giới thiệu đến người dùng. Với nhiều sự thay đổi về ngoại hình cũng như tính năng bên trong, chiếc đồng hồ này hứa hẹn sẽ là lựa chọn tuyệt vời trong phân khúc giá.
Phong cách trẻ trung, thoải mái khi đeo trên tay
Đồng hồ thông minh BeFit sở hữu mặt đồng hồ hình chữ nhật bo nhẹ 4 góc tạo nên một diện mạo hiện đại, năng động, nam hay nữ sử dụng đều rất hợp. Đồng hồ sử dụng khung viền hợp kim kẽm chắc chắn, tính thẩm mỹ cao, đồng thời bảo vệ các chi tiết bên trong tốt hơn"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (325, NULL, NULL, N'44mm
', N'543mAh
', NULL, N'Đen
', N'"Đồng hồ thông minh BeFit WatchS 45mm gây ấn tượng mạnh mẽ với thiết kế thời thượng, sang trọng, mang đậm dấu ấn cá nhân. Đồng hồ được trang bị nhiều chế độ thể thao đa dạng, giúp người dùng theo dõi sức khỏe và tập luyện hiệu quả hơn.
Phong cách thời thượng, màn hình chất lượng cao
Mặt đồng hồ hình chữ nhật quen thuộc được bo cong 4 góc tạo nên vẻ ngoài thanh thoát, sang trọng thích hợp với nhiều phong cách của người dùng. Đồng hồ được trang bị một dây silicone vô cùng mềm mịn, bề mặt chống thấm tốt đảm bảo cổ tay của bạn luôn khô thoáng khi sử dụng. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (327, NULL, NULL, N'42mm
', N'563mAh
', NULL, N'Đen
', N'"Đồng hồ BeFit Watch mang thiết kế cá tính với dáng mặt hình chữ nhật có kích thước 52.6mm. Được trang bị màn hình lớn lên đến 1.95 inch, đồng hồ cung cấp một không gian hiển thị vô cùng thoải mái, cho các thao tác vuốt chạm mượt mà và chính xác hơn.

Sở hữu tấm nền AMOLED kết hợp độ phân giải lên cao 410 x 502 pixels, Watch Ultra mang đến khả năng hiển thị rõ ràng, chi tiết, màu sắc rực rỡ ngay cả khi ở ngoài trời hay khu vực có ánh sáng mạnh. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (328, NULL, NULL, N'47mm
', N'556mAh
', NULL, N'Đen
', N'"Đồng hồ thông minh BeFit Watch Ultra S 52.1mm là một sản phẩm mới của BeFit, với thiết kế hiện đại, phong cách năng động phù hợp với nhiều đối tượng sử dụng. Bên trong của đồng hồ được tích hợp cảm biến giúp theo dõi các chỉ số sức khỏe, hỗ trợ rèn luyện thể chất hiệu quả và khả năng định vị chuẩn xác.
Phong cách thời thượng, gọn nhẹ khi đeo
Phong cách hiện đại, kiểu dáng thể thao của chiếc đồng hồ thông minh của nhà Befit này sẽ phù hợp với cả người dùng nam lẫn nữ. Viền của mặt đồng hồ được làm bằng hợp kim kẽm vừa nhẹ vừa có khả năng chịu lực tốt, đảm bảo sự thoải mái cho người dùng khi tham gia các môn thể thao"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (329, NULL, NULL, N'41mm
', N'502mAh
', NULL, N'Xám
', N'"Đồng hồ thông minh BeFit Hunter1 48mm được thiết kế với phong cách mạnh mẽ, thời thượng, phù hợp với những người yêu thích thể thao và công nghệ. Bên trong thiết bị được tích hợp nhiều tính năng hỗ trợ luyện tập, theo dõi sức khỏe,... sẵn sàng đồng hành cùng người dùng ở bất kì đâu.
Kiểu dáng thời thượng, mạnh mẽ
Khác với những dòng sản phẩm trước đây của BeFit, BeFit Hunter1 sử dụng mặt đồng hồ tròn, mang đến cho người dùng một diện mạo thanh lịch và quý phái. Khung bằng nhựa có khả năng chịu lực ở mức tương đối và giúp giảm một phần nhỏ khối lượng của sản phẩm."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (487, N'8GB
', N'128GB
', N'6.1 inch
', N'3700 mAh
', N'167g
', N'Tím 
', N'Phụ kiện: Hộp, sạc adapter
', N'Snapdragon 8 Gen 1
', NULL, N'Trầy xước ít
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (330, NULL, NULL, N'45mm
', N'536mAh
', NULL, N'Đen
', N'"Sở hữu kiểu dáng hiện đại, năng động, đồng hồ thông minh BeFit B3s còn mang đến cho bạn những tính năng cơ bản để theo dõi sức khỏe và hoạt động thể chất, cùng rất nhiều tính năng hữu ích hằng ngày. Nếu muốn sở hữu một chiếc smartwatch đa tiện ích với mức giá dễ tiếp cận, đây sẽ là một sự lựa chọn phù hợp dành cho bạn.
Thiết kế gọn nhẹ, thời thượng "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (331, NULL, NULL, N'42mm
', N'425mAh
', NULL, N'Xám
', N'"Amazfit Balance 46 mm dây nylon thu hút mọi ánh nhìn bởi thiết kế mỏng nhẹ, tinh tế cùng mặt đồng hồ AMOLED sắc nét. Kiểu dáng thời thượng, ôm sát cổ tay tạo nên phong cách năng động, tự tin cho người đeo. Bên cạnh đó, đồng hồ còn nhiều tính năng theo dõi sức khỏe tiên tiến, giúp bạn hiểu rõ hơn về cơ thể và nâng cao chất lượng cuộc sống. 
Mang đến sự thoải mái khi đeo
Amazfit Balance thu hút mọi ánh nhìn với mặt đồng hồ tròn tinh tế, toát lên vẻ thanh lịch và sang trọng. Chiếc đồng hồ sở hữu kích thước 46 mm các bạn nam đeo sẽ vô cùng vừa vặn, tuy có kích thước lớn những cũng không gây ra sự nặng nề trong các hoạt động."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (332, NULL, NULL, N'50mm
', N'483mAh
', NULL, N'Xám
', N'"Amazfit Cheetah Round 46.7mm là chiếc smartwatch thể thao được thiết kế tối ưu nhằm phục vụ cho người dùng cải thiện hiệu suất luyện tập, đặc biệt là môn chạy bộ với hệ thống GPS tân tiến, nhiều thuật toán thông minh, cảm biến sức khỏe cao cấp,... sẵn sàng đồng hành cùng bạn trên mọi đường chạy.
Tính năng luyện tập vô cùng phong phú tha hồ chọn
Là một chiếc đồng hồ thể thao chuyên nghiệp nên Amazfit Cheetah Round được trang bị hơn 150 chế độ thể thao như: Chạy, bơi, đạp xe, chèo thuyền, golf, leo núi, Yoga, bài tập HIIT,... cho người dùng lựa chọn tùy theo sở thích và mục đích rèn luyện cơ thể. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (333, NULL, NULL, N'44mm
', N'472mAh
', NULL, N'Xám
', N'"Đồng hồ thông minh Amazfit Cheetah Square 44 mm được tích hợp đa dạng chế độ thể thao từ trong nhà cho đến ngoài trời để người dùng lựa chọn. Sở hữu hệ thống định vị tân tiến giúp xác định vị trí chính xác trong nhiều điều kiện môi trường, đây là người bạn đồng hành lý tưởng cho những người yêu thích thể thao hoặc vận động viên chuyên nghiệp.
Đồng hồ có khối lượng nhẹ, thông thoáng khi đeo
Đồng hồ sử dụng khung viền hợp kim nhôm không chỉ có khả năng chịu lực tốt mà còn giúp tối ưu cân nặng của thiết bị. Phần mặt của đồng hồ có khối lượng 25 g, nếu tính luôn phần dây thì thiết bị này có tổng khối lượng là 37 g, vô cùng nhẹ đối với một chiếc đồng hồ thể thao chuyên nghiệp."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (334, NULL, NULL, N'47mm
', N'555mAh
', NULL, N'Đen
', N'"Amazfit Active Edge 46.6mm chinh phục mọi ánh nhìn với thiết kế toát lên sự năng động đậm chất thể thao. Kiểu dáng thanh lịch cùng mặt đồng hồ lớn mang đến trải nghiệm hiển thị ấn tượng, khẳng định cá tính riêng của bạn. Khám phá giới hạn bản thân với các bài tập đa dạng, từ chạy bộ, bơi lội đến leo núi hay Yoga, cùng theo dõi hiệu quả luyện tập chính xác với hệ thống cảm biến hiện đại.
Kiểu dáng thể thao, linh hoạt khi tập luyện
Amazfit Active Edge thu hút mọi ánh nhìn với thiết kế ""dual color"" - sự kết hợp độc đáo giữa hai màu sắc, giúp nét cá tính và lôi cuốn được tôn lên, khẳng định phong cách thời thượng của người sở hữu"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (335, NULL, NULL, N'50mm
', N'449mAh
', NULL, N'Hồng
', N'"Amazfit Active 42.3mm gây ấn tượng với thiết kế mỏng nhẹ, tinh tế cùng màn hình AMOLED sắc nét. Dây đeo silicone mềm mại mang đến sự thoải mái tối đa cho người sử dụng. Bên cạnh vẻ ngoài thời thượng, đồng hồ còn ẩn chứa sức mạnh bên trong với nhiều tính năng theo dõi sức khỏe chuyên nghiệp, hỗ trợ bạn tối ưu hóa hiệu suất tập luyện.
Kiểu dáng hiện đại, thời thượng
Chiếc Amazfit Active này có mặt hình vuông bo cong các góc tinh tế, tạo nên sự thanh lịch khi đeo trên cổ tay. Khung viền được chế tác từ hợp kim nhôm cho khả năng chịu lực tốt, bề mặt sáng bóng giúp vẻ ngoài của đồng hồ thêm cao cấp. Mặt đồng hồ có kích thước 42.3 mm phù hợp cho nhiều cổ tay của người dùng."
', NULL, NULL, NULL)
GO
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (336, NULL, NULL, N'44mm
', N'435mAh
', NULL, N'Hồng
', N'"Bên cạnh những mẫu smartwatch cao cấp và thể thao chuyên nghiệp, Amazfit cũng không ngừng cho ra mắt những sản phẩm có mức giá dễ tiếp cận dành cho người dùng phổ thông. Mới đây hãng cũng đã trình làng thế hệ smartwatch mới mang tên Amazfit Bip 5, hứa hẹn mang đến những trải nghiệm hài lòng cho người dùng.
Thiết kế năng động, gọn nhẹ đi cùng màn hình lớn
Amazfit Bip 5 sở hữu một thiết kế thời thượng với các phiên bản màu sắc năng động, phù hợp cho cả nam và nữ. Màn hình lớn lên đến 1.91 inch mang đến không gian hiển thị vô cùng rộng rãi, khi mình thao tác trên màn hình cảm ứng cũng trơn tru hơn."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (288, NULL, NULL, N'44mm
', N'491mAh
', NULL, N'Kem
', N'"Chiếc đồng hồ thông minh Garmin Venu SQ 2 Music sở hữu phong cách thiết kế hiện đại, thanh lịch, các tính năng chăm sóc sức khỏe chuyên nghiệp cũng như nhiều tiện ích thông minh khác, sẵn sàng đồng hành cùng người dùng trên mọi phương diện cuộc sống. 
Diện mạo thời thượng, năng động"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (418, NULL, NULL, N'55inch
', N'150W
', N'15.5kg
', N'Đen
', N'Màn hình 55 inch siêu chất lượng, Màu sắc tự nhiên, trải nghiệm thị giác dễ chịu, Thiết kế AirSlim, Công nghệ hiển thị tiên tiến với độ tương phản cao, Smart Hub, Bộ vi xử lý Quantum Lite 4K, Âm thanh vòm theo chuyển động hình ảnh, Kết nối thông minh
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (419, NULL, NULL, N'65inch
', N'160W
', N'21.8kg
', N'Đen
', N'Hình ảnh 4K rực rỡ, Tái tạo chuẩn xác từng sắc thái điện ảnh , Thiết kế thanh mảnh tuyệt đẹp, Cá nhân hóa kho app giải trí, Trải nghiệm âm thanh đỉnh cao, Kiêm nhiệm quản lí các thiết bị thông minh trong nhà
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (420, NULL, NULL, N'32inch
', N'100W
', N'4.8kg
', N'Đen
', N'Thiết kế tràn viền với khung kim loại cao cấp, Màn hình HD hiển thị tới 16 triệu màu, Cấu hình tối ưu hình ảnh độc quyền Xiaomi, Tận hưởng hệ thống loa với công nghệ Dolby Audio, Trải nghiệm mượt mà với chip Quad Core, Sẵn sàng kết nối, đầy đủ cổng tương tác, Bộ điều khiển từ xa linh hoạt, đa năng
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (421, NULL, NULL, N'43inch
', N'120W
', N'6.2kg
', N'Đen
', N'Đắm chìm trong thiết kế TV tràn viền, Công cụ tuyệt vời để xả stress và thư giãn mỗi ngày, Khung vỏ nguyên khối sang trọng, tinh xảo, Ngắm nhìn 1,07 tỷ gam màu đã mắt, Loa công suất cao, sống động mà lôi cuốn, Sự kết hợp của Dolby Audio và DTS Virtual:X, Ra lệnh từ xa thông qua Google Assistant, Chip xử lý lõi tứ mạnh mẽ và mượt mà
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (422, NULL, NULL, N'43inch
', N'100W
', N'6kg
', N'Đen
', N'Cấu trúc tràn viền, khung kim loại sang trọng, Phục vụ thư giãn, giải trí lẫn nâng cao sức khỏe, Tái hiện khuôn hình 16 triệu màu sống động, Tối ưu độ tương phản và chi tiết của khuôn hình, Dolby Audio cho hiệu ứng âm thanh nội lực, Tận hưởng kho phim ảnh và nội dung phong phú, Chip bốn nhân với trải nghiệm nhanh nhạy
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (423, NULL, NULL, N'65inch
', N'215W
', N'16kg
', N'Đen
', N'Khởi động thể thao, nâng cao năng lượng, Viền màn hình mỏng gần như biến mất, Khung vỏ kim loại, cấu trúc nguyên khối, Tận hưởng không gian hiển thị độ phân giải 4K, Dolby Vision: Khi nội dung đậm chất Hollywood, Đắm chìm vào không gian của 1,07 tỷ màu, Hệ thống loa 24W sống động và đa chiều, Cấu hình mạnh mẽ, xử lý mọi tác vụ
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (424, NULL, NULL, N'43inch
', N'105W
', N'7.38kg
', N'Đen
', N'Thiết bị gắn kết gia đình hoàn hảo, Chiếc TV viền mỏng nhất bạn từng thấy, Chất lượng hình ảnh 4K Ultra HD mãn nhãn, Ứng dụng Dolby Vision để tăng độ sống động, Loại bỏ giật lag trong mọi cảnh hành động, Tận hưởng chiếc Android TV theo cách của bạn, Ra lệnh cho TV bằng chính giọng nói của bạn, Bộ điều khiển nhận lệnh Bluetooth 360 độ, Phản chiếu nội dung trên điện thoại qua TV, Chip mạnh, cấu hình cao, hoạt động ổn định, Chất từng thanh âm với Dolby Audio đa chiều
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (425, NULL, NULL, N'55inch
', N'160W
', N'15.3kg
', N'Đen
', N'Google Tivi Sony sở hữu kiểu dáng thanh lịch, sang trọng, chân đế chữ V úp ngược được làm từ nhựa chắc chắn, mặt sau tối giản giúp tivi dễ dàng hòa nhập cùng không gian gia đình. Tivi trang bị độ phân giải 4K đem lại sự sắc nét trong từng khung hình, giúp hình ảnh trở nên sống động, thu hút người xem. Chuyển động mượt Motionflow XR 200 cho phép kiểm soát được khung hình, tránh tình trạng rung lắc mạnh, đem lại độ ổn định trong những phân khúc hành động, đua xe đỉnh cao.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (458, NULL, NULL, N'Dưới 15 m2
', NULL, NULL, N'Trắng
', N'Máy lạnh Casper Inverter 1 HP (9000 BTU) TC-09IS35 thuộc dòng máy lạnh thế hệ mới, tích hợp nhiều công nghệ hiện đại. Đây là một mẫu sản phẩm máy lạnh làm lạnh nhanh chóng, có thể tự động làm sạch và đặc biệt là tiết kiệm năng lượng tối ưu.
', NULL, N'9000BTU
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (459, NULL, NULL, N'Dưới 15 m2
', NULL, NULL, NULL, N'Máy lạnh Daikin Inverter 1 HP (9200 BTU) ATKF25YVMV là model máy lạnh mới nhất năm 2024 với những cải tiến và trang bị mới, đem đến hiệu quả làm lạnh nhanh và mạnh. Đồng thời, nhờ ứng dụng công nghệ hiện đại, sản phẩm không chỉ làm mát tốt mà còn tiết kiệm điện năng tối ưu, kết hợp với khả năng thanh lọc không khí, góp phần tạo nên không gian sống trong lành, thoải mái cho các thành viên.
', NULL, N'9200BTU
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (426, NULL, NULL, N'43inch
', N'120W
', N'9.3kg
', N'Đen
', N'Google Tivi Sony sở hữu kiểu dáng thanh lịch, sang trọng, chân đế chữ V úp ngược được làm từ nhựa chắc chắn, mặt sau tối giản giúp tivi dễ dàng hòa nhập cùng không gian gia đình. Tivi trang bị độ phân giải 4K đem lại sự sắc nét trong từng khung hình, giúp hình ảnh trở nên sống động, thu hút người xem. Chuyển động mượt Motionflow XR 200 cho phép kiểm soát được khung hình, tránh tình trạng rung lắc mạnh, đem lại độ ổn định trong những phân khúc hành động, đua xe đỉnh cao.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (427, NULL, NULL, N'55inch
', N'160W
', N'16.9kg
', N'Đen
', N'Google Tivi Sony 4K 55 inch KD-55X80K cho chất lượng hình ảnh sắc nét, độ bão hòa cao, hình ảnh mượt mà, hạn chế nhòe hình nhờ công nghệ nâng cấp chuẩn hình ảnh 4K X-Reality PRO. Công nghệ loa bất đối xứng X-Balanced cho chất lượng âm thanh cao dù thiết kế tivi mỏng. Viền tivi mỏng bằng nhựa vân nét giúp khung hình của tivi được mở rộng, mang đến tầm nhìn lôi cuốn hơn, tăng thêm nét tinh tế và sang trọng cho tổng thể của Google Tivi Sony 4K 55 inch. Độ phân giải 4K với hơn 8 triệu điểm ảnh, hình ảnh được hiển thị một cách sắc nét và tinh tế.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (428, NULL, NULL, N'32inch
', N'120W
', N'12kg
', N'Đen
', N'Google Tivi Sony 32 inch KD-32W830K trang bị các công nghệ xử lý hình ảnh, âm thanh hiện đại như nâng cấp hình ảnh X-Reality PRO, chuyển động mượt Motionflow XR 200, S-Master Digital Amplifier, đặc biệt hệ điều hành Google TV đáp ứng đa dạng nhu cầu giải trí của người sử dụng. Google Tivi Sony sở hữu thiết kế màn hình phẳng, viền đen mềm mại. Chiếc tivi Sony có kích thước màn hình 32 inch tivi được nâng đỡ chắc chắn trên chân đế chữ V úp ngược bằng nhựa. X-Reality PRO giúp nâng cao chất lượng hiển thị của hình ảnh và video sắc nét hơn, giảm nhiễu, cải thiện độ tương phản các sắc đậm nhạt trong mỗi khung hình. Công nghệ tăng cường màu sắc Live Colour tái hiện từng khung hình tự nhiên, màu sắc tươi mới mang đến trải nghiệm hình ảnh chân thực và sống động.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (433, NULL, NULL, N'85inch
', N'250W
', N'45.2kg
', N'Đen
', N'Google Tivi Sony 4K 85 inch K-85S30 mang đến trải nghiệm hình ảnh sắc nét, màu sắc rực rỡ, có chiều sâu và chuyển động mượt mà, lôi cuốn người xem với công nghệ tạo màu Triluminos Pro, công nghệ 4K X-Reality PRO, Motionflow XR 20. Bộ khuếch đại âm thanh S-Master Digital Amplifier, DTS Digital Surround và Dolby Atmos cho âm thanh truyền tải mạnh mẽ, chân thực như đang ở rạp hát. Độ phân giải 4K với hơn 8 triệu điểm ảnh cho độ nét gấp 4 lần Full HD, cùng bộ xử lý 4K HDR Processor X1 hình ảnh hiển thị sắc nét, rõ ràng, sắc màu và độ tương phản sống động. Công nghệ tạo màu Triluminos Pro với hơn 1 tỷ màu sắc sống động, trải nghiệm khung sắc chuẩn điện ảnh với độ sâu ấn tượng. Tổng công suất loa 20W với hệ thống loa 2 kênh, truyền phát âm thanh mạnh mẽ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (451, N'3 GB
', N'64 GB
', N'10.61 inches
', N'8000 mAh
', N'0.76kg
', N'Xám
', N'Xiaomi Redmi Pad 2022 trang bị màn hình IPS LCD kích thước 10.61 inch, tích hợp đa dạng hơn 1 tỷ màu sắc. Tần số quét 90Hz đi cùng với độ phân giải 2K khiến cho chiếc máy tính bảng này trở thành một thiết bị giải trí thật cuốn hút và sống động. Điểm vượt trội không kém của thiết bị chính là chip Helio G99 6nm với 8 nhân mạnh mẽ và hệ thống âm thanh Dolby Atmos chất lượng cao. Trọng lượng 445g nhẹ hơn so với kích cỡ cũng là một điểm cộng dành cho chiếc máy tính bảng này. Kết hợp cùng với đó là khung phẳng và các góc được bo tròn giúp Xiaomi Redmi Pad 2022 trở nên sang trọng, thời thượng hơn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (490, N'12GB
', N'256GB
', N'6.7 inch
', N'3700mAh
', N'187g
', N'Trắng
', N'Phụ kiện: Hộp, sạc adapter
', N'Snapdragon 8 Gen 2
', N'30W
', N'Trầy xước ít
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (492, N'16GB
', N'256GB
', N'6.7 inch
', N'4400mAh
', N'250g
', N'Xám
', N'Phụ kiện: Hộp máy, không tai nghe
', N'Snapdragon 8 Gen 2
', N'50W
', N'Trầy xước màn hình, cấn góc
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (493, N'12GB
', N'256GB
', N'7.6 inch
', N'5000 mAh
', N'221g
', N'Xanh
', N'Phụ kiện: Hộp, sạc adapter
', N'A17 Pro 3nm
 ', N'30W
', N'Trầy xước ít
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (429, NULL, NULL, N'55inch
', N'160W
', N'17.9kg
', N'Đen
', N'Google Tivi OLED Sony 4K 55 inch XR-55A80L sở hữu thiết kế sang trọng, tái tạo màu đen thuần khiết trên màn hình OLED, tận hưởng nội dung theo cách con người nhìn và nghe với bộ xử lý trí tuệ nhận thức XR Cognitive, công nghệ XR Clear Image tái tạo video trực tuyến rõ ràng, công nghệ XR OLED Contrast Pro cho hình ảnh có độ tương phản cao, công nghệ Acoustic Surface Audio+ phát ra chất âm ở đúng vị trí trong khung cảnh, điều khiển giọng nói không cần remote, gọi video chất lượng tốt với Bravia CAM. Sony XR-55A80L có thiết kế cao cấp với đường viền siêu mỏng ôm sát cạnh màn hình cho cảm giác liền mạch, chắc chắn đồng thời giảm thiểu độ nhiễu, để đôi mắt bạn hoàn toàn đắm chìm vào nội dung trình chiếu một cách tự nhiên. Thiết kế màn hình 55 inch trang trí hài hòa và phù hợp cho những không gian phòng ngủ, phòng khách, phòng làm việc có diện tích vừa.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (430, NULL, NULL, N'65inch
', N'160W
', N'24.2kg
', N'Đen
', N'Google Tivi Sony 4K 65 inch XR-65X90L có màn hình lớn 65 inch, khung hình sắc nét, sang trọng chuẩn 4K với bộ xử lý trí tuệ nhận thức XR Cognitive, âm thanh vòm lôi cuốn Dolby Atmos với hiệu ứng âm thanh Acoustic Multi Audio. Hệ điều hành Google TV trực quan, thân thiện với người dùng cho bạn phút giây giải trí thoải mái với kho ứng dụng phong phú. Sony 4K XR-65X90L có thiết kế One Slate tối giản, không kém phần sang trọng với cạnh viền siêu mỏng, cho bạn cảm giác đắm chìm vào không gian phim đang xem. Tivi này sở hữu kích thước màn hình 65 inch, thích hợp cho trang trí trong khu vực phòng khách, phòng ngủ,... Tivi Sony có chân đế được làm bằng hợp kim nhôm, có độ bền cao cùng với kiểu dáng chữ T úp ngược cho khả năng nâng đỡ chắc chắn. Ngoài ra, chân đế tivi có 2 kiểu lắp đặt: Kiểu tiêu chuẩn giúp bạn tập trung vào hình ảnh hoặc soundbar để định vị lý tưởng cho hệ thống âm thanh của bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (432, NULL, NULL, N'75inch
', N'200W
', N'38.3kg
', N'Đen
', N'Khám phá từng gam màu rực rỡ và từng âm thanh sâu lắng với google tivi Mini LED Sony 4K 75 inch K-75XR70 - trung tâm giải trí trang bị nhiều công nghệ hình ảnh đỉnh cao và công nghệ âm thanh vòm 3D hòa quyện. Hơn nữa, chỉ với vài thao tác đơn giản trên remote hoặc sử dụng giọng nói của mình là bạn đã có thể điều khiển chiếc tivi này một cách tự do và thoải mái nhất. Chiếc tivi Sony 75 inch này có phần thân siêu mỏng được bao bọc bằng các đường viền hợp kim nhôm cao cấp, đảm bảo độ bền lâu dài cũng như tăng tính thẩm mỹ cho bất kì không gian nào mà tivi được lắp đặt như phòng khách - phòng ngủ - phòng giải trí - phòng làm việc. Thưởng thức những khung hình siêu sắc nét ở độ phân giải 4K với công nghệ XR 4K Upscaling. Hình ảnh sau khi được nâng cấp độ phân giải vẫn duy trì được các chi tiết gốc ban đầu.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (461, NULL, NULL, N'Dưới 15 m2
', NULL, NULL, NULL, N'Máy lạnh 2 chiều Daikin Inverter 1.5 HP (12300 BTU) ATHF35XVMV là một trong những dòng máy lạnh tích hợp công nghệ Inverter tiết kiệm điện tiên tiến. Với thiết kế đơn giản, nhỏ gọn cùng nhiều ưu điểm vượt trội, chiếc máy lạnh Daikin này chắc chắn sẽ mang đến không gian sống tiện ích và thoải mái cho gia đình bạn.
', NULL, N'12300BTU
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (462, NULL, NULL, N'Dưới 20 m2
', NULL, NULL, NULL, N'Tuy là một tên tuổi còn mới mẻ trên thị trường song máy lạnh Máy lạnh Casper Inverter 1.5 HP GC-12IS35 không hề thua kém bởi cung cấp hàng loạt tiện ích vượt bật. Nỗi lo dùng máy lạnh tốn tiền điện sẽ không còn vì sản phẩm thuộc dòng máy lạnh inverter đi kèm công nghệ tân tiến, hiện đại.
', NULL, N'12000BTU
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (434, NULL, NULL, N'55inch
', N'120W
', N'7.4kg
', N'Đen
', N'Tivi Hisense 43A6500H dễ dàng chinh phục người dùng ngay từ diện mạo bên ngoài nhờ thiết kế tinh tế và độ hoàn thiện chỉn chu. Sản phẩm sở hữu hệ thống viền bao quanh cực mỏng, làm nổi bật phong cách tối giản và tăng cường độ tập trung khi chúng ta quan sát hình ảnh. Nhờ ứng dụng loạt công nghệ giúp tối ưu màu sắc mà Hisense 43A6500H mang tới, sản phẩm trình diễn những khuôn hình với dải màu rộng và cực kỳ sống động. Ngồi trước không gian hiển thị của chiếc tivi, bạn sẽ có cảm giác như đang thực sự có mặt trong bối cảnh thước phim mà mình theo dõi. Với độ phân giải lên tới mức Ultra HD (3.840 x 2.160 pixels), Hisense Google 4K 43 inch 43A6500H có thể hiển thị những khuôn hình sắc nét gấp 4 lần so với các dòng tivi Full HD thông thường trên thị trường. Đây là lợi thế giúp sản phẩm diễn đạt rõ ràng từng chi tiết nhỏ nhất của hình ảnh.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (435, NULL, NULL, N'40inch
', N'150W
', N'7kg
', N'Đen
', N'Màn hình tivi Hisense 40A4200G được trang bị độ phân giải Full HD mang đến cho bạn những hình ảnh sắc nét đến từng chi tiết nhằm nâng tầm trải nghiệm xem hình ảnh được hoàn thiện hơn với độ sắc nét chuẩn chất lượng cao. Công nghệ Dolby Digital cho bạn tận hưởng mọi nội dung yêu thích từ phim ảnh, ca nhạc, các chương trình thể thao,... được trọn vẹn và sống động hơn với hiệu ứng âm thanh vòm đầy chân thực tạo nên những âm thanh đầy trong trẻo, chất lượng với 2 loa có công suất 20W. Tivi Hisense 40 inch sử dụng hệ điều hành Android có giao diện thân thiện với người dùng cùng nhiều chương trình giải trí hấp dẫn cho bạn thỏa sức tận hưởng các nội dung yêu thích ngay tại nhà bên cạnh bạn bè và người thân. Công nghệ Natural Color Enhancer có khả năng tái tạo màu sắc chuẩn tự nhiên đồng thời phân biệt những khác biệt nhỏ nhất để tạo ra màu sắc đồng nhất và chân thực nhất.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (444, N'12 GB
', N'256 GB
', N'14.6 inches
', N'5.000mAh
', N'0.85kg
', N'Đen
', N'Tiếp nối thiết kế từ những chiếc Samsung Galaxy S22 Ultra, những chiếc Samsung S23 Ultra mang dáng vẻ thanh mảnh với những đường nét được gọt giũa chỉnh chu và cực kỳ tinh tế. Với màn hình tràn viền, tỷ lệ màn hình trên thân máy hơn 90% những chiếc điện thoại S23 Ultra hứa hẹn mang đến một thiết kế thời thượng thu hút mọi ánh nhìn. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (445, N'4 GB
', N'128 GB
', N'10.4inch
', N'7.040 mAh
', N'0.85kg
', N'Xanh
', N'Thiết kế nguyên khối cứng cáp, màn hình 10.4 inch và công nghệ LCD cho hình ảnh sắc nét. Samsung Galaxy Tab S6 Lite sở hữu thiết kế nguyên khối cứng cáp, mặc dù đây là một chiếc Tab nhưng lại có kích thước hết sức nhỏ gọn là 244,5 x 154.3 x 7.0 mm', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (449, N'8 GB
', N'256 GB
', N'12.9 inches
', N'10.835 mAh
', N'0.85kg
', N'Bạc
', N'"Tinh tế trên từng đường nét thiết kế - Gia công từ kim loại bền bỉ, phong cách hiện đại, sang trọng
Hiệu năng mạnh mẽ bất ngờ từ thế hệ chip mới - Apple M2 8 nhân cùng RAM 8 GB
Hình ảnh sắc nét, khung hình sống động - 12.9 inch LCD, Tần số quét 120 Hz
Thoải mái sáng tạo và thiết kế - Nhận diện bút Apple Pencil 2 ở khoảng cách 12 mm"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (452, N'6 GB
', N'128 GB
', N'11 inches
', N'8,000 mAh
', N'0.76kg
', N'Xanh lá
', N'Máy tính bảng Xiaomi Redmi Pad SE sở hữu màn hình LCD 11 inch với tần số quét 90hz cùng chứng nhận bảo vệ mắt TÜV Rheinland ánh sáng xanh thấp và không nhấp nháy. Cùng với đó, tablet còn được trang bị loa Dolby Atmos âm thanh nổi giúp mang lại trải nghiệm âm thanh ấn tượng. Máy với ba lựa chọn màu sắc là xanh bạc hà, tím Lavender và xám khoáng thạch. Xiaomi Redmi Pad SE là mẫu máy tính bảng của thương hiệu Xiaomi. Sản phẩm máy tính bảng Xiaomi này sở hữu một thiết kế nổi bật cùng một cấu hình mạnh mẽ đáp ứng tốt mọi nhu cầu sử dụng của người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (436, NULL, NULL, N'55inch
', N'160W
', N'8.6kg
', N'Đen
', N'Tivi Hisense U6K được trang bị bộ xử lý Hi-View Engine. Bộ xử lý này liên tục tối ưu hóa trải nghiệm xem bằng phân tích mức khung hình theo thời gian thực để đảm bảo bạn có được trải nghiệm nghe nhìn tối ưu. Đồng thời, đảm nhận các chức năng phức tạp như nâng cấp 4K và cải thiện màu sắc để kể cả video có chất lượng thấp cũng sẽ hiển thị đẹp hơn bao giờ hết. Công nghệ Quantum Dot (Đoạt giải Nobel Hóa học 2023) là công nghệ kết hợp các hạt nano vào tấm nền tivi giúp cải thiện khả năng tái tạo màu sắc. Thông qua việc sử dụng các chấm lượng tử để phát ra các bước sóng ánh sáng cực kỳ chính xác, Quantum Dot của tivi ULED Hisense có khả năng hiển thị hàng tỷ sắc thái màu sống động. Cách bố trí Mini LED của Tivi Hisense ULED U6K giúp cải thiện hiệu quả của đèn LED này, nhờ đó các chi tiết đều hiển thị ngoạn mục trên màn hình. Các đèn LED được gắn kết gần nhau để tạo ra đèn nền với độ chính xác cao và kiểm soát độ tương phản tốt hơn, mang lại hình ảnh sắc nét và sống động hơn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (437, NULL, NULL, N'65inch
', N'180W
', N'15.6kg
', N'Đen
', N'Smart Tivi ULED Mini-LED Hisense 4K 65 inch 65U7K nằm trong dòng sản phẩm ULED Mini-LED cao cấp mới ra mắt của Hisense. Về ngoại hình, Hisense ULED 4K TV U7K sở hữu ngôn ngữ thiết kế tối giản, đường nét dứt khoát, mạnh mẽ. Đặc biệt, nhà sản xuất đã cách điệu viền kim loại ở những chi tiết như chân đế hay là cạnh tivi. Điều này giúp làm tăng cảm giác sang trọng, cao cấp cho chiếc tivi ULED này. Tivi Hisense ULED MiniLED U7K được trang bị công nghệ Quantum Dot Colour với hơn 1 tỷ sắc màu và Local Dimming Full Array (làm mờ cục bộ) với khả năng tăng cường độ tương phản, giúp hình ảnh dòng TV mới sống động và thể hiện rõ nét các mảng màu tối. Hisense ULED 4K TV U7K có khả năng hiển thị nhiều màu sắc hơn nhờ phổ màu được mở rộng. Công nghệ Quantum Dot Color cho bạn cơ hội chiêm ngưỡng hàng tỉ sắc thái mới ở mức độ sáng cực kỳ ấn tượng. Điểm nhấn công nghệ của tivi Hisense U7K là chip Hi-View Engine - được xem là bộ não của tivi Hisense thế hệ mới. Với khả năng phân tích và tối ưu hình ảnh theo thời gian thực, con chip thông minh này cho phép tivi Hisense điều chỉnh độ sáng, độ tương phản và màu sắc tùy theo nội dung hiển thị, để bạn có được trải nghiệm nghe nhìn tối ưu.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (453, N'8 GB
', N'128 GB
', N'11 inches
', N'7040 mAh
', N'0.76kg
', N'Xám
', N'Phiên bản tablet Lenovo Tab M11 nổi bật với thiết kế gọn nhỏ, cấu hình mạnh mẽ đi kèm bút cảm ứng Lenovo Tab Pen cho phép người dùng viết, vẽ dễ dàng. Chính những đặc trưng này mà thiết bị là lựa chọn phù hợp cho mọi đối tượng từ học sinh, sinh viên đến dân văn phòng. Điểm nhấn đầu tiên của tablet Lenovo Tab M11 nằm ở cấu hình máy mượt mà, ổn định suốt quá trình sử dụng nhờ trang bị chip xử lý Helio G88 của MediaTek và khởi chạy trên phiên bản hệ điều hành Android. 
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (455, N'8 GB
', N'64 GB
', N'10.36 inch
', N'7100 mAh
', N'0.76kg
', N'Xám
', N'Sở hữu màn hình 2K siêu sắc nét, thân máy cực mỏng nhẹ, hệ thống âm thanh Dolby Atmos, viên pin khủng 7.100 mAh và chip xử lý Snapdragon 680, OPPO Pad Air đạt đến sự cân bằng hoàn hảo giữa nét thẩm mỹ và yếu tố công nghệ, trở thành một trong những mẫu tablet tầm trung lý tưởng nhất từ trước đến nay. Với thân máy siêu mỏng chỉ 6.84mm và có trọng lượng nhẹ nhàng 440 gram, OPPO Pad Air không chỉ cơ động mà còn khoe dáng vẻ sắc sảo đầy tính thời trang. Mỗi đường nét, mỗi khía cạnh trên sản phẩm đều được trau chuốt tỉ mỉ nhằm tạo nên kết cấu tổng thể đặc biệt hút mắt. Sự gọn gàng tinh tế biến OPPO Pad Air thành một trong những mẫu tablet cơ động nhất thị trường. Bạn sẽ phải ngạc nhiên về độ hoàn thiện của sản phẩm khi cầm thiết bị trên tay.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (438, NULL, NULL, N'55inch
', N'150W
', N'15kg
', N'Đen
', N'Smart Tivi Casper A Series 4K 55 inch 55UGA610 sở hữu màn hình tràn viền mãn nhãn với độ mỏng tối ưu, mang đến những trải nghiệm mượt mà về thị giác. Thiết kế tinh tế giúp tivi Casper phù hợp với mọi không gian nội thất. Màn hình tivi 50 inch thích hợp trưng bày cho những không gian vừa như phòng ngủ, phòng khách hoặc treo tường tùy theo nhu cầu lắp đặt của bạn. Ngoài ra, chân đế chữ V úp ngược giúp tivi đứng vững trên kệ tủ, mặt bàn,... Màn hình Smart Tivi Casper có độ phân giải 4K siêu sắc nét với 3.840 điểm ảnh ngang và 2.160 điểm ảnh dọc, tương ứng với 8.3 triệu điểm ảnh. Nhờ độ phân giải này, bạn có thể thưởng thức các nội dung hiển thị rõ ràng, màu sắc chi tiết và sống động hơn trên chiếc tivi Casper 4K. Công nghệ HDR được trang bị trên Smart Tivi Casper A Series 4K 50 inch 50UGA610 tái hiện chuẩn xác từng sắc thái, chân thực với dải màu rực rỡ, độ tương phản ấn tượng. Chi tiết giữa vùng sáng và vùng tối được làm rõ nét, hình ảnh chân thật hơn cho bạn thưởng thức trọn mọi chi tiết.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (440, NULL, NULL, N'50inch
', N'120W
', N'14.8kg
', N'Đen
', N'Sở hữu thiết kế khung viền siêu mỏng, Smart Tivi Casper 4K 50 inch 50UW6000 mang đến sự tinh tế và sang trọng cho không gian sống của gia đình bạn. Với chi tiết tỉ mỉ, đường nét thanh lịch cùng chân đế chữ V úp ngược dễ tháo rời, tivi Casper 50UW6000 phù hợp sử dụng cho nhiều không gian giải trí khác nhau. Sự kết hợp hoàn hảo giữa độ phân giải 4K và công nghệ HDR10 của Smart Tivi Casper đảm bảo rằng bạn sẽ được tận hưởng hình ảnh tinh tế, sắc nét và đầy chi tiết. Màu sắc sống động cùng độ tương phản cao sẽ làm cho hình ảnh có chiều sâu hơn, khiến mọi bộ phim, chương trình truyền hình và trò chơi trở nên sống động, chân thực. Công nghệ Dolby Digital Plus là phiên bản nâng cấp của Dolby Digital giúp tái tạo âm thanh vòm sống động, tinh khiết mang đến chất lượng âm thanh đỉnh cao. Người xem có thể khám phá các cung bậc âm thanh hoàn toàn mới mẻ, khác biệt và đẳng cấp thông qua những giai điệu sôi động và mạnh mẽ. Bên cạnh đó, tivi có tổng công suất loa là 16W cho âm thanh vang dội tựa rạp chiếu phim thu nhỏ tại căn phòng bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (463, NULL, NULL, N'458 lít
', NULL, N'70 kg
', NULL, N' Tủ lạnh Casper Inverter side by side 458 lít RS-460PG sở hữu thiết kế hiện đại, sang trọng, được làm từ những chất liệu cao cấp, bền bỉ. Dung tích lớn đáp ứng nhu cầu bảo quản và dự trữ thực phẩm của gia đình đông người. Việc ứng dụng những công nghệ tiên tiến cho hiệu quả giữ tươi thực phẩm tốt và tiết kiệm điện năng tiêu thụ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (464, NULL, NULL, N'95 lít
', NULL, N'19 kg
', NULL, N'Tủ lạnh Casper Inverter một cửa 95 lít RO-95PG là dạng tủ lạnh mini sở hữu thiết kế nhỏ gọn, thích hợp cho nhu cầu lưu trữ thực phẩm thời gian ngắn của 1 - 2 người. Với cấu tạo gồm cả ngăn lạnh và ngăn mát, sản phẩm có thể bảo quản được nhiều loại thực phẩm khác nhau.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (465, NULL, NULL, N'194 lít
', NULL, N'37 kg
', NULL, N'Tủ lạnh Toshiba Inverter 194 lít GR-RT252WE-PMV(52) mang một vẻ đẹp sang trọng, tinh tế, phù hợp với không gian bếp hiện đại. Sản phẩm được tích hợp hàng loạt công nghệ và tính năng thông minh như: công nghệ khử mùi diệt khuẩn PureBio, Multi Air Flow làm lạnh đa chiều, Origin Inverter tiết kiệm điện, Cooling Zone trữ đông mềm thực phẩm,... Với những tính năng tiện ích như vậy, Toshiba Inverter chắc chắn là trợ thủ đắc lực, góp phần mang đến bữa ăn ngon miệng cho cả gia đình bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (466, NULL, NULL, N'49.5 x 59.5 x 85 cm
', NULL, N'61 kg
', NULL, N'Máy giặt cửa trước Casper Inverter 9.0 Kg WF-9VG1 có tới 16 chương trình giặt khác nhau, phù hợp với nhiều loại trang phục cũng như nhu cầu giặt giũ của gia đình. Công nghệ khử khuẩn hơi nước Steam Wash cùng với tính năng làm sạch lồng giặt và hệ thống suy luận ảo Fuzzy Logic giúp tối ưu hiệu quả sử dụng năng lượng và đảm bảo lồng giặt luôn sạch sẽ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (456, N'8 GB
', N'256 GB
', N'11.61inch
', N'9510 mAh, 67W
', N'0.76kg
', N'Xám
', N'OPPO Pad 2 là sản phẩm mới của OPPO trong công cuộc chạy đua công nghệ trên thị trường máy tính bảng. Máy thu hút được khá nhiều sự quan tâm khi trang bị một màn hình lớn, con chip mạnh trong tầm giá cùng một viên pin lớn cho trải nghiệm dài lâu mà ít khi gặp phải gián đoạn. Điểm nổi bật tiếp theo của OPPO Pad 2 chính là màn hình lớn, mang đến trải nghiệm tuyệt vời cho người dùng. Với kích thước lên đến 11.61 inch, chiếc máy tính bảng này không chỉ là một công cụ làm việc hiệu quả mà còn là một trung tâm giải trí đa phương tiện hoàn hảo. OPPO Pad 2 áp dụng tỉ lệ màn hình 7:5, tạo nên cảm giác vuông vức hơn so với các tỉ lệ thông thường, công nghệ này không chỉ giúp bạn dễ dàng truy cập ứng dụng và tài liệu công việc, mà còn làm cho việc sử dụng trở nên thú vị hơn hẳn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (337, NULL, NULL, N'61cm
', NULL, N'20kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 1 HP ATKB25YVMV là sản phẩm mang đến cho người tiêu dùng trải nghiệm mát lạnh một cách dễ chịu với đa dạng các công nghệ hiện đại đi kèm theo như luồng gió thoải mái Coanda, Inverter, Powerful, khử mùi Enzyme Blue mặc định & PM 2.5 (Tùy chọn mua thêm),...

Tổng quan thiết kế
Dàn lạnh

Máy lạnh một chiều này của Daikin được thiết kế với dạng hình chữ nhật quen thuộc, màu trắng trang nhã, hai bên hông được nhấn với dải màu xám khá hiện đại. Bốn góc được bo cong nhẹ tạo sự mềm mại, sản phẩm rất dễ dàng kết hợp với nội thất không gian."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (338, NULL, NULL, N'77cm
', NULL, N'18kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 1 HP ATKF25YVMV nhanh chóng làm lạnh không gian phòng bạn nhờ công nghệ Powerful, thanh lọc không khí trong sạch với công nghệ Streamer và phin lọc Enzyme Blue tích hợp lọc bụi mịn PM2.5, giúp lan tỏa khí lạnh đều khắp phòng nhờ thiết kế cánh quạt đảo gió 3D, tuỳ chỉnh điều khiển lên xuống trái phải tự động.

Tổng quan thiết kế
Dàn lạnh

- Daikin ATKF25YVMV có kiểu dáng hiện đại, đường viền màu xanh bo theo cạnh bên của thân máy giúp tạo nên nét mềm mại góp phần mang đến điểm nhấn khác biệt cho sản phẩm so với những mẫu máy có tông màu trắng thường gặp khác."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (339, NULL, NULL, N'64cm
', NULL, N'18kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 1 HP ATKB25YVMV là sản phẩm mang đến cho người tiêu dùng trải nghiệm mát lạnh một cách dễ chịu với đa dạng các công nghệ hiện đại đi kèm theo như luồng gió thoải mái Coanda, Inverter, Powerful, khử mùi Enzyme Blue mặc định & PM 2.5 (Tùy chọn mua thêm),...

Tổng quan thiết kế
Dàn lạnh

Máy lạnh một chiều này của Daikin được thiết kế với dạng hình chữ nhật quen thuộc, màu trắng trang nhã, hai bên hông được nhấn với dải màu xám khá hiện đại. Bốn góc được bo cong nhẹ tạo sự mềm mại, sản phẩm rất dễ dàng kết hợp với nội thất không gian."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (340, NULL, NULL, N'79cm
', NULL, N'14kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 1 HP ATKF25YVMV nhanh chóng làm lạnh không gian phòng bạn nhờ công nghệ Powerful, thanh lọc không khí trong sạch với công nghệ Streamer và phin lọc Enzyme Blue tích hợp lọc bụi mịn PM2.5, giúp lan tỏa khí lạnh đều khắp phòng nhờ thiết kế cánh quạt đảo gió 3D, tuỳ chỉnh điều khiển lên xuống trái phải tự động.

Tổng quan thiết kế
Dàn lạnh

- Daikin ATKF25YVMV có kiểu dáng hiện đại, đường viền màu xanh bo theo cạnh bên của thân máy giúp tạo nên nét mềm mại góp phần mang đến điểm nhấn khác biệt cho sản phẩm so với những mẫu máy có tông màu trắng thường gặp khác."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (520, N'4GB
', N'64GB
', N'10.2 inch, IPS LCD, 60Hz
', N'10Wh
', N'477g
', N'Hồng
', N'Phụ kiện: Hộp máy, Cáp USB, Pin
', N'Apple A14 Bionic
', N'15W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (457, N'6 GB
', N'128 GB
', N'11.4
', N'8000 mAh33 W
', N'0.76kg
', N'Xám
', N'OPPO Pad Neo WiFi, một phiên bản mới từ OPPO mang đến sự khác biệt trong thị trường máy tính bảng. Với màn hình rộng 11.4 inch, con chip ổn định và RAM lớn giúp nó thu hút sự chú ý, mang đến cho người dùng trải nghiệm mượt mà và bền bỉ. OPPO Pad Neo WiFi có thiết kế mặt lưng được tạo từ chất liệu kính và nhôm cao cấp, mang lại độ bền cao cũng như sự tinh tế và sang trọng. Khi ánh sáng chiếu vào, mặt lưng này phản chiếu lại, tạo nên các hiệu ứng ánh sáng lạ mắt giúp mang đến cái nhìn thú vị hơn cho sản phẩm. OPPO Pad Neo WiFi được trang bị màn hình IPS LCD, nổi tiếng với khả năng cung cấp chất lượng hình ảnh ổn định trong phân khúc giá. Lựa chọn này đảm bảo mang đến hình ảnh chất lượng cao với độ nét không thể phủ nhận và màu sắc trung thực. Độ phân giải 1720 x 2408 pixels giúp mỗi chi tiết trở nên rõ ràng và sống động, tạo ra một trải nghiệm hấp dẫn không thể bỏ qua.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (341, NULL, NULL, N'74cm
', NULL, N'18kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 1 HP FTKY25WMVMV được trang bị công nghệ tiết kiệm điện Inverter, vận hành êm ái với độ ồn 18/38 dB. Phin lọc bụi kháng khuẩn, khử mùi Enzyme Blue, cùng công nghệ lọc khí Streamer độc quyền loại bỏ vi khuẩn, nấm mốc gây hại. 

Tổng quan thiết kế
- Dàn lạnh: Thiết kế tông màu trắng chủ đạo, dễ dàng kết hợp hài hòa với nhiều không gian nhà ở khác nhau đem lại vẻ đẹp sang trọng, tinh tế cho ngôi nhà. 

- Dàn nóng: Vỏ máy được cải tiến chống thằn lằn xâm nhập, bảo vệ tốt hệ thống bo mạch bên trong, kết hợp cùng chất liệu chống ăn mòn giúp gia tăng tuổi thọ của máy."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (342, NULL, NULL, N' 67cm
', NULL, N'16kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 1 HP ATKF25XVMV là dòng máy lạnh sở hữu nhiều tính năng hiện đại với công nghệ lọc khí Streamer và Phin lọc Enzyme Blue tích hợp PM2.5 giúp tinh lọc không khí và loại bỏ các vi rút, vi khuẩn, mùi hôi và nấm mốc hiệu quả. Trang bị công nghệ Inverter giúp tiết kiệm điện năng hiệu quả. Dàn nóng được cải tiến nên máy vận hành êm ái đảm bảo giấc ngủ ngon mỗi tối.

Tổng quan thiết kế
Dàn lạnh

- Máy lạnh Daikin này được thiết kế với tông màu trắng chủ đạo, lớp vỏ ngoài bằng nhựa cao cấp phù hợp với nhiều kiểu không gian nội thất khác nhau."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (343, NULL, NULL, N'78cm
', NULL, N'19kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 1.5 HP ATKB35YVMV thuộc dòng sản phẩm một chiều được tích hợp đa dạng các công nghệ như luồng gió thoải mái Coanda, Inverter, Powerful, khử mùi Enzyme Blue mặc định,... đảm bảo mang đến không gian dễ chịu, thoải mái cho người dùng.

Tổng quan thiết kế
Dàn lạnh

Được thiết kế với dạng hình chữ nhật kết hợp với màu trắng trang nhã, hai bên hông được nhấn với dải màu xám và bốn góc được bo cong nhẹ tạo sự mềm mại, hiện đại.

Dàn nóng

- Dàn nóng thiết kế chắc chắn với ống dẫn gas bằng đồng và lá tản nhiệt bằng nhôm giúp quá trình truyền tải gas nhanh chóng, đảm bảo hiệu quả làm lạnh."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (345, NULL, NULL, N'76cm
', NULL, N'17kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 1.5 HP FTKY35WMVMV được trang bị công nghệ kháng khuẩn, khử mùi Streamer độc quyền, kết hợp cùng phin lọc bụi Enzyme Blue + PM2.5, công nghệ tiết kiệm điện Inverter vận hành êm ái, bền bỉ với độ ồn 19/39 dB.

Tổng quan thiết kế
- Dàn lạnh: Thiết kế tông màu trắng tinh tế, viền bo tròn mềm mại, thanh lịch góp phần đem lại sự sang trọng cho ngôi nhà."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (346, NULL, NULL, N'80cm
', NULL, N'12kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 2 HP FTKF50XVMV sở hữu công nghệ Streamer và phin lọc Enzyme Blue tích hợp PM2.5 sẽ loại bỏ vi rút, vi khuẩn, mùi hôi và nấm mốc giúp tinh lọc không khí. Trang bị thêm công nghệ Inverter giúp tiết kiệm điện năng hiệu quả. Đặc biệt dàn nóng được cải tiến nên vận hành êm ái đảm bảo giấc ngủ ngon.

Thiết kế
Dàn lạnh:

- Thiết kế đơn giản, dễ lắp đặt và vệ sinh máy. Vỏ dàn lạnh được làm bằng nhựa cao cấp và sở hữu gam màu trắng hiện đại."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (347, NULL, NULL, N'64cm
', NULL, N'13kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 2 chiều 1 HP ATHF25XVMV ứng dụng công nghệ Powerful giúp nhanh chóng tận hưởng được sự mát mẻ tức thì. Luồng gió Coanda giúp cho mọi góc phòng đều mát mẻ và tránh hiện tượng buốt người. Tiết kiệm điện năng hiệu quả với công nghệ tiết kiệm điện Inverter. Khử mùi, nấm mốc, lọc bụi PM2.5, giảm vi khuẩn, các chất gây dị ứng với lưới lọc, phin lọc Enzyme Blue + PM2.5 kết hợp cùng công nghệ Streamer.

Tổng quan thiết kế
Dàn lạnh

Máy lạnh nhà Daikin được hoàn thiện với lớp vỏ được làm bằng chất liệu nhựa cao cấp, cùng tone màu trắng thanh lịch và kích thước vừa phải nên hoàn toàn phù hợp với mọi không gian phòng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (348, NULL, NULL, N'67cm
', NULL, N'13kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 2 chiều 1 HP ATHF25XVMV ứng dụng công nghệ Powerful giúp nhanh chóng tận hưởng được sự mát mẻ tức thì. Luồng gió Coanda giúp cho mọi góc phòng đều mát mẻ và tránh hiện tượng buốt người. Tiết kiệm điện năng hiệu quả với công nghệ tiết kiệm điện Inverter. Khử mùi, nấm mốc, lọc bụi PM2.5, giảm vi khuẩn, các chất gây dị ứng với lưới lọc, phin lọc Enzyme Blue + PM2.5 kết hợp cùng công nghệ Streamer.

Tổng quan thiết kế
Dàn lạnh

Máy lạnh nhà Daikin được hoàn thiện với lớp vỏ được làm bằng chất liệu nhựa cao cấp, cùng tone màu trắng thanh lịch và kích thước vừa phải nên hoàn toàn phù hợp với mọi không gian phòng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (349, NULL, NULL, N'60cm
', NULL, N'9kg
', N'Trắng
', N'"Loại bỏ nấm mốc, vi khuẩn đến 99.9% với công nghệ lọc khí Streamer
Công nghệ Streamer phân hủy vi khuẩn và nấm mốc bám trên phin lọc dưới hình thức phóng điện plasma, tạo ra những dòng electron ở tốc độ cao. Những electron va chạm và kết hợp với nitơ và oxy để tạo ra các phân tử phân hủy mạnh.

Nhờ vậy, Streamer sẽ loại bỏ 99.9% nấm mốc trong vòng 24 giờ và có khả năng vô hiệu hóa 99% vi-rút trong vòng 1 giờ, tạo bầu không khí trong lành."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (350, NULL, NULL, N'69cm
', NULL, N'18kg
', N'Trắng
', N'"Máy lạnh 2 chiều, vừa làm lạnh vừa sưởi ấm với công suất 2.5 HP, phù hợp phòng có diện tích từ 30 - 40m² (80 - 120m³).
Đem đến không gian mát lạnh tức thì với chế độ làm lạnh nhanh Powerful.
Trang bị cảm biến mắt thần thông minh + công nghệ Inverter tiết kiệm điện năng, máy vận hành êm.
Phin lọc Enzym Blue kết hợp lọc bụi mịn PM 2.5 ức chế vi khuẩn, khử mùi hôi mang đến luồng không khí tươi mát.
Luồng gió thổi Coanda 3D tránh gió thổi trực tiếp vào người, gây tê buốt.
Chức năng chống ẩm mốc, loại bỏ hơi ẩm trong máy, bảo vệ sức khỏe người dùng.
Chế độ lạnh hoặc sưởi được tự động vận hành theo nhiệt độ phòng, duy trì nhiệt độ ổn định.
Dàn nóng tản nhiệt phủ 2 lớp chống ăn mòn, sử dụng trong thời gian dài."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (351, NULL, NULL, N'65cm
', NULL, N'12kg
', N'Trắng
', N'"Máy lạnh 2 chiều (có sưởi ấm), công suất làm lạnh 2 HP phù hợp không gian từ 20 - 30m² (từ 60 đến 80m³).
Luồng gió thổi Coanda 3D đưa hơi lạnh lan tỏa khắp phòng, tránh thổi trực tiếp vào người.
Công nghệ Inverter và cảm biến mắt thần thông minh giúp tiết kiệm điện hiệu quả.
Tự động vận hành chế độ lạnh hoặc sưởi dựa trên nhiệt độ phòng, duy trì nhiệt độ ổn định.
Phin lọc Enzym Blue mặc định & PM 2.5 lọc bụi bẩn và bụi mịn PM 2.5, đem lại không gian sạch sẽ.
Công nghệ làm lạnh nhanh Powerful giúp làm lạnh nhanh tức thì.
Loại bỏ ẩm mốc, bảo vệ sức khỏe với chức năng chống ẩm mốc.
Dàn nóng được phủ 2 lớp chống ăn mòn, độ bền cao."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (352, NULL, NULL, N'69cm
', NULL, N'19kg
', N'Trắng
', N'"Công nghệ lọc khí Streamer loại bỏ vi khuẩn, nấm mốc hiệu quả
Công nghệ Streamer phân hủy vi khuẩn và nấm mốc bám trên phin lọc dưới hình thức phóng điện plasma, tạo ra những dòng electron ở tốc độ cao. Những electron này va chạm và kết hợp với nitơ, oxy để tạo ra các phân tử có khả năng phân hủy nhanh hơn 1000 lần so với phương pháp phóng điện plasma thông thường.

Nhờ vậy, Streamer sẽ loại bỏ 99.9% nấm mốc trong vòng 24 giờ và có khả năng vô hiệu hóa 99% vi-rút trong vòng 1 giờ, thanh lọc tối ưu bầu không khí bạn thở."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (353, NULL, NULL, N'72cm
', NULL, N'20kg
', N'Trắng
', N'"Công nghệ lọc khí Streamer loại bỏ vi khuẩn, nấm mốc hiệu quả
Công nghệ Streamer loại bỏ vi khuẩn và nấm mốc bám trên phin lọc dưới hình thức phóng điện plasma tiên tiến với khả năng phân hủy oxy hóa nhanh hơn 1000 lần hoặc hơn so với phóng điện plasma thông thường. 

Nhờ vậy, Streamer sẽ loại bỏ 99.9% nấm mốc trong vòng 24 giờ và có khả năng vô hiệu hóa 99% vi-rút trong vòng 1 giờ, mang lại bầu không khí an toàn, sạch khuẩn."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (354, NULL, NULL, N'67cm
', NULL, N'10kg
', N'Trắng
', N'"Máy lạnh Daikin Inverter 2.5 HP FTKY60WVMV là dòng máy lạnh có công suất lớn, với công nghệ Inverter và mắt thần thông minh máy có thể kiểm soát được điện năng tiêu thụ nên tiết kiệm điện. Sở hữu công nghệ Streamer và phin lọc Enzyme Blue kết hợp phin lọc PM2.5 giúp loại bỏ vi khuẩn, nấm mốc và bụi bẩn mang đến không gian trong lành. 

Tổng quan thiết kế
 Dàn lạnh:

Máy lạnh Daikin Inverter 2.5 HP FTKY60WVMV sở hữu thiết kế sang trọng, hiện đại với tông màu trắng chủ đạo. Mặt trước máy được làm phẳng, bo cong nhẹ ở các cạnh phù hợp nhiều kiểu thiết kế không gian, có thể đặt ở phòng khách, phòng ngủ hay phòng làm việc."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (356, NULL, NULL, N'67cm
', NULL, N'19kg
', N'Trắng
', N'"Máy lạnh 2 chiều Daikin Inverter 3 HP FTHF71VAVMV có công suất 3 HP nhanh chóng làm lạnh không gian có diện tích lớn, trang bị công nghệ Inverter tiết kiệm điện năng hiệu quả trong khi vẫn duy trì độ bền bỉ lâu dài khi hoạt động, tích hợp chức năng làm lạnh và sưởi ấm trong cùng một thiết bị.

Thiết kế
Dàn lạnh

- Máy lạnh Daikin duy trì thiết kế sang trọng, đẹp mắt với những đường nét thanh thoát và màu trắng nhẹ nhàng. Dù được sử dụng ở phòng khách, phòng ngủ hay phòng bếp,… sản phẩm sẽ góp phần làm đẹp cho không gian lắp đặt."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (357, NULL, NULL, N'67cm
', NULL, N'17kg
', N'Trắng
', N'"Máy lạnh Panasonic Inverter 1.5 HP CU/CS-PU12AKH-8 thiết kế tối giản, phù hợp cho nhiều không gian, làm mát trong tích tắc với công nghệ làm lạnh nhanh Powerful, giữ không gian sống trong lành, sạch sẽ hơn với công nghệ Nanoe-G lọc được bụi mịn PM 2.5, giảm hao phí điện năng nhờ công nghệ Inverter, chế độ ECO tích hợp A.I.

Tổng quan thiết kế       
Dàn lạnh

- Panasonic CU/CS-PU12AKH-8 có thiết kế hiện đại, các góc bo cong nhẹ nhàng tạo dáng thanh thoát, gam màu trắng thanh lịch, cho dàn lạnh hòa hợp được với nhiều phong cách nội thất khác nhau."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (358, NULL, NULL, N'68cm
', NULL, N'8kg
', N'Trắng
', N'"Máy lạnh Panasonic Inverter 1.5 HP CU/CS-XU12ZKH-8 có khả năng khử mùi, ức chế sự phát triển của virus và vi khuẩn đến 99%, giữ ẩm cho tóc và da của người dùng không bị khô khi sử dụng máy lạnh. Ngoài ra, thiết bị còn có thể kết nối wifi, hỗ trợ người dùng điều khiển máy lạnh bằng điện thoại bất kỳ khi nào.

Thiết kế
Dàn lạnh:

Dàn lạnh được thiết kế màu trắng với lớp vỏ bằng nhựa cao cấp và bền bỉ, phù hợp cho mọi không gian lắp đặt. Ngoài ra, mặt trước dàn lạnh có thể tháo rời dễ dàng để thuận tiện cho việc vệ sinh thiết bị theo định kỳ."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (359, NULL, NULL, N'78cm
', NULL, N'20kg
', N'Trắng
', N'"Máy lạnh Panasonic Inverter 2 HP CU/CS-PU18AKH-8 giúp lọc sạch bụi bẩn với công nghệ Nanoe-G, cho hiệu quả làm mát nhanh với công nghệ Powerful, vận hành êm ái và tiết kiệm điện năng ấn tượng với công nghệ Inverter cùng chế độ ECO tích hợp A.I, điều khiển từ xa tiện lợi khi kết nối App qua Wifi.

Tổng quan thiết kế       
Dàn lạnh

- Với vẻ ngoài tinh giản, tông màu trắng nhã nhặn, máy lạnh bố trí gọn gàng và dung nhập vào không gian nội thất cổ điển cho đến hiện đại một cách hài hòa, đảm bảo tính thẩm mỹ cho căn phòng. 

- Nắp dàn lạnh có thể tháo rời cho việc vệ sinh bên trong dễ dàng. Trên dàn lạnh còn có nhiều đèn báo tín hiệu giúp bạn quan sát thiết bị vận hành tiện lợi mọi lúc"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (360, NULL, NULL, N'69cm
', NULL, N'16kg
', N'Trắng
', N'"Máy lạnh Panasonic Inverter 1 HP CU/CS-PU9AKH-8 là thiết bị được trang bị đầy đủ các tính năng hiện đại như làm lạnh nhanh với chế độ Powerful, lọc bụi mịn có trong không khí giúp duy trì một không gian mát lạnh và trong lành.

Tổng quan thiết kế
Dàn lạnh

Đây là sản phẩm được thiết kế thanh lịch với sắc trắng trung tính dễ dàng kết hợp hài hòa với nội thất không gian. Nhìn chung máy có kiểu dáng vuông vắn với bốn góc được bo cong nhẹ tạo được tổng thể thiết bị hài hòa hơn."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (361, NULL, NULL, N'67cm
', NULL, N'18kg
', N'Trắng
', N'"Máy lạnh Panasonic Inverter 1 HP CU/CS-XU9ZKH-8 thổi hơi lạnh vào căn phòng dưới 15m² của bạn nhanh chóng với công nghệ làm lạnh nhanh iAuto-X, công suất 1 HP, sử dụng tiết kiệm điện với công nghệ ECO tích hợp A.I và Inverter, giữ không gian phòng sạch sẽ, diệt khuẩn, khử mùi tối ưu với công nghệ Nanoe™ X, Nanoe-G, điều khiển bằng điện thoại, có wifi tiện lợi.

Tổng quan thiết kế       
Dàn lạnh

- Máy lạnh Panasonic có vẻ ngoài thời thượng với tông màu trắng thuần khiết, đường viền màu bạc nổi bật tạo điểm nhấn cho tổng thể thiết kế thêm đẹp mắt, sang trọng. Kiểu dáng hình chữ nhật thích hợp lắp đặt trong không gian phòng khách, phòng ngủ, phòng làm việc của bạn"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (362, NULL, NULL, N'70cm
', NULL, N'12kg
', N'Trắng
', N'"Máy lạnh Panasonic Inverter 1 HP CU/CS-YZ9AKH-8 duy trì không gian trong phòng luôn ấm áp/mát mẻ quanh năm, thanh lọc không khí hiệu quả với công nghệ Nanoe-G, chế độ làm lạnh nhanh Powerful, sử dụng tiết kiệm điện năng nhờ công nghệ Inverter, chế độ ECO tích hợp A.I, điều khiển bằng điện thoại qua Wifi từ xa tiện lợi.

Tổng quan thiết kế       
Dàn lạnh

- Mẫu máy lạnh Inverter này có kiểu dáng gọn gàng trong từng chi tiết, hình chữ nhật ngang phù hợp để lắp đặt kiểu treo tường trong phòng khách, phòng ngủ gia đình cho tới phòng làm việc ở công ty. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (363, NULL, NULL, N'68cm
', NULL, N'10kg
', N'Trắng
', N'"Hoạt động với công suất làm lạnh 2 HP, phù hợp với diện tích từ 20 - 30m².
Khử mùi, loại bỏ nấm mốc và các chất gây dị ứng nhờ công nghệ nanoe™ X.
Công nghệ Nanoe-G giúp lọc bụi mịn PM 2.5 có trong không gian.
Máy lạnh vận hành êm ái và tiết kiệm điện nhờ công nghệ Inverter và ECO tích hợp A.I.
Công nghệ iAuto-X giúp không gian nhanh chóng đạt nhiệt độ cài đặt.
Dàn lạnh được hong khô giúp hạn chế tình trạng ẩm mốc nhờ trang bị công nghệ Inside Cleaning.
Điều khiển hoạt động của máy lạnh bằng điện thoại có kết nối Wifi bất kỳ nơi đâu tiện lợi.
Chế độ kiểm soát độ ẩm sẽ tối ưu độ ẩm trong không gian mang đến cảm giác thoải mái."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (495, N'8GB
', N'1TB
', N'6.7 inch
', N'4500mAh
', N'240g
', N'Đen
', N'Phụ kiện: Hộp, sạc adapter
', N'Apple A16 Bionic 6 nhân
', N'25W
', N'Móp cạnh 
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (496, N'8GB', N'1TB
', N'6.1 inch
', N'4500mAh
', N'240g
', N'Tím 
', N'Phụ kiện: Hộp, sạc adapter
', N'Apple A16 Bionic 6 nhân
', N'25W
', N'Trầy xước ít
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (497, N'6GB
', N'1TB
', N'6.7 inch
', N'4000mAh
', N'220g
', N'Vàng đồng
', N'Phụ kiện: Hộp, sạc adapter
', N'Apple A16 Bionic 6 nhân
', N'25W
', N'Máy đẹp ít xước 
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (498, N'6GB
', N'1TB
', N'6.7 inch
', N'3900mAh
', N'189g
', N'Đen
', N'Phụ kiện: Hộp, sạc adapter
', N'Apple A16 Bionic 6 nhân
', N'25W
', N'Trầy xước màn hình, cấn góc
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (500, N'6GB
', N'256GB
', N'6.7 inch
', N'4800mAh
', N'1.29kg
', N'Vàng đồng
', N'Phụ kiện: Hộp máy, Sạc
', N'M1, GPU 8 lõi
', N'60W
', N'Trầy xước vỏ, màn đẹp
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (364, NULL, NULL, N'67cm
', NULL, N'11kg
', N'Trắng
', N'"Máy lạnh Panasonic Inverter 1.5 HP CU/CS-YZ12AKH-8 thuộc dòng máy lạnh 2 chiều vừa làm mát vừa sưởi ấm cho căn phòng có diện tích từ 15 - 20m² hiệu quả với công suất 1.5 HP, hỗ trợ công nghệ Nanoe-G lọc được bụi mịn PM2.5 giúp tăng cường bảo vệ sức khỏe gia đình, mang đến không gian sống thoải mái, tiết kiệm điện nhờ công nghệ Inverter, chế độ ECO tích hợp A.I.

Tổng quan thiết kế       
Dàn lạnh

- Panasonic CU/CS-YZ12AKH-8 có thiết kế tối giản, tông màu trắng trang nhã bổ sung hài hòa vào không gian sống hiện đại của gia đình. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (365, NULL, NULL, N'80cm
', NULL, N'8kg
', N'Trắng
', N'"Máy lạnh Panasonic Inverter 2.5 HP CU/CS-PU24AKH-8 là mẫu máy lạnh 1 chiều hoạt động mạnh mẽ với công suất 2.5 HP, động cơ Inverter, chế độ ECO tích hợp A.I tiết kiệm điện, lọc không khí hiệu quả với công nghệ Nanoe-G, dùng bền bỉ với lá tản nhiệt phủ BlueFin chống ăn mòn.

Tổng quan thiết kế       
Dàn lạnh

- Panasonic CU/CS-PU24AKH-8 có thiết kế hình khối chữ nhật ngang đơn giản, gọn đẹp với tông màu trắng trang nhã, lắp đặt kiểu treo tường, phù hợp cho không gian phòng khách, phòng làm việc cho đến phòng ngủ. 

- Kiểm tra và điều khiển thiết bị dễ dàng, chuẩn xác hơn với các đèn báo hiệu được tích hợp trên dàn lạnh"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (366, NULL, NULL, N'76cm
', NULL, N'15kg
', N'Trắng
', N'"Công suất 1 HP, phù hợp cho diện tích căn phòng dưới 15 mét vuông
Với công suất 1 HP, máy lạnh 2 chiều Panasonic này rất thích hợp cho những hộ gia đình có diện tích căn phòng dưới 15 mét vuông. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (367, NULL, NULL, N'70cm
', NULL, N'18kg
', N'Trắng
', N'"Thiết kế hiện đại, công suất 2 HP - 17.700 BTU phù hợp phòng có diện tích dưới 25 m².
Loại bỏ 99% các hạt bụi có kích thước nhỏ như PM 2.5 với nanoe-G.
Đơn giản hóa kết nối và điều khiển với chức năng kết nối Wi-Fi được tích hợp sẵn.
Duy trì không khí ấm áp/mát mẻ vào bất kỳ mùa nào trong suốt cả năm.
Chế độ Powerful làm mát căn phòng của bạn nhanh hơn 18%.
Sử dụng môi chất lạnh R32 thân thiện với môi trường."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (368, NULL, NULL, N'79cm
', NULL, N'11kg
', N'Trắng
', N'"Máy lạnh 2 chiều 1.5 HP cho mùa hè mát lạnh và mùa đông ấm áp
Máy lạnh Panasonic 2 chiều cho khả năng làm lạnh những lúc thời tiết nóng bức, và khả năng sưởi ấm khi thời tiết lạnh. Loại máy lạnh này phù hợp với những nơi thời tiết 4 mùa, có mùa đông lạnh như miền Bắc, giúp tiết kiệm chi phí khi không cần trang bị thêm máy sưởi."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (369, NULL, NULL, N'63cm
', NULL, N'19kg
', N'Trắng
', N'"Bảo vệ sức khỏe toàn diện nhờ công nghệ nanoe™ X
Với mong muốn bảo vệ gia đình khỏi các bệnh về đường hô hấp, máy lạnh Panasonic cho ra đời công nghệ nanoe™ X để ức chế các loại virus bám trên bề mặt, giúp loại bỏ virus hiệu quả và mang lại môi trường an toàn, lành mạnh.

Bên cạnh đó, công nghệ nanoe™ X còn có khả năng khử mùi hiệu quả, loại bỏ các loại mùi thường gặp trong nhà như mùi thuốc lá, mùi thức ăn,... để đem lại bầu không khí sạch sẽ và trong lành suốt cả ngày"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (370, NULL, NULL, N'66cm
', NULL, N'17kg
', N'Trắng
', N'"Máy lạnh LG Inverter 1 HP V10WIN1 vận hành êm ái, duy trì nhiệt độ làm lạnh ổn định, tiết kiệm năng lượng với công nghệ Dual inverter, chế độ kiểm soát năng lượng chủ động Energy Ctrl, cho tốc độ làm lạnh nhanh với công nghệ Jet Cool, hỗ trợ nhiều tính năng như điều khiển bằng điện thoại có wifi, tự làm sạch, tự chẩn đoán lỗi,...

Tổng quan thiết kế
Dàn lạnh

- LG V10WIN1 mang thiết kế hình khối chữ nhật ngang quen thuộc với những đường cong mềm mại và hoàn thiện kết hợp cùng gam màu trắng thanh lịch, dung nhập liền mạch với những món đồ nội thất khác trong căn phòng hiện đại của bạn."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (503, N'16GB
', N'SSD 512GB
', N'13.3 inch, 60Hz
', N'5000 mAh
', N'1.6kg
', N'Xanh
', N'Phụ kiện: Hộp máy, Sạc Adapter
', N'Intel i3 1220p
', N'75W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (504, N'12GB
', N'SSD 512GB
', N'16.2 inch, 120Hz
', N'5000 mAh
', N'1.6kg
', N'Xanh
', N'Phụ kiện: Hộp máy, Sạc Adapter
', N'Intel i3 1220p
', N'75W
', N'Máy trầy xước nhiều
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (505, N'8GB
', N'SSD 512GB
', N'16.2 inch, 120Hz
', N'7000mAh
', N'1.4kg
', N'Bạc
', N'Phụ kiện: Hộp máy, Sạc
', N'Intel i7 12700H
', N'100W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (371, NULL, NULL, N'80cm
', NULL, N'10kg
', N'Trắng
', N'"Máy lạnh LG Inverter 1.5 HP V13WIN1 có độ bền cao nhờ trang bị dàn nóng có ứng dụng công nghệ Gold-Fin chống ăn mòn hiệu quả. Không những vậy, sản phẩm còn có khả năng làm lạnh nhanh, thổi gió dễ chịu và được trang bị chế độ ngủ đêm tránh buốt, tiện lợi cho bạn lựa chọn.

Thiết kế
Dàn lạnh:

Máy lạnh LG Inverter 1.5 HP V13WIN1 có kiểu thiết kế hình chữ nhật nằm ngang tối giản và tinh tế, sở hữu gam màu trắng với chất liệu vỏ nhựa cao cấp bền bỉ."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (372, NULL, NULL, N'69cm
', NULL, N'18kg
', N'Trắng
', N'"Thiết kế tối giản, phù hợp với mọi không gian
Toàn bộ máy lạnh được bao phủ bởi gam màu trắng sạch sẽ, dễ dàng phối hợp với mọi phong cách thiết kế nội thất từ cổ điển cho đến hiện đại. Máy lạnh kích thước khá gọn gàng giúp tăng thẩm mỹ cho bức tường phòng bạn.

Trên dàn lạnh cũng được trang bị một màn hình hiển thị nhiệt độ giúp bạn dễ dàng quan sát, không cần phải tìm remote mỗi khi muốn xem nhiệt độ nữa."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (373, NULL, NULL, N'71cm
', NULL, N'17kg
', N'Trắng
', N'"Tiết kiệm năng lượng đến 70%, vận hành êm ái hơn nhờ công nghệ Dual Inverter
Máy lạnh LG sử dụng máy nén Dual Inverter có khả năng tiết kiệm điện năng tiêu thụ đến 70% nhờ dải tần số hoạt động mở rộng hơn.

Ngoài ra, với động cơ Dual Inverter thì trong quá trình vận hành, máy lạnh cũng hoạt động khá êm ái, không gây những tiếng ồn khó chịu ảnh hưởng chất lượng cuộc sống."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (374, NULL, NULL, N'79cm
', NULL, N'10kg
', N'Trắng
', N'"Máy lạnh LG Inverter 1 HP V10APFP là dòng máy lạnh 1 chiều sở hữu công nghệ Dual Inverter và Energy Ctrl tiết kiệm điện năng, khả năng lọc bụi kháng khuẩn và khử mùi với màng lọc dị ứng, màng lọc sơ cấp. Trang bị chức năng tự chẩn đoán lỗi, điều khiển thiết bị từ xa bằng điện thoại có wifi. 

Tổng quan thiết kế
Dàn lạnh

- Thiết kế hình chữ nhật với tông màu trắng chủ đạo, phù hợp với mọi không gian nội thất. 

- Trang bị màn hình hiển thị nhiệt độ giúp quan sát và theo dõi nhiệt độ dễ dàng, đặc biệt vào ban đêm."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (375, NULL, NULL, N'72cm
', NULL, N'11kg
', N'Trắng
', N'"Máy lạnh LG Inverter 1.5 HP V13APFP được trang bị công nghệ Dual Inverter và chế độ kiểm soát năng lượng chủ động Energy Ctrl giúp máy vận hành êm ái, tiết kiệm điện năng và duy trì nhiệt độ ổn định. Trang bị khả năng lọc bụi kháng khuẩn và khử mùi với khả năng tạo ion lọc không khí giúp đảm bảo an toàn sức khỏe cho cả gia đình. 

Tổng quan thiết kế
- Máy lạnh LG này được thiết kế với tông màu trắng chủ đạo, trang bị màn hình hiển thị nhiệt độ giúp theo dõi tiện lợi. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (376, NULL, NULL, N'63cm
', NULL, N'17kg
', N'Trắng
', N'"Máy lạnh LG Inverter 2.5 HP V24WIN1 được tích hợp công nghệ Dual inverter, chế độ Energy Ctrl giúp nâng cao hiệu quả làm lạnh và sử dụng tiết kiệm điện năng của gia đình, đẩy mạnh khả năng làm mát với công nghệ làm lạnh nhanh Jet Cool, điều khiển từ xa dễ dàng bằng điện thoại có wifi, giữ không gian phòng trong sạch, khử mùi hôi khó chịu nhờ bộ lọc PM 2.5 và màng lọc sơ cấp.

Tổng quan thiết kế
Dàn lạnh

- LG Inverter 2.5 HP V24WIN1 có vẻ ngoài sang trọng, mặt trước uốn cong tinh tế cùng tông màu trắng nhã nhặn, tươi sáng nên phối hợp được với nhiều phong cách nội thất khác nhau. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (377, NULL, NULL, N'66cm
', NULL, N'14kg
', N'Trắng
', N'"Máy lạnh 2 chiều LG Inverter 1.5 HP B13END1 thuộc dòng máy lạnh có thể vừa làm lạnh vừa sưởi phù hợp với những khu vực miền Bắc. Đặc biệt có tích hợp nhiều tính năng như làm lạnh nhanh Jet Cool, công nghệ Dual Inverter, tự làm sạch, chẩn đoán lỗi, đảo gió 4 chiều.

Tổng quan thiết kế        
Dàn lạnh

- Máy lạnh sở hữu gam màu trắng trang nhã, vỏ bằng nhựa và các cạnh bên được bo nhẹ lại tinh tế.

- Có màn hình hiển thị nhiệt độ ngay trên dàn lạnh."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (378, NULL, NULL, N'64cm
', NULL, N'13kg
', N'Trắng
', N'"Máy lạnh LG Inverter 1.5 HP V13WIN hoạt động với công suất 1.5 HP, làm lạnh tức thì cùng công nghệ Jet Cool, tích hợp công nghệ Dual Inverter, Energy Ctrl tiết kiệm điện năng, có màng lọc bụi mịn PM 2.5 giúp thanh lọc không khí, cho không gian sống của bạn sạch khuẩn hơn.

Tổng quan thiết kế       
Dàn lạnh

- Máy lạnh LG có đường nét mềm mại, kết cấu chắc chắn, bề mặt phủ gam màu trắng tươi sáng, sang trọng, phối hợp hài hòa với thiết kế nội thất của phòng ngủ, phòng khách, phòng làm việc gia đình."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (379, NULL, NULL, N'75cm
', NULL, N'10kg
', N'Trắng
', N'"Đánh giá chi tiết Máy lạnh LG Inverter 1 HP V10WIN
Máy lạnh LG Inverter 1 HP V10WIN là thiết bị làm mát tốt khi có khả năng làm lạnh nhanh chóng với công nghệ Jet Cool, hoạt động ổn định, tiết kiệm điện với công nghệ Dual Inverter, Energy Ctrl, có chức năng tự làm sạch, hẹn giờ bật tắt, chế độ ngủ đêm tránh buốt cho bạn sử dụng máy thuận tiện, làm mát hiệu quả.

Tổng quan thiết kế       
Dàn lạnh

- LG V10WIN thiết kế sang trọng với gam màu trắng thuần khiết, thanh lịch, các góc cạnh chế tác bo cong nhẹ cho kiểu dáng tinh tế, gọn đẹp, phù hợp bố trí trong bất kỳ không gian nội thất nào"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (380, NULL, NULL, N'71cm
', NULL, N'14kg
', N'Trắng
', N'Đảo gió 4 chiều giúp hơi lạnh lan toả đồng đềuĐiều khiển bằng điện thoại, có wifiTự khởi động lại khi có điệnTạo ion lọc không khíThổi gió dễ chịu (cho trẻ em, người già)Màn hình hiển thị nhiệt độ trên dàn lạnhHẹn giờ bật tắt máyCông nghệ Gold-Fin chống ăn mònChức năng tự làm sạchChức năng tự chẩn đoán lỗiChế độ ngủ đêm tránh buốt
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (381, NULL, NULL, N'68cm
', NULL, N'13kg
', N'Trắng
', N'"Máy lạnh 2 chiều LG Inverter thuộc dòng máy lạnh trung cấp với khả năng vừa làm lạnh vừa sưởi phù hợp với những khu vực miền Bắc. Sản phẩm có trang bị các tính năng như làm lạnh nhanh Jet Cool, công nghệ Dual Inverter, tự làm sạch, chẩn đoán lỗi, đảo gió 4 chiều.

Tổng quan thiết kế        
Dàn lạnh

- Máy lạnh 2 chiều LG Inverter 1 HP B10END1 có màu trắng, vỏ bằng nhựa và các cạnh bên được bo lại mềm mại.

- Màn hình hiển thị nhiệt độ ngay trên dàn lạnh để dễ dàng quan sát."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (382, NULL, NULL, N'75cm
', NULL, N'11kg
', N'Trắng
', N'"Máy lạnh âm trần LG Inverter 3 HP ZTNQ30GNLE0 có kiểu dáng âm trần tiết kiệm không gian, làm lạnh nhanh chóng với công suất 3 HP - 30.000 BTU, sử dụng lá tản nhiệt nhôm phủ Gold-Fin hạn chế quá trình ăn mòn, đảm bảo thiết bị hoạt động bền bỉ, giảm tiêu hao năng lượng với công nghệ Smart Inverter hiện đại.

Tổng quan thiết kế       
Dàn lạnh

- Máy lạnh LG có vẻ ngoài tối giản, kết cấu dạng hình vuông với các góc cạnh được thiết kế bo cong mềm mại phối hợp với gam màu trắng tươi sáng tạo nên sự liên kết hài hòa với mọi phong cách trang trí nội thất của căn phòng lắp đặt. Chế tác kiểu bố trí âm trần cho không gian phòng trở nên rộng mở, thông thoáng hơn."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (383, NULL, NULL, N'60cm
', NULL, N'19kg
', N'Trắng
', N'"Máy lạnh tủ đứng LG Inverter 4 HP ZPNQ36GR5A0 thiết kế kiểu tủ đứng hiện đại, dàn tản nhiệt phủ Gold-Fin chống ăn mòn, làm lạnh hiệu quả với công suất 4 HP - 36.000 BTU, công nghệ Smart Inverter giảm hao phí điện năng, đảm bảo máy vận hành êm ái.

Tổng quan thiết kế       
Dàn lạnh

- LG ZPNQ36GR5A0 thiết kế hình dạng chữ nhật đứng đơn giản, tông màu trắng thanh lịch, phối hợp liền mạch với bất kỳ phong cách nội thất nào của gia đình. Kiểu dáng tủ đứng cho phép bạn di chuyển, lựa chọn vị trí lắp đặt linh hoạt, tiện lợi. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (384, NULL, NULL, N'61cm
', NULL, N'14kg
', N'Trắng
', N'"Máy lạnh âm trần LG Inverter 4 HP ZTNQ36GNLA0 thiết kế kiểu âm trần sang trọng, công suất 4 HP đáp ứng nhu cầu làm mát cho phòng có diện tích 40 - 60m², hỗ trợ công nghệ làm lạnh nhanh giúp tăng tốc độ làm lạnh, dùng tiết kiệm điện, động cơ vận hành êm ái với công nghệ Smart Inverter.

Tổng quan thiết kế  
Dàn lạnh

- LG ZTNQ36GNLA0 là máy lạnh âm trần có chế tác hoàn thiện trong từng chi tiết, kiểu dáng đơn giản, màu trắng trang nhã, phối hợp liền mạch với thiết kế nội thất của phòng khách, phòng làm việc, phòng ngủ của bạn."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (385, NULL, NULL, N'73cm
', NULL, N'14kg
', N'Trắng
', N'"Máy lạnh LG Inverter 1.5 HP V13APIB cho hiệu quả làm mát mạnh mẽ với công suất 1.5 HP, công nghệ làm lạnh nhanh Jet Cool, sử dụng bền lâu với dàn tản nhiệt phủ lớp Gold Fin chống ăn mòn cao, giữ không gian sống trong lành với lọc khí Ion Plasmaster, bộ lọc PM 2.5.

Thiết kế
Dàn lạnh:

- LG V13APIB được bao phủ bởi tông màu trắng nhã nhặn, đường nét gọn gàng cùng kiểu dáng tối giản mà sang trọng, hài hòa với không gian căn phòng ngủ, phòng khách hoặc văn phòng làm việc của bạn một cách tự nhiên và hợp thời."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (386, NULL, NULL, N'78cm
', NULL, N'17kg
', N'Trắng
', N'"Máy lạnh tủ đứng LG ZPNQ48LT3A0 (3 Pha) thiết kế kiểu tủ đứng hiện đại, công suất làm lạnh 5 HP - 46.500 BTU phù hợp với không gian diện tích từ 60 - 70m² (từ 160 - 210m³), công nghệ Inverter tiết kiệm điện năng, đảm bảo máy vận hành êm ái.

Tổng quan thiết kế
Dàn lạnh: 

- LG ZPNQ48LT3A0 có thiết kế kiểu tủ đứng hiện đại, tông màu trắng thanh lịch, phù hợp với hầu hết không gian nội thất trong gia đình. 

- Kiểu dáng tủ đứng giúp bạn di chuyển và lắp đặt linh hoạt hơn. "
', NULL, NULL, NULL)
GO
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (387, NULL, NULL, N'62cm
', NULL, N'19kg
', N'Trắng
', N'"Máy lạnh âm trần LG Inverter 2 HP ZTNQ18GPLA0 có thiết kế âm trần phù hợp cho các khu vực đông người như văn phòng, siêu thị. Sản phẩm kèm theo nhiều tính năng như làm lạnh nhanh, Smart Inverter tiết kiệm điện và bộ lọc sơ bộ lọc bụi hiệu quả.

Thiết kế
Dàn lạnh:

- Máy lạnh âm trần LG ZTNQ18GPLA0 được thiết kế hình vuông quen thuộc, thiết kế âm trần không chiếm nhiều diện tích không gian. Hơn nữa, máy lạnh âm trần này còn sở hữu gam màu trắng tinh tế, góp phần tăng thêm vẻ đẹp và sang trọng cho căn phòng"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (388, NULL, NULL, N'76cm
', NULL, N'14kg
', N'Trắng
', N'"Máy lạnh âm trần LG Inverter 4 HP ZTNQ36LNLA0 (3 Pha) làm mát nhanh chóng với công nghệ làm lạnh nhanh, công suất hoạt động 4 HP, cơ chế thổi gió 4 hướng lan tỏa khí lạnh rộng khắp phòng, sử dụng tiết kiệm điện với công nghệ Smart Inverter.

Tổng quan thiết kế  
Dàn lạnh

- Máy lạnh âm trần có kiểu dáng hình vuông với các cạnh được làm bo góc mềm mại kết hợp tông màu sáng thanh lịch cho tổng thể thiết kế sang trọng, đẹp mắt, tô điểm cho căn phòng khách, phòng làm việc, phòng họp càng thêm cao cấp, hiện đại hơn. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (389, NULL, NULL, N'72cm
', NULL, N'17kg
', N'Trắng
', N'"Máy lạnh tủ đứng LG Inverter 4 HP ZPNQ36LR5A0 (3 Pha) có công suất 4 HP - 36.000 BTU và công nghệ làm lạnh nhanh cho hiệu suất làm lạnh cao, công nghệ Smart Inverter giảm tiêu thụ điện năng, bộ lọc sơ bộ tuổi thọ cao giữ không gian sống của bạn trong lành, tốt cho sức khỏe hơn.

Tổng quan thiết kế       
Dàn lạnh

- LG ZPNQ36LR5A0 thiết kế kiểu máy lạnh tủ đứng với kết cấu gọn gàng, vững chắc, cho khả năng di động linh hoạt, bạn có thể chuyển động vị trí lắp đặt tùy theo nhu cầu, hoàn cảnh sử dụng để làm mát tối ưu. Bề mặt thiết bị phủ gam màu trắng trang nhã, dễ dàng dung nhập vào phối cảnh xung quanh, tô điểm cho không gian phòng khách, phòng ngủ gia đình thêm sang trọng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (390, NULL, NULL, N'75cm
', NULL, N'12kg
', N'Trắng
', N'"Máy lạnh âm trần LG Inverter 2.5 HP ZTNQ24GPLA0 có khả năng làm mát từ độ cao 4.2m với lưu lượng gió thổi lớn, cho phạm vi làm mát rộng. Hơn nữa, mẫu máy lạnh này còn được trang bị các tính năng như tiết kiệm điện nhờ công nghệ Smart Inverter, thổi gió 4 hướng, làm lạnh nhanh.

Thiết kế
Dàn lạnh:

- Máy lạnh âm trần LG ZTNQ24GPLA0 có kiểu thiết kế hình vuông, màu trắng tinh tế dễ dàng kết hợp với nội thất và thiết kế của công trình.

 Dàn nóng:

- Được thiết kế dạng hình hộp chữ nhật với chất liệu vỏ máy cứng cáp và cho khả năng chống va đập tối ưu"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (391, NULL, NULL, N'66cm
', NULL, N'12kg
', N'Trắng
', N'"Máy lạnh âm trần LG 5 HP ATNQ48GMLE7 (3 pha) thiết kế âm trần hiện đại và có các tính năng như công nghệ Plasma air purifier bảo vệ sức khỏe, tiết kiệm điện nhờ công nghệ Inverter, làm lạnh nhanh không gian Jet Cool.

Tổng quan thiết kế
Dàn lạnh

- Sản phẩm có thiết kế hình vuông và có màu trắng trang nhã, dễ dàng kết hợp với nội thất trong không gian cũng như âm vào trần nhà, tạo sự thẩm mỹ."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (392, NULL, NULL, N'77cm
', NULL, N'15kg
', N'Trắng
', N'"Máy lạnh âm trần LG Inverter 5 HP ZTNQ48GMLA0 thuộc dòng máy lạnh 1 chiều (chỉ làm lạnh), thiết kế âm trần hiện đại, tiêu hao ít năng lượng nhờ trang bị công nghệ Smart Inverter, bảo vệ sức khỏe người dùng và mang đến không khí trong lành nhờ bộ lọc sơ bộ tuổi thọ cao. 

Tổng quan thiết kế
Dàn lạnh

- Máy lạnh có thiết kế hình vuông mang tính thẩm mỹ cao, dễ dàng kết hợp với mọi không gian nội thất, dễ dàng trong việc thi công và lắp đặt. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (393, NULL, NULL, N'79cm
', NULL, N'18kg
', N'Trắng
', N'"Máy lạnh âm trần LG Inverter 5 HP ZTNQ48LMLA0 (3 Pha) có công suất hoạt động mạnh mẽ với khả năng thổi gió 4 hướng, tỏa đều hơi lạnh trong căn phòng một cách nhanh chóng. Máy lạnh cũng có khả năng tiết kiệm điện hiệu quả.

Thiết kế
Dàn lạnh:

- Máy lạnh âm trần LG Inverter 5 HP ZTNQ48LMLA0 (3 Pha) được thiết kế hình vuông với gam màu trắng tinh tế, dễ dàng phối hợp với các nội thất khác bên trong căn phòng.

- Vỏ máy lạnh âm trần được làm bằng chất liệu cao cấp, chống trầy xước và có độ bền tốt."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (394, NULL, NULL, N'78cm
', NULL, N'9kg
', N'Trắng
', N'"Máy lạnh âm trần 1 hướng LG Inverter 1.5 HP ZTNQ12GULA0 được thiết kế kiểu âm trần 1 hướng thổi cho hiệu quả làm lạnh tốt trong phòng 15 - 20m² với công suất 1.5 HP, công nghệ làm lạnh nhanh giúp rút ngắn thời gian làm mát, dùng tiết kiệm điện cho gia đình với công nghệ Inverter.

Tổng quan thiết kế
- LG ZTNQ12GULA0 có kiểu dáng máy lạnh âm trần với kết cấu gọn gàng, lắp đặt tiết kiệm không gian. Bề ngoài được bao phủ bởi gam màu trắng thanh lịch cho sản phẩm kết hợp hài hòa vào các không gian nội thất khác nhau. 

- Sử dụng ống dẫn gas bằng đồng cho độ bền cao, truyền nhiệt tối ưu. Lá tản nhiệt bằng nhôm phủ lớp Gold Fin giúp nâng cao hiệu quả bảo vệ dàn tản nhiệt, hạn chế ăn mòn và duy trì khả năng làm mát tốt"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (395, NULL, NULL, N'79cm
', NULL, N'12kg
', N'Trắng
', N'"Máy lạnh âm trần 1 hướng LG Inverter 2 HP ZTNQ18GTLA0 làm mát không gian nhanh chóng với công suất 2 HP, công nghệ làm lạnh nhanh hiện đại, giảm hao phí điện năng cho gia đình với công nghệ Inverter, trang bị dàn tản nhiệt phủ lớp Gold Fin chống ăn mòn, sử dụng bền bỉ. 

Tổng quan thiết kế
- Thuộc dòng máy lạnh âm trần có vẻ ngoài gọn gàng, tinh tế, các góc cạnh bo tròn mềm mại kết hợp với tông màu trắng trang nhã tô điểm cho không gian phòng khách, phòng ngủ, văn phòng làm việc của bạn thêm sang trọng, thanh lịch. Phù hợp cho không gian trần nhỏ với chiều cao máy 13.2 cm."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (396, NULL, NULL, N'67cm
', NULL, N'14kg
', N'Trắng
', N'"Máy lạnh âm trần 1 hướng LG Inverter 2.5 HP ZTNQ24GTLA0 có dàn tản nhiệt lá nhôm phủ lớp chống ăn mòn Gold Fin, trang bị công suất lên đến 2.5 HP kết hợp công nghệ làm lạnh nhanh giúp làm mát căn phòng của bạn hiệu quả.

Tổng quan thiết kế
- Kiểu dáng máy lạnh âm trần đơn giản, các chi tiết được chế tác hoàn thiện, chắc chắn, dễ dàng lắp đặt trên trần nhà, góp phần tăng thêm không gian trống cho căn phòng trở nên rộng rãi hơn. 

- Thiết kế ống dẫn gas chất liệu đồng truyền nhiệt nhanh, dùng bền tốt trong thời gian dài. Dàn tản nhiệt làm từ nhôm phủ lớp Gold Fin nâng cao khả năng bảo vệ và hạn chế ăn mòn cho lá tản nhiệt mà vẫn đảm bảo hiệu quả làm lạnh tốt."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (397, NULL, NULL, N'69cm
', NULL, N'16kg
', N'Trắng
', N'"Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV là sản phẩm mới được Samsung trang bị đa dạng các công nghệ có thể kể đến như Digital Inverter Boost, Fast Cooling, bộ ba Triple Protector Plus, bộ Lọc Easy Filter Plus,...

Tổng quan thiết kế
Dàn lạnh

- Thuộc dòng máy lạnh 1 chiều với thiết kế màu trắng trang nhã, bốn góc được thiết kế bo cong lại tạo được cảm giác nhẹ nhàng hơn khi kết hợp với nội thất trong phòng.

- Màn hình hiển thị nhiệt độ trên dàn lạnh tiện lợi quan sát và biết được nhiệt độ đang sử dụng nhờ đó dễ dàng điều chỉnh"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (398, NULL, NULL, N'68cm
', NULL, N'20kg
', N'Trắng
', N'"Máy lạnh Samsung Inverter 1.5 HP AR13DYHZAWKNSV đáp ứng nhu cầu với khả năng làm lạnh ấn tượng với công nghệ làm lạnh nhanh Fast Cooling, tiết kiệm điện với động cơ Digital Inverter Boots và chế độ Eco, giữ không khí trong lành với bộ lọc Easy Filter Plus.

Tổng quan thiết kế
Dàn lạnh

- Samsung AR13DYHZAWKNSV là kiểu máy lạnh treo tường 1 chiều có thiết kế hình khối chữ nhật với các góc được tạo dáng uốn cong tinh tế cùng với gam màu trắng thanh lịch góp phần mang đến nét sang trọng cho căn phòng khách, phòng ngủ hay phòng làm việc của bạn.

- Tích hợp màn hình hiển thị nhiệt độ trên dàn lạnh cho người dùng kiểm tra nhiệt độ dễ dàng bất cứ lúc nào mà không cần sử dụng đến remote."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (399, NULL, NULL, N'72cm
', NULL, N'15kg
', N'Trắng
', N'"Máy lạnh Samsung Wind-Free Inverter 1 HP AR10CYFAAWKNSV được trang bị bộ lọc Copper Anti-bacteria Filter cho hiệu quả lọc sạch bụi bẩn và vi khuẩn tối ưu. Hơn nữa, máy lạnh còn có thể thổi gió dễ chịu và làm lạnh nhanh với công nghệ Wind-Free độc quyền của hãng.

Thiết kế
Dàn lạnh:

- Dàn lạnh có kiểu thiết kế độc đáo với lớp mặt nạ có nhiều họa tiết lỗ nhỏ li ti với chất liệu bền bỉ và phủ sơn màu trắng, phối hợp hài hòa với các nội thất khác bên trong căn phòng.

- Màn hình hiển thị nhiệt độ được thiết kế nhỏ gọn và nằm bên phải bộ phận cánh đảo gió của máy lạnh, nhờ đó mà người dùng dễ dàng quan sát mỗi khi điều chỉnh nhiệt độ."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (400, NULL, NULL, N'73cm
', NULL, N'12kg
', N'Trắng
', N'"Máy lạnh Samsung Wind-Free Inverter 1.5 HP AR13CYFAAWKNSV thuộc dòng máy lạnh 1 chiều sở hữu thiết kế sang trọng, làm lạnh nhanh chóng với công nghệ Fast Cooling, tạo làn gió thổi nhẹ nhàng, dễ chịu nhờ công nghệ Wind-Free, đảm bảo thiết bị vận hành êm ái, giảm tiêu thụ điện với công nghệ Digital Inverter Boost và Eco, tiết kiệm thời gian vệ sinh máy với chức năng tự làm sạch Auto Clean.

Tổng quan thiết kế       
Dàn lạnh

- Samsung AR13CYFAAWKNSV thiết kế hiện đại, tông màu trắng thanh lịch kết hợp chế tác mặt trước với hàng chục ngàn lỗ siêu nhỏ mang đến vẻ ngoài độc đáo, đẹp mắt cho tổng thể thiết kế và không gian bố trí."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (401, NULL, NULL, N'68cm
', NULL, N'14kg
', N'Trắng
', N'"Thiết kế hiện đại, công suất 2 HP - 18.000 BTU phù hợp phòng có diện tích từ 20 - 30 m².
Điều khiển máy lạnh bằng ứng dụng SmartThings.
Giữ cho các bộ phận bên trong dàn lạnh luôn sạch sẽ nhờ chức năng Auto Clean.
Duy trì hiệu quả làm lạnh thông qua Freeze Wash.
Môi chất lạnh R32, thân thiện với môi trường, không ảnh hưởng đến tầng Ozone.
Vận hành êm ái hơn cùng tận hưởng không gian yên tĩnh và thanh bình. 
Bộ lọc phân tử đồng kháng khuẩn Copper Anti-bacterial Filter - dễ dàng tháo gỡ và vệ sinh.
WindFree™ Cooling thổi khí lạnh nhẹ nhàng qua 23.000 lỗ nhỏ, hạn chế gió thổi trực tiếp vào người. "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (402, NULL, NULL, N'69cm
', NULL, N'13kg
', N'Trắng
', N'"Siêu tiết kiệm điện đến 73% với công nghệ Digital Inverter Boost
Với công nghệ Digital Inverter Boost ưu việt, máy lạnh Samsung Inverter 1.5 HP AR13TYHYCWKNSV giúp tiết kiệm điện năng hiệu quả lên đến 73% và duy trì ổn định nhiệt độ mong muốn của người dùng.

Với nam châm Neodymium và bộ giảm âm kép Twin Tube Muffler, máy hoạt động yên tĩnh, êm ái và bền lâu với công suất tối ưu."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (404, NULL, NULL, N'75cm
', NULL, N'12kg
', N'Trắng
', N'"Máy lạnh Samsung Wind-Free Inverter 1 HP AR10CYHAAWKNSV là dòng máy lạnh 1 chiều (chỉ làm lạnh) sở hữu công nghệ Digital Inverter Boost kết hợp với chế độ Eco giúp tiết kiệm điện năng. Chế độ làm lạnh nhanh Fast Cooling giúp tăng tốc làm lạnh, người dùng không mất nhiều thời gian để đạt mức nhiệt độ mong muốn. Bộ lọc Copper Anti-bacteria Filter đem lại bầu không khí trong lành, bảo vệ cả gia đình. Đặc biệt là thiết kế 23.000 lỗ nhỏ li ti ngay trên dàn lạnh hiện đại mang đến hơi lạnh nhẹ nhàng không buốt.

Tổng quan thiết kế
Dàn lạnh:

- Máy lạnh Samsung AR10CYHAAWKNSV có thiết kế đơn giản, các góc được bo tròn tinh tế, gam màu trắng trang nhã."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (405, NULL, NULL, N'72cm
', NULL, N'11kg
', N'Trắng
', N'"Lạnh nhanh không gió buốt thổi trực tiếp nhờ công nghệ WindFree™ 23000 lỗ ở mặt trước máy
Máy lạnh Samsung Wind-Free Inverter 1.5 HP AR13TYGCDWKNSV, ngoài khả năng làm lạnh nhanh còn có thêm lựa chọn chế độ làm lạnh WindFree™ không gió buốt thổi trực tiếp.

Chỉ cần 1 thao tác nhấn chọn chế độ WindFree™ trên điều khiển là căn phòng sẽ nhanh chóng đạt nhiệt độ mát lạnh tối ưu hoặc thổi khí lạnh nhẹ nhàng qua 23.000 lỗ nhỏ, tạo ra làn gió dịu nhẹ, hạn chế gió thổi trực tiếp mà vẫn duy trì nhiệt độ mong muốn của người dùng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (406, NULL, NULL, N'76cm
', NULL, N'13kg
', N'Trắng
', N'"Máy lạnh tủ đứng Samsung Inverter 5 HP AC048BNPDKC/TC có khả năng làm lạnh nhanh chóng và thổi gió xa đến 20m, thích hợp sử dụng trong không gian lớn. Ngoài ra, người dùng còn có thể kiểm soát và điều khiển chức năng máy lạnh từ xa bằng điện thoại tiện lợi.

Thiết kế
Dàn lạnh:

- Máy lạnh tủ đứng Samsung Inverter 5 HP AC048BNPDKC/TC được thiết kế hình hộp chữ nhật đứng tối giản với chiều cao khoảng 185 cm. Chất liệu vỏ máy lạnh được làm bằng nhựa cao cấp có khả năng chống bám bụi bẩn tối đa, đồng thời sở hữu gam màu trắng tinh tế nên sản phẩm dễ dàng phối hợp với các nội thất khác bên trong căn phòng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (407, NULL, NULL, N'60cm
', NULL, N'20kg
', N'Trắng
', N'"Công nghệ WindFree™ làm lạnh nhanh không lo gió buốt thổi trực tiếp
Ngoài hiệu quả làm lạnh nhanh tức thì, máy lạnh Samsung Wind-Free Inverter 1 HP AR10TYGCDWKNSV còn có thêm lựa chọn chế độ làm lạnh WindFree™ không gió buốt thổi trực tiếp.

Theo đó, khi bạn chọn chế độ này, ngay lập tức căn phòng sẽ đạt được nhiệt độ mát lạnh lý tưởng hoặc thổi khí lạnh nhẹ nhàng nhờ có 23000 lỗ nhỏ ở mặt trước máy lạnh, hạn chế gió thổi trực tiếp mà vẫn duy trì nhiệt độ mong muốn của người dùng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (408, NULL, NULL, N'75cm
', NULL, N'9kg
', N'Trắng
', N'"Một chiếc máy lạnh ngoài khả năng làm lạnh còn góp phần làm tăng tính thẩm mỹ công trình nhờ có thiết kế âm trần hiện đại. Sản phẩm được tích hợp đa dạng các công nghệ như Inverter tiết kiệm điện, bộ lọc tiêu chuẩn lọc bụi hiệu quả, chế độ Wind-Free cho hơi lạnh nhẹ nhàng.

Tổng quan thiết kế
- Máy lạnh âm trần thiết kế 1 hướng mới lạ, gam màu trắng hiện đại dễ dàng kết hợp với nội thất. Thiết kế âm trần tạo được bề mặt phẳng giúp không gian trở nên sang trọng hơn.

- Trên dàn lạnh còn có dải đèn giúp người dùng có thể dễ dàng quan sát các chế độ đang được sử dụng."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (409, NULL, NULL, N'74cm
', NULL, N'11kg
', N'Trắng
', N'"Máy lạnh âm trần Samsung Inverter 3.5 HP AC100TN4DKC/EA 3 Pha có công suất làm lạnh ổn định, đồng thời sử dụng công nghệ làm lạnh Fast Cooling không gây lạnh buốt và cho khả năng phân tán rộng, đều khắp căn phòng. Hơn nữa, máy lạnh còn có khả năng hoạt động êm mái và tiết kiệm điện nhờ công nghệ Inverter.

Thiết kế
Dàn lạnh:

- Máy lạnh được thiết kế dạng hình vuông tối giản với 4 góc được bo tròn mềm mại, kết hợp với gam màu trắng tươi sáng, nhờ đó dễ dàng phối hợp hài hòa với các không gian nội thất khác nhau."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (410, NULL, NULL, N'72cm
', NULL, N'20kg
', N'Trắng
', N'"Máy lạnh âm trần Samsung Inverter 3.5 HP AC100TN4DKC/EA thiết kế âm trần hiện đại, và có các tính năng như công nghệ làm lạnh thông minh WindFree không có cảm giác có gió buốt thổi trực tiếp, tiết kiệm năng lượng điện nhờ công nghệ Digital Inverter, cánh đảo gió lớn giúp không khí đi xa hơn.
Tổng quan thiết kế
- Máy lạnh có thiết kế vuông bo tròn ở các cạnh cùng với sự lôi cuốn của gam màu trắng chủ đạo. Giúp ta dễ dàng kết hợp cùng với các nội thất trong không gian cũng như âm vào trần nhà, tăng sự thẩm mỹ.  "
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (411, NULL, NULL, N'73cm
', NULL, N'18kg
', N'Trắng
', N'"Máy lạnh âm trần 1 hướng AC052TN1DKC/EA đến từ thương hiệu Samsung sở hữu đa dạng các tính năng nhằm mang đến trải nghiệm dễ chịu cụ thể Inverter, bộ lọc tiêu chuẩn, Fast Cooling, chế độ Wind-Free,...

Tổng quan thiết kế
Dàn lạnh 

- Máy lạnh có thiết kế dạng dài hình chữ nhật có thể lắp âm vào bề mặt của trần nhà tạo một mặt phẳng cho công trình mang đến sự hiện đại.

- Trên dàn lạnh còn có dải đèn giúp người dùng dễ dàng quan sát chế độ đang hoạt động tiện lợi."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (413, NULL, NULL, N'62cm
', NULL, N'16kg
', N'Trắng
', N'"Máy lạnh âm trần 360 độ Samsung Inverter 3.5 HP AC100TN4PKC/EA 3 Pha có khả năng hoạt động ổn định với công suất mạnh mẽ 3.5 HP, phù hợp cho không gian lớn. Ngoài ra, sản phẩm còn có kiểu dáng hình tròn độc đáo và sử dụng cơ chế làm lạnh 360 độ cho hiệu quả làm lạnh vượt trội.

Thiết kế
Dàn lạnh:

Máy lạnh âm trần 360 độ Samsung Inverter 3.5 HP AC100TN4PKC/EA 3 Pha được thiết kế hoàn toàn mới với kiểu dáng hình tròn đột phá. Phần mặt nạ có thể được thiết kế theo yêu cầu của khách hàng để tạo điểm nhấn phong cách cho gia chủ.

Bên cạnh đó, sản phẩm còn có gam màu trắng tinh tế với chất liệu vỏ máy cứng cáp, bền bỉ và chống bám bụi tối ư"
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (470, NULL, NULL, N'352 x 352 x 93 mm
', N'5200 mAh
', N'3.7kg
', N'Xám
', N'Được trang bị hàng loạt công nghệ cải tiến so với thế hệ cũ, robot hút bụi lau nhà Ecovacs Deebot T8 Max Plus với công nghệ TrueDetect 3D có thể phát hiện được vật cản tầm thấp dưới 10cm, hệ thống lau rung Ozmo Pro sẽ đánh bay mọi bụi bẩn trên sàn nhà bạn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (518, N'4GB
', N'64GB
', N'11.0 inch, Dymamic Amoled, 120Hz
', N'19.3Wh
', N'220g
', N'Tím 
', N'Phụ kiện: Hộp máy, Cáp USB
', N'Apple A15 Bionic
', N'20W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (412, NULL, NULL, N'65cm
', NULL, N'9kg
', N'Trắng
', N'"Máy lạnh tủ đứng Samsung Inverter 3 HP AC030BNPDKC/TC được thiết kế tủ đứng hiện đại, công suất làm lạnh mạnh mẽ 3 HP - tương đương 28.000 BTU, phù hợp với không gian diện tích từ 35 - 50m², được trang bị công nghệ Digital Inverter tiết kiệm điện năng, mang lại hiệu suất vận hành êm ái và ổn định.

Tổng quan thiết kế 
Dàn lạnh 

Máy lạnh tủ đứng Samsung Inverter 3 HP AC030BNPDKC/TC được thiết kế với cấu trúc gọn gàng và vững chắc, mang lại khả năng di động linh hoạt. Điều này cho phép người dùng dễ dàng di chuyển và lắp đặt máy theo nhu cầu và hoàn cảnh sử dụng để đạt hiệu suất làm mát tối ưu nhất. Với bề mặt được phủ lớp màu trắng trang nhã, máy lạnh này dễ dàng hòa nhập vào mọi không gian, từ phòng khách đến phòng ngủ gia đình, tạo điểm nhấn sang trọng và tinh tế."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (414, NULL, NULL, N'79cm
', NULL, N'18kg
', N'Trắng
', N'"Máy lạnh âm trần 360 độ Samsung Inverter 3.5 HP AC100TN4PKC/EA sở hữu kiểu dáng hình tròn độc đáo, góp phần tạo nên điểm nhấn cho không gian sống hiện nay. Chưa hết, sản phẩm còn có cơ chế làm lạnh 360 độ với kiểu thiết kế không cánh đảo gió hoàn toàn mới, giúp phân tán luồng khí lạnh nhanh và rộng hơn.

Thiết kế
Dàn lạnh:

- Máy lạnh âm trần 360 độ Samsung Inverter 3.5 HP AC100TN4PKC/EA có kiểu thiết kế hình tròn đột phá hoàn toàn mới với chất liệu vỏ máy cứng cáp và sở hữu gam màu trắng tinh tế, góp phần tạo nên điểm nhấn thẩm mỹ đẳng cấp cho không gian sống, làm việc và kinh doanh của bạn."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (344, NULL, NULL, N'76cm
', NULL, N'19kg
', N'Trắng', N'"Máy lạnh Daikin Inverter 1.5 HP ATKF35YVMV hoạt động êm ái, hạn chế tiếng ồn, tiết kiệm điện năng nhờ công nghệ Inverter, làm lạnh nhanh chóng và đồng đều với công nghệ Powerful, cánh quạt đảo gió 3D, mang đến không gian sống trong lành, sạch khuẩn với công nghệ Streamer, phin lọc Enzyme Blue tích hợp lọc bụi mịn PM2.5.

Tổng quan thiết kế
Dàn lạnh

- Mẫu máy lạnh Daikin này có kết cấu gọn gàng, tông màu trắng chủ đạo, thêm điểm nhấn là đường viền xanh chạy ôm theo cạnh bên của sản phẩm giúp tạo nên vẻ đẹp độc đáo và thời thượng cho tổng thể thiết kế. 

- Đi kèm máy là remote phối màu đen trắng thanh lịch, kiểu dáng cầm nắm vừa tay, nút tắt/mở được trang bị dạ quang phát sáng giúp bạn quan sát thuận tiện."
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (467, NULL, NULL, N'85 x 59.5 x 47.5 cm
', NULL, N'60 kg
', N'Trắng
', N'Casper Inverter 8.0 Kg WF-8VG1 thuộc dòng máy giặt cửa ngang với thiết kế hiện đại, tích hợp nhiều chương trình giặt, đem đến hiệu quả làm sạch vết bẩn quần áo vượt trội. Kèm theo đó còn có rất nhiều tiện ích như cảnh báo khử khuẩn lồng giặt, tự làm sạch lồng giặt, suy luận ảo Fuzzy Logic,... nhằm tối ưu trải nghiệm người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (468, NULL, NULL, N'35 x 35 x 10,2 cm
', N'5200mah
', N'4.1 kg
', N'Trắng
', N'Thuộc thế hệ máy hút bụi tân tiến, robot hút bụi lau nhà Ecovacs Deebot T20 Omni DLX23 dễ dàng đáp ứng nhiều nhu cầu làm sạch tùy theo từng khu vực. Ngoài ra, bạn có thể điều khiển máy chỉ với vài thao tác trên ứng dụng Ecovacs Home.
', NULL, N'45 W
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (469, NULL, NULL, N'300 x 300 x 70 mm
', N'2600 mAh
', N'4.5 kg
', N'Trắng
', N'Robot hút bụi lau nhà Xiaomi Vacuum E5 là sản phẩm vệ sinh nhà cửa rất cần thiết cho các hộ gia đình hiện nay. Sở hữu lực hút mạnh mẽ lên đến 2000 Pa, thiết bị này có thể làm sạch những bụi bẩn ở những ngóc ngách trong nhà vô cùng nhanh chóng và hiệu quả. Với tính năng hẹn giờ lau dọn và trực tuyến OTA, chiếc robot hút bụi này sẽ là trợ thủ đắc lực cho các chị em trong việc vệ sinh nhà cửa.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (512, N'8GB
', N'512GB
', N'12.3 inch, 60Hz, Touch
', N'5000mAh
', N'466g
', N'Xám
', N'Phụ kiện: Hộp máy, Sạc
', N'Apple M2
', N'70W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (513, N'8GB
', N'128GB
', N'11.0 inch, Retina, 120Hz
', N'4500mAh
', N'682g
', N'Xám
', N'Phụ kiện: Hộp máy, Sạc
', N'Apple M2
', N'65W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (514, N'8GB
', N'128GB
', N'12.9 inch, Retina 120Hz
', N'7500mAh
', N'726g
', N'Xám
', N'Phụ kiện: Hộp máy, Cáp USB
', N'Snapdragon 8 Gen 1
', N'80W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (515, N'8GB
', N'128GB
', N'14 inch, Super Amoled, 120Hz
', N'7500mAh
', N'726g
', N'Xám
', N'Phụ kiện: Hộp máy, Cáp USB
', N'Snapdragon 8 Gen 1
', N'80W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (471, NULL, NULL, N'353x350x98.8mm
', N'5200mAh
', N'7.4kg
', N'Trắng
', N'Xiaomi Vacuum X10 được cải tiến về mặt công nghệ để tăng khả năng thu gom và hút bụi thật hiệu quả. Công nghệ điều hướng và cài đặt bản đồ cao cấp sẽ mang lại cơ khí hút 4.000 Pa của thiết bị chạy khắp mặt sàn. Khi kết hợp với chế độ lau nhà, sản phẩm đảm bảo không gian sống của gia đình luôn được lau sạch, sạch sẽ.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (472, NULL, NULL, N'250x250x1100mm
', N'3700mAh
', N'5,4 kg
', N'Trắng
', N'Máy hút bụi Xiaomi Trueclean W10 Pro giúp loại bỏ bụi bẩn, vi khuẩn và các hạt bụi nhỏ từ các bề mặt như sàn nhà, thảm và nệm. Điều này giúp giảm nguy cơ mắc các bệnh về đường hô hấp và các vấn đề về sức khỏe liên quan đến vi khuẩn và virus. giúp loại bỏ bụi, vi khuẩn cùng với các chất gây dị ứng khác trong môi trường sinh hoạt hàng ngày của chúng ta. Điều này giúp giảm nguy cơ mắc các bệnh về đường hô hấp cùng các vấn đề về sức khỏe cho cả gia đình.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (473, NULL, NULL, N'397x443x527.5mm
', N'6400 mAh
', N'24,2 kg
', N'Đen
', N'Ecovacs Deebot X2 Combo là giải pháp làm sạch thông minh hoàn hảo cho ngôi nhà của bạn khi tích hợp siêu phẩm Robot hút bụi và cả máy hút bụi cầm tay trong một Combo thiết bị. Lau nhà thông minh, giặt khăn lau bằng nước nóng, hút bụi ở tất cả các ngõ ngách trong nhà, Deebot combo sẽ giúp bạn luôn có được không gian sạch sẽ, thoáng mát.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (474, NULL, NULL, N'459*469*623mm
', N'6400 mAh
', N'16 kg
', N'Đen
', N'X2 Omni chính là mẫu robot hút bụi hình vuông đầu tiên từ nhà Ecovacs, có kiểu dáng khác biệt hoàn toàn so với các dòng robot hút bụi hình tròn trước đây, hứa hẹn mang đến khả năng làm sạch các góc, cạnh tốt hơn. Loại robot hút bụi có kiểu dáng hình tròn truyền thống thường gặp khó khăn trong việc tiếp cận và làm sạch ở các góc ngay cả có sự hỗ trợ từ hai chổi quét phụ của máy. Với hình dạng vuông vức, góc cạnh, X2 Omni có thể tiếp cận sâu hơn vào trong các cạnh bế, cạnh tường, từ đó loại bỏ bụi bẩn hiệu quả hơn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (475, NULL, NULL, N'350x350x94.5mm
', N'3200mAh
', N'4,8 kg
', N'Trắng
', N'Với hệ thống điều hướng bằng Laser hiện đại, Xiaomi Robot Vacuum S10 sẽ lập bản đồ dọn dẹp chi tiết để không bỏ sót điểm nào trên mặt sàn. Sản phẩm sử dụng động cơ hút 4.000Pa, áp dụng cơ chế di chuyển Zigzag để tối ưu hiệu suất làm sạch, phát huy tối đa tính ưu việt của cơ chế lau – hút.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (476, NULL, NULL, N'350x183x580mm
', NULL, N'5.3kg
', N'Trắng
', N'Máy lọc không khí Kangaroo KG30AP1 với bộ lọc 6 cấp độ tân tiến, công suất lớn cùng chế độ thông minh tự động xác định tình trạng không khí sẽ là thiết bị gia dụng cần thiết cho mọi gia đình trong hoàn cảnh dịch bệnh hiện nay.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (477, NULL, NULL, N'615 x 297 x 297 mm
', NULL, N'4.8kg
', N'Trắng
', N'Với Xiaomi Mi AP 4 Lite, ai trong số chúng ta cũng có thể tận hưởng bầu không khí hít thở trong lành ở không gian sống. Sản phẩm ghi nhận khả năng lọc tới 99.97% các hạt kích cỡ 0,3 μm, ghi nhận vùng phủ tới 25-43 mét vuông, diện tích gọn gàng nhỏ hơn một tờ giấy A4 và vận hành êm ái không phát ra nhiều tiếng ồn.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (478, NULL, NULL, N'17(d) x 17(r) x 26.5(c) cm
', NULL, N'1.5kg
', N'Trắng
', N'Máy lọc không khí xông tinh dầu Levoit LV-H128 là một giải pháp hoàn hảo cho không gian sống của bạn. Nhờ khả năng lọc không khí hiệu quả và tính năng xông tinh dầu thư giãn, sản phẩm này mang đến không gian trong lành và thư thái cho cả gia đình.
', NULL, N'7W
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (507, N'16GB
', N'SSD 1TB
', N'14.0 inch, 90Hz
', N'7200mAh
', N'2.1lkg
', N'Xám
', N'Phụ kiện: Hộp máy, Sạc
', N'Ryzen R5 6600H
', N'130W
', N'Máy trầy xước nhiều
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (509, N'16GB
', N'SSD 1TB
', N'14.0 inch, 90Hz
', N'7000mAh
', N'1.4kg
', N'Bạc
', N'Phụ kiện: Hộp máy, Sạc
', N'Intel i7 12700H
', N'100W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (510, N'16GB
', N'SSD 1TB
', N'14.0 inch, 90Hz
', N'7200mAh
', N'2.1lkg
', N'Xám
', N'Phụ kiện: Hộp máy, Sạc
', N'Ryzen R5 6600H
', N'130W
', N'Máy trầy xước nhiều
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (489, N'8GB
', N'128GB
', N'6.1 inch
', N'3700 mAh
', N'167g
', N'Tím 
', N'Phụ kiện: Hộp, sạc adapter
', N'Snapdragon 8 Gen 1
', N'30W
', N'Trầy xước ít
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (516, N'8GB
', N'256GB
', N'12.4 inch, Super Amoled, 120Hz
', N'8000mAh
', N'500g
', N'Kem
', N'Phụ kiện: Hộp máy, Cáp USB
', N'Snapdragon 8 Gen 2
', N'80W
', N'Máy đẹp, ít trầy xước
')
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (479, NULL, NULL, N'315x198x516 mm
', NULL, N'5,4 kg
', N'Trắng
', N'Máy lọc không khí Kangaroo KG38AP với thiết kế lịch lãm thời thượng, sử dụng bộ lọc đa cấp độ loại bỏ được bụi mịn, được trang bị tổng cộng 5 chế độ hoạt động cùng với cảm biến bụi tiện dụng, sẽ là sản phẩm phù hợp để đem đến cho người có thời gian biểu bận rộn một bầu không khí trong lành và thoải mái nhất.
', NULL, N'42W
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (480, NULL, NULL, N'22 (d) x 22 (r) x 36 (c) cm
', NULL, N'3.4kg
', N'Trắng
', N'Máy lọc không khí Levoit Core 300 sẽ là giải pháp cho môi trường sống trong lành, giúp duy trì sức khỏe gia đình ở mức tốt nhất, không bị mắc các bệnh về hô hấp thông qua hệ thống màng lọc hiệu quả. Ngoài ra, công nghệ hiện đại sẽ giúp máy vận hành êm ái, không ảnh hưởng đến sinh hoạt chung của người dùng.
', NULL, N'33W
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (481, NULL, NULL, N'646x300x330mm
', NULL, N'5.6KG
', N'Trắng
', N'Cùng tận hưởng bầu không khí trong lành nhất với sự hỗ trợ của Xiaomi Mi Air Purifier 4. Sản phẩm được trang bị hàng loạt công nghệ hiện đại hàng đầu để duy trì cơ chế vận hành êm ái mà vẫn có thể lọc tới 99,97% các loại hạt có kích cỡ từ 0.3μm trở lên, loại bỏ bụi bẩn và phấn hoa, đồng thời ion hóa các tác nhân gây hại cho sức khỏe trong không khí.
', NULL, N'45w
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (482, NULL, NULL, N'32,1 (d) x 16 (r) x 40,6 (c) cm
', NULL, N'3.9kg
', N'Trắng
', N'Từ nay, việc nuôi thú cưng sẽ trở nên thoải mái, dễ thở hơn khi sở hữu máy lọc không khí chống dị ứng thú cưng Levoit Vital 100S. Với hệ thống lọc 3 lớp tiên tiến, sản phẩm đảm bảo khả năng loại bỏ các hạt bụi, phấn hoa, vi khuẩn và mùi khó chịu, mang đến không gian trong lành, thoáng đãng cho cả gia đình.
', NULL, N'30W
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (483, NULL, NULL, N'32,1 (d) x 16 (r) x 40,6 (c) cm
', NULL, N'3.9kg
', N'Trắng
', N'Máy lọc không khí Levoit Core 300 sẽ là giải pháp cho môi trường sống trong lành, giúp duy trì sức khỏe gia đình ở mức tốt nhất, không bị mắc các bệnh về hô hấp thông qua hệ thống màng lọc hiệu quả. Ngoài ra, công nghệ hiện đại sẽ giúp máy vận hành êm ái, không ảnh hưởng đến sinh hoạt chung của người dùng.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (485, NULL, NULL, N'32,1 (d) x 16 (r) x 40,6 (c) cm
', NULL, N'3.9kg
', N'Trắng
', N'Từ nay, việc nuôi thú cưng sẽ trở nên thoải mái, dễ thở hơn khi sở hữu máy lọc không khí chống dị ứng thú cưng Levoit Vital 100S. Với hệ thống lọc 3 lớp tiên tiến, sản phẩm đảm bảo khả năng loại bỏ các hạt bụi, phấn hoa, vi khuẩn và mùi khó chịu, mang đến không gian trong lành, thoáng đãng cho cả gia đình.
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (416, NULL, NULL, N'55inch
', N'150W
', N'14.2kg
', N'Đen
', N'Đắm chìm trong màn hình 4K sắc nét, nâng tầm giải trí ấn tượng, Tối ưu mọi gam màu đến ngưỡng đã mắt nhất, Crystal Processor 4K hiệu chỉnh sắc màu linh hoạt, Mãn nhãn trong mọi phân cảnh hành động, Độ tương phản cao, đắm chìm vào nội dung HDR, Thiết kế tinh tế như một bức tranh hiện đại, Hạn chế tình trạng cáp kết nối lộn xộn, Truyền đạt tín hiệu dễ dàng chỉ với một cú chạm
', NULL, NULL, NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (460, NULL, NULL, N'Dưới 30 m2
', NULL, NULL, NULL, N'Nếu bạn đang tìm một chiếc máy lạnh cho những không gian rộng rãi hơn thì đừng nên bỏ qua máy lạnh Casper Inverter 2 HP (18500 BTU) GC-18IS33. Không chỉ có khả năng làm lạnh nhanh, sử dụng chiếc máy lạnh này còn mang lại những trải nghiệm mới mẻ, thư giãn nhờ vào những tính năng thông minh. 
', NULL, N'18.500 BTU
', NULL)
INSERT [dbo].[Product_Detail] ([Product_id], [RAM], [ROM], [Size], [Battery], [Weight], [Color], [Decription], [CPU], [Wattage], [Status]) VALUES (486, NULL, NULL, N'309x198x516mm
', N'51W
', N'5.1kg
', N'Trắng
', N'Máy lọc không khí Kangaroo KG36AP2 có công suất lọc không khí lớn lên tới 270m3 mỗi giờ. Do đó, chiếc máy này phù hợp để làm sạch hiệu quả không khí trong các căn phòng có diện tích lên tới 30m2 như phòng ngủ, phòng làm việc tại nhà, phòng khách nhỏ...
', NULL, N'51W
', N'Máy đẹp, ít trầy xước
')
GO
INSERT [dbo].[Role] ([Role_Id], [Role_Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Role_Id], [Role_Name]) VALUES (2, N'Sale Manager')
INSERT [dbo].[Role] ([Role_Id], [Role_Name]) VALUES (3, N'Sale')
INSERT [dbo].[Role] ([Role_Id], [Role_Name]) VALUES (4, N'Marketing')
INSERT [dbo].[Role] ([Role_Id], [Role_Name]) VALUES (5, N'Customer')
GO
INSERT [dbo].[settings] ([Role_Id], [View], [Buy], [FeedBack], [Sell], [Edit], [Delete], [Create]) VALUES (1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[settings] ([Role_Id], [View], [Buy], [FeedBack], [Sell], [Edit], [Delete], [Create]) VALUES (2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[settings] ([Role_Id], [View], [Buy], [FeedBack], [Sell], [Edit], [Delete], [Create]) VALUES (3, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[settings] ([Role_Id], [View], [Buy], [FeedBack], [Sell], [Edit], [Delete], [Create]) VALUES (5, 1, 1, 1, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (2, N'1', N'HezzWinGame', N'anhnvhe171196', N'0969792742', 5, N'sadassad', 0, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (5, N'123123123', N'Vu Duc Trong', N'trongvdhe171724@fpt.edu.vn', N'0386168281', 3, N'sadasdsada', NULL, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (6, N'123456789', N'hunglvhe171796', N'hunglvhe171796@fpt.edu.vn', N'0357129704', 5, N'wqeqweqwq', NULL, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (8, N'1', N'hoanghhhe171821', N'hoanghhhe171821@fpt.edu.vn', N'0986407183', 4, N'weqweq', NULL, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (9, N'KvrA1-6@', N'anhnt', N'anhnthe171551@fpt.edu.vn', N'0987888777', 1, N'images.png', NULL, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (93, N'!B@t9wTx', N'Anh Nguyễn Việt', N'hezz281103@gmail.com', N'0969792742', 5, N'326655_history_icon.png', NULL, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (96, N'21312323131', N'Ng Minh Quan', N'quan@gmail.com', N'0921313122', 5, N'9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg', NULL, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (97, N'112312313313', N'hezz281103@gmail.com', N'haXinhGai@gmail.com', N'0969792742', 5, N'9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg', NULL, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (98, N'281mJMC<', N'Feds Shop', N'fedsshop320@gmail.com', NULL, 5, N'9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg', NULL, 1)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (99, N'12345678', N'HE171196', N'vcsdv@gmail.com', N'0335136686', 5, N'9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg', 0, 0)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (100, N'12345678', N'a', N'quan1@gmail.com', N'0969792742', 5, N'9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg', 0, 0)
INSERT [dbo].[User] ([User_Id], [Password], [User_name], [Email], [Phone_number], [Role_id], [Avarta], [isBanned], [gender]) VALUES (101, N'88888888', N' Vũ Đức Trọng', N'trong1@gmail.com', N'0988777888', 3, N'hung.jpg', 0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('active') FOR [Status]
GO
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((1)) FOR [View]
GO
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((1)) FOR [Buy]
GO
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((1)) FOR [FeedBack]
GO
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((1)) FOR [Sell]
GO
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((1)) FOR [Edit]
GO
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((1)) FOR [Delete]
GO
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((1)) FOR [Create]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [isBanned]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User]
GO
ALTER TABLE [dbo].[Brandd]  WITH CHECK ADD  CONSTRAINT [FK_Brandd_Product_Category] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Product_Category] ([Category_id])
GO
ALTER TABLE [dbo].[Brandd] CHECK CONSTRAINT [FK_Brandd_Product_Category]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Bill] FOREIGN KEY([Bill_Id])
REFERENCES [dbo].[Bill] ([Bill_Id])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Bill]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Bill] FOREIGN KEY([Bill_id])
REFERENCES [dbo].[Bill] ([Bill_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Bill]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brandd] FOREIGN KEY([Brand_id])
REFERENCES [dbo].[Brandd] ([Brand_Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brandd]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product]
GO
ALTER TABLE [dbo].[settings]  WITH CHECK ADD  CONSTRAINT [FK__settings__Role_I__5AEE82B9] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Role_Id])
GO
ALTER TABLE [dbo].[settings] CHECK CONSTRAINT [FK__settings__Role_I__5AEE82B9]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Role_Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[PagingBill]    Script Date: 7/30/2024 12:53:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[PagingBill] (
    @PageIndex INT,    
    @NumberBill INT     
)
AS
BEGIN
    
    DECLARE @CurrentRow INT = (@PageIndex - 1) * @NumberBill;
   
    DECLARE @TotalRow INT = (SELECT COUNT(*) FROM Bill);
    
    
    DECLARE @NumberOfPages INT;

   
    IF (@TotalRow % @NumberBill = 0)
        SET @NumberOfPages = @TotalRow / @NumberBill;
    ELSE
        SET @NumberOfPages = @TotalRow / @NumberBill + 1;

    
    SELECT 
        b.[Bill_Id],
        b.[Total_price],
        b.[Date],
        u.[User_name] AS [UserName],
        b.[Address],
        b.[Status], 
		b.Province,
		b.District,
		b.Country
    FROM 
        Bill AS b
    JOIN 
        [User] AS u ON b.[User_id] = u.[User_id]
    ORDER BY 
        b.[Bill_Id] desc
    OFFSET 
        @CurrentRow ROWS
    FETCH NEXT 
        @NumberBill ROWS ONLY;
END

GO
/****** Object:  StoredProcedure [dbo].[PagingContact]    Script Date: 7/30/2024 12:53:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PagingContact] (
    @PageIndex INT,    
    @NumberContact INT     
)
AS
BEGIN
    
    DECLARE @CurrentRow INT = (@PageIndex - 1) * @NumberContact;
   
    DECLARE @TotalRow INT = (SELECT COUNT(*) FROM Contact);
    
    DECLARE @NumberOfPages INT;

    IF (@TotalRow % @NumberContact = 0)
        SET @NumberOfPages = @TotalRow / @NumberContact;
    ELSE
        SET @NumberOfPages = @TotalRow / @NumberContact + 1;

    SELECT c.Contact_id,
        c.[User_Id],
        c.Email,
        c.Phone,
        c.Subject,
        c.Message,
        c.Date,
        c.Status,
        CASE 
            WHEN c.[User_Id] IS NULL THEN c.[Name]
            ELSE COALESCE(u.[User_name], 'Unknown')
        END AS [Username]
    FROM 
        Contact AS c
    LEFT JOIN 
        [User] AS u ON c.[User_id] = u.[User_id]
    ORDER BY 
        c.[Contact_id] desc
    OFFSET
        @CurrentRow ROWS
    FETCH NEXT 
        @NumberContact ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[PagingFeedback]    Script Date: 7/30/2024 12:53:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[PagingFeedback] (
    @PageIndex INT,    
    @NumberFeedback INT     
)
AS
BEGIN
    DECLARE @CurrentRow INT = (@PageIndex - 1) * @NumberFeedback;
    DECLARE @TotalRow INT = (SELECT COUNT(*) FROM FeedBack);
    DECLARE @NumberOfPages INT;

    IF (@TotalRow % @NumberFeedback = 0)
        SET @NumberOfPages = @TotalRow / @NumberFeedback;
    ELSE
        SET @NumberOfPages = @TotalRow / @NumberFeedback + 1;

    SELECT 
		f.Feedback_Id,
        f.Date, 
        p.Product_name,
        f.Rating,
		f.Status,
        u.User_name,
        COUNT(f.Product_id) OVER(PARTITION BY f.Product_id) AS FeedbackCount
    FROM 
        FeedBack AS f
    JOIN 
        [Product] AS p ON f.Product_id = p.Product_id
    JOIN 
        [Bill] AS b ON f.Bill_Id = b.Bill_Id
    JOIN
        [User] AS u ON b.User_id = u.User_Id
    ORDER BY 
        f.Feedback_Id desc
    OFFSET 
        @CurrentRow ROWS
    FETCH NEXT 
        @NumberFeedback ROWS ONLY;
END

GO
/****** Object:  StoredProcedure [dbo].[PagingOfFeedBack]    Script Date: 7/30/2024 12:53:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[PagingOfFeedBack](	
@PageIndex As int,
@PageNumber As int,
@ProductID As int
)
as begin 
declare @CurrentRow as int = (@PageIndex - 1) * @PageNumber
declare @ToltalRow as int = (select count(*) from FeedBack as f
where f.Product_id = @ProductID)
select f.* from FeedBack as f
where f.Product_id = @ProductID
Order by f.Date desc
offset @CurrentRow ROWS
FETCH next @PageNumber ROWS ONLY
End
GO
/****** Object:  StoredProcedure [dbo].[TotalPageOfFeedBack]    Script Date: 7/30/2024 12:53:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TotalPageOfFeedBack]
    @PageIndex AS INT,
    @PageNumber AS INT,
    @ProductID AS INT,
    @NumberOfPages AS INT OUTPUT
AS
BEGIN
    DECLARE @CurrentRow AS INT = (@PageIndex - 1) * @PageNumber
    DECLARE @TotalRow AS INT = (
            SELECT COUNT(*)
            FROM FeedBack AS f
            WHERE f.Product_id = @ProductID
        )

    IF (@TotalRow % @PageNumber = 0)
        SET @NumberOfPages = @TotalRow / @PageNumber
    ELSE
        SET @NumberOfPages = @TotalRow / @PageNumber + 1

    -- Returning the result
    SELECT @NumberOfPages AS NumberOfPages;
END;
GO
