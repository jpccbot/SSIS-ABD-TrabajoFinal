USE [master]
GO
/****** Object:  Database [DMNorthwind]    Script Date: 11/12/2020 2:41:19 PM ******/
CREATE DATABASE [DMNorthwind]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMNorthwind', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMNorthwind.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DMNorthwind_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMNorthwind_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [DMNorthwind] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMNorthwind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMNorthwind] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMNorthwind] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMNorthwind] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMNorthwind] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMNorthwind] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMNorthwind] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMNorthwind] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMNorthwind] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMNorthwind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMNorthwind] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMNorthwind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMNorthwind] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMNorthwind] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMNorthwind] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMNorthwind] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMNorthwind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMNorthwind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMNorthwind] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMNorthwind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMNorthwind] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMNorthwind] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMNorthwind] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMNorthwind] SET RECOVERY FULL 
GO
ALTER DATABASE [DMNorthwind] SET  MULTI_USER 
GO
ALTER DATABASE [DMNorthwind] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMNorthwind] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMNorthwind] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMNorthwind] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DMNorthwind] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DMNorthwind] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMNorthwind', N'ON'
GO
ALTER DATABASE [DMNorthwind] SET QUERY_STORE = OFF
GO
USE [DMNorthwind]
GO
/****** Object:  Table [dbo].[DIM_CLIENTES]    Script Date: 11/12/2020 2:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_CLIENTES](
	[CLI_ID] [int] IDENTITY(1,1) NOT NULL,
	[CLI_NOMBRE] [varchar](50) NOT NULL,
	[CLI_CIUDAD] [varchar](50) NOT NULL,
	[CLI_PAIS] [varchar](20) NOT NULL,
	[CLI_TITULO] [varchar](50) NOT NULL,
	[CLI_COMPANIA] [varchar](50) NOT NULL,
	[CLI_DIRECCION] [varchar](50) NOT NULL,
	[CLI_PHONE] [varchar](20) NOT NULL,
	[CLI_CODIGOPOSTAL] [varchar](20) NOT NULL,
	[CLI_REGION] [varchar](20) NOT NULL,
	[CLI_FAX] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DIM_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[CLI_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_EMPLEADOS]    Script Date: 11/12/2020 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_EMPLEADOS](
	[EMP_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMP_APELLIDO] [varchar](50) NOT NULL,
	[EMP_NOMBRE] [varchar](50) NOT NULL,
	[EMP_TITLE] [varchar](50) NOT NULL,
	[EMP_FECHACONTRATO] [date] NOT NULL,
	[EMP_DIRECCION] [varchar](50) NOT NULL,
	[EMP_PAIS] [varchar](20) NOT NULL,
	[EMP_CIUDAD] [varchar](20) NOT NULL,
	[EMP_PHONE] [varchar](20) NOT NULL,
	[EMP_CUMPLEANIO] [date] NOT NULL,
	[EMP_EDAD] [int] NOT NULL,
	[EMP_Reporte] [varchar](20) NULL,
 CONSTRAINT [PK_DIM_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_PRODUCTOS]    Script Date: 11/12/2020 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_PRODUCTOS](
	[PROD_ID] [int] IDENTITY(1,1) NOT NULL,
	[PROD_NOMBRE] [varchar](50) NOT NULL,
	[PROD_CATEGORIA] [varchar](50) NOT NULL,
	[PROD_PRECIO] [float] NOT NULL,
	[PROD_STOCK] [int] NOT NULL,
	[PROD_ENORDEN] [int] NOT NULL,
	[PROD_LEVELREORDER] [int] NOT NULL,
	[PROD_DISCONTINUIDAD] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DIM_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[PROD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_PROVEEDORES]    Script Date: 11/12/2020 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_PROVEEDORES](
	[PROV_ID] [int] IDENTITY(1,1) NOT NULL,
	[PROV_NOMBRECOMPANIA] [varchar](50) NOT NULL,
	[PROV_PAIS] [varchar](20) NOT NULL,
	[PROV_NOMBRECONTACTO] [varchar](50) NOT NULL,
	[PROV_TITULOCONTACTO] [varchar](50) NOT NULL,
	[PROV_DIRECCION] [varchar](50) NOT NULL,
	[PROV_CIUDAD] [varchar](20) NOT NULL,
	[PROV_TELEFONO] [varchar](20) NOT NULL,
	[PROV_CODIGOPOSTAL] [varchar](20) NOT NULL,
	[PROV_FAX] [varchar](50) NOT NULL,
	[PROV_REGION] [varchar](50) NOT NULL,
	[PROV_HOMEPAGE] [text] NOT NULL,
 CONSTRAINT [PK_DIM_PROVEEDORES] PRIMARY KEY CLUSTERED 
(
	[PROV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_TIEMPO]    Script Date: 11/12/2020 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_TIEMPO](
	[TIME_ID] [int] IDENTITY(1,1) NOT NULL,
	[TIME_FECHAORDEN] [date] NOT NULL,
	[TIME_ANIO] [int] NOT NULL,
	[TIME_TRIMESTRE] [int] NOT NULL,
	[TIME_MES] [varchar](50) NOT NULL,
	[TIME_DIA] [int] NOT NULL,
	[TIME_DIASEMANA] [varchar](50) NOT NULL,
	[TIME_FECHAREQUERIDA] [date] NOT NULL,
	[TIME_FECHAENVIADA] [date] NOT NULL,
	[TIME_ANTESODESPUES] [float] NOT NULL,
	[TIME_TIEMPOPROMEDIOESPERA] [float] NOT NULL,
	[TIME_DIASLUEGODEORDENAR] [float] NOT NULL,
 CONSTRAINT [PK_DIM_TIEMPO] PRIMARY KEY CLUSTERED 
(
	[TIME_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_TRANSPORTES]    Script Date: 11/12/2020 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_TRANSPORTES](
	[TRANS_ID] [int] IDENTITY(1,1) NOT NULL,
	[TRANS_PAIS] [varchar](50) NOT NULL,
	[TRANS_CIUDAD] [varchar](50) NOT NULL,
	[TRANS_NOMBRE] [varchar](50) NOT NULL,
	[TRANS_CODIGOPOSTAL] [varchar](50) NOT NULL,
	[TRANS_DIRECCION] [varchar](60) NOT NULL,
	[TRANS_TELEFONO] [varchar](50) NOT NULL,
	[TRANS_NOMBRECOMPANIA] [varchar](50) NOT NULL,
	[TRANS_REGION] [varchar](20) NOT NULL,
	[TRANS_CARGA] [float] NOT NULL,
 CONSTRAINT [PK_DIM_TRANSPORTES] PRIMARY KEY CLUSTERED 
(
	[TRANS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_VENTAS]    Script Date: 11/12/2020 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_VENTAS](
	[VEN_PROD_ID] [int] NOT NULL,
	[VEN_CLI_ID] [int] NOT NULL,
	[VEN_EMP_ID] [int] NOT NULL,
	[VEN_TIME_ID] [int] NOT NULL,
	[VEN_PROV_ID] [int] NOT NULL,
	[VEN_TRANS_ID] [int] NOT NULL,
	[VEN_PRECIOPRODUCTO] [float] NOT NULL,
	[VEN_GANANCIAFICTICIA] [float] NOT NULL,
	[VEN_CANTIDAD] [int] NOT NULL,
	[VEN_PRECIOACORDADO] [float] NOT NULL,
	[VEN_DESCUENTO] [float] NOT NULL,
	[VEN_GANANCIA] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FACT_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VENTAS_DIM_CLIENTES] FOREIGN KEY([VEN_CLI_ID])
REFERENCES [dbo].[DIM_CLIENTES] ([CLI_ID])
GO
ALTER TABLE [dbo].[FACT_VENTAS] CHECK CONSTRAINT [FK_FACT_VENTAS_DIM_CLIENTES]
GO
ALTER TABLE [dbo].[FACT_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VENTAS_DIM_EMPLEADOS] FOREIGN KEY([VEN_EMP_ID])
REFERENCES [dbo].[DIM_EMPLEADOS] ([EMP_ID])
GO
ALTER TABLE [dbo].[FACT_VENTAS] CHECK CONSTRAINT [FK_FACT_VENTAS_DIM_EMPLEADOS]
GO
ALTER TABLE [dbo].[FACT_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VENTAS_DIM_PRODUCTOS] FOREIGN KEY([VEN_PROD_ID])
REFERENCES [dbo].[DIM_PRODUCTOS] ([PROD_ID])
GO
ALTER TABLE [dbo].[FACT_VENTAS] CHECK CONSTRAINT [FK_FACT_VENTAS_DIM_PRODUCTOS]
GO
ALTER TABLE [dbo].[FACT_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VENTAS_DIM_PROVEEDORES] FOREIGN KEY([VEN_PROV_ID])
REFERENCES [dbo].[DIM_PROVEEDORES] ([PROV_ID])
GO
ALTER TABLE [dbo].[FACT_VENTAS] CHECK CONSTRAINT [FK_FACT_VENTAS_DIM_PROVEEDORES]
GO
ALTER TABLE [dbo].[FACT_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VENTAS_DIM_TIEMPO] FOREIGN KEY([VEN_TIME_ID])
REFERENCES [dbo].[DIM_TIEMPO] ([TIME_ID])
GO
ALTER TABLE [dbo].[FACT_VENTAS] CHECK CONSTRAINT [FK_FACT_VENTAS_DIM_TIEMPO]
GO
ALTER TABLE [dbo].[FACT_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_VENTAS_DIM_TRANSPORTES] FOREIGN KEY([VEN_TRANS_ID])
REFERENCES [dbo].[DIM_TRANSPORTES] ([TRANS_ID])
GO
ALTER TABLE [dbo].[FACT_VENTAS] CHECK CONSTRAINT [FK_FACT_VENTAS_DIM_TRANSPORTES]
GO
USE [master]
GO
ALTER DATABASE [DMNorthwind] SET  READ_WRITE 
GO
