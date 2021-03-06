USE [master]
GO
/****** Object:  Database [TransportationService]    Script Date: 08/06/2020 8:33:06 AM ******/
CREATE DATABASE [TransportationService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TransportationService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TransportationService.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TransportationService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TransportationService_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TransportationService] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TransportationService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TransportationService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TransportationService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TransportationService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TransportationService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TransportationService] SET ARITHABORT OFF 
GO
ALTER DATABASE [TransportationService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TransportationService] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TransportationService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TransportationService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TransportationService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TransportationService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TransportationService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TransportationService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TransportationService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TransportationService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TransportationService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TransportationService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TransportationService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TransportationService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TransportationService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TransportationService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TransportationService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TransportationService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TransportationService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TransportationService] SET  MULTI_USER 
GO
ALTER DATABASE [TransportationService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TransportationService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TransportationService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TransportationService] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TransportationService]
GO
USE [TransportationService]
GO
/****** Object:  Sequence [dbo].[hibernate_sequence]    Script Date: 08/06/2020 8:33:06 AM ******/
CREATE SEQUENCE [dbo].[hibernate_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](60) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[EmpId] [int] NULL,
	[DivisionId] [int] NOT NULL,
	[VerifyCode] [varchar](50) NOT NULL,
	[Cusid] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BusStop]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusStop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_ShuttleBusPoints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomersInformation]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomersInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Address] [nvarchar](250) NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[IdCard] [varchar](50) NULL,
 CONSTRAINT [PK_CustomersInfomation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Divisions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[DivisonLevel] [tinyint] NOT NULL,
 CONSTRAINT [PK_Divisions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeesInformation]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeesInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DivisionId] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[IdCard] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[VehicleId] [int] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[FContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_FAQs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Routes]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Start] [int] NOT NULL,
	[Destination] [int] NOT NULL,
	[Distance] [decimal](18, 0) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteTimes]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RouteTimes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[Time] [varchar](10) NOT NULL,
 CONSTRAINT [PK_RouteTimes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketNumber] [varchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Seat] [varchar](50) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[RouteId] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[RouteTimeId] [int] NOT NULL,
	[OTP] [varchar](50) NULL,
	[BusStopId] [int] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TripCloseTimes]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripCloseTimes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[CloseDate] [datetime] NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_TripCloseTimes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trips]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[VehicleId] [int] NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Trips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 08/06/2020 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalSeat] [int] NOT NULL,
	[SeatType] [nvarchar](50) NOT NULL,
	[LicensePlates] [varchar](50) NOT NULL,
	[VehicleNumber] [varchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[RouteTimeId] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Username], [Password], [CreatedDate], [Status], [EmpId], [DivisionId], [VerifyCode], [Cusid]) VALUES (2, N'thuan', N'$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', CAST(0x0000AB5C00000000 AS DateTime), N'ACTIVE', NULL, 3, N'123', 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [CreatedDate], [Status], [EmpId], [DivisionId], [VerifyCode], [Cusid]) VALUES (1005, N'lampn', N'4297f44b13955235245b2497399d7a93', CAST(0x0000AB6400000000 AS DateTime), N'ACTIVE', NULL, 1, N'EMP842526', 6)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [CreatedDate], [Status], [EmpId], [DivisionId], [VerifyCode], [Cusid]) VALUES (1016, N'lampn9397', N'c7a8173f7567432ec4213c3691298420', CAST(0x0000ABCC00000000 AS DateTime), N'ACTIVE', NULL, 1, N'614063', 17)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[BusStop] ON 

INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (1, N'Bến xe trung tâm Đà Nẵng', 1)
INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (3, N'Bến xe Chợ Lớn', 2)
INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (4, N'Bến xe Miền Đông', 2)
INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (5, N'Bến xe Mỹ Đình', 3)
INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (6, N'Bến xe Lương Yên', 3)
INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (7, N'Bến xe Niệm Nghĩa', 4)
INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (8, N'Bến xe Lạc Long', 4)
INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (9, N'Bến xe Tô Châu', 5)
INSERT [dbo].[BusStop] ([Id], [Name], [CityId]) VALUES (10, N'Bến xe Cần Thơ Mới', 5)
SET IDENTITY_INSERT [dbo].[BusStop] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name]) VALUES (1, N'Đà Nẵng')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (2, N'TP HCM')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (3, N'Hà Nội')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (4, N'Hải Phòng')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (5, N'Cần Thơ')
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[CustomersInformation] ON 

