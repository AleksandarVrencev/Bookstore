USE [master]
GO
/****** Object:  Database [KnjizaraDB]    Script Date: 4/26/2019 1:13:45 AM ******/
CREATE DATABASE [KnjizaraDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KnjizaraDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.JELENASQL\MSSQL\DATA\KnjizaraDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KnjizaraDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.JELENASQL\MSSQL\DATA\KnjizaraDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KnjizaraDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KnjizaraDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KnjizaraDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KnjizaraDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KnjizaraDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KnjizaraDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KnjizaraDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KnjizaraDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KnjizaraDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KnjizaraDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KnjizaraDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KnjizaraDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KnjizaraDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KnjizaraDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KnjizaraDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KnjizaraDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KnjizaraDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KnjizaraDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KnjizaraDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KnjizaraDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KnjizaraDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KnjizaraDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KnjizaraDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KnjizaraDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KnjizaraDB] SET RECOVERY FULL 
GO
ALTER DATABASE [KnjizaraDB] SET  MULTI_USER 
GO
ALTER DATABASE [KnjizaraDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KnjizaraDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KnjizaraDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KnjizaraDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KnjizaraDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KnjizaraDB', N'ON'
GO
ALTER DATABASE [KnjizaraDB] SET QUERY_STORE = OFF
GO
USE [KnjizaraDB]
GO
/****** Object:  Table [dbo].[Autori]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autori](
	[id_autora] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Autori] PRIMARY KEY CLUSTERED 
(
	[id_autora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Knjige]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Knjige](
	[id_knjige] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[id_autora] [int] NOT NULL,
	[slika] [nvarchar](100) NULL,
	[opis] [nvarchar](max) NULL,
	[cena] [int] NOT NULL,
 CONSTRAINT [PK_Knjige] PRIMARY KEY CLUSTERED 
(
	[id_knjige] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Knjige_Zanr]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Knjige_Zanr](
	[id_knjiga_zanr] [int] IDENTITY(1,1) NOT NULL,
	[id_knjige] [int] NULL,
	[id_zanr] [int] NULL,
 CONSTRAINT [PK_Knjige_Zanr] PRIMARY KEY CLUSTERED 
(
	[id_knjiga_zanr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[id_osoba] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NULL,
	[prezime] [nvarchar](50) NULL,
	[pol] [nvarchar](50) NULL,
	[telefon] [nvarchar](50) NULL,
	[id_vrsta_korisnika] [int] NULL,
	[email] [nvarchar](50) NULL,
	[korisnicko_ime] [nvarchar](50) NULL,
	[lozinka] [nvarchar](50) NULL,
 CONSTRAINT [PK_Osoba] PRIMARY KEY CLUSTERED 
(
	[id_osoba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Narudzbina]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Narudzbina](
	[id_narudzbine] [int] IDENTITY(1,1) NOT NULL,
	[id_osoba] [int] NOT NULL,
	[datum] [datetime] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Narudzbina] PRIMARY KEY CLUSTERED 
(
	[id_narudzbine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Narudzbina_Knjiga]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Narudzbina_Knjiga](
	[id_narudzbina_knjiga] [int] IDENTITY(1,1) NOT NULL,
	[id_narudzbine] [int] NOT NULL,
	[id_knjige] [int] NOT NULL,
	[kolicina] [int] NOT NULL,
 CONSTRAINT [PK_Narudzbina_Knjiga] PRIMARY KEY CLUSTERED 
(
	[id_narudzbina_knjiga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Omiljeno]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Omiljeno](
	[id_omiljeno] [int] IDENTITY(1,1) NOT NULL,
	[id_osoba] [int] NULL,
	[id_knjige] [int] NULL,
 CONSTRAINT [PK_Omiljeno] PRIMARY KEY CLUSTERED 
(
	[id_omiljeno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrstaKorisnika]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaKorisnika](
	[id_vrsta_korisnika] [int] IDENTITY(1,1) NOT NULL,
	[vrsta] [nvarchar](50) NULL,
 CONSTRAINT [PK_VrstaOsobe] PRIMARY KEY CLUSTERED 
(
	[id_vrsta_korisnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zanr]    Script Date: 4/26/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zanr](
	[id_zanr] [int] IDENTITY(1,1) NOT NULL,
	[vrsta] [nvarchar](50) NULL,
 CONSTRAINT [PK_Zanr] PRIMARY KEY CLUSTERED 
(
	[id_zanr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Knjige]  WITH CHECK ADD  CONSTRAINT [FK_Knjige_Autori] FOREIGN KEY([id_autora])
REFERENCES [dbo].[Autori] ([id_autora])
GO
ALTER TABLE [dbo].[Knjige] CHECK CONSTRAINT [FK_Knjige_Autori]
GO
ALTER TABLE [dbo].[Knjige_Zanr]  WITH CHECK ADD  CONSTRAINT [FK_Knjige_Zanr_Knjige] FOREIGN KEY([id_knjige])
REFERENCES [dbo].[Knjige] ([id_knjige])
GO
ALTER TABLE [dbo].[Knjige_Zanr] CHECK CONSTRAINT [FK_Knjige_Zanr_Knjige]
GO
ALTER TABLE [dbo].[Knjige_Zanr]  WITH CHECK ADD  CONSTRAINT [FK_Knjige_Zanr_Zanr] FOREIGN KEY([id_zanr])
REFERENCES [dbo].[Zanr] ([id_zanr])
GO
ALTER TABLE [dbo].[Knjige_Zanr] CHECK CONSTRAINT [FK_Knjige_Zanr_Zanr]
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Osoba_VrstaOsobe] FOREIGN KEY([id_vrsta_korisnika])
REFERENCES [dbo].[VrstaKorisnika] ([id_vrsta_korisnika])
GO
ALTER TABLE [dbo].[Korisnici] CHECK CONSTRAINT [FK_Osoba_VrstaOsobe]
GO
ALTER TABLE [dbo].[Narudzbina]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbina_Osoba] FOREIGN KEY([id_osoba])
REFERENCES [dbo].[Korisnici] ([id_osoba])
GO
ALTER TABLE [dbo].[Narudzbina] CHECK CONSTRAINT [FK_Narudzbina_Osoba]
GO
ALTER TABLE [dbo].[Narudzbina_Knjiga]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbina_Knjiga_Knjige] FOREIGN KEY([id_knjige])
REFERENCES [dbo].[Knjige] ([id_knjige])
GO
ALTER TABLE [dbo].[Narudzbina_Knjiga] CHECK CONSTRAINT [FK_Narudzbina_Knjiga_Knjige]
GO
ALTER TABLE [dbo].[Narudzbina_Knjiga]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbina_Knjiga_Narudzbina] FOREIGN KEY([id_narudzbine])
REFERENCES [dbo].[Narudzbina] ([id_narudzbine])
GO
ALTER TABLE [dbo].[Narudzbina_Knjiga] CHECK CONSTRAINT [FK_Narudzbina_Knjiga_Narudzbina]
GO
ALTER TABLE [dbo].[Omiljeno]  WITH CHECK ADD  CONSTRAINT [FK_Omiljeno_Knjige] FOREIGN KEY([id_knjige])
REFERENCES [dbo].[Knjige] ([id_knjige])
GO
ALTER TABLE [dbo].[Omiljeno] CHECK CONSTRAINT [FK_Omiljeno_Knjige]
GO
ALTER TABLE [dbo].[Omiljeno]  WITH CHECK ADD  CONSTRAINT [FK_Omiljeno_Korisnici] FOREIGN KEY([id_osoba])
REFERENCES [dbo].[Korisnici] ([id_osoba])
GO
ALTER TABLE [dbo].[Omiljeno] CHECK CONSTRAINT [FK_Omiljeno_Korisnici]
GO
USE [master]
GO
ALTER DATABASE [KnjizaraDB] SET  READ_WRITE 
GO
