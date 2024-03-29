USE [master]
GO
/****** Object:  Database [user56]    Script Date: 17.03.2024 21:10:09 ******/
CREATE DATABASE [user56]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user56', FILENAME = N'D:\Programms\Management Studio\MSSQL15.MSSQLSERVER\MSSQL\DATA\user56.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user56_log', FILENAME = N'D:\Programms\Management Studio\MSSQL15.MSSQLSERVER\MSSQL\DATA\user56_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [user56] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user56].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user56] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user56] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user56] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user56] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user56] SET ARITHABORT OFF 
GO
ALTER DATABASE [user56] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [user56] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user56] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user56] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user56] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user56] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user56] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user56] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user56] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user56] SET  DISABLE_BROKER 
GO
ALTER DATABASE [user56] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user56] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user56] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user56] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user56] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user56] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user56] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user56] SET RECOVERY FULL 
GO
ALTER DATABASE [user56] SET  MULTI_USER 
GO
ALTER DATABASE [user56] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user56] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user56] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user56] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user56] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user56] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'user56', N'ON'
GO
ALTER DATABASE [user56] SET QUERY_STORE = OFF
GO
USE [user56]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 17.03.2024 21:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id_clients] [int] IDENTITY(1,1) NOT NULL,
	[fam] [nvarchar](50) NULL,
	[im] [nvarchar](50) NULL,
	[otch] [nvarchar](50) NULL,
	[seriya] [nvarchar](50) NULL,
	[nomer] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_clients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marshryti]    Script Date: 17.03.2024 21:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marshryti](
	[id_marshryti] [int] IDENTITY(1,1) NOT NULL,
	[id_clienta] [int] NULL,
	[strana] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marshryti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 17.03.2024 21:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Clients.fam, dbo.Clients.im, dbo.Clients.otch, dbo.Marshryti.strana
FROM            dbo.Clients INNER JOIN
                         dbo.Marshryti ON dbo.Clients.id_clients = dbo.Marshryti.id_clienta
WHERE        (dbo.Clients.fam = N'Сабиров')
GO
/****** Object:  View [dbo].[View_2]    Script Date: 17.03.2024 21:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.Clients.fam, dbo.Clients.im, dbo.Clients.otch, dbo.Marshryti.strana
FROM            dbo.Clients INNER JOIN
                         dbo.Marshryti ON dbo.Clients.id_clients = dbo.Marshryti.id_clienta
WHERE        (dbo.Marshryti.strana = N'Россия')
GO
/****** Object:  Table [dbo].[Poezdki]    Script Date: 17.03.2024 21:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poezdki](
	[id_poezdki] [int] IDENTITY(1,1) NOT NULL,
	[id_clienta] [int] NULL,
	[tsel] [nvarchar](50) NULL,
	[oneday_cost] [money] NULL,
	[transport_cost] [money] NULL,
	[viza_cost] [money] NULL,
	[date_start] [date] NULL,
	[kolvo_dney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_poezdki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Marshryti]  WITH CHECK ADD FOREIGN KEY([id_clienta])
REFERENCES [dbo].[Clients] ([id_clients])
GO
ALTER TABLE [dbo].[Poezdki]  WITH CHECK ADD FOREIGN KEY([id_clienta])
REFERENCES [dbo].[Clients] ([id_clients])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Clients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Marshryti"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 119
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Clients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Marshryti"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 119
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
USE [master]
GO
ALTER DATABASE [user56] SET  READ_WRITE 
GO