INSERT [dbo].[CustomersInformation] ([Id], [Fullname], [Birthday], [Address], [PhoneNumber], [Gender], [CreatedDate], [Email], [IdCard]) VALUES (1, N'Trần Thuận', CAST(0x3B200B00 AS Date), N'Hội An', N'012345678', N'Nam', CAST(0x0000AC0B00000000 AS DateTime), N'tranthuan0406@gmail.com', N'201744455')
INSERT [dbo].[CustomersInformation] ([Id], [Fullname], [Birthday], [Address], [PhoneNumber], [Gender], [CreatedDate], [Email], [IdCard]) VALUES (6, N'Phan Ngoc Lam', CAST(0xBF400B00 AS Date), N'Đà Nẵng', N'0122222222', N'Nữ', CAST(0x0000AB6400000000 AS DateTime), N'lampn9397@gmail.com', N'201855566')
INSERT [dbo].[CustomersInformation] ([Id], [Fullname], [Birthday], [Address], [PhoneNumber], [Gender], [CreatedDate], [Email], [IdCard]) VALUES (17, N'Phan Ngọc Lâm', CAST(0x29410B00 AS Date), N'29 Lê Phụ Trầnn', N'0776266985', N'Other', CAST(0x0000ABCC00000000 AS DateTime), N'davidbull931997@gmail.com', N'201769663')
INSERT [dbo].[CustomersInformation] ([Id], [Fullname], [Birthday], [Address], [PhoneNumber], [Gender], [CreatedDate], [Email], [IdCard]) VALUES (19, N'Trần Thuận', CAST(0x3B200B00 AS Date), N'Đà Nẵng', N'012345678', N'Nam', CAST(0x0000AC0B00000000 AS DateTime), N'tranthuan0406@gmail.com', N'201744455')
INSERT [dbo].[CustomersInformation] ([Id], [Fullname], [Birthday], [Address], [PhoneNumber], [Gender], [CreatedDate], [Email], [IdCard]) VALUES (23, N'Trần Văn A', CAST(0xA2240B00 AS Date), N'hà Nội', N'123456789', N'Nữ', CAST(0x0000ABD400000000 AS DateTime), N'abc@gmail.com', N'222333')
SET IDENTITY_INSERT [dbo].[CustomersInformation] OFF
SET IDENTITY_INSERT [dbo].[Divisions] ON 

INSERT [dbo].[Divisions] ([Id], [Name], [Type], [DivisonLevel]) VALUES (1, N'Khách hàng', N'CUSTOMER', 0)
INSERT [dbo].[Divisions] ([Id], [Name], [Type], [DivisonLevel]) VALUES (2, N'Nhân viên', N'EMPLOYEE', 1)
INSERT [dbo].[Divisions] ([Id], [Name], [Type], [DivisonLevel]) VALUES (3, N'Quản trị viên', N'ROLE_ADMIN', 2)
SET IDENTITY_INSERT [dbo].[Divisions] OFF
SET IDENTITY_INSERT [dbo].[EmployeesInformation] ON 

