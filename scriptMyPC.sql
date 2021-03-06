USE [master]
GO
/****** Object:  Database [MyPC]    Script Date: 22.03.2022 19:30:34 ******/
CREATE DATABASE [MyPC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyPC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\MyPC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyPC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\MyPC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyPC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyPC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyPC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyPC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyPC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyPC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyPC] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyPC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyPC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyPC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyPC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyPC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyPC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyPC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyPC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyPC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyPC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyPC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyPC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyPC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyPC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyPC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyPC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyPC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyPC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyPC] SET  MULTI_USER 
GO
ALTER DATABASE [MyPC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyPC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyPC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyPC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyPC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyPC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyPC] SET QUERY_STORE = OFF
GO
USE [MyPC]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[Patronymic] [nvarchar](100) NULL,
	[ContactData] [nvarchar](100) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnostics]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnostics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Problem] [int] NULL,
	[ID_Repair] [int] NULL,
 CONSTRAINT [PK_Diagnostics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[PassportSeries] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Master] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nchar](1000) NULL,
	[Description] [text] NULL,
	[Cost] [int] NULL,
	[ID_TypeMaterial] [int] NULL,
	[Photo] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problem]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repair]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateEvent] [date] NULL,
	[ID_Client] [int] NULL,
	[ID_Master] [int] NULL,
	[ID_TypeDevice] [int] NULL,
	[Information] [text] NULL,
 CONSTRAINT [PK_Repair] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeDevice]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeDevice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeD] [nvarchar](100) NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_TypeEN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeMaterial]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMaterial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeM] [nvarchar](100) NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_TypeMaterial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Work]    Script Date: 22.03.2022 19:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Repair] [int] NULL,
	[ID_Material] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Work] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (1, N'Абрамов', N'Станислав', N'Филатович', N'7(6545)478-87-79 ', 0.15)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (2, N'Александров', N'Станислав', N'Эдуардович', N'7(18)164-05-12 ', 0.15)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (3, N'Андреев', N'Станислав', N'Максович', N'7(02)993-91-28 ', 0.15)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (4, N'Андреева', N'Патрисия', N'Валерьевна', N'7(9648)953-81-26 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (5, N'Анисимова', N'Тамара', N'Витальевна', N'7(66)128-04-10 ', 0.05)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (6, N'Архипова', N'Прасковья', N'Валерьевна', N'7(86)540-10-21 ', 0.05)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (7, N'Белозёрова', N'Диана', N'Антоновна', N'7(9900)174-59-87 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (8, N'Беляева', N'Сабрина', N'Федосеевна', N'7(6580)534-32-58 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (9, N'Бирюкова', N'Инара', N'Улебовна', N'7(098)346-50-58 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (10, N'Блинов', N'Евгений', N'Мэлсович', N'7(0852)321-82-64 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (11, N'Блохин', N'Пантелеймон', N'Феликсович', N'7(9524)556-48-98 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (12, N'Большаков', N'Вадим', N'Данилович', N'7(386)641-13-37 ', 0.05)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (13, N'Быкова', N'Тала', N'Георгьевна', N'7(13)915-53-53 ', 0.05)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (14, N'Васильев', N'Оскар', N'Богданович', N'7(585)801-94-29 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (15, N'Волков', N'Людвиг', N'Витальевич', N'7(8459)592-05-58 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (16, N'Воронова', N'Изабелла', N'Вячеславовна', N'7(17)433-44-98 ', 0.25)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (17, N'Галкин', N'Эрик', N'Онисимович', N'7(759)873-77-39 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (18, N'Голубев', N'Иосиф', N'Тимофеевич', N'7(78)972-73-11 ', 0.05)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (19, N'Горбачёва', N'Никки', N'Еремеевна', N'7(94)789-69-20 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (20, N'Горшкова', N'Марта', N'Иосифовна', N'7(544)650-59-03', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (21, N'Гусева', N'Роза', N'Дмитриевна', N'7(23)064-51-84 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (22, N'Дементьева', N'Эдита', N'Онисимовна', N'7(198)922-28-76 ', 0.1)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (23, N'Дмитриева', N'Элина', N'Даниловна', N'7(787)140-48-84 ', 0.05)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (24, N'Дроздов', N'Вольдемар', N'Артемович', N'7(307)456-99-05 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (25, N'Ершов', N'Глеб', N'Федорович', N'7(2608)298-40-82 ', 0.25)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (26, N'Ефимова', N'Магда', N'Платоновна', N'7(9261)386-15-92 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (27, N'Ефремов', N'Витольд', N'Авксентьевич', N'7(93)922-14-03 ', 0.1)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (28, N'Игнатов', N'Захар', N'Павлович', N'7(578)574-73-36 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (29, N'Калашников', N'Артур', N'Юрьевич', N'7(147)947-47-21 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (30, N'Киселёв', N'Устин', N'Яковлевич', N'7(83)334-52-76 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (31, N'Колобов', N'Орест', N'Юлианович', N'7(1680)508-58-26 ', 0.15)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (32, N'Копылов', N'Касьян', N'Робертович', N'7(5774)679-82-06 ', 0.15)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (33, N'Крюков', N'Наум', N'Ильяович', N'7(81)657-88-92 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (34, N'Крюкова', N'Авигея', N'Святославовна', N'7(499)318-88-53 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (35, N'Кудряшов', N'Аверкий', N'Константинович', N'7(88)732-96-30 ', 0.15)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (36, N'Кузьмин', N'Леонтий', N'Валерьянович', N'7(1340)148-90-68 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (37, N'Кузьмина', N'Дэнна', N'Витальевна', N'7(9940)977-45-73 ', 0.15)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (38, N'Лазарев', N'Алексей', N'Богданович', N'7(0055)737-37-48 ', 0.1)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (39, N'Медведев', N'Святослав', N'Юлианович', N'7(3520)435-21-20 ', 0.1)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (40, N'Мишина', N'Иветта', N'Андреевна', N'7(3926)244-81-96 ', 0.1)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (41, N'Морозов', N'Наум', N'Валерьянович', N'7(636)050-96-13 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (42, N'Некрасов', N'Варлам', N'Михайлович', N'7(019)258-06-35 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (43, N'Новиков', N'Адриан', N'Аркадьевич', N'7(70)572-33-62 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (44, N'Овчинникова', N'Лаура', N'Еремеевна', N'7(85)829-33-79 ', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (45, N'Орлова', N'Влада', N'Мартыновна', N'7(2506)433-38-35 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (46, N'Попова', N'Харита', N'Якуновна', N'7(335)386-81-06 ', 0.05)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (47, N'Смирнов', N'Мартын', N'Арсеньевич', N'7(6251)589-02-43 ', 0.15)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (48, N'Суворова', N'Божена', N'Анатольевна', N'7(347)895-86-57 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (49, N'Федотов', N'Осип', N'Анатольевич', N'7(590)702-33-06 ', 0)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (50, N'Филатов', N'Аристарх', N'Дмитриевич', N'7(696)235-29-24 ', 0.25)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (52, N'Бабич', N'Никита', N'Андреевич', N'898675667', 0.2)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [ContactData], [Discount]) VALUES (61, N'Волков', N'Данил', N'Андреевич', N'8888888', 0)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Diagnostics] ON 

INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (1, 4, 1)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (2, 3, 2)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (3, 6, 2)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (4, 4, 2)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (5, 3, 3)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (6, 2, 3)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (7, 5, 3)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (8, 4, 3)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (9, 1, 4)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (10, 5, 5)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (11, 4, 6)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (12, 5, 6)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (13, 2, 7)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (14, 2, 7)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (15, 3, 7)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (16, 5, 7)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (17, 4, 7)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (18, 3, 8)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (19, 1, 8)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (20, 4, 8)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (21, 2, 8)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (22, 1, 9)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (23, 1, 10)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (24, 5, 10)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (25, 4, 10)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (26, 3, 10)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (27, 2, 10)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (28, 6, 10)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (29, 2, 11)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (30, 1, 11)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (31, 3, 11)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (32, 5, 11)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (33, 1, 12)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (34, 2, 12)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (35, 1, 13)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (36, 3, 14)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (37, 1, 14)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (38, 2, 14)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (39, 6, 14)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (40, 4, 14)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (41, 1, 15)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (42, 5, 15)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (43, 5, 16)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (44, 3, 17)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (45, 5, 18)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (46, 4, 18)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (47, 3, 20)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (48, 4, 21)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (49, 6, 22)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (50, 5, 23)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (51, 6, 23)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (52, 4, 23)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (53, 4, 24)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (54, 5, 24)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (55, 1, 24)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (56, 1, 25)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (57, 4, 25)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (58, 3, 26)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (59, 6, 26)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (60, 4, 28)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (61, 2, 29)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (62, 1, 29)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (63, 4, 29)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (64, 6, 29)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (65, 6, 30)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (66, 1, 30)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (67, 3, 30)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (68, 3, 31)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (69, 1, 31)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (70, 2, 31)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (71, 4, 31)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (72, 6, 31)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (73, 1, 32)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (74, 6, 32)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (75, 5, 32)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (76, 2, 34)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (77, 3, 34)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (78, 1, 35)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (79, 5, 35)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (80, 2, 35)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (81, 6, 36)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (82, 5, 37)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (83, 3, 38)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (84, 6, 39)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (85, 1, 39)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (86, 5, 39)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (87, 3, 40)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (88, 4, 40)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (89, 3, 41)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (90, 5, 41)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (91, 2, 41)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (92, 2, 41)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (93, 6, 42)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (94, 3, 43)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (95, 1, 44)
INSERT [dbo].[Diagnostics] ([ID], [ID_Problem], [ID_Repair]) VALUES (96, 6, 44)
SET IDENTITY_INSERT [dbo].[Diagnostics] OFF
GO
SET IDENTITY_INSERT [dbo].[Master] ON 

INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (1, N'Волков', N'Людвиг', N'Витальевич', N'6377 054513', CAST(N'1999-06-20' AS Date), N'АДЫГЕЯ РЕСП, МАЙКОП Г, КРАСНООКТЯБРЬСКАЯ УЛ, 21', N'7(20)554-28-68 ')
INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (2, N'Баранова', N'Эльмира', N'Дмитриевна', N'8772 435144', CAST(N'2002-10-05' AS Date), N'АДЫГЕЯ РЕСП, МАЙКОП Г, КРЕСТЬЯНСКАЯ УЛ, 236', N'7(3926)244-81-96 ')
INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (3, N'Андреева', N'Патрисия', N'Валерьевна', N'2986 829076', CAST(N'1981-03-09' AS Date), N'АДЫГЕЯ РЕСП, МАЙКОП Г, ПРИВОКЗАЛЬНАЯ УЛ, 106', N'7(347)895-86-57 ')
INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (4, N'Блинов', N'Евгений', N'Мэлсович', N'8980 979112', CAST(N'1996-07-04' AS Date), N'АДЫГЕЯ РЕСП, МАЙКОП Г, ПРОЛЕТАРСКАЯ УЛ, 269', N'7(3168)043-63-31 ')
INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (5, N'Бобров', N'Агафон', N'Лаврентьевич', N'3666 200836', CAST(N'1996-03-29' AS Date), N'АДЫГЕЯ РЕСП, МАЙКОП Г, ЮННАТОВ УЛ, 9', N'7(93)546-43-73 ')
INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (6, N'Васильев', N'Оскар', N'Богданович', N'3037 183311', CAST(N'1991-04-13' AS Date), N'АЛТАЙ РЕСП, ШЕБАЛИНСКИЙ Р-Н, ШЕБАЛИНО С, СОВЕТСКАЯ УЛ, 19', N'7(764)282-55-22 ')
INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (7, N'Устинова', N'Юнона', N'Валентиновна', N'9495 889773', CAST(N'1988-06-16' AS Date), N'АЛТАЙ РЕСП, ГОРНО-АЛТАЙСК Г, КОМСОМОЛЬСКАЯ УЛ, 9', N'7(66)128-04-10 ')
INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (8, N'Беляева', N'Сабрина', N'Федосеевна', N'7046 713144', CAST(N'1972-07-13' AS Date), N'АЛТАЙ РЕСП, ГОРНО-АЛТАЙСК Г, СЕВЕРНАЯ УЛ, 6', N'7(6419)959-21-87 ')
INSERT [dbo].[Master] ([ID], [LastName], [FirstName], [Patronymic], [PassportSeries], [BirthDate], [Address], [Phone]) VALUES (9, N'Дроздов', N'Вольдемар', N'Артемович', N'3946 315947', CAST(N'1990-06-26' AS Date), N'АЛТАЙ РЕСП, ГОРНО-АЛТАЙСК Г, ЧОРОС-ГУРКИНА Г.И. УЛ, 29', N'7(2506)433-38-35 ')
SET IDENTITY_INSERT [dbo].[Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (1, N'Монитор AOC Value Line 27B2H/EU 27", черный                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'', 14380, 8, N'/Resources\01.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (2, N'Монитор Acer SB271bi 27", черный [um.hs1ee.002]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'', 18290, 8, N'/Resources\02.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (3, N'Монитор игровой Samsung C27G54TQWI 27" черный [lc27g54tqwixci]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'', 23990, 8, N'/Resources\03.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (4, N'Монитор LG 27MK430H-B 27", черный [27mk430h-b.aruz]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', N'', 13900, 8, N'/Resources\04.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (5, N'Монитор Acer SA270Abi 27", черный [um.hs0ee.a01]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'', 15770, 8, N'/Resources\05.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (6, N'Монитор игровой LG UltraGear 24GN650-B 23.8" черный [24gn650-b.aruz]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'', 17490, 8, N'/Resources\06.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (7, N'Монитор игровой MSI Optix G241 23.8" черный [9s6-3ba41t-017]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'', 17490, 8, N'/Resources\07.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (8, N'Монитор игровой BenQ Zowie XL2411P 24" серый [9h.lgplb.qpe]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'', 19290, 8, N'/Resources\08.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (9, N'Жесткий диск WD Caviar Blue WD10EZEX, 1ТБ, HDD, SATA III, 3.5"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'', 3190, 6, N'/Resources\09.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (10, N'Жесткий диск Toshiba P300 HDWD110UZSVA, 1ТБ, HDD, SATA III, 3.5"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'', 2990, 6, N'/Resources\10.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (11, N'Жесткий диск WD Blue WD20EZBX, 2ТБ, HDD, SATA III, 3.5"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'', 4390, 6, N'/Resources\11.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (12, N'SSD накопитель Kingston A400 SA400S37/240G 240ГБ, 2.5", SATA III                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'', 2690, 1, N'/Resources\12.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (13, N'SSD накопитель Crucial BX500 CT240BX500SSD1 240ГБ, 2.5", SATA III                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'', 2890, 1, N'/Resources\13.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (14, N'SSD накопитель A-Data Ultimate SU650 ASU650SS-120GT-R 120ГБ, 2.5", SATA III                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'', 1690, 1, N'/Resources\14.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (15, N'Внешний диск HDD Toshiba Canvio Basics HDTB410EK3AA, 1ТБ, черный                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'', 3490, 5, N'/Resources\15.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (16, N'Внешний диск HDD Toshiba Canvio Basics HDTB420EK3AA, 2ТБ, черный                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'', 4890, 5, N'/Resources\16.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (17, N'Внешний диск HDD WD Elements Portable WDBUZG0010BBK-WESN, 1ТБ, черный                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'', 3790, 5, N'/Resources\17.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (18, N'Колонки Oklick OK-331, 2.0, черный [440404]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'', 390, 2, N'/Resources\18.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (19, N'Колонки Sven 248, 2.0, черный [sv-016333]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'', 849, 2, N'/Resources\19.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (20, N'Колонки Sven 120, 2.0, черный [sv-013493]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'', 490, 2, N'/Resources\20.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (21, N'Процессор AMD Ryzen 5 3600, SocketAM4, OEM [100-000000031]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'', 19590, 13, N'/Resources\21.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (22, N'Процессор Intel Core i3 10100F, LGA 1200, BOX [bx8070110100f s rh8u]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'', 7090, 13, N'/Resources\22.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (23, N'Процессор Intel Core i5 10400F, LGA 1200, BOX [bx8070110400f s rh3d]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'', 11990, 13, N'/Resources\23.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (24, N'Процессор Intel Core i3 10100F, LGA 1200, OEM [cm8070104291318s rh8u]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'', 6690, 13, N'/Resources\24.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (25, N'Материнская плата ASUS PRIME H510M-K, LGA 1200, Intel H510, mATX, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'', 5690, 7, N'/Resources\25.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (26, N'Материнская плата ASROCK A320M-DVS R4.0, SocketAM4, AMD A320, mATX, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'', 3490, 7, N'/Resources\26.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (27, N'Материнская плата GIGABYTE B450M S2H, SocketAM4, AMD B450, mATX, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'', 4190, 7, N'/Resources\27.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (28, N'Материнская плата GIGABYTE H410M S2H V3, LGA 1200, Intel H510, mATX, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'', 5250, 7, N'/Resources\28.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (29, N'Модуль памяти Crucial CT8G4DFRA266 DDR4 - 8ГБ 2666, DIMM, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'', 2890, 9, N'/Resources\29.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (30, N'Модуль памяти Patriot Signature PSD48G266681 DDR4 - 8ГБ 2666, DIMM, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'', 2490, 9, N'/Resources\30.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (31, N'Модуль памяти AMD Radeon R7 Performance Series R748G2606U2S-UO DDR4 - 8ГБ 2666, DIMM, OEM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'', 2490, 9, N'/Resources\31.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (32, N'Модуль памяти Kingston VALUERAM KVR26N19S8/8 DDR4 - 8ГБ 2666, DIMM, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'', 2890, 9, N'/Resources\32.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (33, N'Модуль памяти Patriot PSD38G16002 DDR3 - 8ГБ 1600, DIMM, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'', 2490, 9, N'/Resources\33.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (34, N'Модуль памяти AMD R538G1601S2S-UO DDR3 - 8ГБ 1600, SO-DIMM, OEM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'', 2490, 9, N'/Resources\34.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (35, N'Видеокарта DELL AMD Radeon Pro WX3200, 490-BFQR, 4ГБ, GDDR5, oem                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'', 17490, 4, N'/Resources\35.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (36, N'Видеокарта Palit NVIDIA GeForce GTX 1050TI, PA-GTX1050Ti StormX 4G, 4ГБ, GDDR5, Ret [ne5105t018g1-1070f]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'', 22990, 4, N'/Resources\36.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (37, N'Видеокарта GIGABYTE NVIDIA GeForce GTX 1650, GV-N1650OC-4GD, 4ГБ, GDDR5, OC, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'', 25990, 4, N'/Resources\37.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (38, N'Видеокарта Palit NVIDIA GeForce GTX 1650, PA-GTX1650 GP 4G D6, 4ГБ, GDDR6, Ret [ne6165001bg1-1175a]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', N'', 26990, 4, N'/Resources\38.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (39, N'Видеокарта GIGABYTE NVIDIA GeForce GTX 1650, GV-N1656WF2OC-4GD, 4ГБ, GDDR6, OC, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', N'', 32590, 4, N'/Resources\39.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (40, N'Видеокарта GIGABYTE AMD Radeon RX 6500XT, GV-R65XTGAMING OC-4GD, 4ГБ, GDDR6, OC, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'', 35990, 4, N'/Resources\40.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (41, N'Видеокарта Palit NVIDIA GeForce GTX 1660, PA-GTX1660 DUAL 6G, 6ГБ, GDDR5, Bulk [ne51660018j9-1161c bulk]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'', 44590, 4, N'/Resources\41.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (42, N'Блок питания Aerocool VX PLUS 500W, 500Вт, 120мм, черный, retail [vx-500 plus]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'', 2180, 3, N'/Resources\42.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (43, N'Блок питания Aerocool VX PLUS 600W, 600Вт, 120мм, черный, retail [vx-600 plus]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'', 2520, 3, N'/Resources\43.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (44, N'Блок питания Aerocool VX PLUS, 350Вт, 120мм, черный, retail [vx-350 plus 350w]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'', 1450, 3, N'/Resources\44.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (45, N'Вентилятор GlacialTech GT ICE 4, 40мм, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'', 160, 10, N'/Resources\45.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (46, N'Вентилятор DeepCool XFAN 70, 70мм, Bulk                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'', 240, 10, N'/Resources\46.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (47, N'Устройство охлаждения(кулер) DeepCool CK-11508 PWM, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'', 360, 10, N'/Resources\47.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (48, N'Вентилятор Aerocool Frost 12 PWM, 120мм, Ret                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'', 480, 10, N'/Resources\48.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (49, N'Клавиатура Logitech K380 Multi-Device, беспроводная, белый [920-009589]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'', 3299, 12, N'/Resources\49.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (50, N'Клавиатура Oklick 719G COVEN, USB, c подставкой для запястий, черный [1465485]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'', 870, 12, N'/Resources\50.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (51, N'Клавиатура A4TECH Fstyler FBK25, USB, Bluetooth/Радиоканал, черный серый [fbk25 black]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'', 1590, 12, N'/Resources\51.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (52, N'Клавиатура Oklick 400MR, USB, черный [1070512]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'', 690, 12, N'/Resources\52.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (53, N'Клавиатура Razer Tartarus Pro Mercury, USB, c подставкой для запястий, без русского алфавита, белый [rz07-03110200-r3m1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'', 9999, 12, N'/Resources\53.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (54, N'Мышь Logitech Pebble M350, оптическая, беспроводная, USB, белый [910-005716]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'', 1699, 12, N'/Resources\54.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (55, N'Мышь Defender Sky Dragon GM-090L, игровая, оптическая, проводная, USB, черный [52090]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'', 439, 12, N'/Resources\55.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (56, N'Мышь A4TECH Bloody P81s, игровая, оптическая, проводная, USB, черный [p81s curve activated]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'', 1390, 12, N'/Resources\56.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (57, N'Мышь A4TECH Fstyler FG35, оптическая, беспроводная, USB, серебристый и белый                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'', 790, 12, N'/Resources\57.jpg')
INSERT [dbo].[Material] ([ID], [Title], [Description], [Cost], [ID_TypeMaterial], [Photo]) VALUES (58, N'Мышь Microsoft Precision, оптическая, беспроводная, черный [ghv-00013]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'', 5190, 12, N'/Resources\58.jpg')
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Problem] ON 

INSERT [dbo].[Problem] ([ID], [Title], [Description]) VALUES (1, N'Неисправность блока питания', N'')
INSERT [dbo].[Problem] ([ID], [Title], [Description]) VALUES (2, N'Неисправность видеокарты', N'')
INSERT [dbo].[Problem] ([ID], [Title], [Description]) VALUES (3, N'Неисправность монитора', N'')
INSERT [dbo].[Problem] ([ID], [Title], [Description]) VALUES (4, N'Неисправность ЦП', N'')
INSERT [dbo].[Problem] ([ID], [Title], [Description]) VALUES (5, N'Поломка материнской платы', N'')
INSERT [dbo].[Problem] ([ID], [Title], [Description]) VALUES (6, N'Поломка переферии', N'')
SET IDENTITY_INSERT [dbo].[Problem] OFF
GO
SET IDENTITY_INSERT [dbo].[Repair] ON 

INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (1, CAST(N'2021-01-07' AS Date), 33, 6, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (2, CAST(N'2021-01-08' AS Date), 23, 6, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (3, CAST(N'2021-01-16' AS Date), 24, 8, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (4, CAST(N'2021-01-21' AS Date), 38, 3, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (5, CAST(N'2021-02-01' AS Date), 38, 3, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (6, CAST(N'2021-02-06' AS Date), 3, 3, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (7, CAST(N'2021-02-11' AS Date), 45, 6, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (8, CAST(N'2021-02-17' AS Date), 44, 4, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (9, CAST(N'2021-02-18' AS Date), 11, 1, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (10, CAST(N'2021-02-26' AS Date), 46, 6, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (11, CAST(N'2021-03-04' AS Date), 31, 6, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (12, CAST(N'2021-03-08' AS Date), 22, 8, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (13, CAST(N'2021-03-10' AS Date), 12, 8, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (14, CAST(N'2021-03-14' AS Date), 20, 3, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (15, CAST(N'2021-03-25' AS Date), 37, 2, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (16, CAST(N'2021-04-03' AS Date), 4, 6, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (17, CAST(N'2021-04-15' AS Date), 49, 5, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (18, CAST(N'2021-04-29' AS Date), 35, 9, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (19, CAST(N'2021-05-14' AS Date), 25, 7, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (20, CAST(N'2021-05-23' AS Date), 37, 8, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (21, CAST(N'2021-06-01' AS Date), 50, 3, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (22, CAST(N'2021-06-06' AS Date), 39, 7, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (23, CAST(N'2021-06-13' AS Date), 13, 5, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (24, CAST(N'2021-06-18' AS Date), 45, 8, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (25, CAST(N'2021-06-21' AS Date), 41, 9, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (26, CAST(N'2021-06-24' AS Date), 41, 4, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (27, CAST(N'2021-06-29' AS Date), 5, 7, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (28, CAST(N'2021-07-03' AS Date), 45, 7, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (29, CAST(N'2021-08-01' AS Date), 29, 9, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (30, CAST(N'2021-08-06' AS Date), 5, 6, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (31, CAST(N'2021-08-07' AS Date), 29, 3, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (32, CAST(N'2021-08-19' AS Date), 45, 8, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (33, CAST(N'2021-08-24' AS Date), 26, 8, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (34, CAST(N'2021-08-31' AS Date), 7, 3, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (35, CAST(N'2021-09-13' AS Date), 46, 4, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (36, CAST(N'2021-09-23' AS Date), 5, 7, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (37, CAST(N'2021-11-01' AS Date), 31, 9, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (38, CAST(N'2021-11-15' AS Date), 27, 1, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (39, CAST(N'2021-12-05' AS Date), 46, 1, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (40, CAST(N'2022-01-10' AS Date), 7, 7, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (41, CAST(N'2022-01-13' AS Date), 49, 4, 3, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (42, CAST(N'2022-01-13' AS Date), 12, 4, 4, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (43, CAST(N'2022-01-19' AS Date), 49, 5, 2, N'')
INSERT [dbo].[Repair] ([ID], [DateEvent], [ID_Client], [ID_Master], [ID_TypeDevice], [Information]) VALUES (44, CAST(N'2022-01-30' AS Date), 38, 9, 3, N'')
SET IDENTITY_INSERT [dbo].[Repair] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeDevice] ON 

INSERT [dbo].[TypeDevice] ([ID], [TypeD], [Description]) VALUES (1, N'Сервер', N'')
INSERT [dbo].[TypeDevice] ([ID], [TypeD], [Description]) VALUES (2, N'Домашний ПК', N'')
INSERT [dbo].[TypeDevice] ([ID], [TypeD], [Description]) VALUES (3, N'Офисный ПК', N'')
INSERT [dbo].[TypeDevice] ([ID], [TypeD], [Description]) VALUES (4, N'Ноутбук', N'')
INSERT [dbo].[TypeDevice] ([ID], [TypeD], [Description]) VALUES (5, N'Планшет', N'')
SET IDENTITY_INSERT [dbo].[TypeDevice] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeMaterial] ON 

INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (1, N'SSD накопитель', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (2, N'Аудио переферия', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (3, N'Блок питания', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (4, N'Видеокарта', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (5, N'Внешний жесткий диск', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (6, N'Жесткий диск', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (7, N'Материнская плата', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (8, N'Монитор', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (9, N'Оперативная память', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (10, N'Охлаждение', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (11, N'Привод', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (12, N'Манипуляторы и устройства ввода', N'')
INSERT [dbo].[TypeMaterial] ([ID], [TypeM], [Description]) VALUES (13, N'Центральный процессор (CPU)', N'')
SET IDENTITY_INSERT [dbo].[TypeMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[Work] ON 

INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (1, 1, 56, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (2, 2, 31, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (3, 2, 47, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (4, 3, 31, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (5, 4, 34, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (6, 5, 39, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (7, 5, 31, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (8, 6, 5, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (9, 7, 4, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (10, 7, 6, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (11, 8, 58, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (12, 9, 41, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (13, 9, 15, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (14, 9, 23, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (15, 9, 53, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (16, 10, 32, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (17, 10, 58, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (18, 10, 38, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (19, 10, 52, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (20, 10, 42, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (21, 11, 34, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (22, 12, 2, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (23, 12, 12, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (24, 13, 17, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (25, 14, 36, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (26, 14, 58, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (27, 15, 34, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (28, 15, 31, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (29, 16, 40, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (30, 17, 31, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (31, 17, 1, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (32, 17, 38, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (33, 17, 54, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (34, 18, 47, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (35, 18, 15, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (36, 19, 58, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (37, 19, 29, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (38, 19, 41, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (39, 20, 12, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (40, 20, 48, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (41, 20, 32, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (42, 20, 5, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (43, 21, 25, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (44, 21, 31, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (45, 21, 48, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (46, 21, 14, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (47, 21, 42, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (48, 21, 27, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (49, 22, 29, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (50, 23, 2, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (51, 23, 46, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (52, 23, 40, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (53, 24, 11, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (54, 24, 31, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (55, 25, 32, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (56, 25, 1, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (57, 27, 34, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (58, 27, 42, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (59, 27, 2, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (60, 28, 15, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (61, 29, 44, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (62, 29, 29, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (63, 29, 32, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (64, 30, 20, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (65, 30, 35, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (66, 30, 16, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (67, 30, 13, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (68, 31, 39, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (69, 31, 40, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (70, 31, 53, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (71, 31, 15, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (72, 32, 12, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (73, 32, 56, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (74, 34, 51, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (75, 35, 25, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (76, 35, 43, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (77, 36, 6, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (78, 36, 4, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (79, 36, 26, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (80, 36, 7, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (81, 36, 22, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (82, 36, 1, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (83, 37, 7, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (84, 37, 9, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (85, 37, 39, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (86, 39, 23, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (87, 39, 35, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (88, 39, 2, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (89, 39, 31, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (90, 40, 39, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (91, 40, 58, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (92, 40, 38, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (93, 40, 4, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (94, 41, 28, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (95, 42, 5, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (96, 43, 42, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (97, 44, 24, 2)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (98, 44, 7, 1)
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (99, 44, 50, 2)
GO
INSERT [dbo].[Work] ([ID], [ID_Repair], [ID_Material], [Quantity]) VALUES (100, 44, 31, 1)
SET IDENTITY_INSERT [dbo].[Work] OFF
GO
ALTER TABLE [dbo].[Diagnostics]  WITH CHECK ADD  CONSTRAINT [FK_Diagnostics_Problem] FOREIGN KEY([ID_Problem])
REFERENCES [dbo].[Problem] ([ID])
GO
ALTER TABLE [dbo].[Diagnostics] CHECK CONSTRAINT [FK_Diagnostics_Problem]
GO
ALTER TABLE [dbo].[Diagnostics]  WITH CHECK ADD  CONSTRAINT [FK_Diagnostics_Repair] FOREIGN KEY([ID_Repair])
REFERENCES [dbo].[Repair] ([ID])
GO
ALTER TABLE [dbo].[Diagnostics] CHECK CONSTRAINT [FK_Diagnostics_Repair]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_TypeMaterial] FOREIGN KEY([ID_TypeMaterial])
REFERENCES [dbo].[TypeMaterial] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_TypeMaterial]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Client] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Client]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Master] FOREIGN KEY([ID_Master])
REFERENCES [dbo].[Master] ([ID])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Master]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_TypeDevice] FOREIGN KEY([ID_TypeDevice])
REFERENCES [dbo].[TypeDevice] ([ID])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_TypeDevice]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Material] FOREIGN KEY([ID_Material])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Material]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Repair1] FOREIGN KEY([ID_Repair])
REFERENCES [dbo].[Repair] ([ID])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Repair1]
GO
USE [master]
GO
ALTER DATABASE [MyPC] SET  READ_WRITE 
GO
