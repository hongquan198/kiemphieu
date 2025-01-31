USE [master]
GO
/****** Object:  Database [v2kp]    Script Date: 11/28/2024 2:49:10 PM ******/
CREATE DATABASE [v2kp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'v2kp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\v2kp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'v2kp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\v2kp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [v2kp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [v2kp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [v2kp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [v2kp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [v2kp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [v2kp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [v2kp] SET ARITHABORT OFF 
GO
ALTER DATABASE [v2kp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [v2kp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [v2kp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [v2kp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [v2kp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [v2kp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [v2kp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [v2kp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [v2kp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [v2kp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [v2kp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [v2kp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [v2kp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [v2kp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [v2kp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [v2kp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [v2kp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [v2kp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [v2kp] SET  MULTI_USER 
GO
ALTER DATABASE [v2kp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [v2kp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [v2kp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [v2kp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [v2kp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [v2kp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [v2kp] SET QUERY_STORE = OFF
GO
USE [v2kp]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/28/2024 2:49:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[PassWord] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Role] [nvarchar](50) NULL,
	[KhuVuc] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[KhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaiHoi]    Script Date: 11/28/2024 2:49:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaiHoi](
	[ID] [int] NOT NULL,
	[ThoiGian] [date] NULL,
	[TenDaiHoi] [nvarchar](150) NULL,
	[IDKhuVuc] [int] NOT NULL,
	[TrangThai] [bit] NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [PK_DaiHoi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[IDKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuVuc]    Script Date: 11/28/2024 2:49:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuVuc](
	[ID] [int] NOT NULL,
	[KhuVuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_TenDaiHoi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuBau]    Script Date: 11/28/2024 2:49:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuBau](
	[ID] [int] NOT NULL,
	[IDUngCuVien] [int] NOT NULL,
	[IsCheck] [bit] NULL,
	[KhuVuc] [int] NOT NULL,
	[IDDaiHoi] [int] NOT NULL,
 CONSTRAINT [PK_PhieuBau_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[IDUngCuVien] ASC,
	[KhuVuc] ASC,
	[IDDaiHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinBaoCao]    Script Date: 11/28/2024 2:49:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinBaoCao](
	[TenToChucDang] [nvarchar](200) NULL,
	[DaiHoiLanThu] [nvarchar](200) NULL,
	[ThoiGian] [nvarchar](200) NULL,
	[TruongBanKiemPhieu] [nvarchar](100) NULL,
	[ThuKy] [nvarchar](100) NULL,
	[IDDaiHoi] [int] NOT NULL,
	[KhuVuc] [int] NOT NULL,
	[NhiemKy] [nvarchar](100) NULL,
	[ThoiGianGhiBienBan] [nvarchar](200) NULL,
 CONSTRAINT [PK_ThongTinBaoCao] PRIMARY KEY CLUSTERED 
(
	[IDDaiHoi] ASC,
	[KhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinDaiHoi]    Script Date: 11/28/2024 2:49:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinDaiHoi](
	[IdDaiHoi] [int] NOT NULL,
	[CongressType] [nvarchar](255) NULL,
	[NumberOfVoters] [int] NULL,
	[TotalDelegates] [int] NULL,
	[DelegatesPresent] [int] NULL,
	[DelegatesPresentOfficial] [int] NULL,
	[OfficialDelegatesPresent] [int] NULL,
	[DelegatesDisqualified] [int] NULL,
	[OfficialDelegatesDisqualified] [int] NULL,
	[DelegatesAbsent] [int] NULL,
	[OfficialDelegatesAbsent] [int] NULL,
	[DelegatesPresentDuringVoting] [int] NULL,
	[OfficialDelegatesPresentDuringVoting] [int] NULL,
	[SoPhieuPhatRa] [int] NULL,
	[SoPhieuThuVao] [int] NULL,
	[SoPhieuHopLe] [int] NULL,
	[SoPhieuKhongHopLe] [int] NULL,
	[KhuVuc] [int] NOT NULL,
 CONSTRAINT [PK_ThongTinDaiHoi] PRIMARY KEY CLUSTERED 
(
	[IdDaiHoi] ASC,
	[KhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UngCuVien]    Script Date: 11/28/2024 2:49:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UngCuVien](
	[ID] [int] NOT NULL,
	[Dem] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[KhuVuc] [int] NOT NULL,
	[IDDaiHoi] [int] NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_UngCuVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[KhuVuc] ASC,
	[IDDaiHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UyVien]    Script Date: 11/28/2024 2:49:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UyVien](
	[ID] [int] NOT NULL,
	[HoTenUyVien] [nvarchar](50) NULL,
	[IDDaiHoi] [int] NOT NULL,
	[KhuVuc] [int] NOT NULL,
	[ChucVu] [nvarchar](200) NULL,
 CONSTRAINT [PK_UyVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[IDDaiHoi] ASC,
	[KhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([ID], [UserID], [UserName], [PassWord], [Email], [Role], [KhuVuc]) VALUES (0, N'user1', N'Nguyễn Văn A', N'1', N'user1@gmail.com', N'User', 1)
INSERT [dbo].[Account] ([ID], [UserID], [UserName], [PassWord], [Email], [Role], [KhuVuc]) VALUES (1, N'Admin', N'Admin', N'1', N'admin@gmail.com', N'Admin', 0)
INSERT [dbo].[Account] ([ID], [UserID], [UserName], [PassWord], [Email], [Role], [KhuVuc]) VALUES (2, N'user2', N'Nguyễn Thị K', N'1', N'user2@gmail.com', N'User', 2)
INSERT [dbo].[Account] ([ID], [UserID], [UserName], [PassWord], [Email], [Role], [KhuVuc]) VALUES (3, N'user3', N'1451020118', N'1', N'l@gmail.com', N'Admin', 1)
INSERT [dbo].[Account] ([ID], [UserID], [UserName], [PassWord], [Email], [Role], [KhuVuc]) VALUES (4, N'user4', N'1451020072', N'1', N'zongquan1982002@gmail.com', N'Admin', 2)
GO
INSERT [dbo].[DaiHoi] ([ID], [ThoiGian], [TenDaiHoi], [IDKhuVuc], [TrangThai], [ThoiGianKetThuc]) VALUES (1, CAST(N'2024-11-25' AS Date), N'Đại hội đại biểu Tỉnh Yên Bái', 1, 0, CAST(N'2024-11-25' AS Date))
INSERT [dbo].[DaiHoi] ([ID], [ThoiGian], [TenDaiHoi], [IDKhuVuc], [TrangThai], [ThoiGianKetThuc]) VALUES (1, CAST(N'2024-11-25' AS Date), N'Đại hội đại biểu Hà Nội', 2, 0, CAST(N'2024-11-26' AS Date))
INSERT [dbo].[DaiHoi] ([ID], [ThoiGian], [TenDaiHoi], [IDKhuVuc], [TrangThai], [ThoiGianKetThuc]) VALUES (2, CAST(N'2024-11-25' AS Date), N'Đại hội đảng viên tỉnh yên bái', 1, 0, CAST(N'2024-11-26' AS Date))
INSERT [dbo].[DaiHoi] ([ID], [ThoiGian], [TenDaiHoi], [IDKhuVuc], [TrangThai], [ThoiGianKetThuc]) VALUES (2, CAST(N'2024-11-25' AS Date), N'Đại hội hà nội', 2, 1, CAST(N'2024-11-28' AS Date))
INSERT [dbo].[DaiHoi] ([ID], [ThoiGian], [TenDaiHoi], [IDKhuVuc], [TrangThai], [ThoiGianKetThuc]) VALUES (3, CAST(N'2024-11-26' AS Date), N'Đại hội đảng viên yb', 1, 0, CAST(N'2024-11-26' AS Date))
INSERT [dbo].[DaiHoi] ([ID], [ThoiGian], [TenDaiHoi], [IDKhuVuc], [TrangThai], [ThoiGianKetThuc]) VALUES (4, CAST(N'2024-11-26' AS Date), N'Đại hội Yên Bái 5', 1, 0, CAST(N'2024-11-26' AS Date))
INSERT [dbo].[DaiHoi] ([ID], [ThoiGian], [TenDaiHoi], [IDKhuVuc], [TrangThai], [ThoiGianKetThuc]) VALUES (6, CAST(N'2024-11-28' AS Date), N'võ thuật', 1, 1, CAST(N'2024-11-29' AS Date))
GO
INSERT [dbo].[KhuVuc] ([ID], [KhuVuc]) VALUES (1, N'Yên Bái')
INSERT [dbo].[KhuVuc] ([ID], [KhuVuc]) VALUES (2, N'Hà Nội')
GO
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 1, 0, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 1, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 1, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 2, 0, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 2, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 2, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 3, 1, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 3, 0, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 3, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 3, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (1, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 1, 0, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 1, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 1, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 2, 0, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 2, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 2, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 3, 1, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 3, 0, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 3, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 3, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (2, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 1, 0, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 1, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 1, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 2, 0, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 2, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 2, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 3, 1, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 3, 0, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 3, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 3, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 3, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (3, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 1, 1, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 1, 0, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 1, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 2, 0, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 2, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 2, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 3, 0, 1, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 3, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 3, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 3, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (4, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 1, 0, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 1, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 2, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 2, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 3, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 3, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 3, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 4, 0, 1, 4)
GO
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (5, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 1, 0, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 1, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 2, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 2, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 3, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 3, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 3, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (6, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 1, 0, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 1, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 1, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 2, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 2, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 3, 1, 1, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 3, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 3, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (7, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 1, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 2, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 3, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 3, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (8, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 1, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 1, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 2, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 3, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 3, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (9, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 1, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 1, 1, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 1, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 1, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 2, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 2, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 3, 1, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 3, 0, 1, 6)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 3, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 4, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (10, 5, 0, 1, 4)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (11, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (11, 1, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (11, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (11, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (11, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (11, 3, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (11, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (12, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (12, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (12, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (12, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (12, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (12, 3, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (12, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (13, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (13, 1, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (13, 2, 1, 2, 1)
GO
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (13, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (13, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (13, 3, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (13, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (14, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (14, 1, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (14, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (14, 2, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (14, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (14, 3, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (14, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (15, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (15, 1, 0, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (15, 2, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (15, 2, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (15, 3, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (15, 3, 1, 2, 2)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (15, 4, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (16, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (16, 2, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (16, 3, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (16, 4, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (17, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (17, 2, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (17, 3, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (17, 4, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (18, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (18, 2, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (18, 3, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (18, 4, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (19, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (19, 2, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (19, 3, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (19, 4, 1, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (20, 1, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (20, 2, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (20, 3, 0, 2, 1)
INSERT [dbo].[PhieuBau] ([ID], [IDUngCuVien], [IsCheck], [KhuVuc], [IDDaiHoi]) VALUES (20, 4, 1, 2, 1)
GO
INSERT [dbo].[ThongTinBaoCao] ([TenToChucDang], [DaiHoiLanThu], [ThoiGian], [TruongBanKiemPhieu], [ThuKy], [IDDaiHoi], [KhuVuc], [NhiemKy], [ThoiGianGhiBienBan]) VALUES (N'ĐẢNG ỦY KHỐI DOANH NGHIỆP', N'XX', N'Yên Bái, ngày 11 tháng 2 năm 2024', N'Hoàng Văn A', N'Nguyễn Văn T', 1, 1, N'2024-2025', N'11 giờ 6 phút')
INSERT [dbo].[ThongTinBaoCao] ([TenToChucDang], [DaiHoiLanThu], [ThoiGian], [TruongBanKiemPhieu], [ThuKy], [IDDaiHoi], [KhuVuc], [NhiemKy], [ThoiGianGhiBienBan]) VALUES (N'ĐẢNG BỘ KHỐI CƠ QUAN', N'X', N'Yên Bái, ngày 24 tháng 8 năm 2024', N'Nguyễn', N'Nguyễn Thị K', 1, 2, N'2024-2025', N'11 giờ 36 phút ')
INSERT [dbo].[ThongTinBaoCao] ([TenToChucDang], [DaiHoiLanThu], [ThoiGian], [TruongBanKiemPhieu], [ThuKy], [IDDaiHoi], [KhuVuc], [NhiemKy], [ThoiGianGhiBienBan]) VALUES (N'ĐẢNG ỦY KHỐI ', N'XV', N'Yên Bái, ngày 17 tháng 11 năm 2024', N'Nguyễn Thụ W', N'Nguyễn Văn L', 2, 1, N'2024-2025', N'12 giờ 1 phút')
INSERT [dbo].[ThongTinBaoCao] ([TenToChucDang], [DaiHoiLanThu], [ThoiGian], [TruongBanKiemPhieu], [ThuKy], [IDDaiHoi], [KhuVuc], [NhiemKy], [ThoiGianGhiBienBan]) VALUES (N'ĐẢNG ỦY KHỐI DOANH NGHIỆP', N'XV', N'Yên Bái, ngày 24 tháng 8 năm 2024', N'Nguyễn Văn A', N'Nguyễn Thị E', 2, 2, N'2024-2025', N'11 giờ 6 phút')
INSERT [dbo].[ThongTinBaoCao] ([TenToChucDang], [DaiHoiLanThu], [ThoiGian], [TruongBanKiemPhieu], [ThuKy], [IDDaiHoi], [KhuVuc], [NhiemKy], [ThoiGianGhiBienBan]) VALUES (N'ĐẢNG ỦY KHỐI DOANH NGHIỆP', N'XX', N'Yên Bái, ngày 24 tháng 8 năm 2024', N'Nguyễn B', N'Nguyễn C', 4, 1, N'2024-2025', N'11 giờ 6 phút')
INSERT [dbo].[ThongTinBaoCao] ([TenToChucDang], [DaiHoiLanThu], [ThoiGian], [TruongBanKiemPhieu], [ThuKy], [IDDaiHoi], [KhuVuc], [NhiemKy], [ThoiGianGhiBienBan]) VALUES (N'ĐẢNG BỘ KHỐI CƠ QUAN', N'XX', N'Hà Nội, ngày 11 tháng 2 năm 2024', N'Nguyễn r', N'Nguyễn B', 6, 1, N'2024-2025', N'11 giờ 6 phút')
GO
INSERT [dbo].[ThongTinDaiHoi] ([IdDaiHoi], [CongressType], [NumberOfVoters], [TotalDelegates], [DelegatesPresent], [DelegatesPresentOfficial], [OfficialDelegatesPresent], [DelegatesDisqualified], [OfficialDelegatesDisqualified], [DelegatesAbsent], [OfficialDelegatesAbsent], [DelegatesPresentDuringVoting], [OfficialDelegatesPresentDuringVoting], [SoPhieuPhatRa], [SoPhieuThuVao], [SoPhieuHopLe], [SoPhieuKhongHopLe], [KhuVuc]) VALUES (1, N'Đại hội đại biểu', 1, 5, 5, 5, 5, 0, 0, 1, 1, 5, 5, 5, 5, 4, 1, 1)
INSERT [dbo].[ThongTinDaiHoi] ([IdDaiHoi], [CongressType], [NumberOfVoters], [TotalDelegates], [DelegatesPresent], [DelegatesPresentOfficial], [OfficialDelegatesPresent], [DelegatesDisqualified], [OfficialDelegatesDisqualified], [DelegatesAbsent], [OfficialDelegatesAbsent], [DelegatesPresentDuringVoting], [OfficialDelegatesPresentDuringVoting], [SoPhieuPhatRa], [SoPhieuThuVao], [SoPhieuHopLe], [SoPhieuKhongHopLe], [KhuVuc]) VALUES (1, N'Đại hội đảng viên', 3, 20, 20, 20, 20, 1, 0, 1, 0, 20, 20, 23, 23, 20, 3, 2)
INSERT [dbo].[ThongTinDaiHoi] ([IdDaiHoi], [CongressType], [NumberOfVoters], [TotalDelegates], [DelegatesPresent], [DelegatesPresentOfficial], [OfficialDelegatesPresent], [DelegatesDisqualified], [OfficialDelegatesDisqualified], [DelegatesAbsent], [OfficialDelegatesAbsent], [DelegatesPresentDuringVoting], [OfficialDelegatesPresentDuringVoting], [SoPhieuPhatRa], [SoPhieuThuVao], [SoPhieuHopLe], [SoPhieuKhongHopLe], [KhuVuc]) VALUES (2, N'Đại hội đảng viên', 2, 10, 10, 10, 10, 1, 1, 2, 2, 8, 8, 9, 9, 7, 2, 1)
INSERT [dbo].[ThongTinDaiHoi] ([IdDaiHoi], [CongressType], [NumberOfVoters], [TotalDelegates], [DelegatesPresent], [DelegatesPresentOfficial], [OfficialDelegatesPresent], [DelegatesDisqualified], [OfficialDelegatesDisqualified], [DelegatesAbsent], [OfficialDelegatesAbsent], [DelegatesPresentDuringVoting], [OfficialDelegatesPresentDuringVoting], [SoPhieuPhatRa], [SoPhieuThuVao], [SoPhieuHopLe], [SoPhieuKhongHopLe], [KhuVuc]) VALUES (2, N'Đại hội đại biểu', 2, 15, 15, 15, 15, 0, 0, 0, 0, 15, 15, 18, 18, 15, 3, 2)
INSERT [dbo].[ThongTinDaiHoi] ([IdDaiHoi], [CongressType], [NumberOfVoters], [TotalDelegates], [DelegatesPresent], [DelegatesPresentOfficial], [OfficialDelegatesPresent], [DelegatesDisqualified], [OfficialDelegatesDisqualified], [DelegatesAbsent], [OfficialDelegatesAbsent], [DelegatesPresentDuringVoting], [OfficialDelegatesPresentDuringVoting], [SoPhieuPhatRa], [SoPhieuThuVao], [SoPhieuHopLe], [SoPhieuKhongHopLe], [KhuVuc]) VALUES (4, N'Đại hội đại biểu', 3, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 23, 23, 10, 13, 1)
INSERT [dbo].[ThongTinDaiHoi] ([IdDaiHoi], [CongressType], [NumberOfVoters], [TotalDelegates], [DelegatesPresent], [DelegatesPresentOfficial], [OfficialDelegatesPresent], [DelegatesDisqualified], [OfficialDelegatesDisqualified], [DelegatesAbsent], [OfficialDelegatesAbsent], [DelegatesPresentDuringVoting], [OfficialDelegatesPresentDuringVoting], [SoPhieuPhatRa], [SoPhieuThuVao], [SoPhieuHopLe], [SoPhieuKhongHopLe], [KhuVuc]) VALUES (6, N'Đại hội đại biểu', 1, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 22, 22, 10, 12, 1)
GO
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (1, N'Nguyễn Văn', N'J', 1, 1, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (1, N'Nguyễn Văn', N'A', 1, 2, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (1, N'Nguyễn Văn', N'm', 1, 3, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (1, N'Nguyễn Văn', N'A', 1, 4, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (1, N'Nguyễn', N'A', 1, 6, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (1, N'Nguyễn Thị', N'K', 2, 1, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (1, N'Nguyễn Văn', N'A', 2, 2, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (2, N'Nguyễn Thu', N'K', 1, 1, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (2, N'Nguyễn Thị', N'B', 1, 2, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (2, N'Nguyễn Văn', N'B', 1, 4, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (2, N'Nguyễn', N'D', 1, 6, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (2, N'Nguyễn Văn', N'A', 2, 1, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (2, N'Nguyễn Thị', N'B', 2, 2, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (3, N'Nguyễn Tuấn', N'H', 1, 1, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (3, N'Nguyễn Văn', N'C', 1, 2, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (3, N'Nguyễn Văn', N'C', 1, 4, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (3, N'Nguyễn', N'Q', 1, 6, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (3, N'Nguyễn Thị', N'B', 2, 1, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (3, N'Nguyễn Văn', N'C', 2, 2, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (4, N'Nguyễn Văn', N'D', 1, 4, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (4, N'Nguyễn Văn', N'C', 2, 1, N'')
INSERT [dbo].[UngCuVien] ([ID], [Dem], [Ten], [KhuVuc], [IDDaiHoi], [GhiChu]) VALUES (5, N'Nguyễn Văn', N'E', 1, 4, N'')
GO
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (1, N'Hoàng Văn A', 1, 1, N'Trưởng ban')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (1, N'Nguyễn Văn L', 2, 1, N'Thư ký')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (1, N'Nguyễn Văn A', 2, 2, N'Trưởng ban')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (1, N'Nguyễn A', 4, 1, N'')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (1, N'Nguyễn r', 6, 1, N'Trưởng ban')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (2, N'Nguyễn Văn T', 1, 1, N'Thư ký')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (2, N'Nguyễn Văn O', 2, 1, N'')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (2, N'Nguyễn Thị E', 2, 2, N'Thư ký')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (2, N'Nguyễn B', 4, 1, N'Trưởng ban')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (2, N'Nguyễn B', 6, 1, N'Thư ký')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (3, N'Hoàng Văn N', 1, 1, N'')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (3, N'Nguyễn Thụ W', 2, 1, N'Trưởng ban')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (3, N'Nguyễn Văn G', 2, 2, N'')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (3, N'Nguyễn C', 4, 1, N'Thư ký')
INSERT [dbo].[UyVien] ([ID], [HoTenUyVien], [IDDaiHoi], [KhuVuc], [ChucVu]) VALUES (3, N'Nguyễn C', 6, 1, N'')
GO
ALTER TABLE [dbo].[DaiHoi]  WITH CHECK ADD  CONSTRAINT [FK_DaiHoi_KhuVuc] FOREIGN KEY([IDKhuVuc])
REFERENCES [dbo].[KhuVuc] ([ID])
GO
ALTER TABLE [dbo].[DaiHoi] CHECK CONSTRAINT [FK_DaiHoi_KhuVuc]
GO
ALTER TABLE [dbo].[PhieuBau]  WITH CHECK ADD  CONSTRAINT [FK_PhieuBau_DaiHoi1] FOREIGN KEY([IDDaiHoi], [KhuVuc])
REFERENCES [dbo].[DaiHoi] ([ID], [IDKhuVuc])
GO
ALTER TABLE [dbo].[PhieuBau] CHECK CONSTRAINT [FK_PhieuBau_DaiHoi1]
GO
ALTER TABLE [dbo].[UngCuVien]  WITH CHECK ADD  CONSTRAINT [FK_UngCuVien_DaiHoi1] FOREIGN KEY([IDDaiHoi], [KhuVuc])
REFERENCES [dbo].[DaiHoi] ([ID], [IDKhuVuc])
GO
ALTER TABLE [dbo].[UngCuVien] CHECK CONSTRAINT [FK_UngCuVien_DaiHoi1]
GO
ALTER TABLE [dbo].[UyVien]  WITH CHECK ADD  CONSTRAINT [FK_UyVien_DaiHoi] FOREIGN KEY([IDDaiHoi], [KhuVuc])
REFERENCES [dbo].[DaiHoi] ([ID], [IDKhuVuc])
GO
ALTER TABLE [dbo].[UyVien] CHECK CONSTRAINT [FK_UyVien_DaiHoi]
GO
USE [master]
GO
ALTER DATABASE [v2kp] SET  READ_WRITE 
GO