INSERT [dbo].[EmployeesInformation] ([Id], [Name], [DivisionId], [Address], [Status], [IdCard], [Birthday], [VehicleId], [Gender], [PhoneNumber], [Email], [CreatedDate]) VALUES (1, N'Phan Ngoc Lam', 2, N'Da Nang', 1, 2017966966, CAST(0x39240B00 AS Date), 1, N'NAM', N'01214445555', N'abc@gmail.com', CAST(0x0000AB60017803EE AS DateTime))
INSERT [dbo].[EmployeesInformation] ([Id], [Name], [DivisionId], [Address], [Status], [IdCard], [Birthday], [VehicleId], [Gender], [PhoneNumber], [Email], [CreatedDate]) VALUES (6, N'Tran Thuan', 2, N'Da Nang', 1, 201740496, CAST(0x23240B00 AS Date), 3, N'Nam', N'01223335555', N'bca@gmail.com', CAST(0x0000AB6000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[EmployeesInformation] OFF
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (1, N'Tôi phải xuất trình gì với nhà xe để lên xe?', N'Hành khách có thể xuất trình SMS vé hoặc Email có thông tin về vé (đa số các hãng xe đều chấp nhận hình thức này).')
INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (2, N'Nếu tôi làm mất vé, tôi nên làm gì?', N'Một bản copy của vé xe được gửi về địa chỉ mail của bạn khi bạn đặt vé. Xuất trình Email này cho nhà xe..')
INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (3, N'Tôi không nhận được SMS vé, tôi phải làm thế nào?', N'Trong trường hợp không nhận được SMS vé từ tổng đài, quý khách có thể gọi điên trực tiếp tổng đài 077 62 66 985 để yêu cầu gửi lại.')
INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (4, N'Tôi nhập sai số điện thoại trong lúc đặt vé online. Tôi phải làm thế nào?', N'Nếu quý khách nhập sai số điện thoại trong quá trình đặt vé online, quý khách có thể gọi điên trực tiếp tổng đài 077 62 66 985 để yêu cầu xác nhận lại số điện thoại đặt vé mới.')
INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (5, N'Tôi thanh toán xong rồi phải làm gì tiếp theo?', N'Trong trường hợp quý khách chọn điểm đi tại văn phòng nhà xe thì vui lòng có mặt trước 30 phút tại văn phòng/quầy vé/ Bến xe xuất trình SMS vé hoặc Email vé để làm thủ tục lên xe.')
INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (6, N'Tôi không có thẻ tín dụng/thẻ ngân hàng. Tôi vẫn có thể đặt vé online được không?', N'Có. Quý khách gọi cho tổng đài 077 62 66 985 và trung tâm chăm sóc khách hàng của chúng tôi sẽ đặt vé cho bạn hoặc quý khách cũng có thể đặt vé online bằng cách chọn hình thức “Thanh toán tiền mặt tại các cửa hàng tiện lợi và siêu thị gần nhà”. Qúy khách sẽ trả tiền mặt cho nhân viên khi đến thanh toán tại cửa hàng tiện lợi.')
INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (7, N'Tôi không truy cập Internet, không có thẻ thanh toán online. Tôi có thể mua vé qua Vexere được không?', N'Có. Quý khách có thể gọi điện trực tiếp tổng đài 077 62 66 985 để mua vé và trả tiền khi nhận vé.')
INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (8, N'Tôi có thể hủy vé online đã đặt như thế nào?', N'Trường hợp các vé online đã đặt, quý khách có thể gọi điện trực tiếp bộ phận chăm sóc khách hàng 07762 66 985 để thông báo hủy vé.')
INSERT [dbo].[FAQs] ([Id], [Name], [FContent]) VALUES (9, N'Tôi có ý kiến thắc mắc hoặc khiếu nại gì thì phải làm sao ?', N'Quý khách có thể gửi đơn khiếu nại về địa chỉ mail <tranthuan4046@gmail.com> với nội dung như : Tên người khiếu nại, vấn đề/thắc mắc, người bị khiếu nại(nếu có), số điện thoại liên lạc.')
SET IDENTITY_INSERT [dbo].[FAQs] OFF
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([Id], [Start], [Destination], [Distance], [Price]) VALUES (1, 1, 2, CAST(35 AS Decimal(18, 0)), 800000.0000)
INSERT [dbo].[Routes] ([Id], [Start], [Destination], [Distance], [Price]) VALUES (2, 1, 3, CAST(750 AS Decimal(18, 0)), 2000000.0000)
INSERT [dbo].[Routes] ([Id], [Start], [Destination], [Distance], [Price]) VALUES (3, 2, 3, CAST(500 AS Decimal(18, 0)), 8500000.0000)
INSERT [dbo].[Routes] ([Id], [Start], [Destination], [Distance], [Price]) VALUES (4, 2, 4, CAST(250 AS Decimal(18, 0)), 750000.0000)
SET IDENTITY_INSERT [dbo].[Routes] OFF
SET IDENTITY_INSERT [dbo].[RouteTimes] ON 

INSERT [dbo].[RouteTimes] ([Id], [RouteId], [Time]) VALUES (1, 1, N'07:30')
INSERT [dbo].[RouteTimes] ([Id], [RouteId], [Time]) VALUES (2, 1, N'15:30')
INSERT [dbo].[RouteTimes] ([Id], [RouteId], [Time]) VALUES (3, 1, N'19:00')
INSERT [dbo].[RouteTimes] ([Id], [RouteId], [Time]) VALUES (4, 2, N'05:45')
INSERT [dbo].[RouteTimes] ([Id], [RouteId], [Time]) VALUES (5, 2, N'11:00')
INSERT [dbo].[RouteTimes] ([Id], [RouteId], [Time]) VALUES (6, 2, N'17:30')
SET IDENTITY_INSERT [dbo].[RouteTimes] OFF
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Price], [DateStart], [CreatedDate], [Seat], [VehicleId], [CustomerId], [Status], [RouteId], [Note], [RouteTimeId], [OTP], [BusStopId]) VALUES (1, N'611713', 800000, CAST(0x0000ABCF00000000 AS DateTime), CAST(0x0000ABCF00000000 AS DateTime), N'A2', 1, 17, N'PAID', 1, NULL, 1, N'855381', 3)
INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Price], [DateStart], [CreatedDate], [Seat], [VehicleId], [CustomerId], [Status], [RouteId], [Note], [RouteTimeId], [OTP], [BusStopId]) VALUES (2, N'348256', 800000, CAST(0x0000ABCE00000000 AS DateTime), CAST(0x0000ABCF00000000 AS DateTime), N'A7', 1, 17, N'PAID', 1, NULL, 1, N'431337', 3)
INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Price], [DateStart], [CreatedDate], [Seat], [VehicleId], [CustomerId], [Status], [RouteId], [Note], [RouteTimeId], [OTP], [BusStopId]) VALUES (3, N'010087', 800000, CAST(0x0000ABCD00000000 AS DateTime), CAST(0x0000ABCF00000000 AS DateTime), N'A8', 1, 17, N'PAID', 1, NULL, 1, N'004237', 3)
INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Price], [DateStart], [CreatedDate], [Seat], [VehicleId], [CustomerId], [Status], [RouteId], [Note], [RouteTimeId], [OTP], [BusStopId]) VALUES (4, N'826232', 800000, CAST(0x0000ABCF00000000 AS DateTime), CAST(0x0000ABCF00000000 AS DateTime), N'A4', 1, 17, N'PAID', 1, NULL, 1, N'232483', 3)
INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Price], [DateStart], [CreatedDate], [Seat], [VehicleId], [CustomerId], [Status], [RouteId], [Note], [RouteTimeId], [OTP], [BusStopId]) VALUES (5, N'576354', 800000, CAST(0x0000ABD200000000 AS DateTime), CAST(0x0000ABD200000000 AS DateTime), N'A2', 1, 17, N'PAID', 1, NULL, 1, N'184284', 3)
INSERT [dbo].[Tickets] ([Id], [TicketNumber], [Price], [DateStart], [CreatedDate], [Seat], [VehicleId], [CustomerId], [Status], [RouteId], [Note], [RouteTimeId], [OTP], [BusStopId]) VALUES (6, N'442214', 800000, CAST(0x0000ABD200000000 AS DateTime), CAST(0x0000ABD200000000 AS DateTime), N'A1', 1, 17, N'PAID', 1, NULL, 1, N'283775', 3)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
SET IDENTITY_INSERT [dbo].[TripCloseTimes] ON 

