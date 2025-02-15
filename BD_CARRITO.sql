USE [master]
GO
/****** Object:  Database [DB_CARRITO]    Script Date: 8/11/2023 15:03:17 ******/
CREATE DATABASE [DB_CARRITO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_CARRITO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Template Data\DB_CARRITO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_CARRITO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Template Data\DB_CARRITO.mdf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT;
GO
ALTER DATABASE [DB_CARRITO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_CARRITO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_CARRITO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_CARRITO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_CARRITO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_CARRITO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_CARRITO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_CARRITO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_CARRITO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_CARRITO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_CARRITO] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_CARRITO] SET  MULTI_USER 
GO
ALTER DATABASE [DB_CARRITO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_CARRITO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_CARRITO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_CARRITO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_CARRITO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_CARRITO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_CARRITO', N'ON'
GO
ALTER DATABASE [DB_CARRITO] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_CARRITO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_CARRITO]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[TotalProducto] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[Contacto] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](500) NULL,
	[IdDistrito] [varchar](10) NULL,
	[FechaCompra] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTAMENTO]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENTO](
	[IdDepartamento] [varchar](2) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISTRITO]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISTRITO](
	[IdDistrito] [varchar](6) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdProvincia] [varchar](4) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[Descripcion] [varchar](500) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[IdProvincia] [varchar](4) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Contrasena] [varchar](100) NULL,
	[EsAdministrador] [bit] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (9, N'Celulares', 1, CAST(N'2023-11-06T15:49:04.010' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (10, N'Laptops', 1, CAST(N'2023-11-06T15:49:14.700' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (11, N'Televisores', 1, CAST(N'2023-11-06T15:49:21.417' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (12, N'Audifonos', 1, CAST(N'2023-11-06T15:49:29.400' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (13, N'Smartwatch', 1, CAST(N'2023-11-06T15:49:55.340' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (14, N'Camaras', 1, CAST(N'2023-11-06T15:51:56.713' AS DateTime))
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPRA] ON 

INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Contacto], [Telefono], [Direccion], [IdDistrito], [FechaCompra]) VALUES (1, 2, 2, CAST(1799.80 AS Decimal(10, 2)), N'qqqq', N'987654321', N'qqqq', N'0102', CAST(N'2023-11-07T18:33:37.203' AS DateTime))
SET IDENTITY_INSERT [dbo].[COMPRA] OFF
GO
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'01', N'Amazonas')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'02', N'Áncash')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'03', N'Apurímac')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'04', N'Arequipa')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'05', N'Ayacucho')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'06', N'Cajamarca')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'07', N'Callao')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'08', N'Cusco')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'09', N'Huancavelica')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'10', N'Huánuco')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'11', N'Ica')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'12', N'Junín')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'13', N'La Libertad')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'14', N'Lambayeque')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'15', N'Lima')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'16', N'Loreto')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'17', N'Madre de Dios')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'18', N'Moquegua')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'19', N'Pasco')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'20', N'Piura')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'21', N'Puno')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'22', N'San Martín')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'23', N'Tacna')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'24', N'Tumbes')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'25', N'Ucayali')
GO
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] ON 

INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (1, 1, 29, 1, CAST(1199.90 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (2, 1, 30, 1, CAST(599.90 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] OFF
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010101', N'Chachapoyas', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010102', N'Asunción', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010103', N'Balsas', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010104', N'Cheto', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010105', N'Chiliquin', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010106', N'Chuquibamba', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010107', N'Granada', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010108', N'Huancas', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010109', N'La Jalca', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010110', N'Leimebamba', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010111', N'Levanto', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010112', N'Magdalena', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010113', N'Mariscal Castilla', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010114', N'Molinopampa', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010115', N'Montevideo', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010116', N'Olleros', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010117', N'Quinjalca', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010118', N'San Francisco de Daguas', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010119', N'San Isidro de Maino', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010120', N'Soloco', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010121', N'Sonche', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010201', N'Bagua', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010202', N'Aramango', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010203', N'Copallin', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010204', N'El Parco', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010205', N'Imaza', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010206', N'La Peca', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010301', N'Jumbilla', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010302', N'Chisquilla', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010303', N'Churuja', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010304', N'Corosha', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010305', N'Cuispes', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010306', N'Florida', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010307', N'Jazan', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010308', N'Recta', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010309', N'San Carlos', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010310', N'Shipasbamba', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010311', N'Valera', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010312', N'Yambrasbamba', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010401', N'Nieva', N'0104', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010402', N'El Cenepa', N'0104', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010403', N'Río Santiago', N'0104', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010501', N'Lamud', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010502', N'Camporredondo', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010503', N'Cocabamba', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010504', N'Colcamar', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010505', N'Conila', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010506', N'Inguilpata', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010507', N'Longuita', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010508', N'Lonya Chico', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010509', N'Luya', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010510', N'Luya Viejo', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010511', N'María', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010512', N'Ocalli', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010513', N'Ocumal', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010514', N'Pisuquia', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010515', N'Providencia', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010516', N'San Cristóbal', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010517', N'San Francisco de Yeso', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010518', N'San Jerónimo', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010519', N'San Juan de Lopecancha', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010520', N'Santa Catalina', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010521', N'Santo Tomas', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010522', N'Tingo', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010523', N'Trita', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010601', N'San Nicolás', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010602', N'Chirimoto', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010603', N'Cochamal', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010604', N'Huambo', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010605', N'Limabamba', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010606', N'Longar', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010607', N'Mariscal Benavides', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010608', N'Milpuc', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010609', N'Omia', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010610', N'Santa Rosa', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010611', N'Totora', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010612', N'Vista Alegre', N'0106', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010701', N'Bagua Grande', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010702', N'Cajaruro', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010703', N'Cumba', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010704', N'El Milagro', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010705', N'Jamalca', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010706', N'Lonya Grande', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010707', N'Yamon', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020101', N'Huaraz', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020102', N'Cochabamba', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020103', N'Colcabamba', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020104', N'Huanchay', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020105', N'Independencia', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020106', N'Jangas', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020107', N'La Libertad', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020108', N'Olleros', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020109', N'Pampas Grande', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020110', N'Pariacoto', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020111', N'Pira', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020112', N'Tarica', N'0201', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020201', N'Aija', N'0202', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020202', N'Coris', N'0202', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020203', N'Huacllan', N'0202', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020204', N'La Merced', N'0202', N'02')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020205', N'Succha', N'0202', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020301', N'Llamellin', N'0203', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020302', N'Aczo', N'0203', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020303', N'Chaccho', N'0203', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020304', N'Chingas', N'0203', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020305', N'Mirgas', N'0203', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020306', N'San Juan de Rontoy', N'0203', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020401', N'Chacas', N'0204', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020402', N'Acochaca', N'0204', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020501', N'Chiquian', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020502', N'Abelardo Pardo Lezameta', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020503', N'Antonio Raymondi', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020504', N'Aquia', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020505', N'Cajacay', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020506', N'Canis', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020507', N'Colquioc', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020508', N'Huallanca', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020509', N'Huasta', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020510', N'Huayllacayan', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020511', N'La Primavera', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020512', N'Mangas', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020513', N'Pacllon', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020514', N'San Miguel de Corpanqui', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020515', N'Ticllos', N'0205', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020601', N'Carhuaz', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020602', N'Acopampa', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020603', N'Amashca', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020604', N'Anta', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020605', N'Ataquero', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020606', N'Marcara', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020607', N'Pariahuanca', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020608', N'San Miguel de Aco', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020609', N'Shilla', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020610', N'Tinco', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020611', N'Yungar', N'0206', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020701', N'San Luis', N'0207', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020702', N'San Nicolás', N'0207', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020703', N'Yauya', N'0207', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020801', N'Casma', N'0208', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020802', N'Buena Vista Alta', N'0208', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020803', N'Comandante Noel', N'0208', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020804', N'Yautan', N'0208', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020901', N'Corongo', N'0209', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020902', N'Aco', N'0209', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020903', N'Bambas', N'0209', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020904', N'Cusca', N'0209', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020905', N'La Pampa', N'0209', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020906', N'Yanac', N'0209', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020907', N'Yupan', N'0209', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021001', N'Huari', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021002', N'Anra', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021003', N'Cajay', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021004', N'Chavin de Huantar', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021005', N'Huacachi', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021006', N'Huacchis', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021007', N'Huachis', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021008', N'Huantar', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021009', N'Masin', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021010', N'Paucas', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021011', N'Ponto', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021012', N'Rahuapampa', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021013', N'Rapayan', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021014', N'San Marcos', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021015', N'San Pedro de Chana', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021016', N'Uco', N'0210', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021101', N'Huarmey', N'0211', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021102', N'Cochapeti', N'0211', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021103', N'Culebras', N'0211', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021104', N'Huayan', N'0211', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021105', N'Malvas', N'0211', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021201', N'Caraz', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021202', N'Huallanca', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021203', N'Huata', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021204', N'Huaylas', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021205', N'Mato', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021206', N'Pamparomas', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021207', N'Pueblo Libre', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021208', N'Santa Cruz', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021209', N'Santo Toribio', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021210', N'Yuracmarca', N'0212', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021301', N'Piscobamba', N'0213', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021302', N'Casca', N'0213', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021303', N'Eleazar Guzmán Barron', N'0213', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021304', N'Fidel Olivas Escudero', N'0213', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021305', N'Llama', N'0213', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021306', N'Llumpa', N'0213', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021307', N'Lucma', N'0213', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021308', N'Musga', N'0213', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021401', N'Ocros', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021402', N'Acas', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021403', N'Cajamarquilla', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021404', N'Carhuapampa', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021405', N'Cochas', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021406', N'Congas', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021407', N'Llipa', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021408', N'San Cristóbal de Rajan', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021409', N'San Pedro', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021410', N'Santiago de Chilcas', N'0214', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021501', N'Cabana', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021502', N'Bolognesi', N'0215', N'02')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021503', N'Conchucos', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021504', N'Huacaschuque', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021505', N'Huandoval', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021506', N'Lacabamba', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021507', N'Llapo', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021508', N'Pallasca', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021509', N'Pampas', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021510', N'Santa Rosa', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021511', N'Tauca', N'0215', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021601', N'Pomabamba', N'0216', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021602', N'Huayllan', N'0216', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021603', N'Parobamba', N'0216', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021604', N'Quinuabamba', N'0216', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021701', N'Recuay', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021702', N'Catac', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021703', N'Cotaparaco', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021704', N'Huayllapampa', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021705', N'Llacllin', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021706', N'Marca', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021707', N'Pampas Chico', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021708', N'Pararin', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021709', N'Tapacocha', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021710', N'Ticapampa', N'0217', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021801', N'Chimbote', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021802', N'Cáceres del Perú', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021803', N'Coishco', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021804', N'Macate', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021805', N'Moro', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021806', N'Nepeña', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021807', N'Samanco', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021808', N'Santa', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021809', N'Nuevo Chimbote', N'0218', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021901', N'Sihuas', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021902', N'Acobamba', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021903', N'Alfonso Ugarte', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021904', N'Cashapampa', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021905', N'Chingalpo', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021906', N'Huayllabamba', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021907', N'Quiches', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021908', N'Ragash', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021909', N'San Juan', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'021910', N'Sicsibamba', N'0219', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'022001', N'Yungay', N'0220', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'022002', N'Cascapara', N'0220', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'022003', N'Mancos', N'0220', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'022004', N'Matacoto', N'0220', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'022005', N'Quillo', N'0220', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'022006', N'Ranrahirca', N'0220', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'022007', N'Shupluy', N'0220', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'022008', N'Yanama', N'0220', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030101', N'Abancay', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030102', N'Chacoche', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030103', N'Circa', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030104', N'Curahuasi', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030105', N'Huanipaca', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030106', N'Lambrama', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030107', N'Pichirhua', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030108', N'San Pedro de Cachora', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030109', N'Tamburco', N'0301', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030201', N'Andahuaylas', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030202', N'Andarapa', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030203', N'Chiara', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030204', N'Huancarama', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030205', N'Huancaray', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030206', N'Huayana', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030207', N'Kishuara', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030208', N'Pacobamba', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030209', N'Pacucha', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030210', N'Pampachiri', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030211', N'Pomacocha', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030212', N'San Antonio de Cachi', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030213', N'San Jerónimo', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030214', N'San Miguel de Chaccrampa', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030215', N'Santa María de Chicmo', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030216', N'Talavera', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030217', N'Tumay Huaraca', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030218', N'Turpo', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030219', N'Kaquiabamba', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030220', N'José María Arguedas', N'0302', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030301', N'Antabamba', N'0303', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030302', N'El Oro', N'0303', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030303', N'Huaquirca', N'0303', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030304', N'Juan Espinoza Medrano', N'0303', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030305', N'Oropesa', N'0303', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030306', N'Pachaconas', N'0303', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030307', N'Sabaino', N'0303', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030401', N'Chalhuanca', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030402', N'Capaya', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030403', N'Caraybamba', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030404', N'Chapimarca', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030405', N'Colcabamba', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030406', N'Cotaruse', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030407', N'Ihuayllo', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030408', N'Justo Apu Sahuaraura', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030409', N'Lucre', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030410', N'Pocohuanca', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030411', N'San Juan de Chacña', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030412', N'Sañayca', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030413', N'Soraya', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030414', N'Tapairihua', N'0304', N'03')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030415', N'Tintay', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030416', N'Toraya', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030417', N'Yanaca', N'0304', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030501', N'Tambobamba', N'0305', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030502', N'Cotabambas', N'0305', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030503', N'Coyllurqui', N'0305', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030504', N'Haquira', N'0305', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030505', N'Mara', N'0305', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030506', N'Challhuahuacho', N'0305', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030601', N'Chincheros', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030602', N'Anco_Huallo', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030603', N'Cocharcas', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030604', N'Huaccana', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030605', N'Ocobamba', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030606', N'Ongoy', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030607', N'Uranmarca', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030608', N'Ranracancha', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030609', N'Rocchacc', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030610', N'El Porvenir', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030611', N'Los Chankas', N'0306', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030701', N'Chuquibambilla', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030702', N'Curpahuasi', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030703', N'Gamarra', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030704', N'Huayllati', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030705', N'Mamara', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030706', N'Micaela Bastidas', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030707', N'Pataypampa', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030708', N'Progreso', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030709', N'San Antonio', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030710', N'Santa Rosa', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030711', N'Turpay', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030712', N'Vilcabamba', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030713', N'Virundo', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030714', N'Curasco', N'0307', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040101', N'Arequipa', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040102', N'Alto Selva Alegre', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040103', N'Cayma', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040104', N'Cerro Colorado', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040105', N'Characato', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040106', N'Chiguata', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040107', N'Jacobo Hunter', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040108', N'La Joya', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040109', N'Mariano Melgar', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040110', N'Miraflores', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040111', N'Mollebaya', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040112', N'Paucarpata', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040113', N'Pocsi', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040114', N'Polobaya', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040115', N'Quequeña', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040116', N'Sabandia', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040117', N'Sachaca', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040118', N'San Juan de Siguas', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040119', N'San Juan de Tarucani', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040120', N'Santa Isabel de Siguas', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040121', N'Santa Rita de Siguas', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040122', N'Socabaya', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040123', N'Tiabaya', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040124', N'Uchumayo', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040125', N'Vitor', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040126', N'Yanahuara', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040127', N'Yarabamba', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040128', N'Yura', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040129', N'José Luis Bustamante Y Rivero', N'0401', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040201', N'Camaná', N'0402', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040202', N'José María Quimper', N'0402', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040203', N'Mariano Nicolás Valcárcel', N'0402', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040204', N'Mariscal Cáceres', N'0402', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040205', N'Nicolás de Pierola', N'0402', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040206', N'Ocoña', N'0402', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040207', N'Quilca', N'0402', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040208', N'Samuel Pastor', N'0402', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040301', N'Caravelí', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040302', N'Acarí', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040303', N'Atico', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040304', N'Atiquipa', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040305', N'Bella Unión', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040306', N'Cahuacho', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040307', N'Chala', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040308', N'Chaparra', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040309', N'Huanuhuanu', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040310', N'Jaqui', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040311', N'Lomas', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040312', N'Quicacha', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040313', N'Yauca', N'0403', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040401', N'Aplao', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040402', N'Andagua', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040403', N'Ayo', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040404', N'Chachas', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040405', N'Chilcaymarca', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040406', N'Choco', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040407', N'Huancarqui', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040408', N'Machaguay', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040409', N'Orcopampa', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040410', N'Pampacolca', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040411', N'Tipan', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040412', N'Uñon', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040413', N'Uraca', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040414', N'Viraco', N'0404', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040501', N'Chivay', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040502', N'Achoma', N'0405', N'04')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040503', N'Cabanaconde', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040504', N'Callalli', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040505', N'Caylloma', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040506', N'Coporaque', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040507', N'Huambo', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040508', N'Huanca', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040509', N'Ichupampa', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040510', N'Lari', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040511', N'Lluta', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040512', N'Maca', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040513', N'Madrigal', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040514', N'San Antonio de Chuca', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040515', N'Sibayo', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040516', N'Tapay', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040517', N'Tisco', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040518', N'Tuti', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040519', N'Yanque', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040520', N'Majes', N'0405', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040601', N'Chuquibamba', N'0406', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040602', N'Andaray', N'0406', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040603', N'Cayarani', N'0406', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040604', N'Chichas', N'0406', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040605', N'Iray', N'0406', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040606', N'Río Grande', N'0406', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040607', N'Salamanca', N'0406', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040608', N'Yanaquihua', N'0406', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040701', N'Mollendo', N'0407', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040702', N'Cocachacra', N'0407', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040703', N'Dean Valdivia', N'0407', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040704', N'Islay', N'0407', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040705', N'Mejia', N'0407', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040706', N'Punta de Bombón', N'0407', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040801', N'Cotahuasi', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040802', N'Alca', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040803', N'Charcana', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040804', N'Huaynacotas', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040805', N'Pampamarca', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040806', N'Puyca', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040807', N'Quechualla', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040808', N'Sayla', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040809', N'Tauria', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040810', N'Tomepampa', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'040811', N'Toro', N'0408', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050101', N'Ayacucho', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050102', N'Acocro', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050103', N'Acos Vinchos', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050104', N'Carmen Alto', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050105', N'Chiara', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050106', N'Ocros', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050107', N'Pacaycasa', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050108', N'Quinua', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050109', N'San José de Ticllas', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050110', N'San Juan Bautista', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050111', N'Santiago de Pischa', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050112', N'Socos', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050113', N'Tambillo', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050114', N'Vinchos', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050115', N'Jesús Nazareno', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050116', N'Andrés Avelino Cáceres Dorregaray', N'0501', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050201', N'Cangallo', N'0502', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050202', N'Chuschi', N'0502', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050203', N'Los Morochucos', N'0502', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050204', N'María Parado de Bellido', N'0502', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050205', N'Paras', N'0502', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050206', N'Totos', N'0502', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050301', N'Sancos', N'0503', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050302', N'Carapo', N'0503', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050303', N'Sacsamarca', N'0503', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050304', N'Santiago de Lucanamarca', N'0503', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050401', N'Huanta', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050402', N'Ayahuanco', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050403', N'Huamanguilla', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050404', N'Iguain', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050405', N'Luricocha', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050406', N'Santillana', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050407', N'Sivia', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050408', N'Llochegua', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050409', N'Canayre', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050410', N'Uchuraccay', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050411', N'Pucacolpa', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050412', N'Chaca', N'0504', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050501', N'San Miguel', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050502', N'Anco', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050503', N'Ayna', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050504', N'Chilcas', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050505', N'Chungui', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050506', N'Luis Carranza', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050507', N'Santa Rosa', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050508', N'Tambo', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050509', N'Samugari', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050510', N'Anchihuay', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050511', N'Oronccoy', N'0505', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050601', N'Puquio', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050602', N'Aucara', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050603', N'Cabana', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050604', N'Carmen Salcedo', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050605', N'Chaviña', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050606', N'Chipao', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050607', N'Huac-Huas', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050608', N'Laramate', N'0506', N'05')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050609', N'Leoncio Prado', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050610', N'Llauta', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050611', N'Lucanas', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050612', N'Ocaña', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050613', N'Otoca', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050614', N'Saisa', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050615', N'San Cristóbal', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050616', N'San Juan', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050617', N'San Pedro', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050618', N'San Pedro de Palco', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050619', N'Sancos', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050620', N'Santa Ana de Huaycahuacho', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050621', N'Santa Lucia', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050701', N'Coracora', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050702', N'Chumpi', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050703', N'Coronel Castañeda', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050704', N'Pacapausa', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050705', N'Pullo', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050706', N'Puyusca', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050707', N'San Francisco de Ravacayco', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050708', N'Upahuacho', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050801', N'Pausa', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050802', N'Colta', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050803', N'Corculla', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050804', N'Lampa', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050805', N'Marcabamba', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050806', N'Oyolo', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050807', N'Pararca', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050808', N'San Javier de Alpabamba', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050809', N'San José de Ushua', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050810', N'Sara Sara', N'0508', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050901', N'Querobamba', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050902', N'Belén', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050903', N'Chalcos', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050904', N'Chilcayoc', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050905', N'Huacaña', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050906', N'Morcolla', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050907', N'Paico', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050908', N'San Pedro de Larcay', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050909', N'San Salvador de Quije', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050910', N'Santiago de Paucaray', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'050911', N'Soras', N'0509', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051001', N'Huancapi', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051002', N'Alcamenca', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051003', N'Apongo', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051004', N'Asquipata', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051005', N'Canaria', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051006', N'Cayara', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051007', N'Colca', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051008', N'Huamanquiquia', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051009', N'Huancaraylla', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051010', N'Hualla', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051011', N'Sarhua', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051012', N'Vilcanchos', N'0510', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051101', N'Vilcas Huaman', N'0511', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051102', N'Accomarca', N'0511', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051103', N'Carhuanca', N'0511', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051104', N'Concepción', N'0511', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051105', N'Huambalpa', N'0511', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051106', N'Independencia', N'0511', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051107', N'Saurama', N'0511', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'051108', N'Vischongo', N'0511', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060101', N'Cajamarca', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060102', N'Asunción', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060103', N'Chetilla', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060104', N'Cospan', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060105', N'Encañada', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060106', N'Jesús', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060107', N'Llacanora', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060108', N'Los Baños del Inca', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060109', N'Magdalena', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060110', N'Matara', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060111', N'Namora', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060112', N'San Juan', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060201', N'Cajabamba', N'0602', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060202', N'Cachachi', N'0602', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060203', N'Condebamba', N'0602', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060204', N'Sitacocha', N'0602', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060301', N'Celendín', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060302', N'Chumuch', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060303', N'Cortegana', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060304', N'Huasmin', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060305', N'Jorge Chávez', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060306', N'José Gálvez', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060307', N'Miguel Iglesias', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060308', N'Oxamarca', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060309', N'Sorochuco', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060310', N'Sucre', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060311', N'Utco', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060312', N'La Libertad de Pallan', N'0603', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060401', N'Chota', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060402', N'Anguia', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060403', N'Chadin', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060404', N'Chiguirip', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060405', N'Chimban', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060406', N'Choropampa', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060407', N'Cochabamba', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060408', N'Conchan', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060409', N'Huambos', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060410', N'Lajas', N'0604', N'06')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060411', N'Llama', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060412', N'Miracosta', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060413', N'Paccha', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060414', N'Pion', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060415', N'Querocoto', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060416', N'San Juan de Licupis', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060417', N'Tacabamba', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060418', N'Tocmoche', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060419', N'Chalamarca', N'0604', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060501', N'Contumaza', N'0605', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060502', N'Chilete', N'0605', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060503', N'Cupisnique', N'0605', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060504', N'Guzmango', N'0605', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060505', N'San Benito', N'0605', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060506', N'Santa Cruz de Toledo', N'0605', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060507', N'Tantarica', N'0605', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060508', N'Yonan', N'0605', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060601', N'Cutervo', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060602', N'Callayuc', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060603', N'Choros', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060604', N'Cujillo', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060605', N'La Ramada', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060606', N'Pimpingos', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060607', N'Querocotillo', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060608', N'San Andrés de Cutervo', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060609', N'San Juan de Cutervo', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060610', N'San Luis de Lucma', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060611', N'Santa Cruz', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060612', N'Santo Domingo de la Capilla', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060613', N'Santo Tomas', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060614', N'Socota', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060615', N'Toribio Casanova', N'0606', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060701', N'Bambamarca', N'0607', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060702', N'Chugur', N'0607', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060703', N'Hualgayoc', N'0607', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060801', N'Jaén', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060802', N'Bellavista', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060803', N'Chontali', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060804', N'Colasay', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060805', N'Huabal', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060806', N'Las Pirias', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060807', N'Pomahuaca', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060808', N'Pucara', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060809', N'Sallique', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060810', N'San Felipe', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060811', N'San José del Alto', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060812', N'Santa Rosa', N'0608', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060901', N'San Ignacio', N'0609', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060902', N'Chirinos', N'0609', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060903', N'Huarango', N'0609', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060904', N'La Coipa', N'0609', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060905', N'Namballe', N'0609', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060906', N'San José de Lourdes', N'0609', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'060907', N'Tabaconas', N'0609', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061001', N'Pedro Gálvez', N'0610', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061002', N'Chancay', N'0610', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061003', N'Eduardo Villanueva', N'0610', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061004', N'Gregorio Pita', N'0610', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061005', N'Ichocan', N'0610', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061006', N'José Manuel Quiroz', N'0610', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061007', N'José Sabogal', N'0610', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061101', N'San Miguel', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061102', N'Bolívar', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061103', N'Calquis', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061104', N'Catilluc', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061105', N'El Prado', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061106', N'La Florida', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061107', N'Llapa', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061108', N'Nanchoc', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061109', N'Niepos', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061110', N'San Gregorio', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061111', N'San Silvestre de Cochan', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061112', N'Tongod', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061113', N'Unión Agua Blanca', N'0611', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061201', N'San Pablo', N'0612', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061202', N'San Bernardino', N'0612', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061203', N'San Luis', N'0612', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061204', N'Tumbaden', N'0612', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061301', N'Santa Cruz', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061302', N'Andabamba', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061303', N'Catache', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061304', N'Chancaybaños', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061305', N'La Esperanza', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061306', N'Ninabamba', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061307', N'Pulan', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061308', N'Saucepampa', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061309', N'Sexi', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061310', N'Uticyacu', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'061311', N'Yauyucan', N'0613', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'070101', N'Callao', N'0701', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'070102', N'Bellavista', N'0701', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'070103', N'Carmen de la Legua Reynoso', N'0701', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'070104', N'La Perla', N'0701', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'070105', N'La Punta', N'0701', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'070106', N'Ventanilla', N'0701', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'070107', N'Mi Perú', N'0701', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080101', N'Cusco', N'0801', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080102', N'Ccorca', N'0801', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080103', N'Poroy', N'0801', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080104', N'San Jerónimo', N'0801', N'08')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080105', N'San Sebastian', N'0801', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080106', N'Santiago', N'0801', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080107', N'Saylla', N'0801', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080108', N'Wanchaq', N'0801', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080201', N'Acomayo', N'0802', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080202', N'Acopia', N'0802', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080203', N'Acos', N'0802', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080204', N'Mosoc Llacta', N'0802', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080205', N'Pomacanchi', N'0802', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080206', N'Rondocan', N'0802', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080207', N'Sangarara', N'0802', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080301', N'Anta', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080302', N'Ancahuasi', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080303', N'Cachimayo', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080304', N'Chinchaypujio', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080305', N'Huarocondo', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080306', N'Limatambo', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080307', N'Mollepata', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080308', N'Pucyura', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080309', N'Zurite', N'0803', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080401', N'Calca', N'0804', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080402', N'Coya', N'0804', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080403', N'Lamay', N'0804', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080404', N'Lares', N'0804', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080405', N'Pisac', N'0804', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080406', N'San Salvador', N'0804', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080407', N'Taray', N'0804', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080408', N'Yanatile', N'0804', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080501', N'Yanaoca', N'0805', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080502', N'Checca', N'0805', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080503', N'Kunturkanki', N'0805', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080504', N'Langui', N'0805', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080505', N'Layo', N'0805', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080506', N'Pampamarca', N'0805', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080507', N'Quehue', N'0805', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080508', N'Tupac Amaru', N'0805', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080601', N'Sicuani', N'0806', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080602', N'Checacupe', N'0806', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080603', N'Combapata', N'0806', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080604', N'Marangani', N'0806', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080605', N'Pitumarca', N'0806', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080606', N'San Pablo', N'0806', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080607', N'San Pedro', N'0806', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080608', N'Tinta', N'0806', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080701', N'Santo Tomas', N'0807', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080702', N'Capacmarca', N'0807', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080703', N'Chamaca', N'0807', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080704', N'Colquemarca', N'0807', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080705', N'Livitaca', N'0807', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080706', N'Llusco', N'0807', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080707', N'Quiñota', N'0807', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080708', N'Velille', N'0807', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080801', N'Espinar', N'0808', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080802', N'Condoroma', N'0808', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080803', N'Coporaque', N'0808', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080804', N'Ocoruro', N'0808', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080805', N'Pallpata', N'0808', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080806', N'Pichigua', N'0808', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080807', N'Suyckutambo', N'0808', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080808', N'Alto Pichigua', N'0808', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080901', N'Santa Ana', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080902', N'Echarate', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080903', N'Huayopata', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080904', N'Maranura', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080905', N'Ocobamba', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080906', N'Quellouno', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080907', N'Kimbiri', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080908', N'Santa Teresa', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080909', N'Vilcabamba', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080910', N'Pichari', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080911', N'Inkawasi', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080912', N'Villa Virgen', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080913', N'Villa Kintiarina', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'080914', N'Megantoni', N'0809', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081001', N'Paruro', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081002', N'Accha', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081003', N'Ccapi', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081004', N'Colcha', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081005', N'Huanoquite', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081006', N'Omachaç', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081007', N'Paccaritambo', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081008', N'Pillpinto', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081009', N'Yaurisque', N'0810', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081101', N'Paucartambo', N'0811', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081102', N'Caicay', N'0811', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081103', N'Challabamba', N'0811', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081104', N'Colquepata', N'0811', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081105', N'Huancarani', N'0811', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081106', N'Kosñipata', N'0811', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081201', N'Urcos', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081202', N'Andahuaylillas', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081203', N'Camanti', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081204', N'Ccarhuayo', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081205', N'Ccatca', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081206', N'Cusipata', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081207', N'Huaro', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081208', N'Lucre', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081209', N'Marcapata', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081210', N'Ocongate', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081211', N'Oropesa', N'0812', N'08')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081212', N'Quiquijana', N'0812', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081301', N'Urubamba', N'0813', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081302', N'Chinchero', N'0813', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081303', N'Huayllabamba', N'0813', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081304', N'Machupicchu', N'0813', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081305', N'Maras', N'0813', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081306', N'Ollantaytambo', N'0813', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'081307', N'Yucay', N'0813', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090101', N'Huancavelica', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090102', N'Acobambilla', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090103', N'Acoria', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090104', N'Conayca', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090105', N'Cuenca', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090106', N'Huachocolpa', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090107', N'Huayllahuara', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090108', N'Izcuchaca', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090109', N'Laria', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090110', N'Manta', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090111', N'Mariscal Cáceres', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090112', N'Moya', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090113', N'Nuevo Occoro', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090114', N'Palca', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090115', N'Pilchaca', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090116', N'Vilca', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090117', N'Yauli', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090118', N'Ascensión', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090119', N'Huando', N'0901', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090201', N'Acobamba', N'0902', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090202', N'Andabamba', N'0902', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090203', N'Anta', N'0902', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090204', N'Caja', N'0902', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090205', N'Marcas', N'0902', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090206', N'Paucara', N'0902', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090207', N'Pomacocha', N'0902', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090208', N'Rosario', N'0902', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090301', N'Lircay', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090302', N'Anchonga', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090303', N'Callanmarca', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090304', N'Ccochaccasa', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090305', N'Chincho', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090306', N'Congalla', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090307', N'Huanca-Huanca', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090308', N'Huayllay Grande', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090309', N'Julcamarca', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090310', N'San Antonio de Antaparco', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090311', N'Santo Tomas de Pata', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090312', N'Secclla', N'0903', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090401', N'Castrovirreyna', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090402', N'Arma', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090403', N'Aurahua', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090404', N'Capillas', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090405', N'Chupamarca', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090406', N'Cocas', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090407', N'Huachos', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090408', N'Huamatambo', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090409', N'Mollepampa', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090410', N'San Juan', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090411', N'Santa Ana', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090412', N'Tantara', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090413', N'Ticrapo', N'0904', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090501', N'Churcampa', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090502', N'Anco', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090503', N'Chinchihuasi', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090504', N'El Carmen', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090505', N'La Merced', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090506', N'Locroja', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090507', N'Paucarbamba', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090508', N'San Miguel de Mayocc', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090509', N'San Pedro de Coris', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090510', N'Pachamarca', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090511', N'Cosme', N'0905', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090601', N'Huaytara', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090602', N'Ayavi', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090603', N'Córdova', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090604', N'Huayacundo Arma', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090605', N'Laramarca', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090606', N'Ocoyo', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090607', N'Pilpichaca', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090608', N'Querco', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090609', N'Quito-Arma', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090610', N'San Antonio de Cusicancha', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090611', N'San Francisco de Sangayaico', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090612', N'San Isidro', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090613', N'Santiago de Chocorvos', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090614', N'Santiago de Quirahuara', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090615', N'Santo Domingo de Capillas', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090616', N'Tambo', N'0906', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090701', N'Pampas', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090702', N'Acostambo', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090703', N'Acraquia', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090704', N'Ahuaycha', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090705', N'Colcabamba', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090706', N'Daniel Hernández', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090707', N'Huachocolpa', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090709', N'Huaribamba', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090710', N'Ñahuimpuquio', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090711', N'Pazos', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090713', N'Quishuar', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090714', N'Salcabamba', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090715', N'Salcahuasi', N'0907', N'09')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090716', N'San Marcos de Rocchac', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090717', N'Surcubamba', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090718', N'Tintay Puncu', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090719', N'Quichuas', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090720', N'Andaymarca', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090721', N'Roble', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090722', N'Pichos', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'090723', N'Santiago de Tucuma', N'0907', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100101', N'Huanuco', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100102', N'Amarilis', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100103', N'Chinchao', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100104', N'Churubamba', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100105', N'Margos', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100106', N'Quisqui (Kichki)', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100107', N'San Francisco de Cayran', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100108', N'San Pedro de Chaulan', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100109', N'Santa María del Valle', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100110', N'Yarumayo', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100111', N'Pillco Marca', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100112', N'Yacus', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100113', N'San Pablo de Pillao', N'1001', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100201', N'Ambo', N'1002', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100202', N'Cayna', N'1002', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100203', N'Colpas', N'1002', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100204', N'Conchamarca', N'1002', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100205', N'Huacar', N'1002', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100206', N'San Francisco', N'1002', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100207', N'San Rafael', N'1002', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100208', N'Tomay Kichwa', N'1002', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100301', N'La Unión', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100307', N'Chuquis', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100311', N'Marías', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100313', N'Pachas', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100316', N'Quivilla', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100317', N'Ripan', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100321', N'Shunqui', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100322', N'Sillapata', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100323', N'Yanas', N'1003', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100401', N'Huacaybamba', N'1004', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100402', N'Canchabamba', N'1004', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100403', N'Cochabamba', N'1004', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100404', N'Pinra', N'1004', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100501', N'Llata', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100502', N'Arancay', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100503', N'Chavín de Pariarca', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100504', N'Jacas Grande', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100505', N'Jircan', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100506', N'Miraflores', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100507', N'Monzón', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100508', N'Punchao', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100509', N'Puños', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100510', N'Singa', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100511', N'Tantamayo', N'1005', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100601', N'Rupa-Rupa', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100602', N'Daniel Alomía Robles', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100603', N'Hermílio Valdizan', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100604', N'José Crespo y Castillo', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100605', N'Luyando', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100606', N'Mariano Damaso Beraun', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100607', N'Pucayacu', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100608', N'Castillo Grande', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100609', N'Pueblo Nuevo', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100610', N'Santo Domingo de Anda', N'1006', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100701', N'Huacrachuco', N'1007', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100702', N'Cholon', N'1007', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100703', N'San Buenaventura', N'1007', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100704', N'La Morada', N'1007', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100705', N'Santa Rosa de Alto Yanajanca', N'1007', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100801', N'Panao', N'1008', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100802', N'Chaglla', N'1008', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100803', N'Molino', N'1008', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100804', N'Umari', N'1008', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100901', N'Puerto Inca', N'1009', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100902', N'Codo del Pozuzo', N'1009', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100903', N'Honoria', N'1009', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100904', N'Tournavista', N'1009', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'100905', N'Yuyapichis', N'1009', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101001', N'Jesús', N'1010', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101002', N'Baños', N'1010', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101003', N'Jivia', N'1010', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101004', N'Queropalca', N'1010', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101005', N'Rondos', N'1010', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101006', N'San Francisco de Asís', N'1010', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101007', N'San Miguel de Cauri', N'1010', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101101', N'Chavinillo', N'1011', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101102', N'Cahuac', N'1011', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101103', N'Chacabamba', N'1011', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101104', N'Aparicio Pomares', N'1011', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101105', N'Jacas Chico', N'1011', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101106', N'Obas', N'1011', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101107', N'Pampamarca', N'1011', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'101108', N'Choras', N'1011', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110101', N'Ica', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110102', N'La Tinguiña', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110103', N'Los Aquijes', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110104', N'Ocucaje', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110105', N'Pachacutec', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110106', N'Parcona', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110107', N'Pueblo Nuevo', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110108', N'Salas', N'1101', N'11')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110109', N'San José de Los Molinos', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110110', N'San Juan Bautista', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110111', N'Santiago', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110112', N'Subtanjalla', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110113', N'Tate', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110114', N'Yauca del Rosario', N'1101', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110201', N'Chincha Alta', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110202', N'Alto Laran', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110203', N'Chavin', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110204', N'Chincha Baja', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110205', N'El Carmen', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110206', N'Grocio Prado', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110207', N'Pueblo Nuevo', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110208', N'San Juan de Yanac', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110209', N'San Pedro de Huacarpana', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110210', N'Sunampe', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110211', N'Tambo de Mora', N'1102', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110301', N'Nasca', N'1103', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110302', N'Changuillo', N'1103', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110303', N'El Ingenio', N'1103', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110304', N'Marcona', N'1103', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110305', N'Vista Alegre', N'1103', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110401', N'Palpa', N'1104', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110402', N'Llipata', N'1104', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110403', N'Río Grande', N'1104', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110404', N'Santa Cruz', N'1104', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110405', N'Tibillo', N'1104', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110501', N'Pisco', N'1105', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110502', N'Huancano', N'1105', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110503', N'Humay', N'1105', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110504', N'Independencia', N'1105', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110505', N'Paracas', N'1105', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110506', N'San Andrés', N'1105', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110507', N'San Clemente', N'1105', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'110508', N'Tupac Amaru Inca', N'1105', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120101', N'Huancayo', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120104', N'Carhuacallanga', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120105', N'Chacapampa', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120106', N'Chicche', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120107', N'Chilca', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120108', N'Chongos Alto', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120111', N'Chupuro', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120112', N'Colca', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120113', N'Cullhuas', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120114', N'El Tambo', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120116', N'Huacrapuquio', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120117', N'Hualhuas', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120119', N'Huancan', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120120', N'Huasicancha', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120121', N'Huayucachi', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120122', N'Ingenio', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120124', N'Pariahuanca', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120125', N'Pilcomayo', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120126', N'Pucara', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120127', N'Quichuay', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120128', N'Quilcas', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120129', N'San Agustín', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120130', N'San Jerónimo de Tunan', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120132', N'Saño', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120133', N'Sapallanga', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120134', N'Sicaya', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120135', N'Santo Domingo de Acobamba', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120136', N'Viques', N'1201', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120201', N'Concepción', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120202', N'Aco', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120203', N'Andamarca', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120204', N'Chambara', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120205', N'Cochas', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120206', N'Comas', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120207', N'Heroínas Toledo', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120208', N'Manzanares', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120209', N'Mariscal Castilla', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120210', N'Matahuasi', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120211', N'Mito', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120212', N'Nueve de Julio', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120213', N'Orcotuna', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120214', N'San José de Quero', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120215', N'Santa Rosa de Ocopa', N'1202', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120301', N'Chanchamayo', N'1203', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120302', N'Perene', N'1203', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120303', N'Pichanaqui', N'1203', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120304', N'San Luis de Shuaro', N'1203', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120305', N'San Ramón', N'1203', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120306', N'Vitoc', N'1203', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120401', N'Jauja', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120402', N'Acolla', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120403', N'Apata', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120404', N'Ataura', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120405', N'Canchayllo', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120406', N'Curicaca', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120407', N'El Mantaro', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120408', N'Huamali', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120409', N'Huaripampa', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120410', N'Huertas', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120411', N'Janjaillo', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120412', N'Julcán', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120413', N'Leonor Ordóñez', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120414', N'Llocllapampa', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120415', N'Marco', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120416', N'Masma', N'1204', N'12')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120417', N'Masma Chicche', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120418', N'Molinos', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120419', N'Monobamba', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120420', N'Muqui', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120421', N'Muquiyauyo', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120422', N'Paca', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120423', N'Paccha', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120424', N'Pancan', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120425', N'Parco', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120426', N'Pomacancha', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120427', N'Ricran', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120428', N'San Lorenzo', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120429', N'San Pedro de Chunan', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120430', N'Sausa', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120431', N'Sincos', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120432', N'Tunan Marca', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120433', N'Yauli', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120434', N'Yauyos', N'1204', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120501', N'Junin', N'1205', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120502', N'Carhuamayo', N'1205', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120503', N'Ondores', N'1205', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120504', N'Ulcumayo', N'1205', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120601', N'Satipo', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120602', N'Coviriali', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120603', N'Llaylla', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120604', N'Mazamari', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120605', N'Pampa Hermosa', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120606', N'Pangoa', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120607', N'Río Negro', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120608', N'Río Tambo', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120609', N'Vizcatan del Ene', N'1206', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120701', N'Tarma', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120702', N'Acobamba', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120703', N'Huaricolca', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120704', N'Huasahuasi', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120705', N'La Unión', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120706', N'Palca', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120707', N'Palcamayo', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120708', N'San Pedro de Cajas', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120709', N'Tapo', N'1207', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120801', N'La Oroya', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120802', N'Chacapalpa', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120803', N'Huay-Huay', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120804', N'Marcapomacocha', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120805', N'Morococha', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120806', N'Paccha', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120807', N'Santa Bárbara de Carhuacayan', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120808', N'Santa Rosa de Sacco', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120809', N'Suitucancha', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120810', N'Yauli', N'1208', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120901', N'Chupaca', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120902', N'Ahuac', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120903', N'Chongos Bajo', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120904', N'Huachac', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120905', N'Huamancaca Chico', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120906', N'San Juan de Iscos', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120907', N'San Juan de Jarpa', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120908', N'Tres de Diciembre', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'120909', N'Yanacancha', N'1209', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130101', N'Trujillo', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130102', N'El Porvenir', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130103', N'Florencia de Mora', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130104', N'Huanchaco', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130105', N'La Esperanza', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130106', N'Laredo', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130107', N'Moche', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130108', N'Poroto', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130109', N'Salaverry', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130110', N'Simbal', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130111', N'Victor Larco Herrera', N'1301', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130201', N'Ascope', N'1302', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130202', N'Chicama', N'1302', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130203', N'Chocope', N'1302', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130204', N'Magdalena de Cao', N'1302', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130205', N'Paijan', N'1302', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130206', N'Rázuri', N'1302', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130207', N'Santiago de Cao', N'1302', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130208', N'Casa Grande', N'1302', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130301', N'Bolívar', N'1303', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130302', N'Bambamarca', N'1303', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130303', N'Condormarca', N'1303', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130304', N'Longotea', N'1303', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130305', N'Uchumarca', N'1303', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130306', N'Ucuncha', N'1303', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130401', N'Chepen', N'1304', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130402', N'Pacanga', N'1304', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130403', N'Pueblo Nuevo', N'1304', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130501', N'Julcan', N'1305', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130502', N'Calamarca', N'1305', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130503', N'Carabamba', N'1305', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130504', N'Huaso', N'1305', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130601', N'Otuzco', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130602', N'Agallpampa', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130604', N'Charat', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130605', N'Huaranchal', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130606', N'La Cuesta', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130608', N'Mache', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130610', N'Paranday', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130611', N'Salpo', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130613', N'Sinsicap', N'1306', N'13')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130614', N'Usquil', N'1306', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130701', N'San Pedro de Lloc', N'1307', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130702', N'Guadalupe', N'1307', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130703', N'Jequetepeque', N'1307', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130704', N'Pacasmayo', N'1307', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130705', N'San José', N'1307', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130801', N'Tayabamba', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130802', N'Buldibuyo', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130803', N'Chillia', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130804', N'Huancaspata', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130805', N'Huaylillas', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130806', N'Huayo', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130807', N'Ongon', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130808', N'Parcoy', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130809', N'Pataz', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130810', N'Pias', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130811', N'Santiago de Challas', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130812', N'Taurija', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130813', N'Urpay', N'1308', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130901', N'Huamachuco', N'1309', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130902', N'Chugay', N'1309', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130903', N'Cochorco', N'1309', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130904', N'Curgos', N'1309', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130905', N'Marcabal', N'1309', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130906', N'Sanagoran', N'1309', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130907', N'Sarin', N'1309', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'130908', N'Sartimbamba', N'1309', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131001', N'Santiago de Chuco', N'1310', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131002', N'Angasmarca', N'1310', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131003', N'Cachicadan', N'1310', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131004', N'Mollebamba', N'1310', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131005', N'Mollepata', N'1310', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131006', N'Quiruvilca', N'1310', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131007', N'Santa Cruz de Chuca', N'1310', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131008', N'Sitabamba', N'1310', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131101', N'Cascas', N'1311', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131102', N'Lucma', N'1311', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131103', N'Marmot', N'1311', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131104', N'Sayapullo', N'1311', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131201', N'Viru', N'1312', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131202', N'Chao', N'1312', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'131203', N'Guadalupito', N'1312', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140101', N'Chiclayo', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140102', N'Chongoyape', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140103', N'Eten', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140104', N'Eten Puerto', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140105', N'José Leonardo Ortiz', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140106', N'La Victoria', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140107', N'Lagunas', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140108', N'Monsefu', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140109', N'Nueva Arica', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140110', N'Oyotun', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140111', N'Picsi', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140112', N'Pimentel', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140113', N'Reque', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140114', N'Santa Rosa', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140115', N'Saña', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140116', N'Cayalti', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140117', N'Patapo', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140118', N'Pomalca', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140119', N'Pucala', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140120', N'Tuman', N'1401', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140201', N'Ferreñafe', N'1402', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140202', N'Cañaris', N'1402', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140203', N'Incahuasi', N'1402', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140204', N'Manuel Antonio Mesones Muro', N'1402', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140205', N'Pitipo', N'1402', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140206', N'Pueblo Nuevo', N'1402', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140301', N'Lambayeque', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140302', N'Chochope', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140303', N'Illimo', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140304', N'Jayanca', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140305', N'Mochumi', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140306', N'Morrope', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140307', N'Motupe', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140308', N'Olmos', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140309', N'Pacora', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140310', N'Salas', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140311', N'San José', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'140312', N'Tucume', N'1403', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150101', N'Lima', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150102', N'Ancón', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150103', N'Ate', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150104', N'Barranco', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150105', N'Breña', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150106', N'Carabayllo', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150107', N'Chaclacayo', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150108', N'Chorrillos', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150109', N'Cieneguilla', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150110', N'Comas', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150111', N'El Agustino', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150112', N'Independencia', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150113', N'Jesús María', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150114', N'La Molina', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150115', N'La Victoria', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150116', N'Lince', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150117', N'Los Olivos', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150118', N'Lurigancho', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150119', N'Lurin', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150120', N'Magdalena del Mar', N'1501', N'15')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150121', N'Pueblo Libre', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150122', N'Miraflores', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150123', N'Pachacamac', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150124', N'Pucusana', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150125', N'Puente Piedra', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150126', N'Punta Hermosa', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150127', N'Punta Negra', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150128', N'Rímac', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150129', N'San Bartolo', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150130', N'San Borja', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150131', N'San Isidro', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150132', N'San Juan de Lurigancho', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150133', N'San Juan de Miraflores', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150134', N'San Luis', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150135', N'San Martín de Porres', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150136', N'San Miguel', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150137', N'Santa Anita', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150138', N'Santa María del Mar', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150139', N'Santa Rosa', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150140', N'Santiago de Surco', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150141', N'Surquillo', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150142', N'Villa El Salvador', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150143', N'Villa María del Triunfo', N'1501', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150201', N'Barranca', N'1502', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150202', N'Paramonga', N'1502', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150203', N'Pativilca', N'1502', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150204', N'Supe', N'1502', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150205', N'Supe Puerto', N'1502', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150301', N'Cajatambo', N'1503', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150302', N'Copa', N'1503', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150303', N'Gorgor', N'1503', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150304', N'Huancapon', N'1503', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150305', N'Manas', N'1503', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150401', N'Canta', N'1504', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150402', N'Arahuay', N'1504', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150403', N'Huamantanga', N'1504', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150404', N'Huaros', N'1504', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150405', N'Lachaqui', N'1504', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150406', N'San Buenaventura', N'1504', N'15')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'150407', N'Santa Rosa de Quives', N'1504', N'15')
GO
SET IDENTITY_INSERT [dbo].[MARCA] ON 

INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (24, N'LG', 1, CAST(N'2023-11-06T15:50:56.473' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (25, N'SAMGSUNG', 1, CAST(N'2023-11-06T15:51:10.860' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (26, N'XIAOMI', 1, CAST(N'2023-11-06T15:51:17.970' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (27, N'PHILIPS', 1, CAST(N'2023-11-06T15:51:24.467' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (28, N'CANON', 1, CAST(N'2023-11-06T15:51:30.090' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (29, N'NIKON', 1, CAST(N'2023-11-06T15:51:34.720' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (30, N'MOTOROLA', 1, CAST(N'2023-11-06T15:51:45.450' AS DateTime))
SET IDENTITY_INSERT [dbo].[MARCA] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 

INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (27, N'moto e 22i', N'celular 48MP', 30, 9, CAST(799.00 AS Decimal(10, 2)), 15, N'~/Imagenes/Productos/27.jpg', 1, CAST(N'2023-11-06T15:53:13.850' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (28, N'moto g 22', N'celular 50MP', 30, 9, CAST(999.90 AS Decimal(10, 2)), 15, N'~/Imagenes/Productos/28.jpg', 1, CAST(N'2023-11-06T15:55:27.340' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (29, N'moto g 33', N'celular 16GB RAM', 30, 9, CAST(1199.90 AS Decimal(10, 2)), 19, N'~/Imagenes/Productos/29.jpg', 1, CAST(N'2023-11-06T15:56:32.343' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (30, N'moto g 4', N'celular 5000 MAH', 30, 9, CAST(599.90 AS Decimal(10, 2)), 14, N'~/Imagenes/Productos/30.jpg', 1, CAST(N'2023-11-06T15:58:45.037' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (31, N'moto g 22 lte', N'celular 128 GB 48 MP 4K', 30, 9, CAST(1499.90 AS Decimal(10, 2)), 15, N'~/Imagenes/Productos/31.jpg', 1, CAST(N'2023-11-06T16:00:38.990' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0101', N'Chachapoyas', N'01')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0102', N'Bagua', N'01')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0103', N'Bongará', N'01')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0104', N'Condorcanqui', N'01')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0105', N'Luya', N'01')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0106', N'Rodríguez de Mendoza', N'01')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0107', N'Utcubamba', N'01')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0201', N'Huaraz', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0202', N'Aija', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0203', N'Antonio Raymondi', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0204', N'Asunción', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0205', N'Bolognesi', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0206', N'Carhuaz', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0207', N'Carlos Fermín Fitzcarrald', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0208', N'Casma', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0209', N'Corongo', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0210', N'Huari', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0211', N'Huarmey', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0212', N'Huaylas', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0213', N'Mariscal Luzuriaga', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0214', N'Ocros', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0215', N'Pallasca', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0216', N'Pomabamba', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0217', N'Recuay', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0218', N'Santa', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0219', N'Sihuas', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0220', N'Yungay', N'02')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0301', N'Abancay', N'03')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0302', N'Andahuaylas', N'03')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0303', N'Antabamba', N'03')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0304', N'Aymaraes', N'03')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0305', N'Cotabambas', N'03')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0306', N'Chincheros', N'03')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0307', N'Grau', N'03')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0401', N'Arequipa', N'04')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0402', N'Camaná', N'04')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0403', N'Caravelí', N'04')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0404', N'Castilla', N'04')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0405', N'Caylloma', N'04')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0406', N'Condesuyos', N'04')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0407', N'Islay', N'04')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0408', N'La Uniòn', N'04')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0501', N'Huamanga', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0502', N'Cangallo', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0503', N'Huanca Sancos', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0504', N'Huanta', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0505', N'La Mar', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0506', N'Lucanas', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0507', N'Parinacochas', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0508', N'Pàucar del Sara Sara', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0509', N'Sucre', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0510', N'Víctor Fajardo', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0511', N'Vilcas Huamán', N'05')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0601', N'Cajamarca', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0602', N'Cajabamba', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0603', N'Celendín', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0604', N'Chota', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0605', N'Contumazá', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0606', N'Cutervo', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0607', N'Hualgayoc', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0608', N'Jaén', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0609', N'San Ignacio', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0610', N'San Marcos', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0611', N'San Miguel', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0612', N'San Pablo', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0613', N'Santa Cruz', N'06')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0701', N'Prov. Const. del Callao', N'07')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0801', N'Cusco', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0802', N'Acomayo', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0803', N'Anta', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0804', N'Calca', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0805', N'Canas', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0806', N'Canchis', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0807', N'Chumbivilcas', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0808', N'Espinar', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0809', N'La Convención', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0810', N'Paruro', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0811', N'Paucartambo', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0812', N'Quispicanchi', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0813', N'Urubamba', N'08')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0901', N'Huancavelica', N'09')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0902', N'Acobamba', N'09')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0903', N'Angaraes', N'09')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0904', N'Castrovirreyna', N'09')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0905', N'Churcampa', N'09')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0906', N'Huaytará', N'09')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0907', N'Tayacaja', N'09')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1001', N'Huánuco', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1002', N'Ambo', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1003', N'Dos de Mayo', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1004', N'Huacaybamba', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1005', N'Huamalíes', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1006', N'Leoncio Prado', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1007', N'Marañón', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1008', N'Pachitea', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1009', N'Puerto Inca', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1010', N'Lauricocha ', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1011', N'Yarowilca ', N'10')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1101', N'Ica ', N'11')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1102', N'Chincha ', N'11')
GO
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1103', N'Nasca ', N'11')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1104', N'Palpa ', N'11')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1105', N'Pisco ', N'11')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1201', N'Huancayo ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1202', N'Concepción ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1203', N'Chanchamayo ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1204', N'Jauja ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1205', N'Junín ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1206', N'Satipo ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1207', N'Tarma ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1208', N'Yauli ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1209', N'Chupaca ', N'12')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1301', N'Trujillo ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1302', N'Ascope ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1303', N'Bolívar ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1304', N'Chepén ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1305', N'Julcán ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1306', N'Otuzco ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1307', N'Pacasmayo ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1308', N'Pataz ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1309', N'Sánchez Carrión ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1310', N'Santiago de Chuco ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1311', N'Gran Chimú ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1312', N'Virú ', N'13')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1401', N'Chiclayo ', N'14')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1402', N'Ferreñafe ', N'14')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1403', N'Lambayeque ', N'14')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1501', N'Lima ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1502', N'Barranca ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1503', N'Cajatambo ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1504', N'Canta ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1505', N'Cañete ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1506', N'Huaral ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1507', N'Huarochirí ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1508', N'Huaura ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1509', N'Oyón ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1510', N'Yauyos ', N'15')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1601', N'Maynas ', N'16')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1602', N'Alto Amazonas ', N'16')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1603', N'Loreto ', N'16')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1604', N'Mariscal Ramón Castilla ', N'16')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1605', N'Requena ', N'16')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1606', N'Ucayali ', N'16')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1607', N'Datem del Marañón ', N'16')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1608', N'Putumayo', N'16')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1701', N'Tambopata ', N'17')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1702', N'Manu ', N'17')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1703', N'Tahuamanu ', N'17')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1801', N'Mariscal Nieto ', N'18')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1802', N'General Sánchez Cerro ', N'18')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1803', N'Ilo ', N'18')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1901', N'Pasco ', N'19')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1902', N'Daniel Alcides Carrión ', N'19')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'1903', N'Oxapampa ', N'19')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2001', N'Piura ', N'20')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2002', N'Ayabaca ', N'20')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2003', N'Huancabamba ', N'20')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2004', N'Morropón ', N'20')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2005', N'Paita ', N'20')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2006', N'Sullana ', N'20')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2007', N'Talara ', N'20')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2008', N'Sechura ', N'20')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2101', N'Puno ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2102', N'Azángaro ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2103', N'Carabaya ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2104', N'Chucuito ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2105', N'El Collao ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2106', N'Huancané ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2107', N'Lampa ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2108', N'Melgar ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2109', N'Moho ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2110', N'San Antonio de Putina ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2111', N'San Román ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2112', N'Sandia ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2113', N'Yunguyo ', N'21')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2201', N'Moyobamba ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2202', N'Bellavista ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2203', N'El Dorado ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2204', N'Huallaga ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2205', N'Lamas ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2206', N'Mariscal Cáceres ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2207', N'Picota ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2208', N'Rioja ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2209', N'San Martín ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2210', N'Tocache ', N'22')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2301', N'Tacna ', N'23')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2302', N'Candarave ', N'23')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2303', N'Jorge Basadre ', N'23')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2304', N'Tarata ', N'23')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2401', N'Tumbes ', N'24')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2402', N'Contralmirante Villar ', N'24')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2403', N'Zarumilla ', N'24')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2501', N'Coronel Portillo ', N'25')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2502', N'Atalaya ', N'25')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2503', N'Padre Abad ', N'25')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'2504', N'Purús', N'25')
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Contrasena], [EsAdministrador], [Activo], [FechaRegistro]) VALUES (1, N'test', N'user', N'admin@example.com', N'admin123', 1, 1, CAST(N'2023-11-05T23:26:13.513' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Contrasena], [EsAdministrador], [Activo], [FechaRegistro]) VALUES (2, N'jor', N'ca', N'jcayetano@email.com', N'123', 0, 1, CAST(N'2023-11-05T23:59:01.073' AS DateTime))
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT (getdate()) FOR [FechaCompra]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[COMPRA] ([IdCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[MARCA] ([IdMarca])
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarRutaImagen]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_actualizarRutaImagen](
@IdProducto int,
@RutaImagen varchar(500)
)
as
begin
	update PRODUCTO set RutaImagen = @RutaImagen where IdProducto = @IdProducto
end


GO
/****** Object:  StoredProcedure [dbo].[sp_editarProducto]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_editarProducto](
@IdProducto int,
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion and IdProducto != @IdProducto)
	begin
		update PRODUCTO set 
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdMarca = @IdMarca,
		IdCategoria = @IdCategoria,
		Precio =@Precio ,
		Stock =@Stock ,
		Activo = @Activo where IdProducto = @IdProducto

		SET @Resultado =1
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCarrito]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_InsertarCarrito](
@IdUsuario int,
@IdProducto int,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from CARRITO where IdProducto = @IdProducto and IdUsuario = @IdUsuario)
	begin
		update PRODUCTO set Stock = Stock -1 where IdProducto = @IdProducto
		insert into CARRITO(IdUsuario,IdProducto) values ( @IdUsuario,@IdProducto)
		set @Resultado = 1
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCategoria]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[sp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end



GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarMarca]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR MARCA
create procedure [dbo].[sp_ModificarMarca](
@IdMarca int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion =@Descripcion and IdMarca != @IdMarca)
		
		update MARCA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCarrito]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ObtenerCarrito](
@IdUsuario int
)
as
begin
	select c.IdCarrito, p.IdProducto,m.Descripcion,p.Nombre,p.Precio,p.RutaImagen from carrito c
	inner join PRODUCTO p on p.IdProducto = c.IdProducto
	inner join MARCA m on m.IdMarca = p.IdMarca
	where c.IdUsuario = @IdUsuario
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerCategoria]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerCategoria]
as
begin
 select * from CATEGORIA
end



GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCompra]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ObtenerCompra](
@IdUsuario int)
as
begin
select c.Total,convert(char(10),c.FechaCompra,103)[Fecha],

(select m.Descripcion, p.Nombre,p.RutaImagen,dc.Total,dc.Cantidad from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
inner join MARCA m on m.IdMarca = p.IdMarca
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from compra c
where c.IdUsuario = @IdUsuario
FOR XML PATH('COMPRA'), ROOT('DATA') 
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMarca]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerMarca]
as
begin
 select * from MARCA
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerProducto]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerProducto]
as
begin
 select p.*,m.Descripcion[DescripcionMarca],c.Descripcion[DescripcionCategoria] from PRODUCTO p
 inner join marca m on m.IdMarca = p.IdMarca
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria

end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuario]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_obtenerUsuario](
@Correo varchar(100),
@Contrasena varchar(100)
)
as
begin
	IF EXISTS (SELECT * FROM usuario WHERE correo = @Correo and contrasena = @Contrasena)
	begin
		SELECT IdUsuario,Nombres,Apellidos,Correo,Contrasena,EsAdministrador FROM usuario WHERE correo = @Correo and contrasena = @Contrasena
	end
end



GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[sp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarCompra]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[sp_registrarCompra](
@IdUsuario int,
@TotalProducto int,
@Total decimal(10,2),
@Contacto varchar(100),
@Telefono varchar(100),
@Direccion varchar(100),
@IdDistrito varchar(10),
@QueryDetalleCompra nvarchar(max),
@Resultado bit output
)
as
begin
	begin try
		SET @Resultado = 0
		begin transaction
		
		declare @idcompra int = 0
		insert into COMPRA(IdUsuario,TotalProducto,Total,Contacto,Telefono,Direccion,IdDistrito) values
		(@IdUsuario,@TotalProducto,@Total,@Contacto,@Telefono,@Direccion,@IdDistrito)

		set @idcompra = scope_identity()

		set @QueryDetalleCompra = replace(@QueryDetalleCompra,'¡idcompra!',@idcompra)

		EXECUTE sp_executesql @QueryDetalleCompra

		delete from CARRITO where IdUsuario = @IdUsuario

		SET @Resultado = 1

		commit
	end try
	begin catch
		rollback
		SET @Resultado = 0
	end catch
end


GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMarca]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR MARCA
CREATE PROC [dbo].[sp_RegistrarMarca](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)

		insert into MARCA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarProducto]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarProducto](
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@RutaImagen varchar(500),
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion)
	begin
		insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values (
		@Nombre,@Descripcion,@IdMarca,@IdCategoria,@Precio,@Stock,@RutaImagen)

		SET @Resultado = scope_identity()
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarUsuario]    Script Date: 8/11/2023 15:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarUsuario](
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Contrasena varchar(100),
@EsAdministrador bit,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	begin
		insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values
		(@Nombres,@Apellidos,@Correo,@Contrasena,@EsAdministrador)

		SET @Resultado = scope_identity()
	end
end

GO
USE [master]
GO
ALTER DATABASE [DB_CARRITO] SET  READ_WRITE 
GO
