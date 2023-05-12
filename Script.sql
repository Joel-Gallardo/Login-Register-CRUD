﻿USE [master]
GO
/****** Object:  Database [ASP_SP]    Script Date: 24/2/2022 22:45:48 ******/
CREATE DATABASE [ASP_SP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASP_SP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASP_SP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASP_SP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASP_SP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASP_SP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASP_SP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASP_SP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASP_SP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASP_SP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASP_SP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASP_SP] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASP_SP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASP_SP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASP_SP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASP_SP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASP_SP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASP_SP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASP_SP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASP_SP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASP_SP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASP_SP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASP_SP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASP_SP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASP_SP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASP_SP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASP_SP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASP_SP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASP_SP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASP_SP] SET RECOVERY FULL 
GO
ALTER DATABASE [ASP_SP] SET  MULTI_USER 
GO
ALTER DATABASE [ASP_SP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASP_SP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASP_SP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASP_SP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASP_SP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASP_SP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASP_SP', N'ON'
GO
ALTER DATABASE [ASP_SP] SET QUERY_STORE = OFF
GO
USE [ASP_SP]
GO
/****** Object:  Table [dbo].[Imagenes]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
	[IdUsuario] [int] NULL,
	[Imagen] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[Usuario] [varchar](50) NULL,
	[Clave] [varbinary](max) NULL
) 
select * from Usuarios
ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CambiarContrasenia]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CambiarContrasenia]
@id int,
@Clave varchar(100),
@Patron varchar(50)
as
begin
update Usuarios set Clave=(ENCRYPTBYPASSPHRASE(@Patron, @Clave)) where Id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[CambiarImagen]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CambiarImagen]
@Id int,
@Imagen image
as
begin
update Imagenes set Imagen=@Imagen where IdUsuario=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[CargarImagen]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CargarImagen]
@id int
as
begin
select Imagen from Imagenes where IdUsuario=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[ContarUsuario]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ContarUsuario]
@usuario varchar(50)
as
begin

select count(*) from Usuarios where Usuario=@usuario
end
GO
/****** Object:  StoredProcedure [dbo].[Eliminar]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Eliminar]
@Id int
as
begin
delete from Usuarios where Id=@Id;
delete from Imagenes where IdUsuario=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Perfil]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Perfil]
@Id int
as
begin
select*from Usuarios where Id=@Id;
select* from Imagenes where IdUsuario=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Registrar]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Registrar]
@Nombres varchar(50),
@Apellidos varchar(50),
@Fecha date,
@Usuario varchar(50),
@Clave varchar(100),
@Patron varchar(50),
@IdUsuario int, 
@Imagen image
as
begin
insert into Usuarios values(@Nombres, @Apellidos, @Fecha, @Usuario, ENCRYPTBYPASSPHRASE(@Patron, @Clave));
set @IdUsuario=(select Id from Usuarios where Usuario=@Usuario);
insert into Imagenes values(@IdUsuario, @Imagen)
end
GO

select Id from Usuarios where Usuario=0;
/****** Object:  StoredProcedure [dbo].[Validar]    Script Date: 24/2/2022 22:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Validar]

@Usuario varchar(50),
@Clave varchar(100),
@Patron varchar(50)
as
begin
select*from Usuarios where Usuario=@Usuario and Convert(varchar(100), DECRYPTBYPASSPHRASE(@Patron, Clave))=@Clave
end
GO
USE [master]
GO
ALTER DATABASE [ASP_SP] SET  READ_WRITE 
GO

--consultar definicion de un procedimiento almacenado especifico
sp_helptext '[CambiarContrasenia]'

--consultar nombre de todos los procedimientos almacenados creados en la bd
SELECT name
FROM sys.procedures
WHERE type_desc = 'SQL_STORED_PROCEDURE'

--consultar nombre de todos los procedimientos almacenados creados en la bd y su definicion
SELECT OBJECT_NAME(object_id) AS ProcedureName, definition AS ProcedureDefinition
FROM sys.sql_modules
WHERE objectproperty(object_id, 'IsProcedure') = 1