INSERT [dbo].[TripCloseTimes] ([Id], [RouteId], [CloseDate], [Description]) VALUES (1, 1, CAST(0x0000AC0800000000 AS DateTime), N'Sửa chửa')
INSERT [dbo].[TripCloseTimes] ([Id], [RouteId], [CloseDate], [Description]) VALUES (2, 1, CAST(0x0000ABD800000000 AS DateTime), N'Sửa chửa')
INSERT [dbo].[TripCloseTimes] ([Id], [RouteId], [CloseDate], [Description]) VALUES (3, 2, CAST(0x0000ABD700000000 AS DateTime), N'Sửa chửa')
SET IDENTITY_INSERT [dbo].[TripCloseTimes] OFF
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([Id], [RouteId], [DateStart], [VehicleId], [Status]) VALUES (1, 1, CAST(0x0000ABE000000000 AS DateTime), 1, N'PENDING')
INSERT [dbo].[Trips] ([Id], [RouteId], [DateStart], [VehicleId], [Status]) VALUES (2, 1, CAST(0x0000ABD200000000 AS DateTime), 1, N'PENDING')
SET IDENTITY_INSERT [dbo].[Trips] OFF
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([Id], [TotalSeat], [SeatType], [LicensePlates], [VehicleNumber], [Model], [RouteTimeId], [Description]) VALUES (1, 16, N'SEAT', N'43-E1 42556', N'931997', N'Chevolet Cameron', 1, N'Xe của Lâm')
INSERT [dbo].[Vehicles] ([Id], [TotalSeat], [SeatType], [LicensePlates], [VehicleNumber], [Model], [RouteTimeId], [Description]) VALUES (3, 16, N'SEAT', N'43-E1 42556', N'931997', N'Chevolet Cameron', 2, N'Xe của Lâm')
INSERT [dbo].[Vehicles] ([Id], [TotalSeat], [SeatType], [LicensePlates], [VehicleNumber], [Model], [RouteTimeId], [Description]) VALUES (4, 16, N'SEAT', N'43-E1 42556', N'931997', N'Chevolet Cameron', 3, N'Xe của Lâm')
INSERT [dbo].[Vehicles] ([Id], [TotalSeat], [SeatType], [LicensePlates], [VehicleNumber], [Model], [RouteTimeId], [Description]) VALUES (5, 16, N'SEAT', N'43-E1 7558', N'461997', N'Mercedes Sprinter', 4, N'Xe của Thuận')
INSERT [dbo].[Vehicles] ([Id], [TotalSeat], [SeatType], [LicensePlates], [VehicleNumber], [Model], [RouteTimeId], [Description]) VALUES (6, 16, N'SEAT', N'43-E1 7558', N'461997', N'Mercedes Sprinter', 5, N'Xe của Thuận')
INSERT [dbo].[Vehicles] ([Id], [TotalSeat], [SeatType], [LicensePlates], [VehicleNumber], [Model], [RouteTimeId], [Description]) VALUES (7, 16, N'SEAT', N'43-E1 7558', N'461997', N'Mercedes Sprinter', 6, N'Xe của Thuận')
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_CustomersInformation] FOREIGN KEY([Cusid])
REFERENCES [dbo].[CustomersInformation] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_CustomersInformation]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Divisions1] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Divisions] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Divisions1]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_EmployeesInformation1] FOREIGN KEY([EmpId])
REFERENCES [dbo].[EmployeesInformation] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_EmployeesInformation1]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FKn66wq6rvw3oapiemmetomw717] FOREIGN KEY([Cusid])
REFERENCES [dbo].[CustomersInformation] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FKn66wq6rvw3oapiemmetomw717]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FKtfo3xoeqwryyp2a54l4n1vhr7] FOREIGN KEY([EmpId])
REFERENCES [dbo].[EmployeesInformation] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FKtfo3xoeqwryyp2a54l4n1vhr7]
GO
ALTER TABLE [dbo].[BusStop]  WITH CHECK ADD  CONSTRAINT [FK_ShuttleBusPoints_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[BusStop] CHECK CONSTRAINT [FK_ShuttleBusPoints_Cities]
GO
ALTER TABLE [dbo].[EmployeesInformation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesInformation_Divisions1] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Divisions] ([Id])
GO
ALTER TABLE [dbo].[EmployeesInformation] CHECK CONSTRAINT [FK_EmployeesInformation_Divisions1]
GO
ALTER TABLE [dbo].[EmployeesInformation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesInformation_Vehicles] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [dbo].[EmployeesInformation] CHECK CONSTRAINT [FK_EmployeesInformation_Vehicles]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Cities] FOREIGN KEY([Start])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Cities]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Cities1] FOREIGN KEY([Destination])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Cities1]
GO
ALTER TABLE [dbo].[RouteTimes]  WITH CHECK ADD  CONSTRAINT [FK_RouteTimes_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[RouteTimes] CHECK CONSTRAINT [FK_RouteTimes_Routes]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_BusStop] FOREIGN KEY([BusStopId])
REFERENCES [dbo].[BusStop] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_BusStop]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_CustomersInformation1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CustomersInformation] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_CustomersInformation1]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Routes]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_RouteTimes1] FOREIGN KEY([RouteTimeId])
REFERENCES [dbo].[RouteTimes] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_RouteTimes1]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Vehicles1] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Vehicles1]
GO
ALTER TABLE [dbo].[TripCloseTimes]  WITH CHECK ADD  CONSTRAINT [FK_TripCloseTimes_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[TripCloseTimes] CHECK CONSTRAINT [FK_TripCloseTimes_Routes]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_Trips_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_Trips_Routes]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_Trips_Vehicles] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_Trips_Vehicles]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_RouteTimes] FOREIGN KEY([RouteTimeId])
REFERENCES [dbo].[RouteTimes] ([Id])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_RouteTimes]
GO
USE [master]
GO
ALTER DATABASE [TransportationService] SET  READ_WRITE 
GO
