USE [master]
GO
/****** Object:  Database [Hotel]    Script Date: 20/05/2023 19:55:52 ******/
CREATE DATABASE [Hotel]
GO
USE [Hotel]
GO
/****** Object:  Table [dbo].[BookingStatus]    Script Date: 20/05/2023 19:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingStatus](
	[BookingStatusId] [int] IDENTITY(1,1) NOT NULL,
	[BookingStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__BookingS__54F9C05DA9271E35] PRIMARY KEY CLUSTERED 
(
	[BookingStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 20/05/2023 19:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Payment__9B556A380351B6BC] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 20/05/2023 19:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__PaymentT__BA430B35A2F48074] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUsers]    Script Date: 20/05/2023 19:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUsers](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 20/05/2023 19:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [nvarchar](50) NOT NULL,
	[RoomImage] [nvarchar](500) NOT NULL,
	[RoomPrice] [decimal](18, 2) NOT NULL,
	[BookingStatusId] [int] NOT NULL,
	[RoomTypeId] [int] NOT NULL,
	[RoomCapacity] [int] NOT NULL,
	[RoomDescription] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Room__32863939743517C0] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomBooking]    Script Date: 20/05/2023 19:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomBooking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustomerAddress] [nvarchar](50) NOT NULL,
	[CustomerPhone] [nvarchar](50) NOT NULL,
	[BookingFrom] [datetime] NOT NULL,
	[BookingTo] [datetime] NOT NULL,
	[RoomId] [int] NOT NULL,
	[NoOfMember] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
 CONSTRAINT [PK__RoomBook__73951AEDECEEC78D] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 20/05/2023 19:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20/05/2023 19:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [int] NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookingStatus] ON 

INSERT [dbo].[BookingStatus] ([BookingStatusId], [BookingStatus]) VALUES (1, N'Đã đặt')
INSERT [dbo].[BookingStatus] ([BookingStatusId], [BookingStatus]) VALUES (2, N'Trống')
SET IDENTITY_INSERT [dbo].[BookingStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentType]) VALUES (1, N'Tiền mặt')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentType]) VALUES (2, N'Thẻ tín dụng')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentType]) VALUES (3, N'Thẻ ghi nợ')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (7, N'101', N'double1.jpg', CAST(100.00 AS Decimal(18, 2)), 2, 1, 2, N'Giường đơn 2 người ở thoải mái', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (8, N'102', N'double1.jpg', CAST(150.00 AS Decimal(18, 2)), 2, 2, 4, N'Giường đôi 4 người ở vô tư', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (9, N'103', N'triple-2.jpg', CAST(300.00 AS Decimal(18, 2)), 2, 3, 3, N'Phòng 3 giường ngủ', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (11, N'104', N'suite-2.jpg', CAST(600.00 AS Decimal(18, 2)), 2, 4, 2, N'Sang trong, quy phai', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (12, N'105', N'Triple-1.jpg', CAST(350.00 AS Decimal(18, 2)), 2, 1, 3, N'1231123', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (13, N'106', N'single1.jpg', CAST(200.00 AS Decimal(18, 2)), 2, 1, 2, N'12313', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (14, N'107', N'double1.jpg', CAST(400.00 AS Decimal(18, 2)), 2, 2, 2, N'Giường đôi 4 người ở vô tư', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (1011, N'110', N'suite1.jpg', CAST(1000.00 AS Decimal(18, 2)), 2, 4, 2, N'Suite', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (1012, N'111', N'double-2.jpg', CAST(500.00 AS Decimal(18, 2)), 2, 2, 2, N'Giuong doi', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (1013, N'112', N'room2.jpg', CAST(900.00 AS Decimal(18, 2)), 2, 4, 2, N'Suitee', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (1014, N'113', N'triple-2.jpg', CAST(800.00 AS Decimal(18, 2)), 2, 3, 3, N'Triple', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (1015, N'114', N'room3.jpg', CAST(700.00 AS Decimal(18, 2)), 2, 2, 4, N'Double', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (1016, N'115', N'room2.jpg', CAST(750.00 AS Decimal(18, 2)), 2, 4, 2, N'Suitee', 1)
INSERT [dbo].[Room] ([RoomId], [RoomNumber], [RoomImage], [RoomPrice], [BookingStatusId], [RoomTypeId], [RoomCapacity], [RoomDescription], [IsActive]) VALUES (1017, N'116', N'Triple-1.jpg', CAST(600.00 AS Decimal(18, 2)), 2, 3, 4, N'Triple', 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomBooking] ON 

INSERT [dbo].[RoomBooking] ([BookingId], [CustomerName], [CustomerAddress], [CustomerPhone], [BookingFrom], [BookingTo], [RoomId], [NoOfMember], [Total], [PaymentTypeId]) VALUES (1, N'Loc', N'Viet Nam', N'01010101', CAST(N'2023-05-20T00:00:00.000' AS DateTime), CAST(N'2023-05-21T00:00:00.000' AS DateTime), 9, 2, CAST(300.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[RoomBooking] ([BookingId], [CustomerName], [CustomerAddress], [CustomerPhone], [BookingFrom], [BookingTo], [RoomId], [NoOfMember], [Total], [PaymentTypeId]) VALUES (2, N'Hung', N'Viet Nam', N'0123123', CAST(N'2023-05-19T00:00:00.000' AS DateTime), CAST(N'2023-05-28T00:00:00.000' AS DateTime), 1015, 3, CAST(6300.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[RoomBooking] ([BookingId], [CustomerName], [CustomerAddress], [CustomerPhone], [BookingFrom], [BookingTo], [RoomId], [NoOfMember], [Total], [PaymentTypeId]) VALUES (3, N'LAaaa', N'Viet Nam', N'01010101', CAST(N'2023-05-20T00:00:00.000' AS DateTime), CAST(N'2023-05-22T00:00:00.000' AS DateTime), 1016, 2, CAST(1500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[RoomBooking] ([BookingId], [CustomerName], [CustomerAddress], [CustomerPhone], [BookingFrom], [BookingTo], [RoomId], [NoOfMember], [Total], [PaymentTypeId]) VALUES (4, N'Teo', N'Viet Nam', N'0987654321', CAST(N'2023-05-20T00:00:00.000' AS DateTime), CAST(N'2023-05-28T00:00:00.000' AS DateTime), 11, 2, CAST(4800.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[RoomBooking] ([BookingId], [CustomerName], [CustomerAddress], [CustomerPhone], [BookingFrom], [BookingTo], [RoomId], [NoOfMember], [Total], [PaymentTypeId]) VALUES (5, N'Loc', N'Viet Nam', N'01010101', CAST(N'2023-05-20T00:00:00.000' AS DateTime), CAST(N'2023-05-21T00:00:00.000' AS DateTime), 7, 2, CAST(100.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[RoomBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([RoomTypeId], [RoomTypeName]) VALUES (1, N'Single')
INSERT [dbo].[RoomType] ([RoomTypeId], [RoomTypeName]) VALUES (2, N'Double')
INSERT [dbo].[RoomType] ([RoomTypeId], [RoomTypeName]) VALUES (3, N'Tripple')
INSERT [dbo].[RoomType] ([RoomTypeId], [RoomTypeName]) VALUES (4, N'Suite')
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__RoleUser__8A2B61606F489BE4]    Script Date: 20/05/2023 19:55:52 ******/
ALTER TABLE [dbo].[RoleUsers] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__C9F284565CA7E64C]    Script Date: 20/05/2023 19:55:52 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__Payment__3B75D760]  DEFAULT ((0)) FOR [PaymentAmount]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF__Room__RoomPrice__300424B4]  DEFAULT ((0)) FOR [RoomPrice]
GO
ALTER TABLE [dbo].[RoomBooking] ADD  CONSTRAINT [DF__RoomBooki__Total__36B12243]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [RoleId]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK__Payment__IsActiv__3C69FB99] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([PaymentTypeId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK__Payment__IsActiv__3C69FB99]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK__Room__IsActive__30F848ED] FOREIGN KEY([BookingStatusId])
REFERENCES [dbo].[BookingStatus] ([BookingStatusId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK__Room__IsActive__30F848ED]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK__Room__RoomTypeId__31EC6D26] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomType] ([RoomTypeId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK__Room__RoomTypeId__31EC6D26]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK__RoomBooki__Payme__37A5467C] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK__RoomBooki__Payme__37A5467C]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK__RoomBooki__Payme__38996AB5] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([PaymentTypeId])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK__RoomBooki__Payme__38996AB5]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleUsers] ([RoleId])
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO
