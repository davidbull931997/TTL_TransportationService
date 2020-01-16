USE [master]
GO
/****** Object:  Database [TransportationService]    Script Date: 16/01/2020 8:29:04 PM ******/
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 16/01/2020 8:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[InfoId] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[VerifyCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomersInformation]    Script Date: 16/01/2020 8:29:05 PM ******/
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
 CONSTRAINT [PK_CustomersInfomation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 16/01/2020 8:29:05 PM ******/
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
/****** Object:  Table [dbo].[EmployeesInformation]    Script Date: 16/01/2020 8:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeesInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DivisonId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Routes]    Script Date: 16/01/2020 8:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Start] [nvarchar](100) NOT NULL,
	[Destination] [nvarchar](100) NOT NULL,
	[Distance] [decimal](18, 0) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteTimes]    Script Date: 16/01/2020 8:29:05 PM ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 16/01/2020 8:29:05 PM ******/
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
	[Seat] [tinyint] NOT NULL,
	[VehicleId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[TripId] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TripCloseTimes]    Script Date: 16/01/2020 8:29:05 PM ******/
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
/****** Object:  Table [dbo].[Trips]    Script Date: 16/01/2020 8:29:05 PM ******/
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
/****** Object:  Table [dbo].[Vehicles]    Script Date: 16/01/2020 8:29:05 PM ******/
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
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_CustomersInformation1] FOREIGN KEY([InfoId])
REFERENCES [dbo].[CustomersInformation] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_CustomersInformation1]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Divisions1] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Divisions] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Divisions1]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_EmployeesInformation1] FOREIGN KEY([InfoId])
REFERENCES [dbo].[EmployeesInformation] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_EmployeesInformation1]
GO
ALTER TABLE [dbo].[EmployeesInformation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesInformation_Divisions1] FOREIGN KEY([DivisonId])
REFERENCES [dbo].[Divisions] ([Id])
GO
ALTER TABLE [dbo].[EmployeesInformation] CHECK CONSTRAINT [FK_EmployeesInformation_Divisions1]
GO
ALTER TABLE [dbo].[EmployeesInformation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesInformation_Vehicles] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [dbo].[EmployeesInformation] CHECK CONSTRAINT [FK_EmployeesInformation_Vehicles]
GO
ALTER TABLE [dbo].[RouteTimes]  WITH CHECK ADD  CONSTRAINT [FK_RouteTimes_Routes] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[RouteTimes] CHECK CONSTRAINT [FK_RouteTimes_Routes]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_CustomersInformation1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CustomersInformation] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_CustomersInformation1]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Trips] FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Trips]
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
