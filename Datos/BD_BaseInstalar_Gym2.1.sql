
--Create database

USE [master]
GO
IF NOT EXISTS (SELECT [name] FROM sys.databases WHERE name = N'Gym')
BEGIN
CREATE DATABASE [Gym] COLLATE Modern_Spanish_CI_AS
END
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'Gym', @new_cmptlevel=120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
	EXEC [Gym].[dbo].[sp_fulltext_database] @action = 'enable'
END
GO
ALTER DATABASE [Gym] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Gym] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Gym] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Gym] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Gym] SET ARITHABORT OFF
GO
ALTER DATABASE [Gym] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Gym] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Gym] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Gym] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Gym] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Gym] SET CURSOR_DEFAULT GLOBAL
GO
ALTER DATABASE [Gym] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Gym] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Gym] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Gym] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Gym] SET DISABLE_BROKER
GO
ALTER DATABASE [Gym] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Gym] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Gym] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Gym] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Gym] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Gym] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Gym] SET READ_WRITE
GO
ALTER DATABASE [Gym] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Gym] SET MULTI_USER
GO
ALTER DATABASE [Gym] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Gym] SET DB_CHAINING OFF
GO

USE [Gym]
GO

--Table dbo.TBL_MODULOS

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TBL_MODULOS] (
	[ID_MODULO] [int] NOT NULL IDENTITY (1, 1),
	[DESCRIPCION] [varchar](50) NOT NULL);
GO

--Table dbo.TBL_PERFILES

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TBL_PERFILES] (
	[ID_PERFIL] [int] NOT NULL IDENTITY (1, 1),
	[PERFIL] [varchar](50) NOT NULL,
	[ACTIVO] [bit] NOT NULL CONSTRAINT [DF_TBL_PERFILES_ACTIVO] DEFAULT ((1)),
	[CREADO] [datetime] NOT NULL CONSTRAINT [DF_TBL_PERFILES_CREADO] DEFAULT (getdate()),
	[CREADOPOR] [varchar](50) NOT NULL CONSTRAINT [DF_TBL_PERFILES_CREADOPOR] DEFAULT ('SISTEMA'),
	[ACTUALIZADO] [datetime] NOT NULL CONSTRAINT [DF_TBL_PERFILES_ACTUALIZADO] DEFAULT (getdate()),
	[ACTUALIZADOPOR] [varchar](50) NOT NULL CONSTRAINT [DF_TBL_PERFILES_ACTUALIZADOPOR] DEFAULT ('SISTEMA'));
GO

SET IDENTITY_INSERT [dbo].[TBL_PERFILES] ON
GO
INSERT INTO [dbo].[TBL_PERFILES] ([ID_PERFIL], [PERFIL], [ACTIVO], [CREADO], [CREADOPOR], [ACTUALIZADO], [ACTUALIZADOPOR])
	VALUES (1, N'Administrador', CAST ('True' AS bit), CAST(0x0000a57e00f24412 AS datetime), N'SISTEMA', CAST(0x0000a57e00f24412 AS datetime), N'SISTEMA')

GO
INSERT INTO [dbo].[TBL_PERFILES] ([ID_PERFIL], [PERFIL], [ACTIVO], [CREADO], [CREADOPOR], [ACTUALIZADO], [ACTUALIZADOPOR])
	VALUES (2, N'Socio', CAST ('True' AS bit), CAST(0x0000a3fd00000000 AS datetime), N'Sistema', CAST(0x0000a57e00f27f4e AS datetime), N'Sistema')

GO
INSERT INTO [dbo].[TBL_PERFILES] ([ID_PERFIL], [PERFIL], [ACTIVO], [CREADO], [CREADOPOR], [ACTUALIZADO], [ACTUALIZADOPOR])
	VALUES (3, N'Recepcionista', CAST ('True' AS bit), CAST(0x0000a58400e0b0f6 AS datetime), N'SISTEMA', CAST(0x0000a58400e0b0f6 AS datetime), N'SISTEMA')

GO
INSERT INTO [dbo].[TBL_PERFILES] ([ID_PERFIL], [PERFIL], [ACTIVO], [CREADO], [CREADOPOR], [ACTUALIZADO], [ACTUALIZADOPOR])
	VALUES (4, N'Empleado', CAST ('True' AS bit), CAST(0x0000a5b100f0febf AS datetime), N'SISTEMA', CAST(0x0000a5b100f0febf AS datetime), N'SISTEMA')

GO
SET IDENTITY_INSERT [dbo].[TBL_PERFILES] OFF
GO

--Table dbo.TBL_REL_PERFIL_MODULO

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TBL_REL_PERFIL_MODULO] (
	[ID_REL] [int] NOT NULL IDENTITY (1, 1),
	[ID_PERFIL] [int] NOT NULL,
	[ID_MODULO] [int] NOT NULL,
	[CONTROL_TOTAL] [bit] NOT NULL CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_CONTROL_TOTAL] DEFAULT ((0)),
	[ACTIVO] [bit] NOT NULL CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_ACTIVO] DEFAULT ((1)),
	[CREADO] [datetime] NOT NULL CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_CREADO] DEFAULT (getdate()),
	[CREADOPOR] [varchar](50) NOT NULL CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_CREADOPOR] DEFAULT ('SISTEMA'),
	[ACTUALIZADO] [datetime] NOT NULL CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_ACTUALIZADO] DEFAULT (getdate()),
	[ACTUALIZADOPOR] [varchar](50) NOT NULL CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_ACTUALIZADOPOR] DEFAULT ('SISTEMA'));
GO

--Table dbo.TBL_USUARIOS

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TBL_USUARIOS] (
	[ID_USUARIO] [int] NOT NULL IDENTITY (1, 1),
	[NOMBRE] [varchar](100) NOT NULL,
	[APELLIDO_PAT] [varchar](100) NULL,
	[APELLIDO_MAT] [varchar](100) NULL,
	[ID_AREA] [int] NOT NULL,
	[USUARIO] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
	[ID_PERFIL] [int] NOT NULL,
	[ACTIVO] [bit] NOT NULL CONSTRAINT [DF_TBL_USUARIOS_ACTIVO] DEFAULT ((1)),
	[CREADO] [datetime] NOT NULL CONSTRAINT [DF_TBL_USUARIOS_CREADO] DEFAULT (getdate()),
	[CREADOPOR] [varchar](50) NOT NULL CONSTRAINT [DF_TBL_USUARIOS_CREADOPOR] DEFAULT ('SISTEMA'),
	[ACTUALIZADO] [datetime] NOT NULL CONSTRAINT [DF_TBL_USUARIOS_ACTUALIZADO] DEFAULT (getdate()),
	[ACTUALIZADOPOR] [varchar](50) NOT NULL CONSTRAINT [DF_TBL_USUARIOS_ACTUALIZADOPOR] DEFAULT ('SISTEMA'));
GO

SET IDENTITY_INSERT [dbo].[TBL_USUARIOS] ON
GO
INSERT INTO [dbo].[TBL_USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO_PAT], [APELLIDO_MAT], [ID_AREA], [USUARIO], [PASSWORD], [ID_PERFIL], [ACTIVO], [CREADO], [CREADOPOR], [ACTUALIZADO], [ACTUALIZADOPOR])
	VALUES (1, N'Administrador', N'Sistema', N'Sistema', 1, N'Admin', N'holamundo', 1, CAST ('True' AS bit), CAST(0x0000a57e00f2f66c AS datetime), N'SISTEMA', CAST(0x0000a57e00f2f66c AS datetime), N'SISTEMA')

GO
INSERT INTO [dbo].[TBL_USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO_PAT], [APELLIDO_MAT], [ID_AREA], [USUARIO], [PASSWORD], [ID_PERFIL], [ACTIVO], [CREADO], [CREADOPOR], [ACTUALIZADO], [ACTUALIZADOPOR])
	VALUES (2, N'Oly', N'Martínez', N'Pinedo', 1, N'Oly', N'veyna', 1, CAST ('True' AS bit), CAST(0x0000a584014d5774 AS datetime), N'Admin', CAST(0x0000a584014d5774 AS datetime), N'Admin')

GO
INSERT INTO [dbo].[TBL_USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO_PAT], [APELLIDO_MAT], [ID_AREA], [USUARIO], [PASSWORD], [ID_PERFIL], [ACTIVO], [CREADO], [CREADOPOR], [ACTUALIZADO], [ACTUALIZADOPOR])
	VALUES (3, N'Normix', N'Mendoza', N'Nava', 1, N'Normix', N'normix', 3, CAST ('True' AS bit), CAST(0x0000a584014d9050 AS datetime), N'Admin', CAST(0x0000a584014d9050 AS datetime), N'Admin')

GO
SET IDENTITY_INSERT [dbo].[TBL_USUARIOS] OFF
GO

--Table dbo.TblAsignacion

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblAsignacion] (
	[id_asignacion] [int] NOT NULL IDENTITY (1, 1),
	[id_socio] [int] NOT NULL,
	[id_paquete] [int] NOT NULL,
	[fecha_asignacion] [datetime] NOT NULL CONSTRAINT [DF_TblAsignacion_Asigna] DEFAULT (getdate()),
	[fecha_vigencia] [datetime] NOT NULL CONSTRAINT [DF_TblAsignacion_VigenciA] DEFAULT (getdate()),
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblAsignacion_MOdificacion] DEFAULT (getdate()),
	[fecha_cancelacion] [datetime] NULL CONSTRAINT [DF_TblAsignacion_cancelacion] DEFAULT (getdate()));
GO

--Table dbo.TblChecador

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblChecador] (
	[id_entrada_salida] [int] NOT NULL IDENTITY (1, 1),
	[id_empleado] [int] NOT NULL,
	[entrada] [datetime] NOT NULL CONSTRAINT [DF_TblChecador_Vigencia] DEFAULT (getdate()),
	[salida] [datetime] NOT NULL CONSTRAINT [DF_TblChecador_Salida] DEFAULT (getdate()),
	[fecha_registro] [datetime] NOT NULL CONSTRAINT [DF_TblChecador_Registro] DEFAULT (getdate()),
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblChecador_Modificacion] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblChecador] ON
GO
INSERT INTO [dbo].[TblChecador] ([id_entrada_salida], [id_empleado], [entrada], [salida], [fecha_registro], [activo], [fecha_modificacion])
	VALUES (2, 2, CAST(0x0000a5ee001a4d43 AS datetime), CAST(0x0000000000000000 AS datetime), CAST(0x0000a5ee001a4d43 AS datetime), CAST ('True' AS bit), CAST(0x0000a5ee001a4d43 AS datetime))

GO
INSERT INTO [dbo].[TblChecador] ([id_entrada_salida], [id_empleado], [entrada], [salida], [fecha_registro], [activo], [fecha_modificacion])
	VALUES (3, 2, CAST(0x0000a5ee001aed1d AS datetime), CAST(0x0000000000000000 AS datetime), CAST(0x0000a5ee001aed1d AS datetime), CAST ('True' AS bit), CAST(0x0000a5ee001aed1d AS datetime))

GO
INSERT INTO [dbo].[TblChecador] ([id_entrada_salida], [id_empleado], [entrada], [salida], [fecha_registro], [activo], [fecha_modificacion])
	VALUES (4, 2, CAST(0x0000a5ee001c965c AS datetime), CAST(0x0000a5ee00212460 AS datetime), CAST(0x0000a5ee001c9718 AS datetime), CAST ('True' AS bit), CAST(0x0000a5ee00212579 AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblChecador] OFF
GO

--Table dbo.TblChecadorSocio

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblChecadorSocio] (
	[id_entrada_salida] [int] NOT NULL IDENTITY (1, 1),
	[id_socio] [int] NOT NULL,
	[entrada] [datetime] NOT NULL CONSTRAINT [DF_TblChecadorSocio_Vigencia] DEFAULT (getdate()),
	[salida] [datetime] NOT NULL CONSTRAINT [DF_TblChecadorSocio_Salida] DEFAULT (getdate()),
	[fecha_registro] [datetime] NOT NULL CONSTRAINT [DF_TblChecadorSocio_Registro] DEFAULT (getdate()),
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblChecadorSocio_Modificacion] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblChecadorSocio] ON
GO
INSERT INTO [dbo].[TblChecadorSocio] ([id_entrada_salida], [id_socio], [entrada], [salida], [fecha_registro], [activo], [fecha_modificacion])
	VALUES (1, 1, CAST(0x0000a5ed00000000 AS datetime), CAST(0x0000a5ed00000000 AS datetime), CAST(0x0000a5ed0177f6ef AS datetime), CAST ('True' AS bit), CAST(0x0000a5ed018a203b AS datetime))

GO
INSERT INTO [dbo].[TblChecadorSocio] ([id_entrada_salida], [id_socio], [entrada], [salida], [fecha_registro], [activo], [fecha_modificacion])
	VALUES (2, 1, CAST(0x0000a5ed017812de AS datetime), CAST(0x0000000000000000 AS datetime), CAST(0x0000a5ed017812de AS datetime), CAST ('True' AS bit), CAST(0x0000a5ed017812de AS datetime))

GO
INSERT INTO [dbo].[TblChecadorSocio] ([id_entrada_salida], [id_socio], [entrada], [salida], [fecha_registro], [activo], [fecha_modificacion])
	VALUES (3, 1, CAST(0x0000a5ed01786a1c AS datetime), CAST(0x0000a5ee002add70 AS datetime), CAST(0x0000a5ed01786b3f AS datetime), CAST ('True' AS bit), CAST(0x0000a5ee002adda7 AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblChecadorSocio] OFF
GO

--Table dbo.TblEmpleado

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblEmpleado] (
	[id_empleado] [int] NOT NULL IDENTITY (1, 1),
	[num_empleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[ap_paterno] [varchar](50) NOT NULL,
	[ap_materno] [varchar](50) NOT NULL,
	[direccion] [text] NOT NULL,
	[fecha_registro] [datetime] NOT NULL CONSTRAINT [DF_TblEmpleado_Registro] DEFAULT (getdate()),
	[fecha_baja] [datetime] NOT NULL CONSTRAINT [DF_TblEmpleado_baja] DEFAULT (getdate()),
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblEmpleado_Modificacion] DEFAULT (getdate()),
	[id_perfil] [int] NOT NULL,
	[telefono] [varchar](20) NULL);
GO

SET IDENTITY_INSERT [dbo].[TblEmpleado] ON
GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (1, 1, N'Administrador', N'Sistema', N'Sistema', N'Conocida', CAST(0x0000a57e00f621f8 AS datetime), CAST(0x0000a57e00f621f8 AS datetime), CAST ('True' AS bit), CAST(0x0000a57e00f621f8 AS datetime), 1, N'00000000')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (2, 2, N'Javier ', N'Martínez', N'Pinedo', N'Conocida', CAST(0x0000a57e00f621f8 AS datetime), CAST(0x0000a57e00f621f8 AS datetime), CAST ('True' AS bit), CAST(0x0000a57e00f621f8 AS datetime), 1, N'00000000')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (3, 3, N'Oliva', N'Pinedo', N'Martínez', N'', CAST(0x0000a58d01458760 AS datetime), CAST(0x0000a58d01458760 AS datetime), CAST ('True' AS bit), CAST(0x0000a58d01458760 AS datetime), 4, N'')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (4, 4, N'Norma', N'Nava', N'Mendoza', N'', CAST(0x0000a58d0145b6db AS datetime), CAST(0x0000a58d0145b6db AS datetime), CAST ('True' AS bit), CAST(0x0000a58d0145b6db AS datetime), 4, N'')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (5, 5, N'Eduardo', N'Ledesma', N'Colunga', N'', CAST(0x0000a58d0145e1ac AS datetime), CAST(0x0000a58d0145e1ac AS datetime), CAST ('True' AS bit), CAST(0x0000a58d0145e1ac AS datetime), 4, N'')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (6, 6, N'Aarón', N'Nava', N'Mendoza', N'', CAST(0x0000a58d01460d85 AS datetime), CAST(0x0000a58d01460d85 AS datetime), CAST ('True' AS bit), CAST(0x0000a58d01460d85 AS datetime), 4, N'')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (7, 7, N'Ernesto', N'Pinedo', N'Garay', N'', CAST(0x0000a58d01462227 AS datetime), CAST(0x0000a58d01462227 AS datetime), CAST ('True' AS bit), CAST(0x0000a58d01462227 AS datetime), 4, N'')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (8, 8, N'Gabriel', N'Soriano', N'Muñoz', N'', CAST(0x0000a58d0146362c AS datetime), CAST(0x0000a58d0146362c AS datetime), CAST ('True' AS bit), CAST(0x0000a58d0146362c AS datetime), 4, N'')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (9, 9, N'Rafael', N'Valdéz', N'Chairez', N'', CAST(0x0000a58d0146890e AS datetime), CAST(0x0000a58d0146890e AS datetime), CAST ('True' AS bit), CAST(0x0000a58d0146890e AS datetime), 4, N'')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (10, 10, N'Ana Maria', N'', N'', N'', CAST(0x0000a58d01469987 AS datetime), CAST(0x0000a58d01469987 AS datetime), CAST ('True' AS bit), CAST(0x0000a58d01469987 AS datetime), 4, N'')

GO
INSERT INTO [dbo].[TblEmpleado] ([id_empleado], [num_empleado], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [id_perfil], [telefono])
	VALUES (11, 11, N'Faleg Alejandro', N'Peralta', N'Martinez', N'Limas # 201', CAST(0x0000a5ed01176b72 AS datetime), CAST(0x0000a5ed01176b72 AS datetime), CAST ('True' AS bit), CAST(0x0000a5ed01176b72 AS datetime), 4, N'+524931162911')

GO
SET IDENTITY_INSERT [dbo].[TblEmpleado] OFF
GO

--Table dbo.TblHistorialFisico

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblHistorialFisico] (
	[id_historial_fisico] [int] NOT NULL IDENTITY (1, 1),
	[id_socio] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblHistorialFisico_Modificacion] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblHistorialFisico] ON
GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (1, 1, N'Gym', CAST ('True' AS bit), CAST(0x0000a59c01508ef2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (2, 2, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58d0147ef31 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (3, 3, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58d0147ef31 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (4, 4, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58d0147ef31 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (5, 5, N'Ciclismo', CAST ('True' AS bit), CAST(0x0000a58a00c748f9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (6, 6, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58a00c833b4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (7, 7, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b245d7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (8, 8, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00c9f6fc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (9, 9, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00cb1373 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (10, 10, N'', CAST ('False' AS bit), CAST(0x0000a58e00b259d7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (11, 11, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00cd8f3f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (12, 12, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a58a00cdfa73 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (13, 13, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00ce8b27 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (14, 14, N'', CAST ('True' AS bit), CAST(0x0000a58a00cface7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (15, 15, N'Basquetbol', CAST ('False' AS bit), CAST(0x0000a58e00b27ae3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (16, 16, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00d0cbd2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (17, 17, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b29272 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (18, 18, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00d20baf AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (19, 19, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00d20baf AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (20, 20, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b008bd729 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (21, 21, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b008c6387 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (22, 22, N'Correr', CAST ('True' AS bit), CAST(0x0000a58b008e1e32 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (23, 23, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b2af36 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (24, 24, N'Basquetbol', CAST ('False' AS bit), CAST(0x0000a58e00b2bf45 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (25, 25, N'', CAST ('True' AS bit), CAST(0x0000a58b00919576 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (26, 26, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a58b00944813 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (27, 27, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00951d62 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (28, 28, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b0095e20e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (29, 29, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b009aa25b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (30, 30, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b009ba574 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (31, 31, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b2d8ec AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (32, 32, N'Ciclismo', CAST ('True' AS bit), CAST(0x0000a58b009d1f5b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (33, 33, N'Natación', CAST ('True' AS bit), CAST(0x0000a58b009d8d0b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (34, 34, N'Gimnasio', CAST ('True' AS bit), CAST(0x0000a58b009f0a35 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (35, 35, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b009fc82d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (36, 36, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a0c2aa AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (37, 37, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a2817a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (38, 38, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a2f3e1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (39, 39, N'Natación', CAST ('True' AS bit), CAST(0x0000a58b00a75133 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (40, 40, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a7fa4a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (41, 41, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a879da AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (42, 42, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a8ff2e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (43, 43, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a95e16 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (44, 44, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c00ba7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (45, 45, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c0a55f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (46, 46, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b2fc10 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (48, 48, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c28c69 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (49, 49, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c3f2a7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (50, 50, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b30cfe AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (51, 51, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c471f7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (52, 52, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b31c65 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (53, 53, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c51692 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (54, 54, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c5f3dd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (55, 55, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c6b708 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (56, 56, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00cc857d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (57, 57, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00cda286 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (58, 58, N'Correr', CAST ('True' AS bit), CAST(0x0000a58b00ce8373 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (59, 59, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c007f35e5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (60, 60, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b33fa3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (61, 61, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58b0149ea11 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (62, 62, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c007f17a6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (63, 63, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c008069f0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (64, 64, N'', CAST ('True' AS bit), CAST(0x0000a58c0081b7dc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (65, 65, N'Tenis', CAST ('True' AS bit), CAST(0x0000a58c00915446 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (66, 66, N'Maratonista', CAST ('True' AS bit), CAST(0x0000a58c0092002e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (67, 67, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00929fbd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (68, 68, N'Karate y futbol', CAST ('True' AS bit), CAST(0x0000a58c00931d61 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (69, 69, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c0095893e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (70, 70, N'Futbol y ciclismo', CAST ('True' AS bit), CAST(0x0000a58c00970db3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (71, 71, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c0097e7b7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (72, 72, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00986c01 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (73, 73, N'Motociclismo', CAST ('True' AS bit), CAST(0x0000a58c009c282c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (74, 74, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00a0b77e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (75, 75, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58c00a14693 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (76, 76, N'Bmx', CAST ('True' AS bit), CAST(0x0000a58c00a2a116 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (77, 77, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00a3201d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (78, 78, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b39626 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (79, 79, N'Basquetbol y muai tai', CAST ('True' AS bit), CAST(0x0000a58c00a4dda5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (80, 80, N'Gimnasio y correr', CAST ('True' AS bit), CAST(0x0000a58c00a5582f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (81, 81, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b500df AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (82, 82, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b58e99 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (83, 83, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58c00b67b32 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (84, 84, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b6e6e3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (85, 85, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b78e8b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (86, 86, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b81840 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (87, 87, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b8a608 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (88, 88, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b924ed AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (89, 89, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b3bc1b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (90, 90, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58c00b9e7a5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (91, 91, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00bb6c8b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (92, 92, N'', CAST ('True' AS bit), CAST(0x0000a58c00bcfb3f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (93, 93, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00bf1a9b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (94, 94, N'Beisbol', CAST ('True' AS bit), CAST(0x0000a58c00bfa77e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (95, 95, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00c05dcb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (96, 96, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00c098af AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (97, 97, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00c10680 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (98, 98, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00d5547b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (99, 99, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00d5d384 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (100, 100, N'Correr', CAST ('True' AS bit), CAST(0x0000a58c00d66894 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (101, 101, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58c014cde99 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (102, 102, N'Ciclismo y Natación', CAST ('True' AS bit), CAST(0x0000a59101489f94 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (103, 103, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00a8488e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (104, 104, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b22439 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (105, 105, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e00ae18cb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (106, 106, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a5910149182c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (107, 107, N'Basquetbol', CAST ('False' AS bit), CAST(0x0000a58e00b3e61b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (108, 108, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e00b60cca AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (109, 109, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00c076d6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (110, 110, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00c131f4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (111, 111, N'Tenis', CAST ('True' AS bit), CAST(0x0000a58e00c1c3fc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (112, 112, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00c48d56 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (113, 113, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a58e00c70f36 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (114, 114, N'Raquet', CAST ('True' AS bit), CAST(0x0000a58e00c840c0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (115, 115, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00c8f52f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (116, 116, N'Motocross', CAST ('True' AS bit), CAST(0x0000a58e00ca848c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (117, 117, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e0112be17 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (118, 118, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01146eb8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (119, 119, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01180d55 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (120, 120, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58e0118fe80 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (121, 121, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e011a8f17 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (122, 122, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e011e7c00 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (123, 123, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0120ce7c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (124, 124, N'Spinning', CAST ('True' AS bit), CAST(0x0000a58e0122097f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (125, 125, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01229bb9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (126, 126, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58e01333457 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (127, 128, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e01347dc9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (128, 129, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0134f889 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (129, 130, N'Gotcha y voleibol', CAST ('True' AS bit), CAST(0x0000a58e013584ff AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (130, 131, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0136bf88 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (131, 132, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e01373ebf AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (132, 133, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0137af03 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (133, 134, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01382eda AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (134, 135, N'Natación', CAST ('True' AS bit), CAST(0x0000a58e0138a443 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (135, 136, N'Porrista', CAST ('True' AS bit), CAST(0x0000a58e01393030 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (136, 137, N'', CAST ('True' AS bit), CAST(0x0000a58e0139e71c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (137, 138, N'', CAST ('True' AS bit), CAST(0x0000a58e013a3863 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (138, 139, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013aafad AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (139, 140, N'Spinning', CAST ('True' AS bit), CAST(0x0000a58e013b23c6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (140, 141, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013b8796 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (141, 142, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013c5f13 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (142, 143, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013cfbcd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (143, 144, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013da87f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (144, 145, N'Natación', CAST ('True' AS bit), CAST(0x0000a58e013e5793 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (145, 146, N'Natación', CAST ('True' AS bit), CAST(0x0000a58e013f5dc2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (146, 147, N'', CAST ('True' AS bit), CAST(0x0000a58e013fc42b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (147, 148, N'Porra', CAST ('True' AS bit), CAST(0x0000a58e0140662f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (148, 149, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01553e08 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (149, 150, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0155dd5c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (150, 151, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01568307 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (151, 152, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01575eb6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (152, 153, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0157cd26 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (153, 154, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e015849c0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (154, 155, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0158dc31 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (155, 156, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58e0159b09a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (156, 157, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e015a5f6a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (157, 158, N'Aparatos y spinning', CAST ('True' AS bit), CAST(0x0000a58e015cfa46 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (158, 159, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e015d8bdc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (159, 160, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a58e015e518e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (160, 161, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59300822bb2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (161, 162, N'Futbol', CAST ('True' AS bit), CAST(0x0000a5930082128f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (162, 163, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5930082d6ea AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (163, 164, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5930087fde3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (164, 165, N'Voleibol', CAST ('True' AS bit), CAST(0x0000a59300895e5e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (165, 166, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300894f78 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (166, 167, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593008cc783 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (167, 168, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593008d51ed AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (168, 169, N'Futbol', CAST ('True' AS bit), CAST(0x0000a593008df7a8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (169, 170, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a593008e85f4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (170, 171, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593008f6ab4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (171, 172, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593008fff43 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (172, 173, N'Tae Kwondo,Splash', CAST ('True' AS bit), CAST(0x0000a5930090c85e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (173, 174, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300915655 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (174, 175, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300968188 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (175, 176, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300970cbe AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (176, 177, N'Baile', CAST ('True' AS bit), CAST(0x0000a593009839a4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (177, 178, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300982555 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (178, 179, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300989394 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (179, 180, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593009902cb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (180, 181, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593009b6c93 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (181, 182, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a593009c00a3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (182, 183, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593009c7f41 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (183, 184, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593009dcad9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (184, 185, N'futbol soccer', CAST ('True' AS bit), CAST(0x0000a594009762f7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (185, 186, N'Tiro al blanco', CAST ('True' AS bit), CAST(0x0000a59400b6fe2c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (186, 187, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59400b9012a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (187, 188, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59400c94dcb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (188, 189, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59400ca1ba5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (189, 190, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59400cab392 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (190, 191, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990096497a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (191, 192, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990096c15f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (192, 193, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990097443f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (193, 194, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990097d9b2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (194, 195, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990098689e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (195, 196, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990098f46b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (196, 197, N'Futbol', CAST ('True' AS bit), CAST(0x0000a599009980a3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (197, 198, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009efbf0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (198, 199, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009c37b7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (199, 200, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009cd17a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (200, 201, N'basquetbol y pesas', CAST ('True' AS bit), CAST(0x0000a599009d517c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (201, 202, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009dcbba AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (202, 203, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009e3ebf AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (203, 204, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a59900a391a2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (204, 205, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900ac8885 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (205, 206, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b11986 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (206, 207, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b67a3f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (207, 208, N'Natación', CAST ('True' AS bit), CAST(0x0000a59900b6f008 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (208, 209, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a59900b767dc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (209, 210, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b7dac5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (210, 211, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b83a89 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (211, 212, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b91f58 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (212, 213, N'Ballet', CAST ('True' AS bit), CAST(0x0000a59900c2afe1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (213, 214, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900cea428 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (214, 215, N'Gimnasio', CAST ('True' AS bit), CAST(0x0000a59900cefd55 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (215, 216, N'Natación', CAST ('True' AS bit), CAST(0x0000a59900cfdd95 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (216, 217, N'skateboarding', CAST ('True' AS bit), CAST(0x0000a59900d052bd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (217, 218, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d0e1c0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (218, 219, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59900d12b0a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (219, 220, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d1967c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (220, 221, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d222b2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (221, 222, N'Natación', CAST ('True' AS bit), CAST(0x0000a59900d27827 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (222, 223, N'paintball', CAST ('True' AS bit), CAST(0x0000a59900d2e9a6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (223, 224, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d3395c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (224, 225, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d3f125 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (225, 226, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d448b1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (226, 227, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d4b8d6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (227, 228, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d52bb4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (228, 229, N'Natación', CAST ('True' AS bit), CAST(0x0000a59900d5b084 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (229, 230, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59900d61d88 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (230, 231, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a59a00834d4f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (231, 232, N'Bicicleta', CAST ('True' AS bit), CAST(0x0000a59a0083e525 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (232, 233, N'Caminata', CAST ('True' AS bit), CAST(0x0000a59a00848960 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (233, 234, N'Tenis y futbol', CAST ('True' AS bit), CAST(0x0000a59a008549fa AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (234, 235, N'raquetbol y taekwodo', CAST ('True' AS bit), CAST(0x0000a59a00923fd8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (235, 236, N'Natación', CAST ('True' AS bit), CAST(0x0000a59a0092acab AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (236, 237, N'Natación', CAST ('True' AS bit), CAST(0x0000a59a0096547e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (237, 238, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009775f2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (238, 239, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a0099fc4c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (239, 240, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009a6092 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (240, 241, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009ab83e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (241, 242, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009ec332 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (242, 243, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009f0878 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (243, 244, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59a009f9df0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (244, 245, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a02c47 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (245, 246, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a0cfd2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (246, 247, N'Basquetbol y futbol', CAST ('True' AS bit), CAST(0x0000a59a00a12d1b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (247, 248, N'Bicicleta de montaña y basquetbol', CAST ('True' AS bit), CAST(0x0000a59a00a1abca AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (248, 249, N'Gym', CAST ('True' AS bit), CAST(0x0000a59a00a59106 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (249, 250, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a63df2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (250, 251, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a59a00a70c05 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (251, 252, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a79540 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (252, 253, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59a00a80a65 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (253, 254, N'Gym', CAST ('True' AS bit), CAST(0x0000a59a00a8f55a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (254, 255, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a992c0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (255, 256, N'Gym', CAST ('True' AS bit), CAST(0x0000a59a00aa0d0f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (256, 257, N'Futbol,Basquet y gimnasio', CAST ('True' AS bit), CAST(0x0000a59a00aac217 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (257, 258, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00ab63b6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (258, 259, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59a00abd9ec AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (259, 260, N'Tenis', CAST ('True' AS bit), CAST(0x0000a59c014de439 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (260, 261, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59b00d2f0fe AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (261, 262, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c0095e9a7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (262, 263, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c0096b531 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (263, 264, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c009715b2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (264, 265, N'Gym', CAST ('True' AS bit), CAST(0x0000a59c0097b63d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (265, 266, N'Gym', CAST ('True' AS bit), CAST(0x0000a59c0098504c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (266, 267, N'Gym', CAST ('True' AS bit), CAST(0x0000a59c0098f40f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (267, 268, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c009a49ca AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (268, 269, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c009f0688 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (269, 270, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c009fdb75 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (270, 271, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a59c00a24dea AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (271, 272, N'Natacion 4/sem', CAST ('True' AS bit), CAST(0x0000a59c00a2c9b6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (272, 273, N'Boxeo', CAST ('True' AS bit), CAST(0x0000a59c00a330a9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (273, 274, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a59c00a63518 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (274, 275, N'Natación, Basquet', CAST ('True' AS bit), CAST(0x0000a59c00a8d6c8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (275, 276, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59c00aa3473 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (276, 277, N'Beisbol', CAST ('True' AS bit), CAST(0x0000a59c00aaa99f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (277, 278, N'correr,crossfit y pesas', CAST ('True' AS bit), CAST(0x0000a59c00aba8ef AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (278, 279, N'Gimnasio', CAST ('True' AS bit), CAST(0x0000a59c00ac3694 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (279, 280, N'Correr', CAST ('True' AS bit), CAST(0x0000a59c00accb7d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (280, 281, N'Correr y Basquetbol', CAST ('True' AS bit), CAST(0x0000a59c00b0ee2f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (281, 282, N'Gym', CAST ('True' AS bit), CAST(0x0000a59c00b1bce6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (282, 283, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59c00b2295b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (283, 284, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59c00b2f5e3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (284, 286, N'Gimnasio y motocross', CAST ('True' AS bit), CAST(0x0000a59f00bf77b8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (285, 287, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00c00a35 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (286, 288, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00cbbc49 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (287, 289, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00cc4dfa AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (288, 290, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00cf5565 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (289, 291, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00cfad89 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (290, 292, N'Ciclismo', CAST ('True' AS bit), CAST(0x0000a59f00d01281 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (291, 293, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5a000a2a4c9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (292, 294, N'Natación', CAST ('True' AS bit), CAST(0x0000a5a000a350ce AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (293, 295, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5a000a41499 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (294, 296, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5a000a4b116 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (295, 297, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5a000a5b60e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (296, 298, N'Animacion', CAST ('True' AS bit), CAST(0x0000a5a000a6405d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (297, 299, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5a000a6c87d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (298, 300, N'Futbol', CAST ('True' AS bit), CAST(0x0000a5a000a7edbe AS datetime))

GO
INSERT INTO [dbo].[TblHistorialFisico] ([id_historial_fisico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (299, 301, N'pierna rota', CAST ('True' AS bit), CAST(0x0000a5ed0118116d AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblHistorialFisico] OFF
GO

--Table dbo.TblHistorialMedico

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblHistorialMedico] (
	[id_historial_medico] [int] NOT NULL IDENTITY (1, 1),
	[id_socio] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblHistorialMedico_Modificacion] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblHistorialMedico] ON
GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (1, 1, N'Gym', CAST ('True' AS bit), CAST(0x0000a59c01508ef3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (2, 2, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58d0147ef35 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (3, 3, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58d0147ef35 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (4, 4, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58d0147ef35 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (5, 5, N'Ciclismo', CAST ('True' AS bit), CAST(0x0000a58a00c748fa AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (6, 6, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58a00c833b6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (7, 7, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b245d7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (8, 8, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00c9f6fd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (9, 9, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00cb1375 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (10, 10, N'', CAST ('False' AS bit), CAST(0x0000a58e00b259d8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (11, 11, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00cd8f47 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (12, 12, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a58a00cdfa74 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (13, 13, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00ce8b28 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (14, 14, N'', CAST ('True' AS bit), CAST(0x0000a58a00cface8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (15, 15, N'Basquetbol', CAST ('False' AS bit), CAST(0x0000a58e00b27ae4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (16, 16, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00d0cbd2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (17, 17, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b29272 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (18, 18, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00d20bb1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (19, 19, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58a00d20bb1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (20, 20, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b008bd72a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (21, 21, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b008c6388 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (22, 22, N'Correr', CAST ('True' AS bit), CAST(0x0000a58b008e1e34 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (23, 23, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b2af36 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (24, 24, N'Basquetbol', CAST ('False' AS bit), CAST(0x0000a58e00b2bf49 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (25, 25, N'', CAST ('True' AS bit), CAST(0x0000a58b00919576 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (26, 26, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a58b00944814 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (27, 27, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00951d63 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (28, 28, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b0095e20e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (29, 29, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b009aa25d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (30, 30, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b009ba575 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (31, 31, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b2d8ed AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (32, 32, N'Ciclismo', CAST ('True' AS bit), CAST(0x0000a58b009d1f5e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (33, 33, N'Natación', CAST ('True' AS bit), CAST(0x0000a58b009d8d0c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (34, 34, N'Gimnasio', CAST ('True' AS bit), CAST(0x0000a58b009f0a36 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (35, 35, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b009fc82e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (36, 36, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a0c2ab AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (37, 37, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a2817b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (38, 38, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a2f3e2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (39, 39, N'Natación', CAST ('True' AS bit), CAST(0x0000a58b00a75135 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (40, 40, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a7fa4b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (41, 41, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a879dc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (42, 42, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a8ff30 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (43, 43, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00a95e18 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (44, 44, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c00ba9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (45, 45, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c0a560 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (46, 46, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b2fc11 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (48, 48, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c28c6a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (49, 49, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c3f2a8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (50, 50, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b30cfe AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (51, 51, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c471f9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (52, 52, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b31c66 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (53, 53, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c51693 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (54, 54, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c5f3de AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (55, 55, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00c6b709 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (56, 56, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00cc857e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (57, 57, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58b00cda288 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (58, 58, N'Correr', CAST ('True' AS bit), CAST(0x0000a58b00ce8374 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (59, 59, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c007f35e6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (60, 60, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b33fa4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (61, 61, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58b0149ea11 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (62, 62, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c007f17a7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (63, 63, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c008069f1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (64, 64, N'', CAST ('True' AS bit), CAST(0x0000a58c0081b7dd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (65, 65, N'Tenis', CAST ('True' AS bit), CAST(0x0000a58c00915448 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (66, 66, N'Maratonista', CAST ('True' AS bit), CAST(0x0000a58c0092002f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (67, 67, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00929fbf AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (68, 68, N'Karate y futbol', CAST ('True' AS bit), CAST(0x0000a58c00931d63 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (69, 69, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c0095893f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (70, 70, N'Futbol y ciclismo', CAST ('True' AS bit), CAST(0x0000a58c00970db4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (71, 71, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c0097e7b9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (72, 72, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00986c0a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (73, 73, N'Motociclismo', CAST ('True' AS bit), CAST(0x0000a58c009c282d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (74, 74, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00a0b780 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (75, 75, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58c00a14694 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (76, 76, N'Bmx', CAST ('True' AS bit), CAST(0x0000a58c00a2a118 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (77, 77, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00a3201e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (78, 78, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b3962b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (79, 79, N'Basquetbol y muai tai', CAST ('True' AS bit), CAST(0x0000a58c00a4dda7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (80, 80, N'Gimnasio y correr', CAST ('True' AS bit), CAST(0x0000a58c00a55830 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (81, 81, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b500e1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (82, 82, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b58e9a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (83, 83, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58c00b67b34 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (84, 84, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b6e6e3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (85, 85, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b78e8c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (86, 86, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b81841 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (87, 87, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b8a609 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (88, 88, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00b924ee AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (89, 89, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b3bc1c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (90, 90, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58c00b9e7a6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (91, 91, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00bb6c8c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (92, 92, N'', CAST ('True' AS bit), CAST(0x0000a58c00bcfb41 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (93, 93, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00bf1a9c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (94, 94, N'Beisbol', CAST ('True' AS bit), CAST(0x0000a58c00bfa780 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (95, 95, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00c05dcc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (96, 96, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00c098b0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (97, 97, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00c10681 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (98, 98, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00d5547e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (99, 99, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58c00d5d385 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (100, 100, N'Correr', CAST ('True' AS bit), CAST(0x0000a58c00d66896 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (101, 101, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58c014cde9a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (102, 102, N'Ciclismo y Natación', CAST ('True' AS bit), CAST(0x0000a59101489fa7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (103, 103, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00a84890 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (104, 104, N'Ninguno', CAST ('False' AS bit), CAST(0x0000a58e00b22439 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (105, 105, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e00ae18cd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (106, 106, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a5910149182e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (107, 107, N'Basquetbol', CAST ('False' AS bit), CAST(0x0000a58e00b3e621 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (108, 108, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e00b60ccb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (109, 109, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00c076d8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (110, 110, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00c131f5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (111, 111, N'Tenis', CAST ('True' AS bit), CAST(0x0000a58e00c1c3fd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (112, 112, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00c48d57 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (113, 113, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a58e00c70f38 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (114, 114, N'Raquet', CAST ('True' AS bit), CAST(0x0000a58e00c840c1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (115, 115, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e00c8f530 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (116, 116, N'Motocross', CAST ('True' AS bit), CAST(0x0000a58e00ca848d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (117, 117, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e0112be19 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (118, 118, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01146eb8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (119, 119, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01180d57 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (120, 120, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58e0118fe84 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (121, 121, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e011a8f18 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (122, 122, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e011e7c02 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (123, 123, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0120ce7d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (124, 124, N'Spinning', CAST ('True' AS bit), CAST(0x0000a58e01220980 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (125, 125, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01229bbb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (126, 126, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58e0133345a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (127, 128, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e01347dcb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (128, 129, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0134f88b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (129, 130, N'Gotcha y voleibol', CAST ('True' AS bit), CAST(0x0000a58e01358500 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (130, 131, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0136bf89 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (131, 132, N'Futbol', CAST ('True' AS bit), CAST(0x0000a58e01373ec1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (132, 133, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0137af04 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (133, 134, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01382edd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (134, 135, N'Natación', CAST ('True' AS bit), CAST(0x0000a58e0138a445 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (135, 136, N'Porrista', CAST ('True' AS bit), CAST(0x0000a58e01393031 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (136, 137, N'', CAST ('True' AS bit), CAST(0x0000a58e0139e71c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (137, 138, N'', CAST ('True' AS bit), CAST(0x0000a58e013a3864 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (138, 139, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013aafae AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (139, 140, N'Spinning', CAST ('True' AS bit), CAST(0x0000a58e013b23c7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (140, 141, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013b8797 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (141, 142, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013c5f14 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (142, 143, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013cfbce AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (143, 144, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e013da87f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (144, 145, N'Natación', CAST ('True' AS bit), CAST(0x0000a58e013e5793 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (145, 146, N'Natación', CAST ('True' AS bit), CAST(0x0000a58e013f5dc3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (146, 147, N'', CAST ('True' AS bit), CAST(0x0000a58e013fc42b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (147, 148, N'Porra', CAST ('True' AS bit), CAST(0x0000a58e01406631 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (148, 149, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01553e0b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (149, 150, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0155dd5d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (150, 151, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01568309 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (151, 152, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e01575eb7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (152, 153, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0157cd27 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (153, 154, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e015849c0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (154, 155, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e0158dc32 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (155, 156, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a58e0159b09c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (156, 157, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e015a5f6c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (157, 158, N'Aparatos y spinning', CAST ('True' AS bit), CAST(0x0000a58e015cfa48 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (158, 159, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a58e015d8bdc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (159, 160, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a58e015e518e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (160, 161, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59300822bb3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (161, 162, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59300821290 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (162, 163, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5930082d6ef AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (163, 164, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5930087fde3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (164, 165, N'Voleibol', CAST ('True' AS bit), CAST(0x0000a59300895e5f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (165, 166, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300894f79 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (166, 167, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593008cc785 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (167, 168, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593008d51ef AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (168, 169, N'Futbol', CAST ('True' AS bit), CAST(0x0000a593008df7ac AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (169, 170, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a593008e85f4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (170, 171, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593008f6ab5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (171, 172, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593008fff43 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (172, 173, N'Tae Kwondo,Splash', CAST ('True' AS bit), CAST(0x0000a5930090c85f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (173, 174, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300915656 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (174, 175, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5930096818b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (175, 176, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300970cbf AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (176, 177, N'Baile', CAST ('True' AS bit), CAST(0x0000a593009839a6 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (177, 178, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300982556 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (178, 179, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59300989395 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (179, 180, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593009902cc AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (180, 181, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593009b6c99 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (181, 182, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a593009c00a5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (182, 183, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593009c7f43 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (183, 184, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a593009dcadb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (184, 185, N'futbol soccer', CAST ('True' AS bit), CAST(0x0000a594009762f9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (185, 186, N'Tiro al blanco', CAST ('True' AS bit), CAST(0x0000a59400b6fe2f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (186, 187, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59400b9012b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (187, 188, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59400c94dcd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (188, 189, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59400ca1ba7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (189, 190, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59400cab394 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (190, 191, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990096497f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (191, 192, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990096c161 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (192, 193, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900974442 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (193, 194, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990097d9b2 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (194, 195, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009868a0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (195, 196, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5990098f46c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (196, 197, N'Futbol', CAST ('True' AS bit), CAST(0x0000a599009980a3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (197, 198, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009efbfe AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (198, 199, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009c37b8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (199, 200, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009cd17b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (200, 201, N'basquetbol y pesas', CAST ('True' AS bit), CAST(0x0000a599009d517d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (201, 202, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009dcbbd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (202, 203, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a599009e3ec0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (203, 204, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a59900a391a4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (204, 205, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900ac8887 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (205, 206, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b11987 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (206, 207, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b67a41 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (207, 208, N'Natación', CAST ('True' AS bit), CAST(0x0000a59900b6f00a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (208, 209, N'Bicicross', CAST ('True' AS bit), CAST(0x0000a59900b767dd AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (209, 210, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b7daca AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (210, 211, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b83a8a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (211, 212, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900b91f5a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (212, 213, N'Ballet', CAST ('True' AS bit), CAST(0x0000a59900c2afe3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (213, 214, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900cea42a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (214, 215, N'Gimnasio', CAST ('True' AS bit), CAST(0x0000a59900cefd56 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (215, 216, N'Natación', CAST ('True' AS bit), CAST(0x0000a59900cfdd97 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (216, 217, N'skateboarding', CAST ('True' AS bit), CAST(0x0000a59900d052c3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (217, 218, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d0e1c1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (218, 219, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59900d12b0b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (219, 220, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d1967d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (220, 221, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d222b3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (221, 222, N'Natación', CAST ('True' AS bit), CAST(0x0000a59900d27827 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (222, 223, N'paintball', CAST ('True' AS bit), CAST(0x0000a59900d2e9a7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (223, 224, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d3395f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (224, 225, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d3f126 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (225, 226, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d448b1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (226, 227, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d4b8d7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (227, 228, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59900d52bb5 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (228, 229, N'Natación', CAST ('True' AS bit), CAST(0x0000a59900d5b085 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (229, 230, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59900d61d8a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (230, 231, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a59a00834d55 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (231, 232, N'Bicicleta', CAST ('True' AS bit), CAST(0x0000a59a0083e526 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (232, 233, N'Caminata', CAST ('True' AS bit), CAST(0x0000a59a00848962 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (233, 234, N'Tenis y futbol', CAST ('True' AS bit), CAST(0x0000a59a008549fb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (234, 235, N'raquetbol y taekwodo', CAST ('True' AS bit), CAST(0x0000a59a00923fda AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (235, 236, N'Natación', CAST ('True' AS bit), CAST(0x0000a59a0092acb1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (236, 237, N'Natación', CAST ('True' AS bit), CAST(0x0000a59a00965480 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (237, 238, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009775f3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (238, 239, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a0099fc4d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (239, 240, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009a6093 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (240, 241, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009ab840 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (241, 242, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009ec334 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (242, 243, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a009f087a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (243, 244, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59a009f9df1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (244, 245, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a02c48 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (245, 246, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a0cfd3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (246, 247, N'Basquetbol y futbol', CAST ('True' AS bit), CAST(0x0000a59a00a12d1c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (247, 248, N'Bicicleta de montaña y basquetbol', CAST ('True' AS bit), CAST(0x0000a59a00a1abcb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (248, 249, N'Gym', CAST ('True' AS bit), CAST(0x0000a59a00a59108 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (249, 250, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a63df3 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (250, 251, N'Basquetbol', CAST ('True' AS bit), CAST(0x0000a59a00a70c07 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (251, 252, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a79541 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (252, 253, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59a00a80a66 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (253, 254, N'Gym', CAST ('True' AS bit), CAST(0x0000a59a00a8f55b AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (254, 255, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00a992c1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (255, 256, N'Gym', CAST ('True' AS bit), CAST(0x0000a59a00aa0d10 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (256, 257, N'Futbol,Basquet y gimnasio', CAST ('True' AS bit), CAST(0x0000a59a00aac218 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (257, 258, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59a00ab63b7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (258, 259, N'Futbol', CAST ('True' AS bit), CAST(0x0000a59a00abd9ed AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (259, 260, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c014de43c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (260, 261, N'Alergica a Seftriaxona (Para Garganta)', CAST ('True' AS bit), CAST(0x0000a59b00d2f0ff AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (261, 262, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c0095e9a9 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (262, 263, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c0096b536 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (263, 264, N'alergica a neomelubrina', CAST ('True' AS bit), CAST(0x0000a59c009715b4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (264, 265, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c0097b643 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (265, 266, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c0098504c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (266, 267, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c0098f410 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (267, 268, N'Fibrosis', CAST ('True' AS bit), CAST(0x0000a59c009a49ca AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (268, 269, N'Presion alta,cirugia de hernia inguinal', CAST ('True' AS bit), CAST(0x0000a59c009f068a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (269, 270, N'contractura y esguinse de cuello.', CAST ('True' AS bit), CAST(0x0000a59c009fdb77 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (270, 271, N'Alergico a Dipirona y Ambroxol.	Lesion reciente
do', CAST ('True' AS bit), CAST(0x0000a59c00a24dec AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (271, 272, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c00a2c9b8 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (272, 273, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c00a330aa AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (273, 274, N'cirugia de pulmon (2008)', CAST ('True' AS bit), CAST(0x0000a59c00a6351a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (274, 275, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c00a8d6cb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (275, 276, N'valvula en el corazon. 
Guarfarina tabs.
Alergico ', CAST ('True' AS bit), CAST(0x0000a59c00aa3475 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (276, 277, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c00aaa9a0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (277, 278, N'Se lastimo la rodilla en Octubre', CAST ('True' AS bit), CAST(0x0000a59c00aba8f0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (278, 279, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c00ac3695 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (279, 280, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c00accb7e AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (280, 281, N'Alergico a nuez,aguacate,nuez de la
india,soya, tr', CAST ('True' AS bit), CAST(0x0000a59c00b0ee30 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (281, 282, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59c00b1bcf1 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (282, 283, N'cirugia de rodilla ligamento cruzado.', CAST ('True' AS bit), CAST(0x0000a59c00b2295c AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (283, 284, N'Operacion en Brazo izquierdo (2 años)
', CAST ('True' AS bit), CAST(0x0000a59c00b2f5e4 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (284, 286, N'Gastritis', CAST ('True' AS bit), CAST(0x0000a59f00bf77c7 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (285, 287, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00c00a36 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (286, 288, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00cbbc50 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (287, 289, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00cc4dfb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (288, 290, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00cf5566 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (289, 291, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00cfad8a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (290, 292, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a59f00d01284 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (291, 293, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5a000a2a4cb AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (292, 294, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5a000a350d0 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (293, 295, N'Fractura de tobillo (2013)', CAST ('True' AS bit), CAST(0x0000a5a000a4149a AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (294, 296, N'Presión baja', CAST ('True' AS bit), CAST(0x0000a5a000a4b117 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (295, 297, N'Cesarea (3 años), ', CAST ('True' AS bit), CAST(0x0000a5a000a5b610 AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (296, 298, N'Ninguno', CAST ('True' AS bit), CAST(0x0000a5a000a6405f AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (297, 299, N'Desviación de columna', CAST ('True' AS bit), CAST(0x0000a5a000a6c87d AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (298, 300, N'Ruptura de Ligamentos en Pierna Derecha (3 años 2 ', CAST ('True' AS bit), CAST(0x0000a5a000a7edbf AS datetime))

GO
INSERT INTO [dbo].[TblHistorialMedico] ([id_historial_medico], [id_socio], [descripcion], [activo], [fecha_modificacion])
	VALUES (299, 301, N'ninguno', CAST ('True' AS bit), CAST(0x0000a5ed0118169b AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblHistorialMedico] OFF
GO

--Table dbo.TblMembresia

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblMembresia] (
	[id_membresia] [int] NOT NULL IDENTITY (1, 1),
	[nombre] [varchar](1) NOT NULL,
	[descripcion] [text] NOT NULL,
	[costo] [decimal](5, 2) NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblMembresia_Modificacion] DEFAULT (getdate()));
GO

--Table dbo.TblModulo

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblModulo] (
	[id_modulo] [int] NOT NULL IDENTITY (1, 1),
	[descripcion] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL);
GO

--Table dbo.TblPago

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblPago] (
	[id_pago] [int] NOT NULL IDENTITY (1, 1),
	[id_paquete] [int] NOT NULL,
	[id_socio] [int] NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
	[importe] [decimal](5, 2) NOT NULL,
	[fecha_pago] [datetime] NOT NULL CONSTRAINT [DF_TblPago_pago] DEFAULT (getdate()),
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblPago_Modificacion] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblPago] ON
GO
INSERT INTO [dbo].[TblPago] ([id_pago], [id_paquete], [id_socio], [ID_USUARIO], [importe], [fecha_pago], [activo], [fecha_modificacion])
	VALUES (1, 1, 301, 1, 500.00, CAST(0x0000a5ed011876cc AS datetime), CAST ('True' AS bit), CAST(0x0000a5ed011876cc AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblPago] OFF
GO

--Table dbo.TblPagoRecargo

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblPagoRecargo] (
	[id_pago_recargo] [int] NOT NULL IDENTITY (1, 1),
	[id_pago] [int] NOT NULL,
	[id_recargo] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblPagoRecargo_Modificacion] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblPagoRecargo] ON
GO
INSERT INTO [dbo].[TblPagoRecargo] ([id_pago_recargo], [id_pago], [id_recargo], [activo], [fecha_modificacion])
	VALUES (1, 1, 1, CAST ('True' AS bit), CAST(0x0000a5ed011876d5 AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblPagoRecargo] OFF
GO

--Table dbo.TblPaquete

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblPaquete] (
	[id_paquete] [int] NOT NULL IDENTITY (1, 1),
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
	[costo] [decimal](18, 2) NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblPaquete_Modificacion] DEFAULT (getdate()),
	[diaspaquetes] [int] NOT NULL CONSTRAINT [DF__TblPaquet__diasp__6BAEFA67] DEFAULT ((30)));
GO

SET IDENTITY_INSERT [dbo].[TblPaquete] ON
GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (1, N'Prepago Musculación 14', N'Prepago Musculación 14 visitas hasta 3 meses', 500.00, 1, CAST ('True' AS bit), CAST(0x0000a59c014ba281 AS datetime), 14)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (2, N'Prepagos Musculación 28v', N'Prepagos Musculación 28 visititas hasta 6 meses', 800.00, 1, CAST ('True' AS bit), CAST(0x0000a57e00feeb02 AS datetime), 28)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (3, N'Prepago Cardio 14v', N'Prepago Cardio 14 visitas Hasta 3 meses', 600.00, 1, CAST ('True' AS bit), CAST(0x0000a57e00ff2931 AS datetime), 14)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (4, N'Secundaria', N'Tiempo Ilimitado de Cardio y Musculación.', 330.00, 1, CAST ('True' AS bit), CAST(0x0000a58601405cc9 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (5, N'Secundaria e Inscripción', N'Tiempo Ilimitdo en Cardio y Musculación.', 430.00, 1, CAST ('True' AS bit), CAST(0x0000a5860140d120 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (6, N'Prepa', N'Tiempo Ilimitado en Cardio y Musculación.', 430.00, 1, CAST ('True' AS bit), CAST(0x0000a5860141d492 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (7, N'Prepa e Inscripción', N'Tiempo Ilimitado en Cardio y Musculación.', 530.00, 1, CAST ('True' AS bit), CAST(0x0000a5860142450d AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (8, N'Paquete Especial', N'Tiempo Ilimitado en Cardio y Musculación.', 430.00, 1, CAST ('True' AS bit), CAST(0x0000a586014288e9 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (9, N'Muscuación e Inscripción', N'10 Minutos de Cardio y tiempo Ilimitado en Musculación.', 660.00, 1, CAST ('True' AS bit), CAST(0x0000a586014a7956 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (10, N'Musculación ', N'10 Minutos de Cardio y tiempo Ilimitado en Musculación.', 560.00, 1, CAST ('True' AS bit), CAST(0x0000a586014abef0 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (11, N'Musculación 2p (10% desc)', N'10 Minutos de Cardio y tiempo Ilimitado en Musculación', 510.00, 1, CAST ('True' AS bit), CAST(0x0000a586014b1d3f AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (12, N'Musculación 2p e Inscripción (10% desc)', N'10 Minutos en Cardio y tiempo Ilimitado en Musculación', 610.00, 1, CAST ('True' AS bit), CAST(0x0000a586014b7e7b AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (13, N'Musculación 3p (15% desc)', N'10 Minutos de Cardio y Tiempo Ilimitado en Musculación', 490.00, 1, CAST ('True' AS bit), CAST(0x0000a586014dc7f2 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (14, N'Musculación 3p e Inscripción (15 % desc)', N'10 Minutos de Cardio y Tiempo Ilimitado en Musculación', 590.00, 1, CAST ('True' AS bit), CAST(0x0000a586014e06b5 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (15, N'Musculación 4p (20% desc)', N'10 Minutos de Cardio y Tiempo Ilimitado en Musculación', 460.00, 1, CAST ('True' AS bit), CAST(0x0000a586014f1194 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (16, N'Musculación 4p e Inscripción (20% desc)', N'10 Minutos de Cardio y Tiempo Ilimitado en Musculación', 560.00, 1, CAST ('True' AS bit), CAST(0x0000a586014f4206 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (17, N'Cardio', N'Tiempo Ilimitado en Cardio y 30 Minutos en Musculación.', 650.00, 1, CAST ('True' AS bit), CAST(0x0000a5860153e4b4 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (18, N'Cardio e Inscripción', N'Tiempo Ilimitado en Cardio y 30 Minutos en Musculación.', 750.00, 1, CAST ('True' AS bit), CAST(0x0000a586015408d2 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (19, N'Cardio 2p (10% desc)', N'Tiempo Ilimitado en Cardio y 30 Minutos en Musculación.', 600.00, 1, CAST ('True' AS bit), CAST(0x0000a58601544847 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (20, N'Cradio 2p e Inscripción (10% desc)', N'Tiempo Ilimitado en Cardio y 30 Minutos en Musculación.', 700.00, 1, CAST ('True' AS bit), CAST(0x0000a58601547574 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (21, N'Cardio 3p (15% desc)', N'Tiempo Ilimitado en Cardio y 30 Minutos en Musculación.', 570.00, 1, CAST ('True' AS bit), CAST(0x0000a5860154b099 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (22, N'Cardio 3p e Inscripción (15% desc)', N'Tiempo Ilimitado en Cardio y 30 Minutos en Musculación.', 670.00, 1, CAST ('True' AS bit), CAST(0x0000a5860155832a AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (23, N'Cardio 4p (20% desc)', N'Tiempo Ilimitado en Cardio y 30 Minutos en Musculación.', 540.00, 1, CAST ('True' AS bit), CAST(0x0000a5860155ea79 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (24, N'Cardio 4p e Inscripción (20% desc)', N'Tiempo Ilimitado en Cardio y 30 Minutos en Musculación.', 640.00, 1, CAST ('True' AS bit), CAST(0x0000a586015615b6 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (25, N'Integral', N'Tiempo ilimitado en Cardio y musculación,entrada a', 750.00, 1, CAST ('True' AS bit), CAST(0x0000a58701508f25 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (26, N'Integral e Inscripción', N'Tiempo ilimitado en Cardio y musculación,entrada a las clases y recuperación de dias.', 850.00, 1, CAST ('True' AS bit), CAST(0x0000a5870150b847 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (27, N'Integral 2p (10% desc)', N'Tiempo ilimitado en Cardio y musculación,entrada a las clases y recuperación de dias.', 690.00, 1, CAST ('True' AS bit), CAST(0x0000a58701521840 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (28, N'Integral 2p e inscripción (10 % desc)', N'Tiempo ilimitado en Cardio y musculación,entrada a las clases y recuperación de dias.', 790.00, 1, CAST ('True' AS bit), CAST(0x0000a587015591c7 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (29, N'Integral 3p (15% desc)', N'Tiempo ilimitado en Cardio y musculación,entrada a las clases y recuperación de dias.', 650.00, 1, CAST ('True' AS bit), CAST(0x0000a5870155bc2c AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (30, N'Integral 3p e Inscripción (15% desc)', N'Tiempo ilimitado en Cardio y musculación,entrada a las clases y recuperación de dias.', 750.00, 1, CAST ('True' AS bit), CAST(0x0000a5870155e014 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (31, N'Integral 4p (20% desc)', N'Tiempo ilimitado en Cardio y musculación,entrada a las clases y recuperación de dias.', 630.00, 1, CAST ('True' AS bit), CAST(0x0000a5870158cb9c AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (32, N'Integral 4p e Inscripción (20% desc)', N'Tiempo ilimitado en Cardio y musculación,entrada a las clases y recuperación de dias.', 730.00, 1, CAST ('True' AS bit), CAST(0x0000a5870158f5b2 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (33, N'Musculación Universitario', N'10 Minutos de Cardio y tiempo ilimitado en Muscula', 460.00, 1, CAST ('True' AS bit), CAST(0x0000a59a00979498 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (34, N'Cardio Universitario', N'Tiempo ilimitado en cardio y 30 minutos de musculación.', 540.00, 1, CAST ('True' AS bit), CAST(0x0000a58a00955c6a AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (35, N'Integral Universitario', N'Tiempo ilimitado en todo el gym', 630.00, 1, CAST ('True' AS bit), CAST(0x0000a58a00958ab3 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (36, N'Musculación Universitario e inscripción', N'10 minutos de cardio y tiempo ilimitado en musculación', 560.00, 1, CAST ('True' AS bit), CAST(0x0000a58a0095cefe AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (37, N'Cardio universitario e inscripción', N'Tiempo ilimitado en cardio y 30 min de musculación', 640.00, 1, CAST ('True' AS bit), CAST(0x0000a58a00968bfe AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (38, N'Integral universitario e inscripción', N'Tiempo Ilimitado en todo el gym', 730.00, 1, CAST ('True' AS bit), CAST(0x0000a58a0096b3eb AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (39, N'Bicicross', N'10 minutos de cardio y tiempo ilimitado en musculación', 330.00, 1, CAST ('True' AS bit), CAST(0x0000a58a0096d871 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (40, N'Paquete Especial', N'Cardio y musculación', 400.00, 1, CAST ('True' AS bit), CAST(0x0000a58b008ae6e0 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (41, N'Familia', N'Todo ilimitado', 430.00, 1, CAST ('True' AS bit), CAST(0x0000a58b00c1a3a7 AS datetime), 30)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (42, N'Prepagos Cardio 28v', N'Prepagos Cardio 28v', 900.00, 1, CAST ('True' AS bit), CAST(0x0000a59c014d4e2b AS datetime), 28)

GO
INSERT INTO [dbo].[TblPaquete] ([id_paquete], [nombre], [descripcion], [costo], [ID_USUARIO], [activo], [fecha_modificacion], [diaspaquetes])
	VALUES (43, N'tesfal', N'prueba', 3456.00, 1, CAST ('True' AS bit), CAST(0x0000a5ed0117b2f0 AS datetime), 120)

GO
SET IDENTITY_INSERT [dbo].[TblPaquete] OFF
GO

--Table dbo.TblPaqueteServicio

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblPaqueteServicio] (
	[id_paquete] [int] NOT NULL,
	[id_servicio] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblPaqueteServicio_Modificacion] DEFAULT (getdate()));
GO

--Table dbo.TblProducto

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblProducto] (
	[id_producto] [int] NOT NULL IDENTITY (1, 1),
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
	[costo] [decimal](18, 2) NOT NULL,
	[existencia] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblProducto_Modificacion] DEFAULT (getdate()),
	[clave] [varchar](10) NOT NULL);
GO

SET IDENTITY_INSERT [dbo].[TblProducto] ON
GO
INSERT INTO [dbo].[TblProducto] ([id_producto], [nombre], [descripcion], [costo], [existencia], [activo], [fecha_modificacion], [clave])
	VALUES (1, N'coca', N'coca-cola', 12.00, 12, CAST ('True' AS bit), CAST(0x0000a5ed0118d3df AS datetime), N'Coca 600')

GO
INSERT INTO [dbo].[TblProducto] ([id_producto], [nombre], [descripcion], [costo], [existencia], [activo], [fecha_modificacion], [clave])
	VALUES (2, N'powerate', N'power', 12.00, 10, CAST ('True' AS bit), CAST(0x0000a5ed011c8700 AS datetime), N'po500')

GO
SET IDENTITY_INSERT [dbo].[TblProducto] OFF
GO

--Table dbo.TblRecargo

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblRecargo] (
	[id_recargo] [int] NOT NULL IDENTITY (1, 1),
	[id_socio] [int] NOT NULL,
	[id_paquete] [int] NOT NULL,
	[fecha_recargo] [datetime] NOT NULL CONSTRAINT [DF_TblRecargo_Recargo] DEFAULT (getdate()),
	[importe] [decimal](18, 2) NOT NULL,
	[liberacion] [bit] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblRecargo_Modificacion] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblRecargo] ON
GO
INSERT INTO [dbo].[TblRecargo] ([id_recargo], [id_socio], [id_paquete], [fecha_recargo], [importe], [liberacion], [activo], [fecha_modificacion])
	VALUES (1, 301, 1, CAST(0x0000a5ed011876d3 AS datetime), 0.00, CAST ('True' AS bit), CAST ('True' AS bit), CAST(0x0000a5ed011876d3 AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblRecargo] OFF
GO

--Table dbo.TblRegistroVisita

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblRegistroVisita] (
	[id_vigencia] [int] NOT NULL IDENTITY (1, 1),
	[id_socio] [int] NOT NULL,
	[dias_vigentes] [int] NOT NULL,
	[fecha_entrada] [datetime] NOT NULL CONSTRAINT [DF_TblRegistroVisita_baja] DEFAULT (getdate()),
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblRegistroVisita_Modificacion] DEFAULT (getdate()));
GO

--Table dbo.TblServicio

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblServicio] (
	[id_servicio] [int] NOT NULL IDENTITY (1, 1),
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblSocio_Modificacion] DEFAULT (getdate()));
GO

--Table dbo.TblSocio

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblSocio] (
	[id_socio] [int] NOT NULL IDENTITY (1, 1),
	[num_socio] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[ap_paterno] [varchar](50) NOT NULL,
	[ap_materno] [varchar](50) NOT NULL,
	[direccion] [text] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[fecha_baja] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[telefono] [varchar](18) NULL,
	[fecha_nacimiento] [datetime] NOT NULL CONSTRAINT [DF_TblSocio_nacimiento] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblSocio] ON
GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (1, 1, N'Javier ', N'Martínez', N'Pinedo', N'Palomar #1', CAST(0x0000a584014f9a10 AS datetime), CAST(0x0000a59c01508ef2 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c01508ef2 AS datetime), N'4931071374', CAST(0x0000724600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (2, 24, N'Víctor Manuel', N'De León', N'García', N'Calle: La Joya #13', CAST(0x0000a58a009760c4 AS datetime), CAST(0x0000a58a009760c4 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a009760c4 AS datetime), N'8785853', CAST(0x0000639600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (3, 25, N'Ceny ', N'Macías', N'De León', N'La joya #13', CAST(0x0000a58a00c3ec79 AS datetime), CAST(0x0000a58a00c3ec79 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00c3ec79 AS datetime), N'4931141808', CAST(0x0000686800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (4, 26, N'Gerardo', N'Díaz', N'Sánchez', N'Calle: Jeréz #200 Col. Industrial', CAST(0x0000a58a00c68e67 AS datetime), CAST(0x0000a58d0147ef30 AS datetime), CAST ('True' AS bit), CAST(0x0000a58d0147ef30 AS datetime), N'4931140345', CAST(0x0000807200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (5, 27, N'José Antonio', N'Rodarte', N'Hernández', N'Calle: Aldama #106', CAST(0x0000a58a00c748f8 AS datetime), CAST(0x0000a58a00c748f8 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00c748f8 AS datetime), N'9320824', CAST(0x0000664600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (6, 29, N'Edjoani Isaias', N'Torres', N'Perea', N'Calle: República de Ecuador #21 Col. Las Américas', CAST(0x0000a58a00c833a1 AS datetime), CAST(0x0000a58a00c833a1 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00c833a1 AS datetime), N'4931108320', CAST(0x0000a62900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (7, 31, N'Karla Nohemi', N'Piña', N'Garay', N'Calle:Barreno #212 Centro', CAST(0x0000a58a00c8db61 AS datetime), CAST(0x0000a58e00b245d6 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b245d6 AS datetime), N'4931030827', CAST(0x000074ca00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (8, 44, N'Elza Mónica', N'Pasillas', N'Huizar', N'Calle:Sierra Madre #713 ColÑ Lomas de Pláteros', CAST(0x0000a58a00c9f6fb AS datetime), CAST(0x0000a58a00c9f6fb AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00c9f6fb AS datetime), N'9325142', CAST(0x00006d0b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (9, 51, N'José Armando', N'Navarrete', N'Ulloa', N'Calle: Carrillo Puerto #319 Centro', CAST(0x0000a58a00cb1372 AS datetime), CAST(0x0000a58a00cb1372 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00cb1372 AS datetime), N'4939399014', CAST(0x00005fe200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (10, 52, N'José Luis', N'Martínez', N'Ojeda', N'', CAST(0x0000a58a00cc9a46 AS datetime), CAST(0x0000a58e00b259d7 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b259d7 AS datetime), N'', CAST(0x0000807200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (11, 64, N'Juan Jésus', N'Hernández', N'Pérez', N'Calle: Alvaro Obregón #7 Col: Centro', CAST(0x0000a58a00cd8f3e AS datetime), CAST(0x0000a58a00cd8f3e AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00cd8f3e AS datetime), N'4931140255', CAST(0x0000781d00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (12, 65, N'José Solink', N'Hernández', N'Pérez', N'Calle: Alvaro Obregón #7 Col: Centro', CAST(0x0000a58a00cdfa73 AS datetime), CAST(0x0000a58a00cdfa73 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00cdfa73 AS datetime), N'4931140646', CAST(0x0000840900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (13, 69, N'Ana María', N'Zacarias', N'Valenzuela', N'Calle: Privada Monterrey #12 Col: Esparza', CAST(0x0000a58a00ce8b26 AS datetime), CAST(0x0000a58a00ce8b26 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00ce8b26 AS datetime), N'4931067138', CAST(0x000080e800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (14, 73, N'Ruth', N'Galván', N'Solis', N'', CAST(0x0000a58a00cface6 AS datetime), CAST(0x0000a58a00cface6 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00cface6 AS datetime), N'', CAST(0x0000807200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (15, 74, N'Omar Eduardo', N'Luna', N'Herrera', N'Calle:Sonora #1 A Col: Centro', CAST(0x0000a58a00d033f8 AS datetime), CAST(0x0000a58e00b27ae2 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b27ae2 AS datetime), N'9325928', CAST(0x00007e0900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (16, 76, N'Fredy', N'Hinojosa', N'Gómez', N'Calle: Gabriel Lugo #4 Col: Las Americas', CAST(0x0000a58a00d0cbd1 AS datetime), CAST(0x0000a58a00d0cbd1 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00d0cbd1 AS datetime), N'4921532353', CAST(0x0000769c00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (17, 79, N'Alejandro', N'Pérez', N'Martínez', N'Calle:Paseo del Mineral #9Col: ', CAST(0x0000a58a00d1756f AS datetime), CAST(0x0000a58e00b29271 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b29271 AS datetime), N'4921209240', CAST(0x0000840300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (18, 81, N'Jésus', N'Alvarado', N'Guerra', N'Calle:Palomar #14 Col: Lagunilla', CAST(0x0000a58a00d20bad AS datetime), CAST(0x0000a58a00d20bad AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00d20bad AS datetime), N'9331939', CAST(0x0000632200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (19, 74, N'Omar Eduardo', N'Luna', N'Herrera', N'Calle:Sonora #1 A Col: Centro', CAST(0x0000a58a014ccd45 AS datetime), CAST(0x0000a58a014ccd45 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a014ccd45 AS datetime), N'9325928', CAST(0x00007e0900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (20, 87, N'Martín Eduardo', N'Luna', N'Herrera', N'Calle: Sonora #1 A Col: Centro', CAST(0x0000a58b008bd726 AS datetime), CAST(0x0000a58b008bd726 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b008bd726 AS datetime), N'4931005807', CAST(0x00005d8a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (21, 88, N'Andrea', N'Rivera', N'Blanco', N'Calle: Revolución #45  Col: Tecnologica', CAST(0x0000a58b008c6386 AS datetime), CAST(0x0000a58b008c6386 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b008c6386 AS datetime), N'4931030595', CAST(0x0000857700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (22, 89, N'Cecilia', N'Soto', N'Montellano', N'Calle: Roble #17  Col: Centro', CAST(0x0000a58b008e1e30 AS datetime), CAST(0x0000a58b008e1e30 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b008e1e30 AS datetime), N'4931073003', CAST(0x0000715700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (23, 106, N'Oscar Manuel', N'Hernández', N'Venegas', N'Calle: Colima #8  Col: Centro', CAST(0x0000a58b008f5208 AS datetime), CAST(0x0000a58e00b2af35 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2af35 AS datetime), N'9324451', CAST(0x00007b4200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (24, 108, N'Juan Carlos', N'Valenzuela', N'Pedroza', N'Calle: Juchipila #109  Col: Solidaridad', CAST(0x0000a58b008fe576 AS datetime), CAST(0x0000a58e00b2bf44 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2bf44 AS datetime), N'4931112115', CAST(0x00006f7100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (25, 112, N'Scarlett', N'Navarrete', N'Díaz', N'', CAST(0x0000a58b00919575 AS datetime), CAST(0x0000a58b00919575 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00919575 AS datetime), N'', CAST(0x0000807300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (26, 123, N'Alan Adrián', N'Román', N'Troncoso', N'Calle:Indndustria Quimica #4 Col: Industrial', CAST(0x0000a58b00944811 AS datetime), CAST(0x0000a58b00944811 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00944811 AS datetime), N'4931150179', CAST(0x0000805100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (27, 129, N'Paola', N'Rios', N'Hernández', N'Calle:20 de Noviembre #325 Col: Centro', CAST(0x0000a58b00951d61 AS datetime), CAST(0x0000a58b00951d61 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00951d61 AS datetime), N'4931083417', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (28, 130, N'Otoniel', N'Rodarte', N'Hernández', N'Calle: Avenida Juárez #424 Col: Centro', CAST(0x0000a58b0095e20d AS datetime), CAST(0x0000a58b0095e20d AS datetime), CAST ('True' AS bit), CAST(0x0000a58b0095e20d AS datetime), N'4931140432', CAST(0x00007b1600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (29, 132, N'Ricardo', N'Pereyra', N'Esparza', N'Calle: Veta de estaño #605 Col:Fovissste', CAST(0x0000a58b009aa259 AS datetime), CAST(0x0000a58b009aa259 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009aa259 AS datetime), N'4939334593', CAST(0x00005b7000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (30, 136, N'Angél', N'Aguilar', N'Hernández', N'Calle: Codo Nte #8 Col:Centro', CAST(0x0000a58b009ba574 AS datetime), CAST(0x0000a58b009ba574 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009ba574 AS datetime), N'9321589', CAST(0x000058c200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (31, 145, N'Francisco Javier', N'Manriquez', N'Muñoz', N'Calle:Veta la Eperanza #276', CAST(0x0000a58b009c2d19 AS datetime), CAST(0x0000a58e00b2d8ec AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2d8ec AS datetime), N'4931068069', CAST(0x00006f5400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (32, 149, N'Rafael', N'Escobedo', N'Hernández', N'Calle: Gabriel Lugo #117 Col:Del parque', CAST(0x0000a58b009d1f5a AS datetime), CAST(0x0000a58b009d1f5a AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009d1f5a AS datetime), N'4931030466', CAST(0x00006c5a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (33, 151, N'Andrea', N'Carrera', N'Mendéz', N'Calle: Apolo#208 Col: Industrial', CAST(0x0000a58b009d8d0a AS datetime), CAST(0x0000a58b009d8d0a AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009d8d0a AS datetime), N'9330959', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (34, 155, N'Blanca Esthela', N'Morales', N'Rodriguez', N'Calle: Las Rosas #33 Col: Lasalle', CAST(0x0000a58b009f0a34 AS datetime), CAST(0x0000a58b009f0a34 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009f0a34 AS datetime), N'4931209477', CAST(0x0000779500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (35, 159, N'Ana', N'Chairez', N'Félix', N'Calle: Hombres Ilustres #38 Col: Centro', CAST(0x0000a58b009fc82c AS datetime), CAST(0x0000a58b009fc82c AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009fc82c AS datetime), N'4931008787', CAST(0x000060a200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (36, 174, N'Guillermo', N'Huitron', N'Carranza', N'Calle: Tiro fortuna #203 Col: Minera', CAST(0x0000a58b00a0c2a9 AS datetime), CAST(0x0000a58b00a0c2a9 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a0c2a9 AS datetime), N'9331251', CAST(0x000072f500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (37, 176, N'Manuel', N'Valdéz', N'Flores', N'Calle: Hombres Ilustres Col: Centro', CAST(0x0000a58b00a28179 AS datetime), CAST(0x0000a58b00a28179 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a28179 AS datetime), N'', CAST(0x0000805d00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (38, 178, N'Norma Alicia', N'Huizar', N'Bañuelos', N'Calle: Gómez Farias #249 Col: Centro', CAST(0x0000a58b00a2f3df AS datetime), CAST(0x0000a58b00a2f3df AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a2f3df AS datetime), N'9322722', CAST(0x000087c700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (39, 188, N'Jésus', N'Rivera', N'Sandoval', N'Calle:Laboratoristas #209 Col: Tecnologica', CAST(0x0000a58b00a75131 AS datetime), CAST(0x0000a58b00a75131 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a75131 AS datetime), N'4937962986', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (40, 203, N'Ignacio', N'Puentes', N'Hernández', N'Calle:Industria agropecuaria #138 Col: Industrial', CAST(0x0000a58b00a7fa49 AS datetime), CAST(0x0000a58b00a7fa49 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a7fa49 AS datetime), N'9334338', CAST(0x0000620400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (41, 225, N'Cinthia Janeth', N'Medellín', N'Hurtado', N'Calle:Teotihuacana #104 Col: Francisco Goytia', CAST(0x0000a58b00a879d9 AS datetime), CAST(0x0000a58b00a879d9 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a879d9 AS datetime), N'4931150009', CAST(0x00007d8900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (42, 249, N'María Angélica', N'Díaz', N'Sánchez', N'Calle:Avenida Juárez#232 Col: Centro', CAST(0x0000a58b00a8ff27 AS datetime), CAST(0x0000a58b00a8ff27 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a8ff27 AS datetime), N'9332417', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (43, 259, N'Pola', N'Malpica', N'Serrano', N'Calle:Avenida Enrique Estrada #503 Col: Centro', CAST(0x0000a58b00a95e15 AS datetime), CAST(0x0000a58b00a95e15 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a95e15 AS datetime), N'4931068420', CAST(0x00005c8300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (44, 268, N'Michel', N'Martínez', N'Delgado', N'Calle:Huicot #208 Col: Tecnologica', CAST(0x0000a58b00c00ba5 AS datetime), CAST(0x0000a58b00c00ba5 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c00ba5 AS datetime), N'4931066431', CAST(0x0000732a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (45, 274, N'Juan Antonio', N'Piña', N'Hernández', N'Calle:Avenida Juárez #427 Col: Centro', CAST(0x0000a58b00c0a55e AS datetime), CAST(0x0000a58b00c0a55e AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c0a55e AS datetime), N'4931140833', CAST(0x00006d8e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (46, 308, N'Alan Eduardo', N'Cáldera', N'Pinedo', N'Calle:Veta de estaño #325 Col:Lomas de la fortuna', CAST(0x0000a58b00c18c01 AS datetime), CAST(0x0000a58e00b2fc10 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2fc10 AS datetime), N'9327537', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (48, 310, N'Susana', N'Díaz', N'Bañuelos', N'Calle:Carrillo Puerto #319 Colonia: Esparza', CAST(0x0000a58b00c28c68 AS datetime), CAST(0x0000a58b00c28c68 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c28c68 AS datetime), N'4939390506', CAST(0x0000607500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (49, 318, N'Jésus', N'Muñoz', N'Sánchez', N'Calle:Rosas Moreno #9 Colonia: Centro', CAST(0x0000a58b00c3f2a6 AS datetime), CAST(0x0000a58b00c3f2a6 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c3f2a6 AS datetime), N'9322656', CAST(0x0000614600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (50, 319, N'Jésus', N'Muñoz', N'Soriano', N'Calle:Rosas Moreno #9 Colonia: Centro', CAST(0x0000a58b00c42efa AS datetime), CAST(0x0000a58e00b30cfe AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b30cfe AS datetime), N'9322656', CAST(0x0000804700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (51, 332, N'David', N'Román', N'Graciano', N'', CAST(0x0000a58b00c471f6 AS datetime), CAST(0x0000a58b00c471f6 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c471f6 AS datetime), N'', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (52, 333, N'Aldo Jahir', N'Román', N'Sánchez', N'', CAST(0x0000a58b00c49bfc AS datetime), CAST(0x0000a58e00b31c64 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b31c64 AS datetime), N'', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (53, 334, N'David Alonso', N'Román', N'Sánchez', N'Calle:America #105 Colonia: Centro', CAST(0x0000a58b00c51690 AS datetime), CAST(0x0000a58b00c51690 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c51690 AS datetime), N'9329947', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (54, 336, N'Claudia', N'Carolina', N'Vasquez', N'Calle:Gónzalez boca negra #106 Colonia: Centro', CAST(0x0000a58b00c5f3dc AS datetime), CAST(0x0000a58b00c5f3dc AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c5f3dc AS datetime), N'9329947', CAST(0x0000855500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (55, 343, N'Nicolas', N'Soto', N'Acosta', N'Calle:Lázaro Cárdenas #426 Colonia: Centro', CAST(0x0000a58b00c6b707 AS datetime), CAST(0x0000a58b00c6b707 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c6b707 AS datetime), N'4931120346', CAST(0x00006d3f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (56, 355, N'Leed', N'Alvarado', N'Hernández', N'Calle: Cromo #18 Col:Lomas del mineral', CAST(0x0000a58b00cc857c AS datetime), CAST(0x0000a58b00cc857c AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00cc857c AS datetime), N'4939597306', CAST(0x0000746d00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (57, 371, N'Manuel Josimar', N'Córtez', N'Camacho', N'Calle:Privada López Mateos #401 Col: Maravillas', CAST(0x0000a58b00cda285 AS datetime), CAST(0x0000a58b00cda285 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00cda285 AS datetime), N'4931128416', CAST(0x00007e9c00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (58, 377, N'Juan', N'Medrano', N'Alvarado', N'Calle:Alvaro Obregón #104 Col: Centro', CAST(0x0000a58b00ce8370 AS datetime), CAST(0x0000a58b00ce8370 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00ce8370 AS datetime), N'', CAST(0x00006a0400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (59, 379, N'Jorge Alberto', N'Barrón', N'Rangel', N'Calle:Alvaro Obregón #213 Col: Centro', CAST(0x0000a58b00cf56e5 AS datetime), CAST(0x0000a58c007f35e4 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c007f35e4 AS datetime), N'9321892', CAST(0x00007c3900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (60, 382, N'Alejandra Juliana', N'Pérez', N'Castillo', N'Calle:Rosas Moreno #9 Col: Centro', CAST(0x0000a58b00cff259 AS datetime), CAST(0x0000a58e00b33fa0 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b33fa0 AS datetime), N'9843001', CAST(0x000083e800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (61, 382, N'Alejandra Juliana', N'Pérez', N'Castillo', N'Calle:Rosas Moreno #9 Col: Centro', CAST(0x0000a58b0148a1d1 AS datetime), CAST(0x0000a58b0149ea10 AS datetime), CAST ('False' AS bit), CAST(0x0000a58b0149ea10 AS datetime), N'9843001', CAST(0x000083e800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (62, 382, N'Alejandra Juliana', N'Pérez', N'Castillo', N'Calle:Rosas Moreno #9 Col: Centro', CAST(0x0000a58c007f17a5 AS datetime), CAST(0x0000a58c007f17a5 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c007f17a5 AS datetime), N'9843001', CAST(0x000083e800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (63, 389, N'Edgar', N'Venegas', N'López', N'Libertad #118 Centro', CAST(0x0000a58c008069ef AS datetime), CAST(0x0000a58c008069ef AS datetime), CAST ('True' AS bit), CAST(0x0000a58c008069ef AS datetime), N'9320519', CAST(0x000071b300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (64, 412, N'Antonio ', N'Landecho', N'Salazar', N'', CAST(0x0000a58c0081b7db AS datetime), CAST(0x0000a58c0081b7db AS datetime), CAST ('True' AS bit), CAST(0x0000a58c0081b7db AS datetime), N'4931007369', CAST(0x000083a800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (65, 414, N'Lizbeth', N'Guardado', N'Perales', N'Calle: Privada 20 de Nov #6 Col: Benito Juárez', CAST(0x0000a58c00915443 AS datetime), CAST(0x0000a58c00915443 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00915443 AS datetime), N'9332777', CAST(0x00008a5800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (66, 415, N'Jorge Antonio', N'Guardado', N'Mendéz', N'Calle: Privada 20 de Nov #6 Col: Benito Juárez', CAST(0x0000a58c0092002c AS datetime), CAST(0x0000a58c0092002c AS datetime), CAST ('True' AS bit), CAST(0x0000a58c0092002c AS datetime), N'4931122826', CAST(0x00005cbb00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (67, 416, N'María Leticia', N'Camacho', N'Hernández', N'Calle: Privada López Mateos #401 Colonia: Maravillas', CAST(0x0000a58c00929fb8 AS datetime), CAST(0x0000a58c00929fb8 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00929fb8 AS datetime), N'4939597602', CAST(0x00005ea600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (68, 418, N'Arturo', N'Aguayo', N'Rojas', N'Calle: Gómez Farias #8 Colonia: Centro', CAST(0x0000a58c00931d5f AS datetime), CAST(0x0000a58c00931d5f AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00931d5f AS datetime), N'4931123389', CAST(0x0000677700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (69, 424, N'Daniel', N'Campos', N'De la Rosa', N'Calle: Carrillo Puerto #215 Colonia: Esparza', CAST(0x0000a58c0095893e AS datetime), CAST(0x0000a58c0095893e AS datetime), CAST ('True' AS bit), CAST(0x0000a58c0095893e AS datetime), N'9320938', CAST(0x0000780900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (70, 425, N'Raymundo', N'Campos', N'De la Rosa', N'Calle: Carrillo Puerto #215 Col: Esparza', CAST(0x0000a58c00970db2 AS datetime), CAST(0x0000a58c00970db2 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00970db2 AS datetime), N'9324646', CAST(0x0000729a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (71, 441, N'Rafael', N'González', N'López', N'Calle:Paseo del mineral #814 Colonia:Las flores', CAST(0x0000a58c0097e7b6 AS datetime), CAST(0x0000a58c0097e7b6 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c0097e7b6 AS datetime), N'4931143292', CAST(0x000070fb00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (72, 453, N'Amado', N'Cortéz', N'Medina', N'Calle:Privada López Mateos#401 Colonia:Maravillas', CAST(0x0000a58c00986c00 AS datetime), CAST(0x0000a58c00986c00 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00986c00 AS datetime), N'9335265', CAST(0x0000597400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (73, 468, N'Jonathan', N'Villagran', N'Martínez', N'Calle: Electricistas #14 Colonia: Electricistas', CAST(0x0000a58c009c282b AS datetime), CAST(0x0000a58c009c282b AS datetime), CAST ('True' AS bit), CAST(0x0000a58c009c282b AS datetime), N'4931030163', CAST(0x00007cef00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (74, 486, N'Erika', N'Torres', N'Pinedo', N'Calle: Palomar #2 Colonia: Sector Lagunilla', CAST(0x0000a58c00a0b775 AS datetime), CAST(0x0000a58c00a0b775 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a0b775 AS datetime), N'9327740', CAST(0x000074e700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (75, 500, N'Porfirio', N'Flores', N'Perales', N'Calle:11 de Julio #37 Colonia: Tecnologica', CAST(0x0000a58c00a14692 AS datetime), CAST(0x0000a58c00a14692 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a14692 AS datetime), N'4931128697', CAST(0x00006d6a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (76, 508, N'Diego', N'Rivera', N'Muro', N'Calle:Privada rio papaloapan #3 Colonia: ', CAST(0x0000a58c00a2a114 AS datetime), CAST(0x0000a58c00a2a114 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a2a114 AS datetime), N'9329003', CAST(0x000082b500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (77, 514, N'Antonio', N'Varela', N'Conn', N'Calle:Ensaye #113 Int #5 Colonia: Centro', CAST(0x0000a58c00a3201d AS datetime), CAST(0x0000a58c00a3201d AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a3201d AS datetime), N'9328780', CAST(0x0000640c00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (78, 516, N'Marisol', N'Hernández', N'Valdéz', N'Calle:Independencia #23  Colonia: Centro', CAST(0x0000a58c00a3b09c AS datetime), CAST(0x0000a58e00b39625 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b39625 AS datetime), N'4931067919', CAST(0x00007c7300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (79, 526, N'Cinthia', N'Pinedo', N'Torres', N'Calle:Ministerio de guerra #3  Colonia: Fraccionamiento Gonzalez Ortega', CAST(0x0000a58c00a4dda0 AS datetime), CAST(0x0000a58c00a4dda0 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a4dda0 AS datetime), N'9335523', CAST(0x00007cee00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (80, 539, N'David', N'Bracamontes', N'Dominguez', N'Calle:Puente #3  Colonia: Centro', CAST(0x0000a58c00a5582e AS datetime), CAST(0x0000a58c00a5582e AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a5582e AS datetime), N'4931029493', CAST(0x00007f1d00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (81, 563, N'José Iván', N'Balderas', N'Santoyo', N'Calle: Indusrtia Artesanal #316 Colonia: Industrial', CAST(0x0000a58c00b500dd AS datetime), CAST(0x0000a58c00b500dd AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b500dd AS datetime), N'9330493', CAST(0x0000834600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (82, 571, N'Jonathan Eduardo', N'Hernández', N'Saenz', N'Calle: Veta de plata #422 Colonia:Lomas de la fortuna', CAST(0x0000a58c00b58e97 AS datetime), CAST(0x0000a58c00b58e97 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b58e97 AS datetime), N'4939371727', CAST(0x000089de00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (83, 576, N'Arturo', N'Gurrola', N'Carrillo', N'Calle: Pinavetes #21 Colonia: Arboledas', CAST(0x0000a58c00b67b30 AS datetime), CAST(0x0000a58c00b67b30 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b67b30 AS datetime), N'4931112117', CAST(0x000082eb00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (84, 599, N'Luis Arturo', N'Ramírez', N'Arellano', N'Calle: Industria Textil #204 Colonia: Industrial', CAST(0x0000a58c00b6e6e2 AS datetime), CAST(0x0000a58c00b6e6e2 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b6e6e2 AS datetime), N'9329066', CAST(0x000074d100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (85, 624, N'Fernando Issac', N'Gil', N'Valdez', N'Calle: Algodoneros #714 Colonia: Industrial', CAST(0x0000a58c00b78e8a AS datetime), CAST(0x0000a58c00b78e8a AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b78e8a AS datetime), N'4931065221', CAST(0x00007cac00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (86, 660, N'Jésus', N'González', N'Ortíz', N'Calle: Hombres Ilustres #20 Colonia: José Ma. Vasquez', CAST(0x0000a58c00b8183f AS datetime), CAST(0x0000a58c00b8183f AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b8183f AS datetime), N'4931140477', CAST(0x00007e5c00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (87, 663, N'Miguel Angél', N'Ayala', N'Santana', N'Calle: Roque Estrada #12 Colonia: Fovissste', CAST(0x0000a58c00b8a607 AS datetime), CAST(0x0000a58c00b8a607 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b8a607 AS datetime), N'4931146333', CAST(0x00007f6100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (88, 669, N'Jonathan', N'Pasillas', N'Cisneros', N'Calle: Privada 4to centenario #10 Colonia: Del parque', CAST(0x0000a58c00b924ec AS datetime), CAST(0x0000a58c00b924ec AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b924ec AS datetime), N'8780054', CAST(0x0000830e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (89, 675, N'Javier', N'Barrios', N'Lara', N'Calle: Sierra Madre#125 Colonia: Lomas de pláteros', CAST(0x0000a58c00b97988 AS datetime), CAST(0x0000a58e00b3bc1a AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b3bc1a AS datetime), N'8780054', CAST(0x000084df00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (90, 676, N'Josue', N'Peralta', N'Félix', N'Calle:Puente #3 Colonia: Sector Lagunilla', CAST(0x0000a58c00b9e7a4 AS datetime), CAST(0x0000a58c00b9e7a4 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b9e7a4 AS datetime), N'4931037384', CAST(0x000079b200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (91, 689, N'Juan Carlos', N'Serrano', N'Ortega', N'Calle: Río Nazas #5 Colonia: Lindavista', CAST(0x0000a58c00bb6c8a AS datetime), CAST(0x0000a58c00bb6c8a AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00bb6c8a AS datetime), N'4931200224', CAST(0x000072c400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (92, 705, N'Juan Francisco', N'Medina', N'Benitez', N'Nuevo León #404 Centro', CAST(0x0000a58c00bcfb3d AS datetime), CAST(0x0000a58c00bcfb3d AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00bcfb3d AS datetime), N'4938781525', CAST(0x000076ac00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (93, 716, N'María Guadalupe', N'Carrera', N'Hernández', N'Calle: Sonora #26 Colonia: Centro', CAST(0x0000a58c00bf1a9a AS datetime), CAST(0x0000a58c00bf1a9a AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00bf1a9a AS datetime), N'4934681190', CAST(0x000086e000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (94, 732, N'Luis Manuel', N'Mendoza', N'Triana', N'Calle: Junque #121 Colonia: Fraccionamiento villas de plateros', CAST(0x0000a58c00bfa77d AS datetime), CAST(0x0000a58c00bfa77d AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00bfa77d AS datetime), N'4931030863', CAST(0x0000711f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (95, 743, N'Verónica', N'Martínez', N'Candia', N'Calle:Hombres Ilustres', CAST(0x0000a58c00c05dca AS datetime), CAST(0x0000a58c00c05dca AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00c05dca AS datetime), N'9326737', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (96, 744, N'Liliana Jaqueline', N'Rosales', N'', N'Calle:Niño Artillero', CAST(0x0000a58c00c098ae AS datetime), CAST(0x0000a58c00c098ae AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00c098ae AS datetime), N'', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (97, 748, N'Juan Luis', N'Martínez', N'Rucobo ', N'Calle:Ejercito de oriente #40 Fraccionamiento Gonzalez Ortega', CAST(0x0000a58c00c10680 AS datetime), CAST(0x0000a58c00c10680 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00c10680 AS datetime), N'9321166', CAST(0x0000865800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (98, 751, N'Margarita', N'Basurto', N'Frausto', N'Calle: Insurgentes #18 Colonia: Industrial', CAST(0x0000a58c00d55479 AS datetime), CAST(0x0000a58c00d55479 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00d55479 AS datetime), N'9329038', CAST(0x000057b100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (99, 763, N'Mayra', N'Ramírez', N'Trejo', N'Calle:Colima #40 Colonia: Centro', CAST(0x0000a58c00d5d383 AS datetime), CAST(0x0000a58c00d5d383 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00d5d383 AS datetime), N'4931006310', CAST(0x00007faf00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (100, 764, N'José Luis', N'Reyes', N'Hernández', N'Calle:Circuito Técnico #18 Colonia: Del Fresno', CAST(0x0000a58c00d66893 AS datetime), CAST(0x0000a58c00d66893 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00d66893 AS datetime), N'9323125', CAST(0x00005fec00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (101, 999, N'Flavio César', N'De la Rosa', N'Muñoz', N'Calle:Belisario Dominguez #523 Colonia:Centro', CAST(0x0000a58c014b7949 AS datetime), CAST(0x0000a58c014cde97 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c014cde97 AS datetime), N'9326591', CAST(0x0000869e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (102, 3673, N'Miguel Angél', N'Rojas', N'Bermudez', N'Calle:Oaxaca #417 Colonia:Industrial', CAST(0x0000a58d014a8ca7 AS datetime), CAST(0x0000a59101489f8e AS datetime), CAST ('True' AS bit), CAST(0x0000a59101489f8e AS datetime), N'4931030333', CAST(0x0000811400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (103, 791, N'Armando', N'Galván', N'Estrada', N'Calle:Aquiles serdan #99 colonia: Centro', CAST(0x0000a58e00a84882 AS datetime), CAST(0x0000a58e00a84882 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00a84882 AS datetime), N'9329736', CAST(0x00005ac200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (104, 802, N'Martín Alejandro', N'Herrera', N'Román', N'Calle:Del parque #120 Colonia: Esparza', CAST(0x0000a58e00ac1552 AS datetime), CAST(0x0000a58e00b22439 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b22439 AS datetime), N'8780163', CAST(0x000082ca00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (105, 853, N'Jorge Adalberto', N'Mendoza', N'Morales', N'Calle: Melchor ocampo #12 Colonia: Benito Juárez', CAST(0x0000a58e00acd232 AS datetime), CAST(0x0000a58e00ae18c3 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00ae18c3 AS datetime), N'4931076371', CAST(0x0000501b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (106, 856, N'Jorge César', N'Mendoza', N'Herrera', N'Calle: Melchor ocampo #12 Colonia: Benito Juárez', CAST(0x0000a58e00aea442 AS datetime), CAST(0x0000a5910149182c AS datetime), CAST ('True' AS bit), CAST(0x0000a5910149182c AS datetime), N'4931077005', CAST(0x00006b6100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (107, 866, N'Estefania', N'Frayre', N'Ruvalcaba', N'Calle: Claveles #126 Colonia: Fraccionamiento el vergel', CAST(0x0000a58e00b117a2 AS datetime), CAST(0x0000a58e00b3e61a AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b3e61a AS datetime), N'8780106', CAST(0x00008b8a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (108, 868, N'Luis Carlos', N'Camacho', N'Martínez', N'Calle: Industria pesquera #519 Colonia: Industrial', CAST(0x0000a58e00b5e15f AS datetime), CAST(0x0000a58e00b60cc9 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00b60cc9 AS datetime), N'4931017046', CAST(0x000087a900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (109, 880, N'Luis Angél', N'Mcormick', N'Isunza', N'Calle: Av. Juárez #224 Colonia: Centro', CAST(0x0000a58e00c076d4 AS datetime), CAST(0x0000a58e00c076d4 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c076d4 AS datetime), N'', CAST(0x0000765900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (110, 1000, N'Oralia', N'Solis', N'Romo', N'Calle: Palomar #2 Colonia: Lagunilla', CAST(0x0000a58e00c131f3 AS datetime), CAST(0x0000a58e00c131f3 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c131f3 AS datetime), N'9335454', CAST(0x0000604700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (111, 2034, N'Fernando', N'Sucunza', N'Cerda', N'Calle: Morelos sur#6 Colonia: Centro', CAST(0x0000a58e00c1c3fb AS datetime), CAST(0x0000a58e00c1c3fb AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c1c3fb AS datetime), N'9325074', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (112, 883, N'Luis Manuel', N'García', N'Victorio', N'Calle: Monte Escobedo#16 Colonia: Solidaridad', CAST(0x0000a58e00c48d56 AS datetime), CAST(0x0000a58e00c48d56 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c48d56 AS datetime), N'4931154697', CAST(0x0000772600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (113, 889, N'Alejandro', N'Román', N'Troncoso', N'Calle: Industria Quimica #4 Colonia: Industrial', CAST(0x0000a58e00c70f34 AS datetime), CAST(0x0000a58e00c70f34 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c70f34 AS datetime), N'4931150178', CAST(0x0000840e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (114, 917, N'Sergio Alberto', N'Veloz', N'Cortez', N'Calle:Delicias #11 Colonia:Centro', CAST(0x0000a58e00c840bf AS datetime), CAST(0x0000a58e00c840bf AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c840bf AS datetime), N'9322063', CAST(0x0000809300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (115, 1017, N'Manuel Guillermo', N'Acuña', N'Landeros', N'Calle:La luz#326 Colonia:Centro', CAST(0x0000a58e00c8f52d AS datetime), CAST(0x0000a58e00c8f52d AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c8f52d AS datetime), N'9321998', CAST(0x00004e8100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (116, 2035, N'Mauricio', N'Ibarra', N'Huerta', N'Calle: 20 de Noviembre #334 Colonia: Centro', CAST(0x0000a58e00ca848b AS datetime), CAST(0x0000a58e00ca848b AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00ca848b AS datetime), N'9836780', CAST(0x00008a7900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (117, 923, N'Martín', N'Cumplido', N'Mier', N'Calle: Mina #408 Colonia:Centro', CAST(0x0000a58e0112be16 AS datetime), CAST(0x0000a58e0112be16 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0112be16 AS datetime), N'9322060', CAST(0x00007eab00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (118, 929, N'Alan', N'Reyes', N'Mauricio', N'Calle: Circuito técnico#18 Colonia:Del fresno', CAST(0x0000a58e01146eb7 AS datetime), CAST(0x0000a58e01146eb7 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01146eb7 AS datetime), N'9323125', CAST(0x0000917300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (119, 935, N'Laura Esther', N'Guerra', N'Avalos', N'Calle:Industria quimica #4Colonia:Del fresno', CAST(0x0000a58e01180d52 AS datetime), CAST(0x0000a58e01180d52 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01180d52 AS datetime), N'9323125', CAST(0x0000810700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (120, 941, N'Francisco', N'Martínez', N'Galván', N'Calle:Justo Sierra #323 Colonia:Centro', CAST(0x0000a58e0118fe7d AS datetime), CAST(0x0000a58e0118fe7d AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0118fe7d AS datetime), N'9323125', CAST(0x000081e500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (121, 942, N'Salvador', N'Rivera', N'De la Rosa', N'Calle:24 de febrero #204 Colonia:Gónzalez Ortega', CAST(0x0000a58e011a8f16 AS datetime), CAST(0x0000a58e011a8f16 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e011a8f16 AS datetime), N'', CAST(0x000063f200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (122, 943, N'Luis', N'Sucunza', N'Márquez', N'Calle:Morelos Norte #215 Colonia:Gónzalez Ortega', CAST(0x0000a58e011e7bfe AS datetime), CAST(0x0000a58e011e7bfe AS datetime), CAST ('True' AS bit), CAST(0x0000a58e011e7bfe AS datetime), N'4934684261', CAST(0x0000521b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (123, 955, N'Maria Fernanda', N'Varela', N'Diaz', N'Calle:Ensaye #113 int #5 Colonia:Centro', CAST(0x0000a58e0120ce7a AS datetime), CAST(0x0000a58e0120ce7a AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0120ce7a AS datetime), N'9329961', CAST(0x000089ff00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (124, 965, N'Leticia', N'Ruelas', N'Martínez', N'Colonia:privada azucenas #6 Colonia: las flores', CAST(0x0000a58e0122097e AS datetime), CAST(0x0000a58e0122097e AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0122097e AS datetime), N'4931121206', CAST(0x00006be800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (125, 984, N'Adriana', N'Sánchez', N'Pérez', N'Colonia:Lázaro Cárdenas #40 Colonia: las flores', CAST(0x0000a58e01229bb8 AS datetime), CAST(0x0000a58e01229bb8 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01229bb8 AS datetime), N'4939597762', CAST(0x000080a500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (126, 1139, N'Graciela', N'Herrera', N'De Luna', N'Calle: Sonora #1A Colonia: Centro', CAST(0x0000a58e01333455 AS datetime), CAST(0x0000a58e01333455 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01333455 AS datetime), N'4931100440', CAST(0x00005ec600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (128, 1151, N'Cristian', N'Carrillo', N'Murillo', N'Calle:Laris #6 Colonia: Centro', CAST(0x0000a58e01347dc7 AS datetime), CAST(0x0000a58e01347dc7 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01347dc7 AS datetime), N'4931163849', CAST(0x0000734b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (129, 1133, N'Efrain', N'Sánchez', N'Venecia', N'Calle:Claveles #120 Colonia: El vergel', CAST(0x0000a58e0134f887 AS datetime), CAST(0x0000a58e0134f887 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0134f887 AS datetime), N'8780081', CAST(0x000085b100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (130, 1127, N'Carlos', N'Gómez', N'Gónzalez', N'Calle:Claveles #120 Colonia: El vergel', CAST(0x0000a58e013584fe AS datetime), CAST(0x0000a58e013584fe AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013584fe AS datetime), N'4931211030', CAST(0x000084eb00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (131, 1114, N'Mónica', N'Piña', N'Romero', N'Calle:Claveles #120 Colonia: El vergel', CAST(0x0000a58e0136bf87 AS datetime), CAST(0x0000a58e0136bf87 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0136bf87 AS datetime), N'4931157252', CAST(0x0000864300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (132, 1113, N'Arturo', N'Piña', N'Soto', N'Calle:Av Hidalgo#412 Colonia: Centro', CAST(0x0000a58e01373ebf AS datetime), CAST(0x0000a58e01373ebf AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01373ebf AS datetime), N'4939597988', CAST(0x00005b1f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (133, 1154, N'Francisco Javier', N'Espino', N'Munguia', N'Calle:Tlaxcaltecas#16 Colonia:Mesoamerica', CAST(0x0000a58e0137af02 AS datetime), CAST(0x0000a58e0137af02 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0137af02 AS datetime), N'4931178817', CAST(0x0000805e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (134, 1100, N'Fabio Rafael', N'Uribe', N'Hernandez', N'Calle:Plazuela del caminero#9 Colonia:Fovissste', CAST(0x0000a58e01382eda AS datetime), CAST(0x0000a58e01382eda AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01382eda AS datetime), N'4934688594', CAST(0x000089fa00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (135, 1071, N'Eduardo', N'Almeida', N'Dominguez', N'Calle:Plateros#112 Colonia:Centro', CAST(0x0000a58e0138a441 AS datetime), CAST(0x0000a58e0138a441 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0138a441 AS datetime), N'4492102868', CAST(0x0000838e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (136, 1050, N'Diana Yareli', N'López', N'Serrano', N'Calle: Napoleon Gomez Sada #34Colonia:Napoleon', CAST(0x0000a58e0139302f AS datetime), CAST(0x0000a58e0139302f AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0139302f AS datetime), N'9358068', CAST(0x000084e400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (137, 1034, N'Roberto', N'Ricoy', N'Hernández', N'', CAST(0x0000a58e0139e71b AS datetime), CAST(0x0000a58e0139e71b AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0139e71b AS datetime), N'', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (138, 1033, N'Marlene ', N'Martinez', N'Juárez', N'', CAST(0x0000a58e013a3862 AS datetime), CAST(0x0000a58e013a3862 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013a3862 AS datetime), N'', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (139, 1122, N'Francisco Javier', N'Marino', N'Moreno', N'Calle:Xicotencatl #2 Colonia: Lagunilla', CAST(0x0000a58e013aafad AS datetime), CAST(0x0000a58e013aafad AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013aafad AS datetime), N'9333727', CAST(0x0000825900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (140, 1121, N'María Hulvia', N'Rivera', N'Rodriguez', N'Calle:Reforma #2 Colonia: Centro', CAST(0x0000a58e013b23c3 AS datetime), CAST(0x0000a58e013b23c3 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013b23c3 AS datetime), N'9320129', CAST(0x0000679d00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (141, 1163, N'Dennise', N'Monreal', N'Chairez', N'Calle:Hidalgo #379 Colonia: Centro', CAST(0x0000a58e013b8795 AS datetime), CAST(0x0000a58e013b8795 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013b8795 AS datetime), N'4931162967', CAST(0x0000830100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (142, 1169, N'Crystal', N'Flores', N'Alaniz', N'Calle:Puebla #20 Colonia: Centro', CAST(0x0000a58e013c5f12 AS datetime), CAST(0x0000a58e013c5f12 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013c5f12 AS datetime), N'9331451', CAST(0x0000809200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (143, 1180, N'Juan Manuel', N'Flores', N'Alaniz', N'Calle:Puebla #20 Colonia: Centro', CAST(0x0000a58e013cfbcc AS datetime), CAST(0x0000a58e013cfbcc AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013cfbcc AS datetime), N'9331451', CAST(0x0000757f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (144, 1191, N'Jaime', N'Gonzalez', N'Romo', N'Calle:Sonora #106 Colonia: Centro', CAST(0x0000a58e013da87e AS datetime), CAST(0x0000a58e013da87e AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013da87e AS datetime), N'4931061897', CAST(0x000087d800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (145, 1198, N'Juan Carlos', N'Valle', N'Solis', N'Calle:Privada Venustiano Carranza#27 A Colonia: Sector Lagunilla', CAST(0x0000a58e013e5792 AS datetime), CAST(0x0000a58e013e5792 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013e5792 AS datetime), N'4931061897', CAST(0x000071b800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (146, 1210, N'Maria José', N'Carlos', N'De la Torre', N'Calle:Guayana#4 A Colonia: Esparza', CAST(0x0000a58e013f5dc1 AS datetime), CAST(0x0000a58e013f5dc1 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013f5dc1 AS datetime), N'9332487', CAST(0x0000862e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (147, 1216, N'Edgar', N'Del cojo', N'Pinedo', N'', CAST(0x0000a58e013fc429 AS datetime), CAST(0x0000a58e013fc429 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013fc429 AS datetime), N'', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (148, 1222, N'Sharon', N'Márquez', N'Arias', N'Calle:pinavetes #19 Colonia:Arboledas', CAST(0x0000a58e0140662d AS datetime), CAST(0x0000a58e0140662d AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0140662d AS datetime), N'4939492620', CAST(0x00008ba300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (149, 1253, N'Altagracia', N'Hernández', N'Flores', N'Calle:Vaso de la Lagunilla #4 Col:Sector Lagunilla', CAST(0x0000a58e01553e04 AS datetime), CAST(0x0000a58e01553e04 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01553e04 AS datetime), N'4931108013', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (150, 1250, N'Karina', N'Solis', N'De Santiago', N'Calle:Privada Plan de Guadalupe  #13 Colonia:Venustiano Carranza', CAST(0x0000a58e0155dd5a AS datetime), CAST(0x0000a58e0155dd5a AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0155dd5a AS datetime), N'4931041827', CAST(0x0000788a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (151, 1258, N'Maria Guadalupe', N'Mier', N'Carrillo', N'Calle:Justo sierra #325 Colonia:Centro', CAST(0x0000a58e01568306 AS datetime), CAST(0x0000a58e01568306 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01568306 AS datetime), N'9321690', CAST(0x00006c5a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (152, 1235, N'Omar', N'Carrillo', N'Solis', N'Calle:Fraccionamiento Lomas de la la Fortuna #220', CAST(0x0000a58e01575eb5 AS datetime), CAST(0x0000a58e01575eb5 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01575eb5 AS datetime), N'9330130', CAST(0x000082f200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (153, 1228, N'Manuel Alberto', N'Espinoza', N'Celaya', N'Calle:Ignacio Zaragoza #1 Colonia: Miguel Hidalgo', CAST(0x0000a58e0157cd25 AS datetime), CAST(0x0000a58e0157cd25 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0157cd25 AS datetime), N'4937963532', CAST(0x00008fcd00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (154, 1284, N'Maribel', N'Marino', N'Moreno', N'Calle:IXicotencatl #2 Colonia: Sector Lagunilla', CAST(0x0000a58e015849bf AS datetime), CAST(0x0000a58e015849bf AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015849bf AS datetime), N'4931129143', CAST(0x00007c5400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (155, 1285, N'Diana', N'Rivera', N'Gandara', N'Calle:Gómez Farias#108 Colonia: Electricistas', CAST(0x0000a58e0158dc30 AS datetime), CAST(0x0000a58e0158dc30 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0158dc30 AS datetime), N'9320125', CAST(0x000086bd00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (156, 1300, N'Juan José', N'Guzmán', N'Mota', N'Calle:Articulo 27#605 Colonia: Luis Donaldo Colosio', CAST(0x0000a58e0159b099 AS datetime), CAST(0x0000a58e0159b099 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0159b099 AS datetime), N'9354457', CAST(0x0000843f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (157, 1314, N'Amairani', N'Castorena', N'Mijares', N'Calle:21 de Marzo#201 Colonia: Centro', CAST(0x0000a58e015a5f69 AS datetime), CAST(0x0000a58e015a5f69 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015a5f69 AS datetime), N'4931077690', CAST(0x0000843f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (158, 1322, N'Aurora', N'Ledesma', N'Macias', N'Calle:Diamante#7 Colonia: Privada la joya', CAST(0x0000a58e015cfa44 AS datetime), CAST(0x0000a58e015cfa44 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015cfa44 AS datetime), N'4931202908', CAST(0x0000639f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (159, 1336, N'Maria Concepcion', N'Muro', N'De la torre', N'Calle:Diamante#7 Colonia: Privada la joya', CAST(0x0000a58e015d8bdb AS datetime), CAST(0x0000a58e015d8bdb AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015d8bdb AS datetime), N'4931075401', CAST(0x00006c7200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (160, 1341, N'Irving Eduardo', N'Dávila', N'Varela', N'CalleEjercito de Oriente #38 Colonia: Fraccionamiento Gonzalez Ortega', CAST(0x0000a58e015e518d AS datetime), CAST(0x0000a58e015e518d AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015e518d AS datetime), N'4931008661', CAST(0x000086b700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (161, 1360, N'Pedro', N'Dominguez', N'Campos', N'Calle:Garcia Salinas #474 int 16 Colonia:Centro', CAST(0x0000a59300817240 AS datetime), CAST(0x0000a59300822baf AS datetime), CAST ('True' AS bit), CAST(0x0000a59300822baf AS datetime), N'4931012079', CAST(0x000067de00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (162, 1367, N'Fernando', N'Rodriguez', N'Romero', N'Calle:Doroteo Arango #230 Colonia:Francisco Villa', CAST(0x0000a5930082128d AS datetime), CAST(0x0000a5930082128d AS datetime), CAST ('True' AS bit), CAST(0x0000a5930082128d AS datetime), N'4931028279', CAST(0x0000843400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (163, 1404, N'Manuel', N'Bracamontes', N'Pasillas', N'Calle:2da de Tepetongo#26 Colonia:Industrial', CAST(0x0000a5930082d6e9 AS datetime), CAST(0x0000a5930082d6e9 AS datetime), CAST ('True' AS bit), CAST(0x0000a5930082d6e9 AS datetime), N'9333795', CAST(0x0000858400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (164, 1414, N'Saúl', N'Esparza', N'Jaime', N'CerCalle: Cerrada del telegrafo #2 Colonia: Fovissste', CAST(0x0000a5930087fde2 AS datetime), CAST(0x0000a5930087fde2 AS datetime), CAST ('True' AS bit), CAST(0x0000a5930087fde2 AS datetime), N'4931141913', CAST(0x00006da500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (165, 1417, N'Fernanda Isabel', N'Martínez', N'Calvillo', N'Calle: Arteaga#416 Colonia: Centro', CAST(0x0000a59300888f79 AS datetime), CAST(0x0000a59300895e59 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300895e59 AS datetime), N'4931166410', CAST(0x000087f000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (166, 1418, N'Karla Liliana', N'Gutierrez', N'De Santiago', N'Calle: De los pinos #408 Colonia:Arboledas', CAST(0x0000a59300894f76 AS datetime), CAST(0x0000a59300894f76 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300894f76 AS datetime), N'4934688633', CAST(0x0000885e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (167, 1424, N'Nicolas', N'Peralta', N'Félix', N'Calle:Piramide del sol #104Colonia:Francisco Goytia', CAST(0x0000a593008cc781 AS datetime), CAST(0x0000a593008cc781 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008cc781 AS datetime), N'4931038510', CAST(0x00006d4900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (168, 1491, N'Juan José', N'Mayorga', N'Fierros', N'Calle:Reforma #504 Colonia:Centro', CAST(0x0000a593008d51ec AS datetime), CAST(0x0000a593008d51ec AS datetime), CAST ('True' AS bit), CAST(0x0000a593008d51ec AS datetime), N'9327757', CAST(0x0000716400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (169, 1426, N'Luis Alejandro', N'Trujillo', N'Lomeli', N'Calle:Jardin Madero #9 Int. 2 Colonia:Centro', CAST(0x0000a593008df7a7 AS datetime), CAST(0x0000a593008df7a7 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008df7a7 AS datetime), N'4931044007', CAST(0x000086b300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (170, 1457, N'Raudel Alejandro', N'Espinoza', N'Chavéz', N'Calle:J20 de Noviembre #430 Colonia:Centro', CAST(0x0000a593008e85f3 AS datetime), CAST(0x0000a593008e85f3 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008e85f3 AS datetime), N'4931204470', CAST(0x00007afa00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (171, 1462, N'Rocío', N'De la Rosa', N'Alvarado', N'Calle:Lirios#113 Colonia: Luis Donaldo Colosio', CAST(0x0000a593008f6ab3 AS datetime), CAST(0x0000a593008f6ab3 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008f6ab3 AS datetime), N'4939597136', CAST(0x0000612600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (172, 1449, N'José Guadalupe', N'Gutierrez', N'Dominguez', N'Calle:De la paz #27 Colonia:Centro', CAST(0x0000a593008fff42 AS datetime), CAST(0x0000a593008fff42 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008fff42 AS datetime), N'4931122063', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (173, 1461, N'Carlos Leonardo', N'Alba', N'De la Rosa', N'Calle:Lirios#113 Colonia:Luis Donaldo Colosio', CAST(0x0000a5930090c85d AS datetime), CAST(0x0000a5930090c85d AS datetime), CAST ('True' AS bit), CAST(0x0000a5930090c85d AS datetime), N'9357697', CAST(0x0000907500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (174, 1466, N'David ', N'Cruz', N'Varela', N'Calle:Veta de Plata#23 Colonia:Lomas de la fortuna', CAST(0x0000a59300915654 AS datetime), CAST(0x0000a59300915654 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300915654 AS datetime), N'017225225776', CAST(0x0000763300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (175, 1508, N'Manuel', N'Dominguez', N'Valdez', N'Calle:Piramide del sol #21 Colonia: Francisco Goytia', CAST(0x0000a59300968186 AS datetime), CAST(0x0000a59300968186 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300968186 AS datetime), N'9329999', CAST(0x00005e1100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (176, 1533, N'Lizbeth', N'Gonzalez', N'Devora', N'', CAST(0x0000a59300970cbc AS datetime), CAST(0x0000a59300970cbc AS datetime), CAST ('True' AS bit), CAST(0x0000a59300970cbc AS datetime), N'', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (177, 1546, N'Esmeralda', N'Zamudio', N'Hernández', N'Calle: Daniel Peralta #308 Colonia: Industrial', CAST(0x0000a593009786bd AS datetime), CAST(0x0000a593009839a3 AS datetime), CAST ('True' AS bit), CAST(0x0000a593009839a3 AS datetime), N'4931105874', CAST(0x00008bfe00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (178, 1567, N'Ricardo David', N'Garcia', N'Pasillas', N'Calle: Sierra de #1211 Colonia: Industrial', CAST(0x0000a59300982554 AS datetime), CAST(0x0000a59300982554 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300982554 AS datetime), N'9328708', CAST(0x0000902b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (179, 1568, N'Edgar Omar', N'Garcia', N'Pasillas', N'Calle: Sierra de #1211 Colonia: Industrial', CAST(0x0000a59300989394 AS datetime), CAST(0x0000a59300989394 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300989394 AS datetime), N'9328708', CAST(0x00008dde00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (180, 1569, N'Mayra Alejandra', N'Ríos', N'Rodriguez', N'Calle:Barreteros #330 Colonia:Villas de plateros', CAST(0x0000a593009902cb AS datetime), CAST(0x0000a593009902cb AS datetime), CAST ('True' AS bit), CAST(0x0000a593009902cb AS datetime), N'4921183641', CAST(0x000072ea00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (181, 1626, N'Claudia', N'Galindo', N'Casas', N'Calle:Aquiles Serdán #62 Colonia: Industrial', CAST(0x0000a593009b6c91 AS datetime), CAST(0x0000a593009b6c91 AS datetime), CAST ('True' AS bit), CAST(0x0000a593009b6c91 AS datetime), N'4939376767', CAST(0x0000870300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (182, 1637, N'Olay Alejandra', N'Anguiano', N'Diaz', N'Calle:José Vasconcelos #2 Colonia:Mesoamerica', CAST(0x0000a593009c00a1 AS datetime), CAST(0x0000a593009c00a1 AS datetime), CAST ('True' AS bit), CAST(0x0000a593009c00a1 AS datetime), N'4934681037', CAST(0x00008a2900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (183, 1631, N'Cynthia Janeth', N'Sánchez', N'Contreras', N'Calle:Prolongación Reforma  #1038 Colonia:Centro', CAST(0x0000a593009c7f3f AS datetime), CAST(0x0000a593009c7f3f AS datetime), CAST ('True' AS bit), CAST(0x0000a593009c7f3f AS datetime), N'4931140920', CAST(0x0000798b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (184, 1595, N'Andrea', N'Rosales', N'Gutierrez', N'Calle:Niño Artillero  #306 Colonia:Industrial', CAST(0x0000a593009dcad7 AS datetime), CAST(0x0000a593009dcad7 AS datetime), CAST ('True' AS bit), CAST(0x0000a593009dcad7 AS datetime), N'4931156188', CAST(0x00008c0800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (185, 1632, N'Eduardo', N'Ríos', N'Gutierrez Zamora', N'Calle:Av. Hidalgo #412 Colonia: centro', CAST(0x0000a594009762f5 AS datetime), CAST(0x0000a594009762f5 AS datetime), CAST ('True' AS bit), CAST(0x0000a594009762f5 AS datetime), N'4931023159', CAST(0x000078f600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (186, 1633, N'David', N'Flores', N'Flores', N'Calle:Rio Nasaz #503 Colonia: del valle', CAST(0x0000a59400b6fe2a AS datetime), CAST(0x0000a59400b6fe2a AS datetime), CAST ('True' AS bit), CAST(0x0000a59400b6fe2a AS datetime), N'4939597561', CAST(0x00006a4200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (187, 1634, N'Abraham', N'Gutierrez', N'Aragón', N'Calle:Xicotencatl#203 Colonia: Esparza', CAST(0x0000a59400b90128 AS datetime), CAST(0x0000a59400b90128 AS datetime), CAST ('True' AS bit), CAST(0x0000a59400b90128 AS datetime), N'4939597561', CAST(0x0000876e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (188, 1648, N'Carlo Rey', N'Escalante', N'Oliván', N'Calle:Caballitos #16 Colonia:Francisco Goytia', CAST(0x0000a59400c94dca AS datetime), CAST(0x0000a59400c94dca AS datetime), CAST ('True' AS bit), CAST(0x0000a59400c94dca AS datetime), N'9328919', CAST(0x00007aef00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (189, 1686, N'Ana Laura', N'Gallegos', N'Galaviz', N'Calle:Luis Moya #64 Colonia:Electricistas', CAST(0x0000a59400ca1ba3 AS datetime), CAST(0x0000a59400ca1ba3 AS datetime), CAST ('True' AS bit), CAST(0x0000a59400ca1ba3 AS datetime), N'4939328454', CAST(0x00006fbc00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (190, 1687, N'Gustavo', N'Frausto', N'Gutierrez', N'Calle:Venustiano Carranza #46 Colonia:Bulevard San José', CAST(0x0000a59400cab390 AS datetime), CAST(0x0000a59400cab390 AS datetime), CAST ('True' AS bit), CAST(0x0000a59400cab390 AS datetime), N'4931218047', CAST(0x0000855a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (191, 1689, N'Raymundo', N'Alvarádo', N'Castañon', N'Calle:Paseo del mineral #205 Colonia:Lomas de plateros', CAST(0x0000a59900964954 AS datetime), CAST(0x0000a59900964954 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900964954 AS datetime), N'8110286496', CAST(0x00007ed900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (192, 1696, N'Oscar', N'Piña', N'Fernández', N'Calle:Aquiles Serdán #220 Colonia: Centro', CAST(0x0000a5990096c15d AS datetime), CAST(0x0000a5990096c15d AS datetime), CAST ('True' AS bit), CAST(0x0000a5990096c15d AS datetime), N'4931141941', CAST(0x00007d2e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (193, 1699, N'Lizbeth', N'Gutierrez', N'Hernández', N'Calle:Limones #23 Colonia: Arboledas', CAST(0x0000a5990097443e AS datetime), CAST(0x0000a5990097443e AS datetime), CAST ('True' AS bit), CAST(0x0000a5990097443e AS datetime), N'4931351349', CAST(0x0000838100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (194, 1700, N'Andrés', N'Argomaniz', N'López', N'Calle:Francisco Sarabia#9 Colonia:Centro', CAST(0x0000a5990097d9ac AS datetime), CAST(0x0000a5990097d9ac AS datetime), CAST ('True' AS bit), CAST(0x0000a5990097d9ac AS datetime), N'4931213103', CAST(0x000071fa00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (195, 1708, N'Tanía Jenifer', N'García', N'Flores', N'Calle:Palo verde #106 Colonia:5ta del cobre', CAST(0x0000a5990098689d AS datetime), CAST(0x0000a5990098689d AS datetime), CAST ('True' AS bit), CAST(0x0000a5990098689d AS datetime), N'4931035188', CAST(0x00006d0100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (196, 1709, N'Beatriz Adriana', N'Sánchez', N'Caldera', N'Calle:Juan de Toosa #303 Colonia:Centro', CAST(0x0000a5990098f46a AS datetime), CAST(0x0000a5990098f46a AS datetime), CAST ('True' AS bit), CAST(0x0000a5990098f46a AS datetime), N'9320164', CAST(0x00006b7e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (197, 283, N'Alejandro', N'Carrillo', N'De la Rosa', N'Calle:Sierra de Organos #322 Colonia:Lomas de pláteros', CAST(0x0000a599009980a2 AS datetime), CAST(0x0000a599009980a2 AS datetime), CAST ('True' AS bit), CAST(0x0000a599009980a2 AS datetime), N'8788197', CAST(0x00006d8300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (198, 1736, N'Manuel', N'Alonso', N'Acuña', N'Calle:Fresnos #25 Colonia: Obrera', CAST(0x0000a599009bb0ec AS datetime), CAST(0x0000a599009efbdf AS datetime), CAST ('True' AS bit), CAST(0x0000a599009efbdf AS datetime), N'4931096620', CAST(0x00006b5900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (199, 1731, N'Héctor Daniel', N'Píña', N'Fernández', N'Calle:Privada 2da del mesquite #5 Colonia: Barrio Alto', CAST(0x0000a599009c37b6 AS datetime), CAST(0x0000a599009c37b6 AS datetime), CAST ('True' AS bit), CAST(0x0000a599009c37b6 AS datetime), N'9324666', CAST(0x000074fd00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (200, 1746, N'Vanessa', N'González', N'Hernández', N'Calle:Paseo del mineral #417 Colonia: Lomas de plateros', CAST(0x0000a599009cd179 AS datetime), CAST(0x0000a599009cd179 AS datetime), CAST ('True' AS bit), CAST(0x0000a599009cd179 AS datetime), N'4939370159', CAST(0x0000844b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (201, 1740, N'Eddie Fernando', N'Sandoval', N'Castro', N'Calle: Sonora #26 Colonia:Centro', CAST(0x0000a599009d517a AS datetime), CAST(0x0000a599009d517a AS datetime), CAST ('True' AS bit), CAST(0x0000a599009d517a AS datetime), N'4921456348', CAST(0x000076a000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (202, 1734, N'Aurora', N'Correa', N'Caldera', N'Calle: Carrillo Puerto #3 Colonia:Centro', CAST(0x0000a599009dcbba AS datetime), CAST(0x0000a599009dcbba AS datetime), CAST ('True' AS bit), CAST(0x0000a599009dcbba AS datetime), N'9321788', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (203, 1730, N'Ana Victoria', N'Saldivar', N'Moreno', N'Calle:Lasalle#3 Colonia:Lasalle', CAST(0x0000a599009e3ebf AS datetime), CAST(0x0000a599009e3ebf AS datetime), CAST ('True' AS bit), CAST(0x0000a599009e3ebf AS datetime), N'9321623', CAST(0x00008d2600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (204, 1721, N'Diego', N'Alonso', N'Acuña', N'Calle:Fresnos #25 Colonia: Obrera', CAST(0x0000a59900a391a0 AS datetime), CAST(0x0000a59900a391a0 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900a391a0 AS datetime), N'4939597307', CAST(0x0000750200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (205, 1752, N'Ana Karen', N'Dévora', N'Caldera', N'Calle:Aquiles Serdan #220 Colonia:Centro ', CAST(0x0000a59900ac8882 AS datetime), CAST(0x0000a59900ac8882 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900ac8882 AS datetime), N'4939494907', CAST(0x00007f9700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (206, 1716, N'Jésus Alejandro', N'Guerrero', N'Aguilera', N'Calle:Av. Juárez #708 Colonia:Centro ', CAST(0x0000a59900b11984 AS datetime), CAST(0x0000a59900b11984 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b11984 AS datetime), N'4931038286', CAST(0x0000768300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (207, 1755, N'Rocío', N'Rosales', N'Lozano', N'Calle:José María Vasquez #12 Colonia:Centro ', CAST(0x0000a59900b67a3d AS datetime), CAST(0x0000a59900b67a3d AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b67a3d AS datetime), N'4931078510', CAST(0x00006e7d00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (208, 2159, N'Joel Refugio', N'García', N'Campos', N'Calle:Aquiles Serdán #311 Colonia:Centro ', CAST(0x0000a59900b6f006 AS datetime), CAST(0x0000a59900b6f006 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b6f006 AS datetime), N'4931140974', CAST(0x000087e100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (209, 1770, N'Bernardo', N'Carrera', N'Herrera', N'Calle:Dr. Ignacio Hierro #134 Colonia:Centro ', CAST(0x0000a59900b767d9 AS datetime), CAST(0x0000a59900b767d9 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b767d9 AS datetime), N'4939495573', CAST(0x0000890a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (210, 1788, N'Alejandra', N'Uribe', N'Hernandez', N'Calle:Plazuela del caminero #9 Colonia:Fovissste', CAST(0x0000a59900b7dac4 AS datetime), CAST(0x0000a59900b7dac4 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b7dac4 AS datetime), N'4931076643', CAST(0x0000801800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (211, 1794, N'Paulina', N'Flores', N'Reveles', N'Calle:Alvaro Obregón#10 Colonia:Centro', CAST(0x0000a59900b83a88 AS datetime), CAST(0x0000a59900b83a88 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b83a88 AS datetime), N'4931076643', CAST(0x0000777800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (212, 1795, N'Juan Antonio', N'Reyes', N'Herrera', N'Calle:jardin#104 Colonia:Balcones', CAST(0x0000a59900b91f57 AS datetime), CAST(0x0000a59900b91f57 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b91f57 AS datetime), N'4939597509', CAST(0x0000711000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (213, 1808, N'Fatima ', N'Martínez', N'Vasquez', N'Calle:Industria hotelera #8 Colonia:industrial', CAST(0x0000a59900c2afe0 AS datetime), CAST(0x0000a59900c2afe0 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900c2afe0 AS datetime), N'9333511', CAST(0x00008f4c00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (214, 1872, N'Alexis Eduardo', N'Rivera', N'Rivera', N'Calle:Av. Huicot#225 Colonia:Del Fresno', CAST(0x0000a59900cea426 AS datetime), CAST(0x0000a59900cea426 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900cea426 AS datetime), N'4931125319', CAST(0x0000857400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (215, 1855, N'César', N'García', N'Peña', N'', CAST(0x0000a59900cefd54 AS datetime), CAST(0x0000a59900cefd54 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900cefd54 AS datetime), N'4931106645', CAST(0x000074e000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (216, 1908, N'Raúl', N'Ulloa', N'Guzmán', N'Calle:Industria Automotriz #503 Colonia:Industrial', CAST(0x0000a59900cfdd91 AS datetime), CAST(0x0000a59900cfdd91 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900cfdd91 AS datetime), N'4939597215', CAST(0x00006cbd00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (217, 1880, N'Alberto', N'Morales', N'Esquivel', N'Calle:Industria cibernetica #206Colonia:Industrial', CAST(0x0000a59900d052bc AS datetime), CAST(0x0000a59900d052bc AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d052bc AS datetime), N'9332383', CAST(0x0000893600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (218, 1859, N'Juan Pablo', N'Ortíz', N'Martínez', N'Calle:Hombres ilustres#303 Colonia:Centro', CAST(0x0000a59900d0e1bf AS datetime), CAST(0x0000a59900d0e1bf AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d0e1bf AS datetime), N'9326737', CAST(0x0000924200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (219, 1812, N'Adolfo', N'Oropeza', N'Ríos', N'', CAST(0x0000a59900d12b08 AS datetime), CAST(0x0000a59900d12b08 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d12b08 AS datetime), N'4931035765', CAST(0x000076f400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (220, 1906, N'Jocelyn', N'Alatorre', N'Castorena', N'', CAST(0x0000a59900d1967b AS datetime), CAST(0x0000a59900d1967b AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d1967b AS datetime), N'4931141020', CAST(0x0000845e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (221, 1826, N'Pamela', N'Sagredo', N'Beltrán', N'Calle:5ta Ortega int #2 Colonia: Centro', CAST(0x0000a59900d222ad AS datetime), CAST(0x0000a59900d222ad AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d222ad AS datetime), N'4921460200', CAST(0x00007f3f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (222, 1825, N'Estefania', N'Sagredo', N'Beltrán', N'Calle:5ta Ortega int #2 Colonia: Centro', CAST(0x0000a59900d27826 AS datetime), CAST(0x0000a59900d27826 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d27826 AS datetime), N'4931001560', CAST(0x000087aa00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (223, 1901, N'Héctor Raúl', N'Basurto', N'Castañeda', N'Calle:Fray servando teresa de mier #12 Colonia: Centro', CAST(0x0000a59900d2e9a5 AS datetime), CAST(0x0000a59900d2e9a5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d2e9a5 AS datetime), N'4931150049', CAST(0x0000884300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (224, 1841, N'Edgar Saúl', N'Román', N'De la Rosa', N'Calle:Tomás Mendez#207 Colonia: Centro', CAST(0x0000a59900d3395a AS datetime), CAST(0x0000a59900d3395a AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d3395a AS datetime), N'4931150049', CAST(0x0000884300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (225, 1885, N'Maria Guadalupe', N'Mendéz', N'Torres', N'Calle:Ministerio de guerra#3 Colonia: fraccionamiento Gonzalez ortega', CAST(0x0000a59900d3f123 AS datetime), CAST(0x0000a59900d3f123 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d3f123 AS datetime), N'9335523', CAST(0x000088e300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (226, 1837, N'Francisco', N'Romo', N'Hernandez', N'Calle:Ministerio de guerra#3 Colonia: fraccionamiento Gonzalez ortega', CAST(0x0000a59900d448b0 AS datetime), CAST(0x0000a59900d448b0 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d448b0 AS datetime), N'493879982', CAST(0x0000853400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (227, 1817, N'Nallely', N'Rios', N'Hernandez', N'Calle:Mhacienda de abrego#3 Colonia: villas del campestre', CAST(0x0000a59900d4b8d5 AS datetime), CAST(0x0000a59900d4b8d5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d4b8d5 AS datetime), N'4931070976', CAST(0x00007f1400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (228, 1883, N'Juan Javier', N'Marín', N'Vaquera', N'Calle:Francisco Sarabia #119 Colonia: Centro', CAST(0x0000a59900d52bb3 AS datetime), CAST(0x0000a59900d52bb3 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d52bb3 AS datetime), N'4939332768', CAST(0x00006d0100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (229, 1836, N'Jorge', N'Román', N'López', N'Calle:mecanica privada de los espejos #111 Colonia: Centro', CAST(0x0000a59900d5b083 AS datetime), CAST(0x0000a59900d5b083 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d5b083 AS datetime), N'4931142038', CAST(0x00007e6600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (230, 1861, N'Nikk', N'Alvarado', N'García', N'Calle:mecanica privada de los espejos #111 Colonia: Centro', CAST(0x0000a59900d61d86 AS datetime), CAST(0x0000a59900d61d86 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d61d86 AS datetime), N'9328943', CAST(0x00009c5200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (231, 1915, N'Luis Manuel', N'Solis', N'Torres', N'Calle:Veta de aluminio #323 Colonia: Lomas de la fortuna', CAST(0x0000a59a00834d40 AS datetime), CAST(0x0000a59a00834d40 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00834d40 AS datetime), N'9327131', CAST(0x00008a1800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (232, 1929, N'Eduardo de Jésus', N'Martínez', N'Villagran', N'Calle:Gabriel Lugo #18 A Colonia: Industrial', CAST(0x0000a59a0083e524 AS datetime), CAST(0x0000a59a0083e524 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a0083e524 AS datetime), N'4931183311', CAST(0x0000862300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (233, 1930, N'Juan Leonardo', N'Pérez', N'Cervantes', N'Calle:Priv. Belizario Dominguez#109  Colonia: Electricistas', CAST(0x0000a59a0084895f AS datetime), CAST(0x0000a59a0084895f AS datetime), CAST ('True' AS bit), CAST(0x0000a59a0084895f AS datetime), N'9322565', CAST(0x00004c4400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (234, 1939, N'Edwin', N'Delgado ', N'Valadez', N'Calle:Industria Textil#34  Colonia: Industrial', CAST(0x0000a59a008549f8 AS datetime), CAST(0x0000a59a008549f8 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a008549f8 AS datetime), N'4931354380', CAST(0x00008ccb00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (235, 1941, N'Jésus', N'Guardado', N'Valle', N'Calle:Laboratoristas #11 Colonia: Tecnologica', CAST(0x0000a59a00923fd7 AS datetime), CAST(0x0000a59a00923fd7 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00923fd7 AS datetime), N'9322539', CAST(0x00008c3e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (236, 1947, N'Eduardo', N'Rivera', N'Sandoval', N'', CAST(0x0000a59a0092acaa AS datetime), CAST(0x0000a59a0092acaa AS datetime), CAST ('True' AS bit), CAST(0x0000a59a0092acaa AS datetime), N'', CAST(0x00008cdc00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (237, 1951, N'Luis Fernando', N'Guardado', N'Perales', N'Calle:Priv. 20 de noviembre #6 ', CAST(0x0000a59a0096547c AS datetime), CAST(0x0000a59a0096547c AS datetime), CAST ('True' AS bit), CAST(0x0000a59a0096547c AS datetime), N'4931069058', CAST(0x00008c0400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (238, 1960, N'Eduardo', N'Bonilla', N'Martínez', N'Calle:Tlaxcala #202 Colonia: Centro ', CAST(0x0000a59a009775f1 AS datetime), CAST(0x0000a59a009775f1 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009775f1 AS datetime), N'4931126732', CAST(0x00008b9900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (239, 1964, N'Karina', N'Márquez', N'Nava', N'Calle:Av. juarez #315 Colonia: Centro', CAST(0x0000a59a0099fc4b AS datetime), CAST(0x0000a59a0099fc4b AS datetime), CAST ('True' AS bit), CAST(0x0000a59a0099fc4b AS datetime), N'4931061169', CAST(0x00008d1100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (240, 1966, N'Ricardo Iván', N'De la Rosa', N'Cabral', N'Calle:Alvaro Obregón #430 Colonia: Centro', CAST(0x0000a59a009a6091 AS datetime), CAST(0x0000a59a009a6091 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009a6091 AS datetime), N'4931153676', CAST(0x00008b4400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (241, 1967, N'Lucia', N'Torres', N'Muñoz', N'Calle:Reforma #1027  Colonia: Centro', CAST(0x0000a59a009ab83c AS datetime), CAST(0x0000a59a009ab83c AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009ab83c AS datetime), N'4931130931', CAST(0x0000854100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (242, 1969, N'Rocio', N'Torres', N'Muñoz', N'Calle:Reforma #1027  Colonia: Centro', CAST(0x0000a59a009ec330 AS datetime), CAST(0x0000a59a009ec330 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009ec330 AS datetime), N'9331198', CAST(0x0000894000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (243, 1973, N'Luis Arturo', N'Ramirez', N'Barba', N'', CAST(0x0000a59a009f0877 AS datetime), CAST(0x0000a59a009f0877 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009f0877 AS datetime), N'', CAST(0x0000a58000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (244, 1988, N'José Antonio', N'Torres', N'Amador', N'Calle:Xicotencalt #7 Colonia:Lagunilla', CAST(0x0000a59a009f9def AS datetime), CAST(0x0000a59a009f9def AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009f9def AS datetime), N'4921224530', CAST(0x000088b400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (245, 1990, N'Elvira Monserrat', N'Dominguez', N'Arroyo', N'Calle:Piramide del sol #21 Colonia:Francisco Goytia', CAST(0x0000a59a00a02c46 AS datetime), CAST(0x0000a59a00a02c46 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a02c46 AS datetime), N'4931137841', CAST(0x00008fca00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (246, 1991, N'Ana Elva', N'Venecia', N'Gonzalez', N'Calle:Claveles #120', CAST(0x0000a59a00a0cfd1 AS datetime), CAST(0x0000a59a00a0cfd1 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a0cfd1 AS datetime), N'4931137841', CAST(0x00005ba600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (247, 1992, N'Andrés', N'Diaz', N'Sánchez', N'Calle:Jérez #200 Colonia: Industrial', CAST(0x0000a59a00a12d1a AS datetime), CAST(0x0000a59a00a12d1a AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a12d1a AS datetime), N'4931076971', CAST(0x00008c3f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (248, 1997, N'Leonardo', N'Pérez', N'Barrón', N'Calle:Privada Belizario Dominguez #109 Colonia: Electricistas', CAST(0x0000a59a00a1abc9 AS datetime), CAST(0x0000a59a00a1abc9 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a1abc9 AS datetime), N'3338099251', CAST(0x0000749c00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (249, 2040, N'Pedro Adrian', N'Hernández', N'Velasco', N'Calle: Priv. Belisario Dominguez #104 Colonia: Centro', CAST(0x0000a59a00a59104 AS datetime), CAST(0x0000a59a00a59104 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a59104 AS datetime), N'4931061044', CAST(0x000081f600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (250, 2042, N'Monserrath', N'Alba', N'De la rosa', N'Calle:Rubi #114 Colonia:Lomas de la Fortuna', CAST(0x0000a59a00a63df1 AS datetime), CAST(0x0000a59a00a63df1 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a63df1 AS datetime), N'4921268833', CAST(0x000083f900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (251, 2043, N'Jorge', N'Guerrero', N'Pérez', N'Calle:Tamaulipas #6 A Colonia:Lagunilla', CAST(0x0000a59a00a70c03 AS datetime), CAST(0x0000a59a00a70c03 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a70c03 AS datetime), N'4938799461', CAST(0x000075f600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (252, 2048, N'Ever', N'Ortega', N'Caldera', N'Calle:Enrique Estrada #3  Colonia:Centro', CAST(0x0000a59a00a7953e AS datetime), CAST(0x0000a59a00a7953e AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a7953e AS datetime), N'4931105659', CAST(0x000079fd00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (253, 2049, N'Andrea', N'Faz', N'Márquez', N'Calle:Lázaro Cardenas #317 Colonia:Centro', CAST(0x0000a59a00a80a64 AS datetime), CAST(0x0000a59a00a80a64 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a80a64 AS datetime), N'4931141175', CAST(0x0000900b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (254, 2055, N'Jessica Yadhira', N'Rodriguez', N'López', N'Calle:Veta plomosa #244 Colonia:Minera', CAST(0x0000a59a00a8f559 AS datetime), CAST(0x0000a59a00a8f559 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a8f559 AS datetime), N'4931134821', CAST(0x00007e2e00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (255, 2057, N'Carlos Alejandro', N'García', N'Rangel', N'Calle:Mina #408  Colonia:Centro', CAST(0x0000a59a00a992bf AS datetime), CAST(0x0000a59a00a992bf AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a992bf AS datetime), N'4931079880', CAST(0x000084b900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (256, 2059, N'Donny', N'Gurrola', N'Carranza', N'Calle:Pasaje sección 62 #408  Colonia:Minera', CAST(0x0000a59a00aa0d0e AS datetime), CAST(0x0000a59a00aa0d0e AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00aa0d0e AS datetime), N'4939599788', CAST(0x0000775200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (257, 2060, N'Estefania', N'Vejar', N'Alvarez', N'Calle:Lázaro cardenas #424  Colonia:Centro', CAST(0x0000a59a00aac217 AS datetime), CAST(0x0000a59a00aac217 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00aac217 AS datetime), N'4931110065', CAST(0x0000838000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (258, 2067, N'Alejandro Jésus', N'Ocampo', N'Carrera', N'Calle: 2da de topilzin #9  Colonia:Esparza', CAST(0x0000a59a00ab63b5 AS datetime), CAST(0x0000a59a00ab63b5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00ab63b5 AS datetime), N'9324282', CAST(0x00008f8100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (259, 2068, N'Ana Luz', N'Ramirez', N'Trujillo', N'Calle: Heroico colegio militar #14', CAST(0x0000a59a00abd9eb AS datetime), CAST(0x0000a59a00abd9eb AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00abd9eb AS datetime), N'4939495702', CAST(0x00008e6f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (260, 3890, N'María Fernanda', N'Delgado', N'Escobedo', N'Calle:Sierra de Valdecañas #704 Colonia:Lomas de Plateros', CAST(0x0000a59b00d1d26a AS datetime), CAST(0x0000a59c014de438 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c014de438 AS datetime), N'4931138395', CAST(0x00008c3400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (261, 3889, N'Georgina', N'Hinojosa', N'Medrano', N'Calle:Bugambilias #4 Colonia:Buenos Aires', CAST(0x0000a59b00d2f0fd AS datetime), CAST(0x0000a59b00d2f0fd AS datetime), CAST ('True' AS bit), CAST(0x0000a59b00d2f0fd AS datetime), N'8712349492', CAST(0x00007b4400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (262, 2069, N'Diana Beatriz', N'Venecia', N'Carrera', N'Calle:Gomez Farias # 823 Colonia: Centro', CAST(0x0000a59c0095e9a5 AS datetime), CAST(0x0000a59c0095e9a5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0095e9a5 AS datetime), N'493 115 0007', CAST(0x00008cfa00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (263, 2071, N'Cristobal Alexis', N'Hernández', N'Gónzalez', N'Calle:Jardinera # 1 Colonia: Los Balcones', CAST(0x0000a59c0096b52f AS datetime), CAST(0x0000a59c0096b52f AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0096b52f AS datetime), N'9353624', CAST(0x0000890000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (264, 2076, N'Mónica Ximena', N'Aguirre', N'Robledo', N'Calle:Chabacanos # 12 Colonia:El vergel', CAST(0x0000a59c009715b0 AS datetime), CAST(0x0000a59c009715b0 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c009715b0 AS datetime), N'9353624', CAST(0x0000895100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (265, 2074, N'Felipe de Jésus', N'García', N'Pérez', N'Calle:Panfilo Natera # 306 Colonia:centro', CAST(0x0000a59c0097b63c AS datetime), CAST(0x0000a59c0097b63c AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0097b63c AS datetime), N'4931026249', CAST(0x0000706500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (266, 2073, N'Jorge Adán', N'Barrón', N'Pérez', N'Calle:Juan de Tolosa # 331 int 4 Colonia:centro', CAST(0x0000a59c0098504a AS datetime), CAST(0x0000a59c0098504a AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0098504a AS datetime), N'4931021953', CAST(0x00007fb200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (267, 2072, N'Josue', N'Valdéz', N'Anguiano', N'Calle:Carrillo Puerto  #104  Colonia:centro', CAST(0x0000a59c0098f40e AS datetime), CAST(0x0000a59c0098f40e AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0098f40e AS datetime), N'4931118129', CAST(0x000089a000000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (268, 2083, N'Sandra Hilda', N'Bermudez', N'Valle', N'Calle:Rio colorado  #106  Colonia: Lindavista', CAST(0x0000a59c009a49c9 AS datetime), CAST(0x0000a59c009a49c9 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c009a49c9 AS datetime), N'4931016173', CAST(0x0000899300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (269, 2089, N'Francisco Javier', N'López', N'Castañeda', N'Calle: Pino suárez  #209  Colonia: Centro', CAST(0x0000a59c009f0686 AS datetime), CAST(0x0000a59c009f0686 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c009f0686 AS datetime), N'9321138', CAST(0x000059c600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (270, 2102, N'Ana Laura', N'Cruz', N'Rivera', N'Calle:Revolución #11  Colonia:Tecnologica', CAST(0x0000a59c009fdb74 AS datetime), CAST(0x0000a59c009fdb74 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c009fdb74 AS datetime), N'8785181', CAST(0x00008e6200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (271, 2108, N'Juan Pablo', N'Ayala', N'Santana', N'Calle:Av. Roque Estrada #12 Colonia:Fovissste', CAST(0x0000a59c00a24de8 AS datetime), CAST(0x0000a59c00a24de8 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a24de8 AS datetime), N'8780417', CAST(0x0000828200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (272, 2112, N'Mario', N'Peters', N'Moreno', N'Calle:Privada Olmos #2 Colonia:Fraccionamiento del parque', CAST(0x0000a59c00a2c9b5 AS datetime), CAST(0x0000a59c00a2c9b5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a2c9b5 AS datetime), N'', CAST(0x0000811b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (273, 2120, N'Carlos David', N'Martínez', N'Márquez', N'', CAST(0x0000a59c00a330a7 AS datetime), CAST(0x0000a59c00a330a7 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a330a7 AS datetime), N'4931036247', CAST(0x00007bb600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (274, 2122, N'Jonathan', N'Medina', N'Mendéz', N'Calle: Hidalgo #303 Colonia: Centro', CAST(0x0000a59c00a63517 AS datetime), CAST(0x0000a59c00a63517 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a63517 AS datetime), N'4931030941', CAST(0x0000855400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (275, 2124, N'Francisco', N'Salgado', N'Delgado', N'Calle: Ramón corona #7 Colonia:Benito juárez', CAST(0x0000a59c00a8d6c6 AS datetime), CAST(0x0000a59c00a8d6c6 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a8d6c6 AS datetime), N'4934687297', CAST(0x00008bad00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (276, 2144, N'Juan Miguel', N'Aviña', N'Peralta', N'', CAST(0x0000a59c00aa3472 AS datetime), CAST(0x0000a59c00aa3472 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00aa3472 AS datetime), N'4931126252', CAST(0x00008b1d00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (277, 2143, N'Filiberto', N'Burciaga', N'Ramírez', N'Calle:Netzahualcoyotl #30 Colonia: Esparza', CAST(0x0000a59c00aaa99e AS datetime), CAST(0x0000a59c00aaa99e AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00aaa99e AS datetime), N'', CAST(0x0000677b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (278, 2138, N'Alejandro', N'Hernández', N'González', N'Calle:Garcia Salinas #610  Colonia: Centro', CAST(0x0000a59c00aba8ee AS datetime), CAST(0x0000a59c00aba8ee AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00aba8ee AS datetime), N'9320300', CAST(0x000083d200000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (279, 2456, N'María Dolores', N'Carlos', N'Basurto', N'', CAST(0x0000a59c00ac3693 AS datetime), CAST(0x0000a59c00ac3693 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00ac3693 AS datetime), N'4921030566', CAST(0x000076bd00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (280, 2135, N'Oscar Ricardo', N'García', N'Ramírez', N'Calle:C,Sinteticos #12 Colonia:Petroleos Mexicanos', CAST(0x0000a59c00accb7b AS datetime), CAST(0x0000a59c00accb7b AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00accb7b AS datetime), N'4931123029', CAST(0x00007a3100000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (281, 2151, N'Omar', N'Carrera', N'Pérez', N'Calle:Priv. Olmos #34 Colonia:del parque', CAST(0x0000a59c00b0ee2e AS datetime), CAST(0x0000a59c00b0ee2e AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00b0ee2e AS datetime), N'4931141492', CAST(0x00006fcb00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (282, 2520, N'Saúl Giovanni', N'Escobedo', N'Navarro', N'Calle:Francisco Villa #309 Colonia:Higueras', CAST(0x0000a59c00b1bce5 AS datetime), CAST(0x0000a59c00b1bce5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00b1bce5 AS datetime), N'8784466', CAST(0x0000857800000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (283, 2132, N'Jaime Arturo', N'Gracia', N'Rivera', N'Calle:Marquez de Bugarin #2 Colonia:Fracc. 5ta del cobre', CAST(0x0000a59c00b2295a AS datetime), CAST(0x0000a59c00b2295a AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00b2295a AS datetime), N'4931027202', CAST(0x000069e700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (284, 3736, N'Christopher Salvador', N'Vasquez', N'Gonzalez', N'Calle: Gonzalez Bocanegra #106 Colonia: Centro', CAST(0x0000a59c00b2f5e2 AS datetime), CAST(0x0000a59c00b2f5e2 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00b2f5e2 AS datetime), N'4931030933', CAST(0x00008e7f00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (286, 2161, N'Juan José', N'Uribe', N'Carreón', N'Calle:Río Colorado #2 Colonia: Lindavista', CAST(0x0000a59f00bf7791 AS datetime), CAST(0x0000a59f00bf7791 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00bf7791 AS datetime), N'4931135957', CAST(0x00006acc00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (287, 2163, N'Sergio Eduardo', N'Castro', N'Sifuentes', N'Calle:20 de Noviembre #419 Colonia: Centro', CAST(0x0000a59f00c00a34 AS datetime), CAST(0x0000a59f00c00a34 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00c00a34 AS datetime), N'9325041', CAST(0x00008f7a00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (288, 2165, N'Alfonso Hadariel', N'Mata', N'Dévora', N'Calle:Morelos Sur #112 A Colonia:Centro', CAST(0x0000a59f00cbbc46 AS datetime), CAST(0x0000a59f00cbbc46 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00cbbc46 AS datetime), N'4931070363', CAST(0x00008a5500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (289, 2174, N'Luis Rafael', N'LLamas', N'Félix', N'Calle:Callejón de Pacheco #111 Colonia:Centro', CAST(0x0000a59f00cc4ded AS datetime), CAST(0x0000a59f00cc4ded AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00cc4ded AS datetime), N'4921645605', CAST(0x0000694700000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (290, 2201, N'Paulina Alejandra', N'Macías', N'Berumen', N'Calle:Maravillas #89 Colonia:Maravillas', CAST(0x0000a59f00cf5564 AS datetime), CAST(0x0000a59f00cf5564 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00cf5564 AS datetime), N'4937962733', CAST(0x0000816b00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (291, 2175, N'Luis Eduardo', N'Llamas', N'Vargas', N'', CAST(0x0000a59f00cfad87 AS datetime), CAST(0x0000a59f00cfad87 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00cfad87 AS datetime), N'4931257718', CAST(0x0000853600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (292, 2193, N'Antonio', N'Arroyo', N'Alvarez', N'Calle:Analco #28 Colonia: Centro ', CAST(0x0000a59f00d0127f AS datetime), CAST(0x0000a59f00d0127f AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00d0127f AS datetime), N'4931066705', CAST(0x000066ee00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (293, 3831, N'Javier', N'Dávalos', N'Montoya', N'Calle: Garcia Salinas #416  Colonia: Centro', CAST(0x0000a5a000a2a4c7 AS datetime), CAST(0x0000a5a000a2a4c7 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a2a4c7 AS datetime), N'4931098179', CAST(0x0000899c00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (294, 3823, N'Guadalupe Isabel', N'Barrios', N'Berumen', N'Calle:Lázaro Cardenas #227 Colonia: Centro', CAST(0x0000a5a000a350c8 AS datetime), CAST(0x0000a5a000a350c8 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a350c8 AS datetime), N'4934682171', CAST(0x0000896400000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (295, 3806, N'Mercedes Stephania', N'Ortíz', N'Herrera', N'Calle: 2da de Ignacio Zaragoza #1-A Colonia: Esparza', CAST(0x0000a5a000a41498 AS datetime), CAST(0x0000a5a000a41498 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a41498 AS datetime), N'4931152766', CAST(0x00008f0d00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (296, 3744, N'Ana Isabel', N'Robles', N'Rivas', N'Calle:Valparaiso #40 Colonia:Del parque', CAST(0x0000a5a000a4b116 AS datetime), CAST(0x0000a5a000a4b116 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a4b116 AS datetime), N'9313427', CAST(0x00007ced00000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (297, 3731, N'Thelma ', N'Navarro', N'Castañeda', N'Calle:Circuito Universitario #21 Colonia:Del Fresno', CAST(0x0000a5a000a5b60c AS datetime), CAST(0x0000a5a000a5b60c AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a5b60c AS datetime), N'9313427', CAST(0x000083c600000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (298, 3728, N'Irma Alicia', N'Luevano', N'Muro', N'Calle:C. 1858 #9 Colonia:Fracc. Gonzalez Ortega', CAST(0x0000a5a000a64058 AS datetime), CAST(0x0000a5a000a64058 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a64058 AS datetime), N'4934687638', CAST(0x00008cc300000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (299, 3714, N'Lilia Isela', N'Escareño', N'García', N'Calle:Ricardo Monreal #106 Colonia: Felipe Monreal', CAST(0x0000a5a000a6c87b AS datetime), CAST(0x0000a5a000a6c87b AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a6c87b AS datetime), N'4931213820', CAST(0x00008c5500000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (300, 3575, N'Cristhian Emmanuel', N'Rodriguez', N'Perales', N'Calle:Leona Vicario#603 Colonia: Del parque', CAST(0x0000a5a000a7edbd AS datetime), CAST(0x0000a5a000a7edbd AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a7edbd AS datetime), N'4931174204', CAST(0x00008e3900000000 AS datetime))

GO
INSERT INTO [dbo].[TblSocio] ([id_socio], [num_socio], [nombre], [ap_paterno], [ap_materno], [direccion], [fecha_registro], [fecha_baja], [activo], [fecha_modificacion], [telefono], [fecha_nacimiento])
	VALUES (301, 6666, N'Faleg Alejandro', N'Martinez', N'Peralta', N'Limas # 201', CAST(0x0000a5ed01180e91 AS datetime), CAST(0x0000a5ed01180e91 AS datetime), CAST ('True' AS bit), CAST(0x0000a5ed01180e91 AS datetime), N'+524931162911', CAST(0x000080d400000000 AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblSocio] OFF
GO

--Table dbo.TblSocioMembresia

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblSocioMembresia] (
	[id_socio_membresia] [int] NOT NULL IDENTITY (1, 1),
	[id_socio] [int] NOT NULL,
	[id_paquete] [int] NOT NULL,
	[fecha_vinculacion] [datetime] NOT NULL CONSTRAINT [DF_TblSocioMembresia_vinculacion] DEFAULT (getdate()),
	[fecha_renovacion] [datetime] NOT NULL CONSTRAINT [DF_TblSocioMembresia_renovacion] DEFAULT (getdate()),
	[fecha_expiracion] [datetime] NOT NULL CONSTRAINT [DF_TblSocioMembresia_expiracion] DEFAULT (getdate()),
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblSocioMembresia_Modificacion] DEFAULT (getdate()));
GO

SET IDENTITY_INSERT [dbo].[TblSocioMembresia] ON
GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (1, 1, 1, CAST(0x0000a584014f9a17 AS datetime), CAST(0x0000a593014f9a17 AS datetime), CAST(0x0000a592014f9a17 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c01508ef6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (2, 2, 15, CAST(0x0000a58a009760d5 AS datetime), CAST(0x0000a5a9009760d5 AS datetime), CAST(0x0000a5a8009760d5 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a009760d5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (3, 3, 30, CAST(0x0000a58a00c3ec8b AS datetime), CAST(0x0000a5a900c3ec8b AS datetime), CAST(0x0000a5a800c3ec8b AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00c3ec8b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (4, 4, 15, CAST(0x0000a58a00c68e6a AS datetime), CAST(0x0000a5a900c68e6a AS datetime), CAST(0x0000a5a800c68e6a AS datetime), CAST ('True' AS bit), CAST(0x0000a58d0147ef37 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (5, 5, 13, CAST(0x0000a58a00c748fb AS datetime), CAST(0x0000a5a900c748fb AS datetime), CAST(0x0000a5a800c748fb AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00c748fb AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (6, 6, 30, CAST(0x0000a58a00c833ba AS datetime), CAST(0x0000a5a900c833ba AS datetime), CAST(0x0000a5a800c833ba AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00c833ba AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (7, 7, 19, CAST(0x0000a58a00c8db6c AS datetime), CAST(0x0000a5a900c8db6c AS datetime), CAST(0x0000a5a800c8db6c AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b245d7 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (8, 8, 15, CAST(0x0000a58a00c9f6ff AS datetime), CAST(0x0000a5a900c9f6ff AS datetime), CAST(0x0000a5a800c9f6ff AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00c9f6ff AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (9, 9, 3, CAST(0x0000a58a00cb1377 AS datetime), CAST(0x0000a59900cb1377 AS datetime), CAST(0x0000a59800cb1377 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00cb1377 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (10, 10, 1, CAST(0x0000a58a00cc9a49 AS datetime), CAST(0x0000a59900cc9a49 AS datetime), CAST(0x0000a59800cc9a49 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b259d8 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (11, 11, 33, CAST(0x0000a58a00cd8f48 AS datetime), CAST(0x0000a5a900cd8f48 AS datetime), CAST(0x0000a5a800cd8f48 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00cd8f48 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (12, 12, 32, CAST(0x0000a58a00cdfa76 AS datetime), CAST(0x0000a5a900cdfa76 AS datetime), CAST(0x0000a5a800cdfa76 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00cdfa76 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (13, 13, 34, CAST(0x0000a58a00ce8b29 AS datetime), CAST(0x0000a5a900ce8b29 AS datetime), CAST(0x0000a5a800ce8b29 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00ce8b29 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (14, 14, 23, CAST(0x0000a58a00cfacea AS datetime), CAST(0x0000a5a900cfacea AS datetime), CAST(0x0000a5a800cfacea AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00cfacea AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (15, 15, 15, CAST(0x0000a58a00d033fd AS datetime), CAST(0x0000a5a900d033fd AS datetime), CAST(0x0000a5a800d033fd AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b27ae6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (16, 16, 15, CAST(0x0000a58a00d0cbd4 AS datetime), CAST(0x0000a5a900d0cbd4 AS datetime), CAST(0x0000a5a800d0cbd4 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00d0cbd4 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (17, 17, 32, CAST(0x0000a58a00d17572 AS datetime), CAST(0x0000a5a900d17572 AS datetime), CAST(0x0000a5a800d17572 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b29272 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (18, 18, 21, CAST(0x0000a58a00d20bb4 AS datetime), CAST(0x0000a5a900d20bb4 AS datetime), CAST(0x0000a5a800d20bb4 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a00d20bb4 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (19, 19, 17, CAST(0x0000a58a014ccd49 AS datetime), CAST(0x0000a5a9014ccd49 AS datetime), CAST(0x0000a5a8014ccd49 AS datetime), CAST ('True' AS bit), CAST(0x0000a58a014ccd49 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (20, 20, 40, CAST(0x0000a58b008bd72d AS datetime), CAST(0x0000a5aa008bd72d AS datetime), CAST(0x0000a5a9008bd72d AS datetime), CAST ('True' AS bit), CAST(0x0000a58b008bd72d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (21, 21, 34, CAST(0x0000a58b008c6389 AS datetime), CAST(0x0000a5aa008c6389 AS datetime), CAST(0x0000a5a9008c6389 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b008c6389 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (22, 22, 11, CAST(0x0000a58b008e1e37 AS datetime), CAST(0x0000a5aa008e1e37 AS datetime), CAST(0x0000a5a9008e1e37 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b008e1e37 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (23, 23, 10, CAST(0x0000a58b008f520b AS datetime), CAST(0x0000a5aa008f520b AS datetime), CAST(0x0000a5a9008f520b AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2af37 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (24, 24, 10, CAST(0x0000a58b008fe579 AS datetime), CAST(0x0000a5aa008fe579 AS datetime), CAST(0x0000a5a9008fe579 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2bf4a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (25, 25, 6, CAST(0x0000a58b00919578 AS datetime), CAST(0x0000a5aa00919578 AS datetime), CAST(0x0000a5a900919578 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00919578 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (26, 26, 39, CAST(0x0000a58b00944817 AS datetime), CAST(0x0000a5aa00944817 AS datetime), CAST(0x0000a5a900944817 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00944817 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (27, 27, 15, CAST(0x0000a58b00951d64 AS datetime), CAST(0x0000a5aa00951d64 AS datetime), CAST(0x0000a5a900951d64 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00951d64 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (28, 28, 13, CAST(0x0000a58b0095e210 AS datetime), CAST(0x0000a5aa0095e210 AS datetime), CAST(0x0000a5a90095e210 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b0095e210 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (29, 29, 11, CAST(0x0000a58b009aa25f AS datetime), CAST(0x0000a5aa009aa25f AS datetime), CAST(0x0000a5a9009aa25f AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009aa25f AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (30, 30, 15, CAST(0x0000a58b009ba577 AS datetime), CAST(0x0000a5aa009ba577 AS datetime), CAST(0x0000a5a9009ba577 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009ba577 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (31, 31, 15, CAST(0x0000a58b009c2d1c AS datetime), CAST(0x0000a5aa009c2d1c AS datetime), CAST(0x0000a5a9009c2d1c AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2d8ef AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (32, 32, 10, CAST(0x0000a58b009d1f5f AS datetime), CAST(0x0000a5aa009d1f5f AS datetime), CAST(0x0000a5a9009d1f5f AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009d1f5f AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (33, 33, 33, CAST(0x0000a58b009d8d0e AS datetime), CAST(0x0000a5aa009d8d0e AS datetime), CAST(0x0000a5a9009d8d0e AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009d8d0e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (34, 34, 27, CAST(0x0000a58b009f0a37 AS datetime), CAST(0x0000a5aa009f0a37 AS datetime), CAST(0x0000a5a9009f0a37 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009f0a37 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (35, 35, 21, CAST(0x0000a58b009fc82f AS datetime), CAST(0x0000a5aa009fc82f AS datetime), CAST(0x0000a5a9009fc82f AS datetime), CAST ('True' AS bit), CAST(0x0000a58b009fc82f AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (36, 36, 13, CAST(0x0000a58b00a0c2ac AS datetime), CAST(0x0000a5aa00a0c2ac AS datetime), CAST(0x0000a5a900a0c2ac AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a0c2ac AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (37, 37, 17, CAST(0x0000a58b00a2817c AS datetime), CAST(0x0000a5aa00a2817c AS datetime), CAST(0x0000a5a900a2817c AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a2817c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (38, 38, 33, CAST(0x0000a58b00a2f3e4 AS datetime), CAST(0x0000a5aa00a2f3e4 AS datetime), CAST(0x0000a5a900a2f3e4 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a2f3e4 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (39, 39, 23, CAST(0x0000a58b00a75139 AS datetime), CAST(0x0000a5aa00a75139 AS datetime), CAST(0x0000a5a900a75139 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a75139 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (40, 40, 3, CAST(0x0000a58b00a7fa4d AS datetime), CAST(0x0000a59a00a7fa4d AS datetime), CAST(0x0000a59900a7fa4d AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a7fa4d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (41, 41, 15, CAST(0x0000a58b00a879de AS datetime), CAST(0x0000a5aa00a879de AS datetime), CAST(0x0000a5a900a879de AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a879de AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (42, 42, 23, CAST(0x0000a58b00a8ff31 AS datetime), CAST(0x0000a5aa00a8ff31 AS datetime), CAST(0x0000a5a900a8ff31 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a8ff31 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (43, 43, 23, CAST(0x0000a58b00a95e19 AS datetime), CAST(0x0000a5aa00a95e19 AS datetime), CAST(0x0000a5a900a95e19 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00a95e19 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (44, 44, 23, CAST(0x0000a58b00c00bac AS datetime), CAST(0x0000a5aa00c00bac AS datetime), CAST(0x0000a5a900c00bac AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c00bac AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (45, 45, 29, CAST(0x0000a58b00c0a562 AS datetime), CAST(0x0000a5aa00c0a562 AS datetime), CAST(0x0000a5a900c0a562 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c0a562 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (46, 46, 6, CAST(0x0000a58b00c18c07 AS datetime), CAST(0x0000a5aa00c18c07 AS datetime), CAST(0x0000a5a900c18c07 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2fc11 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (48, 48, 21, CAST(0x0000a58b00c28c6b AS datetime), CAST(0x0000a5aa00c28c6b AS datetime), CAST(0x0000a5a900c28c6b AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c28c6b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (49, 49, 41, CAST(0x0000a58b00c3f2ad AS datetime), CAST(0x0000a5aa00c3f2ad AS datetime), CAST(0x0000a5a900c3f2ad AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c3f2ad AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (50, 50, 41, CAST(0x0000a58b00c42efd AS datetime), CAST(0x0000a5aa00c42efd AS datetime), CAST(0x0000a5a900c42efd AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b30cff AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (51, 51, 15, CAST(0x0000a58b00c471fb AS datetime), CAST(0x0000a5aa00c471fb AS datetime), CAST(0x0000a5a900c471fb AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c471fb AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (52, 52, 15, CAST(0x0000a58b00c49bff AS datetime), CAST(0x0000a5aa00c49bff AS datetime), CAST(0x0000a5a900c49bff AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b31c6a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (53, 53, 15, CAST(0x0000a58b00c51694 AS datetime), CAST(0x0000a5aa00c51694 AS datetime), CAST(0x0000a5a900c51694 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c51694 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (54, 54, 13, CAST(0x0000a58b00c5f3df AS datetime), CAST(0x0000a5aa00c5f3df AS datetime), CAST(0x0000a5a900c5f3df AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c5f3df AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (55, 55, 17, CAST(0x0000a58b00c6b70a AS datetime), CAST(0x0000a5aa00c6b70a AS datetime), CAST(0x0000a5a900c6b70a AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00c6b70a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (56, 56, 13, CAST(0x0000a58b00cc8580 AS datetime), CAST(0x0000a5aa00cc8580 AS datetime), CAST(0x0000a5a900cc8580 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00cc8580 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (57, 57, 3, CAST(0x0000a58b00cda289 AS datetime), CAST(0x0000a59a00cda289 AS datetime), CAST(0x0000a59900cda289 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00cda289 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (58, 58, 10, CAST(0x0000a58b00ce8377 AS datetime), CAST(0x0000a5aa00ce8377 AS datetime), CAST(0x0000a5a900ce8377 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b00ce8377 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (59, 59, 15, CAST(0x0000a58b00cf56e8 AS datetime), CAST(0x0000a5aa00cf56e8 AS datetime), CAST(0x0000a5a900cf56e8 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c007f35e8 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (60, 60, 16, CAST(0x0000a58b00cff25d AS datetime), CAST(0x0000a5aa00cff25d AS datetime), CAST(0x0000a5a900cff25d AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b33fa5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (61, 61, 18, CAST(0x0000a58b0148a1d7 AS datetime), CAST(0x0000a5aa0148a1d7 AS datetime), CAST(0x0000a5a90148a1d7 AS datetime), CAST ('True' AS bit), CAST(0x0000a58b0148a1d7 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (62, 62, 41, CAST(0x0000a58c007f17a9 AS datetime), CAST(0x0000a5ab007f17a9 AS datetime), CAST(0x0000a5aa007f17a9 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c007f17a9 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (63, 63, 10, CAST(0x0000a58c008069f3 AS datetime), CAST(0x0000a5ab008069f3 AS datetime), CAST(0x0000a5aa008069f3 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c008069f3 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (64, 64, 10, CAST(0x0000a58c0081b7de AS datetime), CAST(0x0000a5ab0081b7de AS datetime), CAST(0x0000a5aa0081b7de AS datetime), CAST ('True' AS bit), CAST(0x0000a58c0081b7de AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (65, 65, 32, CAST(0x0000a58c0091544b AS datetime), CAST(0x0000a5ab0091544b AS datetime), CAST(0x0000a5aa0091544b AS datetime), CAST ('True' AS bit), CAST(0x0000a58c0091544b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (66, 66, 23, CAST(0x0000a58c00920031 AS datetime), CAST(0x0000a5ab00920031 AS datetime), CAST(0x0000a5aa00920031 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00920031 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (67, 67, 30, CAST(0x0000a58c00929fc1 AS datetime), CAST(0x0000a5ab00929fc1 AS datetime), CAST(0x0000a5aa00929fc1 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00929fc1 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (68, 68, 30, CAST(0x0000a58c00931d65 AS datetime), CAST(0x0000a5ab00931d65 AS datetime), CAST(0x0000a5aa00931d65 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00931d65 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (69, 69, 30, CAST(0x0000a58c00958941 AS datetime), CAST(0x0000a5ab00958941 AS datetime), CAST(0x0000a5aa00958941 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00958941 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (70, 70, 30, CAST(0x0000a58c00970db5 AS datetime), CAST(0x0000a5ab00970db5 AS datetime), CAST(0x0000a5aa00970db5 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00970db5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (71, 71, 13, CAST(0x0000a58c0097e7bb AS datetime), CAST(0x0000a5ab0097e7bb AS datetime), CAST(0x0000a5aa0097e7bb AS datetime), CAST ('True' AS bit), CAST(0x0000a58c0097e7bb AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (72, 72, 15, CAST(0x0000a58c00986c0b AS datetime), CAST(0x0000a5ab00986c0b AS datetime), CAST(0x0000a5aa00986c0b AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00986c0b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (73, 73, 17, CAST(0x0000a58c009c282f AS datetime), CAST(0x0000a5ab009c282f AS datetime), CAST(0x0000a5aa009c282f AS datetime), CAST ('True' AS bit), CAST(0x0000a58c009c282f AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (74, 74, 41, CAST(0x0000a58c00a0b782 AS datetime), CAST(0x0000a5ab00a0b782 AS datetime), CAST(0x0000a5aa00a0b782 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a0b782 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (75, 75, 10, CAST(0x0000a58c00a14695 AS datetime), CAST(0x0000a5ab00a14695 AS datetime), CAST(0x0000a5aa00a14695 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a14695 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (76, 76, 10, CAST(0x0000a58c00a2a11c AS datetime), CAST(0x0000a5ab00a2a11c AS datetime), CAST(0x0000a5aa00a2a11c AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a2a11c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (77, 77, 15, CAST(0x0000a58c00a32020 AS datetime), CAST(0x0000a5ab00a32020 AS datetime), CAST(0x0000a5aa00a32020 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a32020 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (78, 78, 10, CAST(0x0000a58c00a3b09f AS datetime), CAST(0x0000a5ab00a3b09f AS datetime), CAST(0x0000a5aa00a3b09f AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b3962e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (79, 79, 41, CAST(0x0000a58c00a4dda8 AS datetime), CAST(0x0000a5ab00a4dda8 AS datetime), CAST(0x0000a5aa00a4dda8 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a4dda8 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (80, 80, 10, CAST(0x0000a58c00a55831 AS datetime), CAST(0x0000a5ab00a55831 AS datetime), CAST(0x0000a5aa00a55831 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00a55831 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (81, 81, 32, CAST(0x0000a58c00b500e3 AS datetime), CAST(0x0000a5ab00b500e3 AS datetime), CAST(0x0000a5aa00b500e3 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b500e3 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (82, 82, 10, CAST(0x0000a58c00b58e9d AS datetime), CAST(0x0000a5ab00b58e9d AS datetime), CAST(0x0000a5aa00b58e9d AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b58e9d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (83, 83, 10, CAST(0x0000a58c00b67b36 AS datetime), CAST(0x0000a5ab00b67b36 AS datetime), CAST(0x0000a5aa00b67b36 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b67b36 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (84, 84, 10, CAST(0x0000a58c00b6e6e5 AS datetime), CAST(0x0000a5ab00b6e6e5 AS datetime), CAST(0x0000a5aa00b6e6e5 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b6e6e5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (85, 85, 10, CAST(0x0000a58c00b78e8e AS datetime), CAST(0x0000a5ab00b78e8e AS datetime), CAST(0x0000a5aa00b78e8e AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b78e8e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (86, 86, 10, CAST(0x0000a58c00b81842 AS datetime), CAST(0x0000a5ab00b81842 AS datetime), CAST(0x0000a5aa00b81842 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b81842 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (87, 87, 10, CAST(0x0000a58c00b8a60a AS datetime), CAST(0x0000a5ab00b8a60a AS datetime), CAST(0x0000a5aa00b8a60a AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b8a60a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (88, 88, 15, CAST(0x0000a58c00b924ef AS datetime), CAST(0x0000a5ab00b924ef AS datetime), CAST(0x0000a5aa00b924ef AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b924ef AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (89, 89, 10, CAST(0x0000a58c00b9798d AS datetime), CAST(0x0000a5ab00b9798d AS datetime), CAST(0x0000a5aa00b9798d AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b3bc1e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (90, 90, 10, CAST(0x0000a58c00b9e7a9 AS datetime), CAST(0x0000a5ab00b9e7a9 AS datetime), CAST(0x0000a5aa00b9e7a9 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00b9e7a9 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (91, 91, 3, CAST(0x0000a58c00bb6c8d AS datetime), CAST(0x0000a59b00bb6c8d AS datetime), CAST(0x0000a59a00bb6c8d AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00bb6c8d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (93, 93, 33, CAST(0x0000a58c00bf1a9e AS datetime), CAST(0x0000a5ab00bf1a9e AS datetime), CAST(0x0000a5aa00bf1a9e AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00bf1a9e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (94, 94, 10, CAST(0x0000a58c00bfa781 AS datetime), CAST(0x0000a5ab00bfa781 AS datetime), CAST(0x0000a5aa00bfa781 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00bfa781 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (95, 95, 23, CAST(0x0000a58c00c05dcd AS datetime), CAST(0x0000a5ab00c05dcd AS datetime), CAST(0x0000a5aa00c05dcd AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00c05dcd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (96, 96, 23, CAST(0x0000a58c00c098b2 AS datetime), CAST(0x0000a5ab00c098b2 AS datetime), CAST(0x0000a5aa00c098b2 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00c098b2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (97, 97, 15, CAST(0x0000a58c00c10683 AS datetime), CAST(0x0000a5ab00c10683 AS datetime), CAST(0x0000a5aa00c10683 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00c10683 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (98, 98, 27, CAST(0x0000a58c00d55481 AS datetime), CAST(0x0000a5ab00d55481 AS datetime), CAST(0x0000a5aa00d55481 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00d55481 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (99, 99, 25, CAST(0x0000a58c00d5d386 AS datetime), CAST(0x0000a5ab00d5d386 AS datetime), CAST(0x0000a5aa00d5d386 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00d5d386 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (100, 100, 23, CAST(0x0000a58c00d66898 AS datetime), CAST(0x0000a5ab00d66898 AS datetime), CAST(0x0000a5aa00d66898 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c00d66898 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (101, 101, 10, CAST(0x0000a58c014b7953 AS datetime), CAST(0x0000a5ab014b7953 AS datetime), CAST(0x0000a5aa014b7953 AS datetime), CAST ('True' AS bit), CAST(0x0000a58c014b7953 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (102, 102, 13, CAST(0x0000a58d014a8cac AS datetime), CAST(0x0000a5ac014a8cac AS datetime), CAST(0x0000a5ab014a8cac AS datetime), CAST ('True' AS bit), CAST(0x0000a59101489fd3 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (103, 103, 23, CAST(0x0000a58e00a84898 AS datetime), CAST(0x0000a5ad00a84898 AS datetime), CAST(0x0000a5ac00a84898 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00a84898 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (104, 104, 10, CAST(0x0000a58e00ac1558 AS datetime), CAST(0x0000a5ad00ac1558 AS datetime), CAST(0x0000a5ac00ac1558 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b2243a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (105, 105, 15, CAST(0x0000a58e00acd238 AS datetime), CAST(0x0000a5ad00acd238 AS datetime), CAST(0x0000a5ac00acd238 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00ae18d5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (106, 106, 15, CAST(0x0000a58e00aea449 AS datetime), CAST(0x0000a5ad00aea449 AS datetime), CAST(0x0000a5ac00aea449 AS datetime), CAST ('True' AS bit), CAST(0x0000a59101491830 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (107, 107, 15, CAST(0x0000a58e00b117a9 AS datetime), CAST(0x0000a5ad00b117a9 AS datetime), CAST(0x0000a5ac00b117a9 AS datetime), CAST ('False' AS bit), CAST(0x0000a58e00b3e621 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (108, 108, 10, CAST(0x0000a58e00b5e166 AS datetime), CAST(0x0000a5ad00b5e166 AS datetime), CAST(0x0000a5ac00b5e166 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00b60ccc AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (109, 109, 10, CAST(0x0000a58e00c076db AS datetime), CAST(0x0000a5ad00c076db AS datetime), CAST(0x0000a5ac00c076db AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c076db AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (110, 110, 10, CAST(0x0000a58e00c131f7 AS datetime), CAST(0x0000a5ad00c131f7 AS datetime), CAST(0x0000a5ac00c131f7 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c131f7 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (111, 111, 10, CAST(0x0000a58e00c1c3ff AS datetime), CAST(0x0000a5ad00c1c3ff AS datetime), CAST(0x0000a5ac00c1c3ff AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c1c3ff AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (112, 112, 10, CAST(0x0000a58e00c48d59 AS datetime), CAST(0x0000a5ad00c48d59 AS datetime), CAST(0x0000a5ac00c48d59 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c48d59 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (113, 113, 10, CAST(0x0000a58e00c70f3a AS datetime), CAST(0x0000a5ad00c70f3a AS datetime), CAST(0x0000a5ac00c70f3a AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c70f3a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (114, 114, 15, CAST(0x0000a58e00c840c2 AS datetime), CAST(0x0000a5ad00c840c2 AS datetime), CAST(0x0000a5ac00c840c2 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c840c2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (115, 115, 19, CAST(0x0000a58e00c8f534 AS datetime), CAST(0x0000a5ad00c8f534 AS datetime), CAST(0x0000a5ac00c8f534 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00c8f534 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (116, 116, 10, CAST(0x0000a58e00ca848f AS datetime), CAST(0x0000a5ad00ca848f AS datetime), CAST(0x0000a5ac00ca848f AS datetime), CAST ('True' AS bit), CAST(0x0000a58e00ca848f AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (117, 117, 10, CAST(0x0000a58e0112be1c AS datetime), CAST(0x0000a5ad0112be1c AS datetime), CAST(0x0000a5ac0112be1c AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0112be1c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (118, 118, 4, CAST(0x0000a58e01146eba AS datetime), CAST(0x0000a5ad01146eba AS datetime), CAST(0x0000a5ac01146eba AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01146eba AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (119, 119, 39, CAST(0x0000a58e01180d59 AS datetime), CAST(0x0000a5ad01180d59 AS datetime), CAST(0x0000a5ac01180d59 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01180d59 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (120, 120, 15, CAST(0x0000a58e0118fe87 AS datetime), CAST(0x0000a5ad0118fe87 AS datetime), CAST(0x0000a5ac0118fe87 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0118fe87 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (121, 121, 21, CAST(0x0000a58e011a8f19 AS datetime), CAST(0x0000a5ad011a8f19 AS datetime), CAST(0x0000a5ac011a8f19 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e011a8f19 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (122, 122, 21, CAST(0x0000a58e011e7c04 AS datetime), CAST(0x0000a5ad011e7c04 AS datetime), CAST(0x0000a5ac011e7c04 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e011e7c04 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (123, 123, 32, CAST(0x0000a58e0120ce7f AS datetime), CAST(0x0000a5ad0120ce7f AS datetime), CAST(0x0000a5ac0120ce7f AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0120ce7f AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (124, 124, 23, CAST(0x0000a58e01220982 AS datetime), CAST(0x0000a5ad01220982 AS datetime), CAST(0x0000a5ac01220982 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01220982 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (125, 125, 34, CAST(0x0000a58e01229bbd AS datetime), CAST(0x0000a5ad01229bbd AS datetime), CAST(0x0000a5ac01229bbd AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01229bbd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (126, 126, 23, CAST(0x0000a58e0133345e AS datetime), CAST(0x0000a5ad0133345e AS datetime), CAST(0x0000a5ac0133345e AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0133345e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (127, 128, 15, CAST(0x0000a58e01347dcd AS datetime), CAST(0x0000a5ad01347dcd AS datetime), CAST(0x0000a5ac01347dcd AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01347dcd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (128, 129, 10, CAST(0x0000a58e0134f88e AS datetime), CAST(0x0000a5ad0134f88e AS datetime), CAST(0x0000a5ac0134f88e AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0134f88e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (129, 130, 10, CAST(0x0000a58e01358501 AS datetime), CAST(0x0000a5ad01358501 AS datetime), CAST(0x0000a5ac01358501 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01358501 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (130, 131, 10, CAST(0x0000a58e0136bf8b AS datetime), CAST(0x0000a5ad0136bf8b AS datetime), CAST(0x0000a5ac0136bf8b AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0136bf8b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (131, 132, 17, CAST(0x0000a58e01373ec2 AS datetime), CAST(0x0000a5ad01373ec2 AS datetime), CAST(0x0000a5ac01373ec2 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01373ec2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (132, 133, 10, CAST(0x0000a58e0137af05 AS datetime), CAST(0x0000a5ad0137af05 AS datetime), CAST(0x0000a5ac0137af05 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0137af05 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (133, 134, 10, CAST(0x0000a58e01382ede AS datetime), CAST(0x0000a5ad01382ede AS datetime), CAST(0x0000a5ac01382ede AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01382ede AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (134, 135, 10, CAST(0x0000a58e0138a447 AS datetime), CAST(0x0000a5ad0138a447 AS datetime), CAST(0x0000a5ac0138a447 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0138a447 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (135, 136, 10, CAST(0x0000a58e01393032 AS datetime), CAST(0x0000a5ad01393032 AS datetime), CAST(0x0000a5ac01393032 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01393032 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (136, 137, 1, CAST(0x0000a58e0139e71e AS datetime), CAST(0x0000a59d0139e71e AS datetime), CAST(0x0000a59c0139e71e AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0139e71e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (137, 138, 1, CAST(0x0000a58e013a3865 AS datetime), CAST(0x0000a59d013a3865 AS datetime), CAST(0x0000a59c013a3865 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013a3865 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (138, 139, 10, CAST(0x0000a58e013aafb0 AS datetime), CAST(0x0000a5ad013aafb0 AS datetime), CAST(0x0000a5ac013aafb0 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013aafb0 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (139, 140, 23, CAST(0x0000a58e013b23ca AS datetime), CAST(0x0000a5ad013b23ca AS datetime), CAST(0x0000a5ac013b23ca AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013b23ca AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (140, 141, 10, CAST(0x0000a58e013b8798 AS datetime), CAST(0x0000a5ad013b8798 AS datetime), CAST(0x0000a5ac013b8798 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013b8798 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (141, 142, 10, CAST(0x0000a58e013c5f15 AS datetime), CAST(0x0000a5ad013c5f15 AS datetime), CAST(0x0000a5ac013c5f15 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013c5f15 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (142, 143, 17, CAST(0x0000a58e013cfbd0 AS datetime), CAST(0x0000a5ad013cfbd0 AS datetime), CAST(0x0000a5ac013cfbd0 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013cfbd0 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (143, 144, 10, CAST(0x0000a58e013da881 AS datetime), CAST(0x0000a5ad013da881 AS datetime), CAST(0x0000a5ac013da881 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013da881 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (144, 145, 10, CAST(0x0000a58e013e5795 AS datetime), CAST(0x0000a5ad013e5795 AS datetime), CAST(0x0000a5ac013e5795 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013e5795 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (145, 146, 10, CAST(0x0000a58e013f5dc4 AS datetime), CAST(0x0000a5ad013f5dc4 AS datetime), CAST(0x0000a5ac013f5dc4 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013f5dc4 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (146, 147, 10, CAST(0x0000a58e013fc42d AS datetime), CAST(0x0000a5ad013fc42d AS datetime), CAST(0x0000a5ac013fc42d AS datetime), CAST ('True' AS bit), CAST(0x0000a58e013fc42d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (147, 148, 17, CAST(0x0000a58e01406633 AS datetime), CAST(0x0000a5ad01406633 AS datetime), CAST(0x0000a5ac01406633 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01406633 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (148, 149, 15, CAST(0x0000a58e01553e0e AS datetime), CAST(0x0000a5ad01553e0e AS datetime), CAST(0x0000a5ac01553e0e AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01553e0e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (149, 150, 10, CAST(0x0000a58e0155dd60 AS datetime), CAST(0x0000a5ad0155dd60 AS datetime), CAST(0x0000a5ac0155dd60 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0155dd60 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (150, 151, 21, CAST(0x0000a58e0156830c AS datetime), CAST(0x0000a5ad0156830c AS datetime), CAST(0x0000a5ac0156830c AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0156830c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (151, 152, 15, CAST(0x0000a58e01575eb8 AS datetime), CAST(0x0000a5ad01575eb8 AS datetime), CAST(0x0000a5ac01575eb8 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e01575eb8 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (152, 153, 40, CAST(0x0000a58e0157cd29 AS datetime), CAST(0x0000a5ad0157cd29 AS datetime), CAST(0x0000a5ac0157cd29 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0157cd29 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (153, 154, 32, CAST(0x0000a58e015849c2 AS datetime), CAST(0x0000a5ad015849c2 AS datetime), CAST(0x0000a5ac015849c2 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015849c2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (154, 155, 17, CAST(0x0000a58e0158dc37 AS datetime), CAST(0x0000a5ad0158dc37 AS datetime), CAST(0x0000a5ac0158dc37 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0158dc37 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (155, 156, 10, CAST(0x0000a58e0159b09e AS datetime), CAST(0x0000a5ad0159b09e AS datetime), CAST(0x0000a5ac0159b09e AS datetime), CAST ('True' AS bit), CAST(0x0000a58e0159b09e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (156, 157, 10, CAST(0x0000a58e015a5f6d AS datetime), CAST(0x0000a5ad015a5f6d AS datetime), CAST(0x0000a5ac015a5f6d AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015a5f6d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (157, 158, 10, CAST(0x0000a58e015cfa4a AS datetime), CAST(0x0000a5ad015cfa4a AS datetime), CAST(0x0000a5ac015cfa4a AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015cfa4a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (158, 159, 17, CAST(0x0000a58e015d8bde AS datetime), CAST(0x0000a5ad015d8bde AS datetime), CAST(0x0000a5ac015d8bde AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015d8bde AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (159, 160, 39, CAST(0x0000a58e015e5190 AS datetime), CAST(0x0000a5ad015e5190 AS datetime), CAST(0x0000a5ac015e5190 AS datetime), CAST ('True' AS bit), CAST(0x0000a58e015e5190 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (160, 161, 15, CAST(0x0000a59300817266 AS datetime), CAST(0x0000a5b200817266 AS datetime), CAST(0x0000a5b100817266 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300822bb6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (161, 162, 10, CAST(0x0000a59300821295 AS datetime), CAST(0x0000a5b200821295 AS datetime), CAST(0x0000a5b100821295 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300821295 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (162, 163, 15, CAST(0x0000a5930082d6f1 AS datetime), CAST(0x0000a5b20082d6f1 AS datetime), CAST(0x0000a5b10082d6f1 AS datetime), CAST ('True' AS bit), CAST(0x0000a5930082d6f1 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (163, 164, 19, CAST(0x0000a5930087fde5 AS datetime), CAST(0x0000a5b20087fde5 AS datetime), CAST(0x0000a5b10087fde5 AS datetime), CAST ('True' AS bit), CAST(0x0000a5930087fde5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (164, 165, 32, CAST(0x0000a59300888f7e AS datetime), CAST(0x0000a5b200888f7e AS datetime), CAST(0x0000a5b100888f7e AS datetime), CAST ('True' AS bit), CAST(0x0000a59300895e62 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (165, 166, 10, CAST(0x0000a59300894f7c AS datetime), CAST(0x0000a5b200894f7c AS datetime), CAST(0x0000a5b100894f7c AS datetime), CAST ('True' AS bit), CAST(0x0000a59300894f7c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (166, 167, 11, CAST(0x0000a593008cc787 AS datetime), CAST(0x0000a5b2008cc787 AS datetime), CAST(0x0000a5b1008cc787 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008cc787 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (167, 168, 13, CAST(0x0000a593008d51f1 AS datetime), CAST(0x0000a5b2008d51f1 AS datetime), CAST(0x0000a5b1008d51f1 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008d51f1 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (168, 169, 10, CAST(0x0000a593008df7ad AS datetime), CAST(0x0000a5b2008df7ad AS datetime), CAST(0x0000a5b1008df7ad AS datetime), CAST ('True' AS bit), CAST(0x0000a593008df7ad AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (169, 170, 15, CAST(0x0000a593008e85f6 AS datetime), CAST(0x0000a5b2008e85f6 AS datetime), CAST(0x0000a5b1008e85f6 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008e85f6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (170, 171, 21, CAST(0x0000a593008f6ab6 AS datetime), CAST(0x0000a5b2008f6ab6 AS datetime), CAST(0x0000a5b1008f6ab6 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008f6ab6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (171, 172, 23, CAST(0x0000a593008fff45 AS datetime), CAST(0x0000a5b2008fff45 AS datetime), CAST(0x0000a5b1008fff45 AS datetime), CAST ('True' AS bit), CAST(0x0000a593008fff45 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (172, 173, 4, CAST(0x0000a5930090c860 AS datetime), CAST(0x0000a5b20090c860 AS datetime), CAST(0x0000a5b10090c860 AS datetime), CAST ('True' AS bit), CAST(0x0000a5930090c860 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (173, 174, 23, CAST(0x0000a59300915657 AS datetime), CAST(0x0000a5b200915657 AS datetime), CAST(0x0000a5b100915657 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300915657 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (174, 175, 19, CAST(0x0000a5930096818d AS datetime), CAST(0x0000a5b20096818d AS datetime), CAST(0x0000a5b10096818d AS datetime), CAST ('True' AS bit), CAST(0x0000a5930096818d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (175, 176, 10, CAST(0x0000a59300970cc2 AS datetime), CAST(0x0000a5b200970cc2 AS datetime), CAST(0x0000a5b100970cc2 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300970cc2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (176, 177, 10, CAST(0x0000a593009786c0 AS datetime), CAST(0x0000a5b2009786c0 AS datetime), CAST(0x0000a5b1009786c0 AS datetime), CAST ('True' AS bit), CAST(0x0000a593009839a9 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (177, 178, 4, CAST(0x0000a59300982557 AS datetime), CAST(0x0000a5b200982557 AS datetime), CAST(0x0000a5b100982557 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300982557 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (178, 179, 6, CAST(0x0000a59300989397 AS datetime), CAST(0x0000a5b200989397 AS datetime), CAST(0x0000a5b100989397 AS datetime), CAST ('True' AS bit), CAST(0x0000a59300989397 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (179, 180, 11, CAST(0x0000a593009902ce AS datetime), CAST(0x0000a5b2009902ce AS datetime), CAST(0x0000a5b1009902ce AS datetime), CAST ('True' AS bit), CAST(0x0000a593009902ce AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (180, 181, 10, CAST(0x0000a593009b6c9c AS datetime), CAST(0x0000a5b2009b6c9c AS datetime), CAST(0x0000a5b1009b6c9c AS datetime), CAST ('True' AS bit), CAST(0x0000a593009b6c9c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (181, 182, 10, CAST(0x0000a593009c00a7 AS datetime), CAST(0x0000a5b2009c00a7 AS datetime), CAST(0x0000a5b1009c00a7 AS datetime), CAST ('True' AS bit), CAST(0x0000a593009c00a7 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (182, 183, 10, CAST(0x0000a593009c7f45 AS datetime), CAST(0x0000a5b2009c7f45 AS datetime), CAST(0x0000a5b1009c7f45 AS datetime), CAST ('True' AS bit), CAST(0x0000a593009c7f45 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (183, 184, 40, CAST(0x0000a593009dcadd AS datetime), CAST(0x0000a5b2009dcadd AS datetime), CAST(0x0000a5b1009dcadd AS datetime), CAST ('True' AS bit), CAST(0x0000a593009dcadd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (184, 185, 15, CAST(0x0000a594009762fc AS datetime), CAST(0x0000a5b3009762fc AS datetime), CAST(0x0000a5b2009762fc AS datetime), CAST ('True' AS bit), CAST(0x0000a594009762fc AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (185, 186, 11, CAST(0x0000a59400b6fe32 AS datetime), CAST(0x0000a5b300b6fe32 AS datetime), CAST(0x0000a5b200b6fe32 AS datetime), CAST ('True' AS bit), CAST(0x0000a59400b6fe32 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (186, 187, 10, CAST(0x0000a59400b9012e AS datetime), CAST(0x0000a5b300b9012e AS datetime), CAST(0x0000a5b200b9012e AS datetime), CAST ('True' AS bit), CAST(0x0000a59400b9012e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (187, 188, 10, CAST(0x0000a59400c94dd0 AS datetime), CAST(0x0000a5b300c94dd0 AS datetime), CAST(0x0000a5b200c94dd0 AS datetime), CAST ('True' AS bit), CAST(0x0000a59400c94dd0 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (188, 189, 15, CAST(0x0000a59400ca1ba9 AS datetime), CAST(0x0000a5b300ca1ba9 AS datetime), CAST(0x0000a5b200ca1ba9 AS datetime), CAST ('True' AS bit), CAST(0x0000a59400ca1ba9 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (189, 190, 17, CAST(0x0000a59400cab396 AS datetime), CAST(0x0000a5b300cab396 AS datetime), CAST(0x0000a5b200cab396 AS datetime), CAST ('True' AS bit), CAST(0x0000a59400cab396 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (190, 191, 10, CAST(0x0000a5990096498e AS datetime), CAST(0x0000a5b80096498e AS datetime), CAST(0x0000a5b70096498e AS datetime), CAST ('True' AS bit), CAST(0x0000a5990096498e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (191, 192, 10, CAST(0x0000a5990096c164 AS datetime), CAST(0x0000a5b80096c164 AS datetime), CAST(0x0000a5b70096c164 AS datetime), CAST ('True' AS bit), CAST(0x0000a5990096c164 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (192, 193, 17, CAST(0x0000a59900974445 AS datetime), CAST(0x0000a5b800974445 AS datetime), CAST(0x0000a5b700974445 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900974445 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (193, 194, 17, CAST(0x0000a5990097d9b4 AS datetime), CAST(0x0000a5b80097d9b4 AS datetime), CAST(0x0000a5b70097d9b4 AS datetime), CAST ('True' AS bit), CAST(0x0000a5990097d9b4 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (194, 195, 13, CAST(0x0000a599009868a6 AS datetime), CAST(0x0000a5b8009868a6 AS datetime), CAST(0x0000a5b7009868a6 AS datetime), CAST ('True' AS bit), CAST(0x0000a599009868a6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (195, 196, 10, CAST(0x0000a5990098f46d AS datetime), CAST(0x0000a5b80098f46d AS datetime), CAST(0x0000a5b70098f46d AS datetime), CAST ('True' AS bit), CAST(0x0000a5990098f46d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (196, 197, 23, CAST(0x0000a599009980a5 AS datetime), CAST(0x0000a5b8009980a5 AS datetime), CAST(0x0000a5b7009980a5 AS datetime), CAST ('True' AS bit), CAST(0x0000a599009980a5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (197, 198, 19, CAST(0x0000a599009bb0ef AS datetime), CAST(0x0000a5b8009bb0ef AS datetime), CAST(0x0000a5b7009bb0ef AS datetime), CAST ('True' AS bit), CAST(0x0000a599009efc0b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (198, 199, 10, CAST(0x0000a599009c37b9 AS datetime), CAST(0x0000a5b8009c37b9 AS datetime), CAST(0x0000a5b7009c37b9 AS datetime), CAST ('True' AS bit), CAST(0x0000a599009c37b9 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (199, 200, 10, CAST(0x0000a599009cd17e AS datetime), CAST(0x0000a5b8009cd17e AS datetime), CAST(0x0000a5b7009cd17e AS datetime), CAST ('True' AS bit), CAST(0x0000a599009cd17e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (200, 201, 15, CAST(0x0000a599009d5180 AS datetime), CAST(0x0000a5b8009d5180 AS datetime), CAST(0x0000a5b7009d5180 AS datetime), CAST ('True' AS bit), CAST(0x0000a599009d5180 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (201, 202, 17, CAST(0x0000a599009dcbbf AS datetime), CAST(0x0000a5b8009dcbbf AS datetime), CAST(0x0000a5b7009dcbbf AS datetime), CAST ('True' AS bit), CAST(0x0000a599009dcbbf AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (202, 203, 6, CAST(0x0000a599009e3ec2 AS datetime), CAST(0x0000a5b8009e3ec2 AS datetime), CAST(0x0000a5b7009e3ec2 AS datetime), CAST ('True' AS bit), CAST(0x0000a599009e3ec2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (203, 204, 11, CAST(0x0000a59900a391a6 AS datetime), CAST(0x0000a5b800a391a6 AS datetime), CAST(0x0000a5b700a391a6 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900a391a6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (204, 205, 10, CAST(0x0000a59900ac888b AS datetime), CAST(0x0000a5b800ac888b AS datetime), CAST(0x0000a5b700ac888b AS datetime), CAST ('True' AS bit), CAST(0x0000a59900ac888b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (205, 206, 25, CAST(0x0000a59900b11989 AS datetime), CAST(0x0000a5b800b11989 AS datetime), CAST(0x0000a5b700b11989 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b11989 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (206, 207, 10, CAST(0x0000a59900b67a45 AS datetime), CAST(0x0000a5b800b67a45 AS datetime), CAST(0x0000a5b700b67a45 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b67a45 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (207, 208, 10, CAST(0x0000a59900b6f010 AS datetime), CAST(0x0000a5b800b6f010 AS datetime), CAST(0x0000a5b700b6f010 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b6f010 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (208, 209, 10, CAST(0x0000a59900b767e0 AS datetime), CAST(0x0000a5b800b767e0 AS datetime), CAST(0x0000a5b700b767e0 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b767e0 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (209, 210, 10, CAST(0x0000a59900b7dacc AS datetime), CAST(0x0000a5b800b7dacc AS datetime), CAST(0x0000a5b700b7dacc AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b7dacc AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (210, 211, 17, CAST(0x0000a59900b83a8c AS datetime), CAST(0x0000a5b800b83a8c AS datetime), CAST(0x0000a5b700b83a8c AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b83a8c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (211, 212, 10, CAST(0x0000a59900b91f5b AS datetime), CAST(0x0000a5b800b91f5b AS datetime), CAST(0x0000a5b700b91f5b AS datetime), CAST ('True' AS bit), CAST(0x0000a59900b91f5b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (212, 213, 6, CAST(0x0000a59900c2afe5 AS datetime), CAST(0x0000a5b800c2afe5 AS datetime), CAST(0x0000a5b700c2afe5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900c2afe5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (213, 214, 10, CAST(0x0000a59900cea42c AS datetime), CAST(0x0000a5b800cea42c AS datetime), CAST(0x0000a5b700cea42c AS datetime), CAST ('True' AS bit), CAST(0x0000a59900cea42c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (214, 215, 17, CAST(0x0000a59900cefd58 AS datetime), CAST(0x0000a5b800cefd58 AS datetime), CAST(0x0000a5b700cefd58 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900cefd58 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (215, 216, 10, CAST(0x0000a59900cfdd9a AS datetime), CAST(0x0000a5b800cfdd9a AS datetime), CAST(0x0000a5b700cfdd9a AS datetime), CAST ('True' AS bit), CAST(0x0000a59900cfdd9a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (216, 217, 10, CAST(0x0000a59900d052c4 AS datetime), CAST(0x0000a5b800d052c4 AS datetime), CAST(0x0000a5b700d052c4 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d052c4 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (217, 218, 4, CAST(0x0000a59900d0e1c3 AS datetime), CAST(0x0000a5b800d0e1c3 AS datetime), CAST(0x0000a5b700d0e1c3 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d0e1c3 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (218, 219, 10, CAST(0x0000a59900d12b0c AS datetime), CAST(0x0000a5b800d12b0c AS datetime), CAST(0x0000a5b700d12b0c AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d12b0c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (219, 220, 17, CAST(0x0000a59900d1967e AS datetime), CAST(0x0000a5b800d1967e AS datetime), CAST(0x0000a5b700d1967e AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d1967e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (220, 221, 17, CAST(0x0000a59900d222b6 AS datetime), CAST(0x0000a5b800d222b6 AS datetime), CAST(0x0000a5b700d222b6 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d222b6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (221, 222, 17, CAST(0x0000a59900d2782a AS datetime), CAST(0x0000a5b800d2782a AS datetime), CAST(0x0000a5b700d2782a AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d2782a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (222, 223, 10, CAST(0x0000a59900d2e9a8 AS datetime), CAST(0x0000a5b800d2e9a8 AS datetime), CAST(0x0000a5b700d2e9a8 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d2e9a8 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (223, 224, 10, CAST(0x0000a59900d33962 AS datetime), CAST(0x0000a5b800d33962 AS datetime), CAST(0x0000a5b700d33962 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d33962 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (224, 225, 40, CAST(0x0000a59900d3f127 AS datetime), CAST(0x0000a5b800d3f127 AS datetime), CAST(0x0000a5b700d3f127 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d3f127 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (225, 226, 10, CAST(0x0000a59900d448b3 AS datetime), CAST(0x0000a5b800d448b3 AS datetime), CAST(0x0000a5b700d448b3 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d448b3 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (226, 227, 10, CAST(0x0000a59900d4b8d8 AS datetime), CAST(0x0000a5b800d4b8d8 AS datetime), CAST(0x0000a5b700d4b8d8 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d4b8d8 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (227, 228, 17, CAST(0x0000a59900d52bb6 AS datetime), CAST(0x0000a5b800d52bb6 AS datetime), CAST(0x0000a5b700d52bb6 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d52bb6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (228, 229, 10, CAST(0x0000a59900d5b086 AS datetime), CAST(0x0000a5b800d5b086 AS datetime), CAST(0x0000a5b700d5b086 AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d5b086 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (229, 230, 4, CAST(0x0000a59900d61d8c AS datetime), CAST(0x0000a5b800d61d8c AS datetime), CAST(0x0000a5b700d61d8c AS datetime), CAST ('True' AS bit), CAST(0x0000a59900d61d8c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (230, 231, 6, CAST(0x0000a59a00834d60 AS datetime), CAST(0x0000a5b900834d60 AS datetime), CAST(0x0000a5b800834d60 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00834d60 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (231, 232, 32, CAST(0x0000a59a0083e528 AS datetime), CAST(0x0000a5b90083e528 AS datetime), CAST(0x0000a5b80083e528 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a0083e528 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (232, 233, 10, CAST(0x0000a59a00848965 AS datetime), CAST(0x0000a5b900848965 AS datetime), CAST(0x0000a5b800848965 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00848965 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (233, 234, 32, CAST(0x0000a59a008549fd AS datetime), CAST(0x0000a5b9008549fd AS datetime), CAST(0x0000a5b8008549fd AS datetime), CAST ('True' AS bit), CAST(0x0000a59a008549fd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (234, 235, 10, CAST(0x0000a59a00923fdd AS datetime), CAST(0x0000a5b900923fdd AS datetime), CAST(0x0000a5b800923fdd AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00923fdd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (235, 236, 1, CAST(0x0000a59a0092acb2 AS datetime), CAST(0x0000a5a90092acb2 AS datetime), CAST(0x0000a5a80092acb2 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a0092acb2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (236, 237, 32, CAST(0x0000a59a00965482 AS datetime), CAST(0x0000a5b900965482 AS datetime), CAST(0x0000a5b800965482 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00965482 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (237, 238, 32, CAST(0x0000a59a009775f4 AS datetime), CAST(0x0000a5b9009775f4 AS datetime), CAST(0x0000a5b8009775f4 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009775f4 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (238, 239, 6, CAST(0x0000a59a0099fc4f AS datetime), CAST(0x0000a5b90099fc4f AS datetime), CAST(0x0000a5b80099fc4f AS datetime), CAST ('True' AS bit), CAST(0x0000a59a0099fc4f AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (239, 240, 6, CAST(0x0000a59a009a6095 AS datetime), CAST(0x0000a5b9009a6095 AS datetime), CAST(0x0000a5b8009a6095 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009a6095 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (240, 241, 17, CAST(0x0000a59a009ab842 AS datetime), CAST(0x0000a5b9009ab842 AS datetime), CAST(0x0000a5b8009ab842 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009ab842 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (241, 242, 10, CAST(0x0000a59a009ec337 AS datetime), CAST(0x0000a5b9009ec337 AS datetime), CAST(0x0000a5b8009ec337 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009ec337 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (242, 243, 4, CAST(0x0000a59a009f087c AS datetime), CAST(0x0000a5b9009f087c AS datetime), CAST(0x0000a5b8009f087c AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009f087c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (243, 244, 17, CAST(0x0000a59a009f9df2 AS datetime), CAST(0x0000a5b9009f9df2 AS datetime), CAST(0x0000a5b8009f9df2 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a009f9df2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (244, 245, 17, CAST(0x0000a59a00a02c4b AS datetime), CAST(0x0000a5b900a02c4b AS datetime), CAST(0x0000a5b800a02c4b AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a02c4b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (245, 246, 1, CAST(0x0000a59a00a0cfd5 AS datetime), CAST(0x0000a5a900a0cfd5 AS datetime), CAST(0x0000a5a800a0cfd5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a0cfd5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (246, 247, 6, CAST(0x0000a59a00a12d1e AS datetime), CAST(0x0000a5b900a12d1e AS datetime), CAST(0x0000a5b800a12d1e AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a12d1e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (247, 248, 10, CAST(0x0000a59a00a1abcd AS datetime), CAST(0x0000a5b900a1abcd AS datetime), CAST(0x0000a5b800a1abcd AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a1abcd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (248, 249, 10, CAST(0x0000a59a00a5910b AS datetime), CAST(0x0000a5b900a5910b AS datetime), CAST(0x0000a5b800a5910b AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a5910b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (249, 250, 3, CAST(0x0000a59a00a63dfa AS datetime), CAST(0x0000a5a900a63dfa AS datetime), CAST(0x0000a5a800a63dfa AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a63dfa AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (250, 251, 10, CAST(0x0000a59a00a70c09 AS datetime), CAST(0x0000a5b900a70c09 AS datetime), CAST(0x0000a5b800a70c09 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a70c09 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (251, 252, 17, CAST(0x0000a59a00a79542 AS datetime), CAST(0x0000a5b900a79542 AS datetime), CAST(0x0000a5b800a79542 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a79542 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (252, 253, 6, CAST(0x0000a59a00a80a67 AS datetime), CAST(0x0000a5b900a80a67 AS datetime), CAST(0x0000a5b800a80a67 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a80a67 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (253, 254, 17, CAST(0x0000a59a00a8f55d AS datetime), CAST(0x0000a5b900a8f55d AS datetime), CAST(0x0000a5b800a8f55d AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a8f55d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (254, 255, 27, CAST(0x0000a59a00a992c3 AS datetime), CAST(0x0000a5b900a992c3 AS datetime), CAST(0x0000a5b800a992c3 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00a992c3 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (255, 256, 15, CAST(0x0000a59a00aa0d12 AS datetime), CAST(0x0000a5b900aa0d12 AS datetime), CAST(0x0000a5b800aa0d12 AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00aa0d12 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (256, 257, 10, CAST(0x0000a59a00aac21a AS datetime), CAST(0x0000a5b900aac21a AS datetime), CAST(0x0000a5b800aac21a AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00aac21a AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (257, 258, 6, CAST(0x0000a59a00ab63ba AS datetime), CAST(0x0000a5b900ab63ba AS datetime), CAST(0x0000a5b800ab63ba AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00ab63ba AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (258, 259, 6, CAST(0x0000a59a00abd9ef AS datetime), CAST(0x0000a5b900abd9ef AS datetime), CAST(0x0000a5b800abd9ef AS datetime), CAST ('True' AS bit), CAST(0x0000a59a00abd9ef AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (259, 260, 6, CAST(0x0000a59b00d1d274 AS datetime), CAST(0x0000a5ba00d1d274 AS datetime), CAST(0x0000a5b900d1d274 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c014de441 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (260, 261, 23, CAST(0x0000a59b00d2f102 AS datetime), CAST(0x0000a5ba00d2f102 AS datetime), CAST(0x0000a5b900d2f102 AS datetime), CAST ('True' AS bit), CAST(0x0000a59b00d2f102 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (261, 262, 6, CAST(0x0000a59c0095e9ac AS datetime), CAST(0x0000a5bb0095e9ac AS datetime), CAST(0x0000a5ba0095e9ac AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0095e9ac AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (262, 263, 10, CAST(0x0000a59c0096b539 AS datetime), CAST(0x0000a5bb0096b539 AS datetime), CAST(0x0000a5ba0096b539 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0096b539 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (263, 264, 10, CAST(0x0000a59c009715bd AS datetime), CAST(0x0000a5bb009715bd AS datetime), CAST(0x0000a5ba009715bd AS datetime), CAST ('True' AS bit), CAST(0x0000a59c009715bd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (264, 265, 15, CAST(0x0000a59c0097b645 AS datetime), CAST(0x0000a5bb0097b645 AS datetime), CAST(0x0000a5ba0097b645 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0097b645 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (265, 266, 15, CAST(0x0000a59c0098504e AS datetime), CAST(0x0000a5bb0098504e AS datetime), CAST(0x0000a5ba0098504e AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0098504e AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (266, 267, 15, CAST(0x0000a59c0098f413 AS datetime), CAST(0x0000a5bb0098f413 AS datetime), CAST(0x0000a5ba0098f413 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c0098f413 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (267, 268, 15, CAST(0x0000a59c009a49cc AS datetime), CAST(0x0000a5bb009a49cc AS datetime), CAST(0x0000a5ba009a49cc AS datetime), CAST ('True' AS bit), CAST(0x0000a59c009a49cc AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (268, 269, 17, CAST(0x0000a59c009f068d AS datetime), CAST(0x0000a5bb009f068d AS datetime), CAST(0x0000a5ba009f068d AS datetime), CAST ('True' AS bit), CAST(0x0000a59c009f068d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (269, 270, 32, CAST(0x0000a59c009fdb79 AS datetime), CAST(0x0000a5bb009fdb79 AS datetime), CAST(0x0000a5ba009fdb79 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c009fdb79 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (270, 271, 10, CAST(0x0000a59c00a24def AS datetime), CAST(0x0000a5bb00a24def AS datetime), CAST(0x0000a5ba00a24def AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a24def AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (271, 272, 10, CAST(0x0000a59c00a2c9be AS datetime), CAST(0x0000a5bb00a2c9be AS datetime), CAST(0x0000a5ba00a2c9be AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a2c9be AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (272, 273, 10, CAST(0x0000a59c00a330ab AS datetime), CAST(0x0000a5bb00a330ab AS datetime), CAST(0x0000a5ba00a330ab AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a330ab AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (273, 274, 10, CAST(0x0000a59c00a6351c AS datetime), CAST(0x0000a5bb00a6351c AS datetime), CAST(0x0000a5ba00a6351c AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a6351c AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (274, 275, 32, CAST(0x0000a59c00a8d6ce AS datetime), CAST(0x0000a5bb00a8d6ce AS datetime), CAST(0x0000a5ba00a8d6ce AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00a8d6ce AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (275, 276, 10, CAST(0x0000a59c00aa3477 AS datetime), CAST(0x0000a5bb00aa3477 AS datetime), CAST(0x0000a5ba00aa3477 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00aa3477 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (276, 277, 15, CAST(0x0000a59c00aaa9a1 AS datetime), CAST(0x0000a5bb00aaa9a1 AS datetime), CAST(0x0000a5ba00aaa9a1 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00aaa9a1 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (277, 278, 15, CAST(0x0000a59c00aba8f2 AS datetime), CAST(0x0000a5bb00aba8f2 AS datetime), CAST(0x0000a5ba00aba8f2 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00aba8f2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (278, 279, 23, CAST(0x0000a59c00ac3697 AS datetime), CAST(0x0000a5bb00ac3697 AS datetime), CAST(0x0000a5ba00ac3697 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00ac3697 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (279, 280, 23, CAST(0x0000a59c00accb7f AS datetime), CAST(0x0000a5bb00accb7f AS datetime), CAST(0x0000a5ba00accb7f AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00accb7f AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (280, 281, 30, CAST(0x0000a59c00b0ee32 AS datetime), CAST(0x0000a5bb00b0ee32 AS datetime), CAST(0x0000a5ba00b0ee32 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00b0ee32 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (281, 282, 10, CAST(0x0000a59c00b1bcf6 AS datetime), CAST(0x0000a5bb00b1bcf6 AS datetime), CAST(0x0000a5ba00b1bcf6 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00b1bcf6 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (282, 283, 15, CAST(0x0000a59c00b2295d AS datetime), CAST(0x0000a5bb00b2295d AS datetime), CAST(0x0000a5ba00b2295d AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00b2295d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (283, 284, 6, CAST(0x0000a59c00b2f5e5 AS datetime), CAST(0x0000a5bb00b2f5e5 AS datetime), CAST(0x0000a5ba00b2f5e5 AS datetime), CAST ('True' AS bit), CAST(0x0000a59c00b2f5e5 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (284, 286, 15, CAST(0x0000a59f00bf77ed AS datetime), CAST(0x0000a5be00bf77ed AS datetime), CAST(0x0000a5bd00bf77ed AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00bf77ed AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (285, 287, 6, CAST(0x0000a59f00c00a37 AS datetime), CAST(0x0000a5be00c00a37 AS datetime), CAST(0x0000a5bd00c00a37 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00c00a37 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (286, 288, 6, CAST(0x0000a59f00cbbc59 AS datetime), CAST(0x0000a5be00cbbc59 AS datetime), CAST(0x0000a5bd00cbbc59 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00cbbc59 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (287, 289, 15, CAST(0x0000a59f00cc4dfd AS datetime), CAST(0x0000a5be00cc4dfd AS datetime), CAST(0x0000a5bd00cc4dfd AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00cc4dfd AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (288, 290, 15, CAST(0x0000a59f00cf5568 AS datetime), CAST(0x0000a5be00cf5568 AS datetime), CAST(0x0000a5bd00cf5568 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00cf5568 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (289, 291, 15, CAST(0x0000a59f00cfad8d AS datetime), CAST(0x0000a5be00cfad8d AS datetime), CAST(0x0000a5bd00cfad8d AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00cfad8d AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (290, 292, 15, CAST(0x0000a59f00d01289 AS datetime), CAST(0x0000a5be00d01289 AS datetime), CAST(0x0000a5bd00d01289 AS datetime), CAST ('True' AS bit), CAST(0x0000a59f00d01289 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (291, 293, 32, CAST(0x0000a5a000a2a4ce AS datetime), CAST(0x0000a5bf00a2a4ce AS datetime), CAST(0x0000a5be00a2a4ce AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a2a4ce AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (292, 294, 32, CAST(0x0000a5a000a350d2 AS datetime), CAST(0x0000a5bf00a350d2 AS datetime), CAST(0x0000a5be00a350d2 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a350d2 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (293, 295, 6, CAST(0x0000a5a000a4149b AS datetime), CAST(0x0000a5bf00a4149b AS datetime), CAST(0x0000a5be00a4149b AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a4149b AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (294, 296, 17, CAST(0x0000a5a000a4b119 AS datetime), CAST(0x0000a5bf00a4b119 AS datetime), CAST(0x0000a5be00a4b119 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a4b119 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (295, 297, 10, CAST(0x0000a5a000a5b612 AS datetime), CAST(0x0000a5bf00a5b612 AS datetime), CAST(0x0000a5be00a5b612 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a5b612 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (296, 298, 10, CAST(0x0000a5a000a64062 AS datetime), CAST(0x0000a5bf00a64062 AS datetime), CAST(0x0000a5be00a64062 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a64062 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (297, 299, 6, CAST(0x0000a5a000a6c882 AS datetime), CAST(0x0000a5bf00a6c882 AS datetime), CAST(0x0000a5be00a6c882 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a6c882 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (298, 300, 6, CAST(0x0000a5a000a7edc0 AS datetime), CAST(0x0000a5bf00a7edc0 AS datetime), CAST(0x0000a5be00a7edc0 AS datetime), CAST ('True' AS bit), CAST(0x0000a5a000a7edc0 AS datetime))

GO
INSERT INTO [dbo].[TblSocioMembresia] ([id_socio_membresia], [id_socio], [id_paquete], [fecha_vinculacion], [fecha_renovacion], [fecha_expiracion], [activo], [fecha_modificacion])
	VALUES (299, 301, 1, CAST(0x0000a5ed01181fd4 AS datetime), CAST(0x0000a5fc01181fd4 AS datetime), CAST(0x0000a5fb01181fd4 AS datetime), CAST ('True' AS bit), CAST(0x0000a5ed01181fd4 AS datetime))

GO
SET IDENTITY_INSERT [dbo].[TblSocioMembresia] OFF
GO

--Table dbo.TblVenta

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblVenta] (
	[id_venta] [int] NOT NULL IDENTITY (1, 1),
	[folio_diario] [int] NOT NULL,
	[fecha] [datetime] NOT NULL CONSTRAINT [DF_TblVenta_fecha] DEFAULT (getdate()),
	[total] [decimal](6, 2) NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblVenta_Modificacion] DEFAULT (getdate()));
GO

--Table dbo.TblVentaProducto

USE [Gym]
GO

--Create table and its columns
CREATE TABLE [dbo].[TblVentaProducto] (
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[costo] [decimal](18, 2) NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL CONSTRAINT [DF_TblVentaProducto_Modificacion] DEFAULT (getdate()),
	[cantidad] [int] NOT NULL);
GO

--Executing Entities
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_registro_visita]
	-- Add the parameters for the stored procedure here
	@id_vigencia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRegistroVisita
	where id_vigencia=@id_vigencia
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_registro_visita]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRegistroVisita
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
	@id_rel int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRelPerfilModulo
	WHERE id_rel=@id_rel
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRelPerfilModulo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_servicio]
	-- Add the parameters for the stored procedure here
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblServicio
	where id_servicio=@id_servicio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_servicio]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblServicio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_socio_membresia]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblSocioMembresia 
	WHERE id_socio=@id_socio AND id_paquete =@id_paquete
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byNumero_ChecadorSocio] --1
	-- Add the parameters for the stored procedure here
	@num_empleado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @id_socio int 
	set @id_socio = ( SELECT [id_socio] FROM TblSocio WHERE num_socio = @num_empleado  ) 

    -- Insert statements for procedure here
	SELECT TOP 1 id_entrada_salida,id_Socio,entrada, salida,activo
		 FROM TblChecadorSocio ch
			 WHERE id_Socio = @id_socio AND (entrada >=  CONVERT (date, GETDATE()) OR entrada <=  CONVERT (date, GETDATE()))
			 ORDER BY id_entrada_salida DESC
END
GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_socio_membresia]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_socio_membresia,
			id_socio,
			id_paquete,
			fecha_vinculacion,
			fecha_renovacion,
			fecha_expiracion,
			activo,
			fecha_modificacion
		 FROM TblSocioMembresia 
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_usuario] 
	-- Add the parameters for the stored procedure here
	@id_usuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT U.[ID_USUARIO]
      ,U.[NOMBRE]
      ,U.[APELLIDO_PAT]
      ,U.[APELLIDO_MAT]
      ,U.[ID_AREA]
      ,U.[USUARIO]
      ,U.[PASSWORD]
      ,U.[ID_PERFIL]
      ,U.[ACTIVO]
      ,U.[CREADO]
      ,U.[CREADOPOR]
      ,U.[ACTUALIZADO]
      ,U.[ACTUALIZADOPOR] 
	  ,P.PERFIL 
		FROM TBL_USUARIOS U
				JOIN TBL_PERFILES AS P ON P.ID_PERFIL = U.id_perfil
	WHERE id_usuario=@id_usuario

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_ChecadorSocio] --1,1,'2016-04-19','2016-04-19',	1
	-- Add the parameters for the stored procedure here
	@id_entrada_salida int,
	@id_socio int,
	@entrada datetime, 
	@salida datetime, 
	@activo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblChecadorSocio SET id_socio=@id_socio,
							 entrada=@entrada,
							 salida=@salida,
							 activo=@activo,
							 fecha_modificacion=getdate()
	WHERE id_entrada_salida=@id_entrada_salida
END
GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_usuario] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT U.[ID_USUARIO]
      ,U.[NOMBRE]
      ,U.[APELLIDO_PAT]
      ,U.[APELLIDO_MAT]
      ,U.[ID_AREA]
      ,U.[USUARIO]
      ,U.[PASSWORD]
      ,U.[ID_PERFIL]
      ,U.[ACTIVO]
      ,U.[CREADO]
      ,U.[CREADOPOR]
      ,U.[ACTUALIZADO]
      ,U.[ACTUALIZADOPOR] 
	  ,P.PERFIL 
		FROM TBL_USUARIOS U
				JOIN TBL_PERFILES AS P ON P.ID_PERFIL = U.id_perfil
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byNumero_Checador] --2
	-- Add the parameters for the stored procedure here
	@num_empleado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @id_empleado int 
	set @id_empleado = ( SELECT [id_empleado] FROM TblEmpleado WHERE num_empleado =  @num_empleado  ) 

    -- Insert statements for procedure here
	SELECT TOP 1 id_entrada_salida,id_empleado,entrada, salida,activo
		 FROM TblChecador ch
			 WHERE id_empleado = @id_empleado AND (entrada >=  CONVERT (date, GETDATE()) OR entrada <=  CONVERT (date, GETDATE()))
			 ORDER BY id_entrada_salida DESC
END
GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_venta]
	-- Add the parameters for the stored procedure here
	@id_venta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblVenta
	WHERE id_venta=@id_venta
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_checadorSocio]
	-- Add the parameters for the stored procedure here
	@id_entrada_salida int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblChecadorSocio
	WHERE id_entrada_salida=@id_entrada_salida
END

GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_venta]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblVenta
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VerificaVisitas] --1
@num_empleado INT

AS
BEGIN
	
	SET NOCOUNT ON;
	Declare @id_socio int 
	set @id_socio = ( SELECT [id_socio] FROM TblSocio WHERE num_socio = @num_empleado  ) 
	Declare @id_paquete int 
	set @id_paquete = (Select id_paquete FROM TblSocioMembresia where id_socio = @id_socio ) 

    -- Insert statements for procedure here
	SELECT CONVERT(int,(Select diaspaquetes FROM TblPaquete where id_paquete= @id_paquete )) -  CONVERT(int,(Select COUNT(*) FROM TblChecadorSocio  WHERE id_socio = @id_socio )) AS DiasRestantes
		
END

--Select  * FROM TblPaquete
--Select * FROM TblSocioMembresia
--Select * FROM TblSocio
GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_checadorSocio]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblChecadorSocio 
	WHERE id_Socio=@id_socio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_venta_producto]
	-- Add the parameters for the stored procedure here
	@id_venta int,
	@id_producto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblVentaProducto
	where ((id_venta=@id_venta)and (id_producto=@id_producto))
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_checadorSocio]
	-- Add the parameters for the stored procedure here
	@num_empleado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @id_socio int 
	set @id_socio = ( SELECT [id_socio] FROM TblSocio WHERE num_socio = @num_empleado  )

    -- Insert statements for procedure here
	INSERT INTO TblChecadorSocio (id_Socio,
							 entrada,
							 salida,
							 fecha_registro,
							 activo,
							 fecha_modificacion
	) VALUES (@id_socio,
			  getdate(),
			  '',
			  getdate(),
			  1,
			  getdate()
	)
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_venta_producto]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblVentaProducto
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_historial_medico]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblHistorialMedico 
	WHERE id_socio=@id_socio
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_socio_membresia_paquete]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 * FROM TblSocioMembresia
		WHERE id_socio = @id_socio
		 ORDER BY id_socio_membresia desc
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_historial_fisico]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblHistorialFisico 
	WHERE id_socio=@id_socio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_Allproducto]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_producto,nombre FROM TblProducto WHERE activo = 1
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_empleado]
	-- Add the parameters for the stored procedure here
	@id_empleado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_empleado],
			e.num_empleado,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.telefono,
			e.direccion,
			e.fecha_registro,
			e.fecha_baja,
			e.activo,
			e.fecha_modificacion,
			e.id_perfil,
			P.PERFIL
				FROM TblEmpleado As E
				JOIN TBL_PERFILES AS P ON P.ID_PERFIL = E.id_perfil
	WHERE id_empleado=@id_empleado

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_checador]
	-- Add the parameters for the stored procedure here
	@id_empleado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblChecador 
	WHERE id_empleado=@id_empleado
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_asignacion]
	-- Add the parameters for the stored procedure here
	@id_asignacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT* FROM TblAsignacion
	WHERE id_asignacion=@id_asignacion

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_usuario] 
	-- Add the parameters for the stored procedure here

	@nombre varchar(100),
	@apellido_pat varchar(100),
	@apellido_mat varchar(100),
	@id_area int,
	@usuario varchar(50),
	@password varchar(50),
	@id_perfil int,
	@creado_por varchar(50),
	@actualizado_por varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into TBL_USUARIOS(NOMBRE, APELLIDO_PAT, APELLIDO_MAT, ID_AREA, USUARIO, PASSWORD, ID_PERFIL, ACTIVO, creado, CREADOPOR, actualizado, actualizadopor) 
	values (@nombre, @apellido_pat, @apellido_mat, @id_area, @usuario, @password, @id_perfil, 1, getdate(), @creado_por, getdate(), @actualizado_por)

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
	@descripcion varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblModulo(DESCRIPCION, activo, fecha_modificacion)
	values (@descripcion, 1, getdate() )
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
	@perfil varchar(50),
	@creado_por varchar(50),
	@actualizado_por varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblPerfil(PERFIL, ACTIVO, creado, creado_por,actualizado_por, actualizado)
	values (@perfil, 1, GETDATE(), @creado_por, @actualizado_por, GETDATE() )
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_asignacion]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int,
	@fecha_asignacion datetime,
	@fecha_vigencia datetime,
	@fecha_cancelacion datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblAsignacion(id_socio, 
							  id_paquete, 
							  fecha_asignacion,
							  fecha_vigencia,
							  activo,
							  fecha_modificacion,
							  fecha_cancelacion
	) VALUES (@id_socio,
			  @id_paquete,
			  @fecha_asignacion,
			  @fecha_vigencia,
			  1,
			  getdate(),
			  @fecha_cancelacion
	)
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_checador]--2
	-- Add the parameters for the stored procedure here
	@num_empleado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @id_empleado int 
	set @id_empleado = ( SELECT [id_empleado] FROM TblEmpleado WHERE num_empleado = @num_empleado  )

    -- Insert statements for procedure here
	INSERT INTO TblChecador (id_empleado,
							 entrada,
							 salida,
							 fecha_registro,
							 activo,
							 fecha_modificacion
	) VALUES (@id_empleado,
			  getdate(),
			  '',
			  getdate(),
			  1,
			  getdate()
	)
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_empleado]
	-- Add the parameters for the stored procedure here
	@num_empleado int,
	@nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50), 
	@telefono varchar(20), 
	@direccion text,
	@id_perfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblEmpleado (num_empleado,
							 nombre,
							 ap_paterno,
							 ap_materno,
							 telefono,
							 direccion,
							 fecha_registro,
							 fecha_baja,
							 activo,
							 fecha_modificacion,
							 id_perfil
	) VALUES (@num_empleado,
			  @nombre,
			  @ap_paterno,
			  @ap_materno,
			  @telefono,
			  @direccion,
			  getdate(),
			  getdate(),--obener algo para calcular una fecha
			  1,
			  getdate(),
			  @id_perfil
	)
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_historial_fisico]
	-- Add the parameters for the stored procedure here
	@id_socio int, 
	@descripcion text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblHistorialFisico (id_socio, descripcion, activo,fecha_modificacion)
	VALUES (@id_socio, @descripcion, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_historial_medico]
	-- Add the parameters for the stored procedure here
	@id_socio int, 
	@descripcion varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblHistorialMedico (id_socio, descripcion, activo,fecha_modificacion)
	VALUES (@id_socio, @descripcion, 1,getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_membresia]
	-- Add the parameters for the stored procedure here
	@nombre varchar (25),
	@descripcion text,
	@costo decimal(5,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblMembresia (nombre, descripcion, costo,activo ,fecha_modificacion)
	VALUES (@nombre, @descripcion, @costo, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ValidaSocio]
@nombre varchar(50),
@ap_paterno varchar(50),
@ap_materno varchar(50)

AS
BEGIN
	
	SET NOCOUNT ON;

	if (Select Count(*) From TblSocio where nombre =@nombre and ap_paterno = @ap_paterno  and ap_materno = @ap_materno )>0
		
BEGIN

RAISERROR('Este Socio ya existe ', 16, 1)
	END
	
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_pago]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_socio int,
	@ID_USUARIO int,
	@importe decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblPago (id_paquete, id_socio, ID_USUARIO, importe, fecha_pago, activo, fecha_modificacion)
	 OUTPUT INSERTED.id_pago
	VALUES(@id_paquete, @id_socio, @ID_USUARIO, @importe, getdate(), 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Valida que no exista un numero de socio igual
-- =============================================
CREATE PROCEDURE [dbo].[ValidaNumSocio] 
@num_socio int

AS
BEGIN
	SET NOCOUNT ON;

	IF( Select COUNT(*) FROM TblSocio  where num_socio = @num_socio)>0

	BEGIN
	RAISERROR('Este Número de Socio no esta disponible  ', 16, 1)
	END
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Checa que el nombre, ap paterno, ap materno no se repitan en la TblEmpleado>
-- =============================================
CREATE PROCEDURE [dbo].[ValidaEmpleado]
    @nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	if (select Count (*) From TblEmpleado WHERE nombre = @nombre and ap_paterno = @ap_paterno and ap_materno = @ap_materno)>0
	BEGIN
	
RAISERROR('Este Emplado ya existe', 16, 1)
	END
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Valida que no exista un numero de empleado igual
-- =============================================
CREATE PROCEDURE [dbo].[ValidaNumEmpleado]
	@num_empleado int
AS
BEGIN
	SET NOCOUNT ON;

	IF( Select COUNT(*) FROM TblEmpleado  where num_empleado = @num_empleado)>0

	BEGIN
	RAISERROR('Este Número de Empleado no esta  disponible  ', 16, 1)
	End
	
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Faleg A. Peralta
-- Create date: 25.09.2015
-- Description:	Valida el Inicio de Session
-- =============================================
CREATE PROCEDURE [dbo].[Usu_Login] --'admin' ,  'admin'
	-- Add the parameters for the stored procedure here
	@usuario varchar(50), 
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM TBL_USUARIOS
		WHERE USUARIO = @usuario AND PASSWORD = @password
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Valida que el Nombre de usuario no exista
-- =============================================
CREATE PROCEDURE [dbo].[ValidaUsuario]
@nombre varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	if (Select Count(*) From TBL_USUARIOS where nombre =@nombre )>0
	BEGIN
	RAISERROR('Este Nombre de Usuario ya existe ', 16, 1)
	END
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_AllSocios]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_socio,Convert(varchar,Num_socio) + ' - ' + nombre + ' ' + ap_paterno As nombre FROM TblSocio WHERE activo = 1
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_pago_recargo]
	-- Add the parameters for the stored procedure here
	@id_pago int,
	@id_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblPagoRecargo (id_pago, id_recargo, activo, fecha_modificacion)
	VALUES (@id_pago, @id_recargo, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_paquete]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@descripcion text,
	@costo decimal(18,2),
	@diasPaquete Int,
	@ID_USUARIO int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--select @costo
    -- Insert statements for procedure here
	INSERT INTO TblPaquete (nombre, descripcion, costo, diaspaquetes, ID_USUARIO, activo, fecha_modificacion)
	VALUES (@nombre, @descripcion, @costo, @diasPaquete, @ID_USUARIO, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_socio]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_socio],
			e.num_socio,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.direccion,
			e.fecha_registro,
			e.fecha_baja,
			e.activo,
			e.fecha_modificacion
				FROM TblSocio As E
END


GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_paquete_servicio]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblPaqueteServicio (id_paquete, id_servicio, activo, fecha_modificacion)
	VALUES (@id_paquete, @id_servicio, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_socio] --1,'1','1','1','1','01/01/1987','1'
	-- Add the parameters for the stored procedure here
	@num_socio int,
	@nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50),
	@telefono varchar(20),
	@fecha_nacimiento datetime,
	@direccion text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Tblsocio (num_socio,
							 nombre,
							 ap_paterno,
							 ap_materno,
							 telefono,
							 direccion,
							 fecha_nacimiento,
							 fecha_registro,
							 fecha_baja,
							 activo,
							 fecha_modificacion
	) OUTPUT INSERTED.id_socio VALUES (@num_socio,
			  @nombre,
			  @ap_paterno,
			  @ap_materno,
			  @telefono,
			  @direccion,
			  @fecha_nacimiento,
			  getdate(),
			  getdate(),--obener algo para calcular una fecha
			  1,
			  getdate()
	)

	--SELECT SCOPE_IDENTITY()
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_producto]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50), 
	@descripcion text,
	@costo decimal(18,2),
	@existencia int,
	@clave varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblProducto (nombre, descripcion, costo, existencia, clave, activo, fecha_modificacion)
	VALUES (@nombre, @descripcion, @costo,@existencia,@clave, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_socio]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Tblsocio 
	WHERE id_socio=@id_socio

END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_recargo]
	-- Add the parameters for the stored procedure here
	
	@id_paquete int,
	@id_socio int,
	@importe decimal (18,2),
	@liberacion bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblRecargo (id_socio, id_paquete, fecha_recargo, importe, liberacion, activo, fecha_modificacion)
	 OUTPUT INSERTED.id_recargo
	VALUES (@id_socio, @id_paquete, GETDATE(), @importe, @liberacion, 1, GETDATE())
						  
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_socio]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_socio],
			e.num_socio,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.telefono,
			e.direccion,
			e.fecha_nacimiento,
			e.fecha_registro,
			e.fecha_baja,
			e.activo,
			e.fecha_modificacion,
			SM.id_paquete,
			sm.fecha_vinculacion,
			sm.fecha_expiracion,
			sm.fecha_renovacion,
			sm.fecha_modificacion
				FROM Tblsocio As E
				join TblSocioMembresia As SM On SM.id_socio = e.id_socio
	WHERE e.id_socio=@id_socio

END


GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_registro_visita]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@dias_vigentes int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblRegistroVisita(id_socio, dias_vigentes, fecha_entrada, activo, fecha_modificacion)
	VALUES(@id_socio, @dias_vigentes, getdate(), 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_Allpaquete]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_paquete,nombre FROM TblPaquete WHERE activo = 1
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_servicio]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@descripcion text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblServicio(nombre, descripcion, activo, fecha_modificacion)
	VALUES(@nombre, @descripcion, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_socio_membresia]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int
AS
BEGIN
	DECLARE @dias int
	set @dias = (SELECT diaspaquetes FROM [dbo].[TblPaquete] WHERE id_paquete =@id_paquete)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblSocioMembresia(id_socio, id_paquete, fecha_vinculacion, fecha_renovacion, fecha_expiracion, activo, fecha_modificacion)
	VALUES(@id_socio, @id_paquete, getdate(), getdate() + @dias + 1, getdate() + @dias, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_venta]
	-- Add the parameters for the stored procedure here
	@folio_diario int,
	@total decimal(18,2),
	@ID_USUARIO int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblVenta(folio_diario,fecha, total, [ID_USUARIO], activo,fecha_modificacion)
	OUTPUT INSERTED.id_venta
	VALUES(@folio_diario, getdate(), @total, @ID_USUARIO, 1, getdate())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_venta_producto]
	-- Add the parameters for the stored procedure here
	@id_venta int, 
	@id_producto int,
	@cantidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblVentaProducto(id_venta, id_producto, costo, cantidad, activo, fecha_modificacion)
	VALUES (@id_venta, @id_producto, 0, @cantidad, 1, GETDATE())
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_asignacion]
	-- Add the parameters for the stored procedure here
	@id_asignacion int,
	@id_socio int,
	@id_paquete int,
	@fecha_vigencia datetime,
	@fecha_cancelacion datetime,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblAsignacion SET id_socio = @id_socio,
							 id_paquete =@id_paquete,
							 fecha_vigencia=@fecha_vigencia,
							 activo=@activo,
							 fecha_modificacion=getdate(),
							 fecha_cancelacion=@fecha_cancelacion
	WHERE id_asignacion=@id_asignacion

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_checador]
	-- Add the parameters for the stored procedure here
	@id_entrada_salida int,
	@id_empleado int,
	@entrada datetime, 
	@salida datetime, 
	@activo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblChecador SET id_empleado=@id_empleado,
							 entrada=@entrada,
							 salida=@salida,
							 activo=@activo,
							 fecha_modificacion=getdate()
	WHERE id_entrada_salida=@id_entrada_salida
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_empleado]
	-- Add the parameters for the stored procedure here
	@id_empleado int,
	@num_empleado int,
	@nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50), 
	@telefono varchar(20), 
	@direccion text,
	@id_perfil int,
	@fecha_baja datetime, 
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblEmpleado SET num_empleado=@num_empleado,
							 nombre=@nombre,
							 ap_paterno=@ap_paterno,
							 ap_materno=@ap_materno,
							 telefono=@telefono , 
							 direccion=@direccion,
							 id_perfil=@id_perfil,
							 fecha_baja =@fecha_baja,
							 activo= @activo,
							 fecha_modificacion= getdate()
	WHERE id_empleado=@id_empleado

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_historial_fisico]
	-- Add the parameters for the stored procedure here
	@id_socio int, 
	@descripcion text,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblHistorialFisico SET  descripcion=@descripcion, 
								  activo=@activo, 
								  fecha_modificacion=getdate()
	WHERE id_socio=@id_socio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_historial_medico]
	-- Add the parameters for the stored procedure here
	@id_socio int, 
	@descripcion varchar(50),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblHistorialMedico set descripcion=@descripcion, 
								  activo=@activo, 
								  fecha_modificacion=getdate()
	WHERE id_socio=@id_socio
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_membresia]
	-- Add the parameters for the stored procedure here
	@id_membresia int,
	@nombre varchar (25),
	@descripcion text,
	@costo decimal(5,2),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblMembresia SET nombre=@nombre, descripcion=@descripcion, costo=@costo, activo=@activo, fecha_modificacion=getdate()
	WHERE id_membresia=@id_membresia
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
	@id_perfil int, 
	@id_modulo int,
	@control_total bit,
	@activo bit,
	@creado_por varchar (50),
	@actualizado_por varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblRelPerfilModulo(id_perfil, id_modulo, control_total, activo, creado, creado_por, actualizado, actualizado_por)
	VALUES(@id_perfil, @id_modulo, @control_total, @activo, GETDATE(),@creado_por, GETDATE(), @actualizado_por)
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
	@id_modulo int,
	@descripcion varchar(50),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblModulo SET DESCRIPCION=@descripcion, 
						 activo=@activo, 
						 fecha_modificacion=getdate()
	WHERE id_modulo=@id_modulo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_pago]
	-- Add the parameters for the stored procedure here
	@id_pago int,
	@id_paquete int,
	@id_socio int,
	@ID_USUARIO int,
	@importe decimal(18,2),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPago SET id_paquete=@id_paquete, 
					   id_socio=@id_socio, 
					   ID_USUARIO=@ID_USUARIO, 
					   importe=@importe, 
					   fecha_pago=GETDATE(), 
					   activo= @activo, 
					   fecha_modificacion=getdate()
	WHERE id_pago=@id_pago
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_pago_recargo]
	-- Add the parameters for the stored procedure here
	@id_pago_recargo int,
	@id_pago int,
	@id_recargo int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPagoRecargo SET id_pago=@id_pago, 
							  id_recargo = @id_recargo, 
							  activo=@activo, 
							  fecha_modificacion=getdate()
	WHERE id_pago_recargo=@id_pago_recargo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_paquete]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@nombre varchar(50),
	@descripcion text,
	@costo decimal(18,2),
	@diasPaquete int,
	@ID_USUARIO int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPaquete SET nombre=@nombre, 
						  descripcion=@descripcion, 
						  costo=@costo, 
						  diaspaquetes=@diasPaquete,
						  ID_USUARIO=@ID_USUARIO, 
						  activo=@activo, 
						  fecha_modificacion=getdate()
	where id_paquete=@id_paquete
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_paquete_servicio]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_servicio int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPaqueteServicio SET id_paquete=@id_paquete, 
								  id_servicio=@id_servicio, 
								  activo=@activo, 
								  fecha_modificacion=getdate()
	where ((id_paquete=@id_paquete)and (id_servicio=@id_servicio))
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
	@id_perfil int,
	@perfil varchar(50),
	@activo bit,
	@actualizado_por varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPerfil SET PERFIL=@perfil, 
						 ACTIVO=@activo, 
						 actualizado_por=@actualizado_por,
						 actualizado=getdate()
	WHERE id_perfil=@id_perfil
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
	@id_rel int,
	@id_perfil int, 
	@id_modulo int,
	@control_total bit,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblRelPerfilModulo SET id_perfil=@id_perfil, 
								  id_modulo=@id_modulo, 
								  control_total=@control_total, 
								  activo=@activo, 
								  actualizado=GETDATE()
	WHERE id_rel=@id_rel
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_producto]
	-- Add the parameters for the stored procedure here
	@id_producto int,
	@nombre varchar(50), 
	@descripcion text,
	@costo decimal(18,2),
	@existencia int,
	@clave varchar(10),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblProducto SET nombre=@nombre, 
						   descripcion=@descripcion, 
						   costo=@costo, 
						   existencia=@existencia,
						   clave=@clave,
						   activo=@activo, 
						   fecha_modificacion=getdate()
	WHERE id_producto=@id_producto
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_recargo]
	-- Add the parameters for the stored procedure here
	@id_recargo int,	
	@id_paquete int,
	@id_socio int,
	@fecha_recargo datetime,
	@importe decimal (18,2),
	@liberacion bit,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblRecargo SET id_socio=@id_socio, 
						  id_paquete=@id_paquete, 
						  fecha_recargo=@fecha_recargo, 
						  importe=@importe, 
						  liberacion=@liberacion, 
						  activo=@activo, 
						  fecha_modificacion=getdate()
	WHERE id_recargo=@id_recargo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_registro_visita]
	-- Add the parameters for the stored procedure here
	@id_vigencia int,
	@id_socio int,
	@dias_vigentes int,
	@fecha_entrada datetime,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblRegistroVisita SET id_socio=@id_socio, 
								 dias_vigentes=@dias_vigentes, 
								 fecha_entrada=@fecha_entrada, 
								 activo=@activo, 
								 fecha_modificacion=getdate()
	where id_vigencia=@id_vigencia
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_servicio]
	-- Add the parameters for the stored procedure here
	@id_servicio int,
	@nombre varchar(50),
	@descripcion text,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblServicio SET nombre=@nombre, 
						   descripcion=@descripcion, 
						   activo=@activo, 
						   fecha_modificacion=getdate()
	where id_servicio=@id_servicio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_socio_membresia]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @dias int, @fechaRenovacion datetime
	set @dias = (SELECT diaspaquetes FROM [dbo].[TblPaquete] WHERE id_paquete =@id_paquete)
	set @fechaRenovacion = (SELECT fecha_vinculacion FROM [dbo].[TblSocioMembresia] WHERE id_socio=@id_socio AND id_paquete =@id_paquete)
    -- Insert statements for procedure here
UPDATE TblSocioMembresia SET id_socio=@id_socio, 
								fecha_renovacion=@fechaRenovacion + @dias + 1, 
								fecha_expiracion=@fechaRenovacion + @dias , 
								 activo=@activo, 
								 fecha_modificacion=getdate()
	WHERE id_socio=@id_socio AND id_paquete =@id_paquete
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_usuario] 
	-- Add the parameters for the stored procedure here
	@id_usuario int,
	@nombre varchar(100),
	@apellido_pat varchar(100),
	@apellido_mat varchar(100),
	@id_area int,
	@usuario varchar(50),
	@password varchar(50),
	@id_perfil int,
	@activo bit,
	@actualizado_por varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TBL_USUARIOS SET NOMBRE=@nombre, 
						  APELLIDO_PAT=@apellido_pat, 
						  APELLIDO_MAT=@apellido_mat, 
						  ID_AREA=@id_area, 
						  USUARIO=@usuario, 
						  PASSWORD=@password, 
						  ID_PERFIL=@id_perfil, 
						  ACTIVO=@activo, 
						  actualizado=getdate(),
						  actualizadopor=@actualizado_por
	WHERE id_usuario=@id_usuario

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_venta]
	-- Add the parameters for the stored procedure here
	@id_venta int,
	@folio_diario int,
	@fecha datetime,
	@total decimal(18,2),
	@ID_USUARIO int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblVenta SET folio_diario=@folio_diario,
						fecha=@fecha, 
						total=@total, 
						ID_USUARIO=@ID_USUARIO, 
						activo=@activo,
						fecha_modificacion=getdate()
	WHERE id_venta=@id_venta
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_venta_producto]
	-- Add the parameters for the stored procedure here
	@id_venta int, 
	@id_producto int,
	@costo decimal(18,2),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblVentaProducto SET id_venta=@id_venta, 
								id_producto=@id_producto, 
								costo=@costo, 
								activo=@activo, 
								fecha_modificacion=GETDATE()
	where ((id_venta=@id_venta)and (id_producto=@id_producto))
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_asignacion]
	-- Add the parameters for the stored procedure here
	@id_asignacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	DELETE FROM TblAsignacion
	WHERE id_asignacion=@id_asignacion

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_checador]
	-- Add the parameters for the stored procedure here
	@id_entrada_salida int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblChecador 
	WHERE id_entrada_salida=@id_entrada_salida
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_empleado]
	-- Add the parameters for the stored procedure here
	@id_empleado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblEmpleado 
	WHERE id_empleado=@id_empleado

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_historial_fisico]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblHistorialFisico 
	WHERE id_socio=@id_socio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_historial_medico]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblHistorialMedico 
	WHERE id_socio=@id_socio
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_membresia]
	-- Add the parameters for the stored procedure here
	@id_membresia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblMembresia
	WHERE id_membresia=@id_membresia
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
	@id_modulo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblModulo 
	WHERE id_modulo=@id_modulo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_pago]
	-- Add the parameters for the stored procedure here
	@id_pago int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPago
	WHERE id_pago=@id_pago
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_pago_recargo]
	-- Add the parameters for the stored procedure here
	@id_pago_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPagoRecargo
	WHERE id_pago_recargo=@id_pago_recargo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_paquete]
	-- Add the parameters for the stored procedure here
	@id_paquete int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPaquete
	where id_paquete=@id_paquete
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_paquete_servicio]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPaqueteServicio
	where ((id_paquete=@id_paquete)and (id_servicio=@id_servicio))
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
	@id_perfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPerfil 
	WHERE id_perfil=@id_perfil
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_producto]
	-- Add the parameters for the stored procedure here
	@id_producto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblProducto
	WHERE id_producto=@id_producto
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_recargo]
	-- Add the parameters for the stored procedure here
	@id_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblRecargo
	WHERE id_recargo=@id_recargo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_registro_visita]
	-- Add the parameters for the stored procedure here
	@id_vigencia int,
	@id_socio int,
	@dias_vigentes int,
	@fecha_entrada datetime,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblRegistroVisita
	where id_vigencia=@id_vigencia
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
	@id_rel int,
	@id_perfil int, 
	@id_modulo int,
	@control_total bit,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblRelPerfilModulo
	WHERE id_rel=@id_rel
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_servicio]
	-- Add the parameters for the stored procedure here
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblServicio
	where id_servicio=@id_servicio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_socio_membresia]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblSocioMembresia 
	WHERE id_socio=@id_socio AND id_paquete =@id_paquete
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_usuario] 
	-- Add the parameters for the stored procedure here
	@id_usuario int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblUsuario
	WHERE id_usuario=@id_usuario

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_venta]
	-- Add the parameters for the stored procedure here
	@id_venta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblVenta
	WHERE id_venta=@id_venta
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_venta_producto]
	-- Add the parameters for the stored procedure here
	@id_venta int,
	@id_producto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblVentaProducto
	where ((id_venta=@id_venta)and (id_producto=@id_producto))
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_asignacion]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT* FROM TblAsignacion

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_checador]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblChecador 
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_empleado]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_empleado],
			e.num_empleado,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.direccion,
			e.fecha_registro,
			e.fecha_baja,
			e.activo,
			e.fecha_modificacion,
			e.id_perfil,
			P.Perfil,
			e.telefono
				FROM TblEmpleado As E
				JOIN TBL_PERFILES AS P ON P.ID_PERFIL = E.id_perfil
				Order by e.num_empleado
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_historial_fisico]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblHistorialFisico 
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_historial_medico]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblHistorialMedico 
END



GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_membresia]
	-- Add the parameters for the stored procedure here
	@id_membresia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblMembresia
	WHERE id_membresia=@id_membresia
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_membresia]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblMembresia
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
	@id_modulo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblModulo 
	WHERE id_modulo=@id_modulo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblModulo 
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_pago]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.id_pago as id_pago,
			p.id_paquete as id_paquete,
			p.id_socio  as id_socio,
			p.ID_USUARIO as ID_USUARIO,
			p.importe AS TotalRecibido,
			pa.costo As TotalPagar,
			sm.fecha_expiracion AS fecha_expiracion,
			r.importe as Adeudos
	 FROM TblPago p
		join TblPaquete pa on pa.id_paquete = p.id_paquete
		join TBL_USUARIOS U on U.ID_USUARIO = p.ID_USUARIO
		join TblPagoRecargo pr on pr.id_pago =p.id_pago
		join TblRecargo r on r.id_recargo = pr.id_recargo
		join TblSocioMembresia As SM On SM.id_socio = p.id_socio
	WHERE p.id_pago=@id_socio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_pago]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.id_pago as id_pago,
		p.id_socio as id_socio,
		s.nombre + ' ' +s.ap_paterno AS Socio,
		p.ID_USUARIO as ID_USUARIO,
		u.NOMBRE + ' ' + u.APELLIDO_PAT Registro_Pago,
		p.id_paquete as id_paquete,
		pa.descripcion paquete,
		p.importe as importe,
		p.activo as activo
	FROM TblPago p
	join TblSocio s on p.id_socio = s.id_socio
	join TblPaquete pa on pa.id_paquete = p.id_paquete
	join TBL_USUARIOS U on U.ID_USUARIO = p.ID_USUARIO
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_pago_recargo]
	-- Add the parameters for the stored procedure here
	@id_pago_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPagoRecargo
	WHERE id_pago_recargo=@id_pago_recargo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_pago_recargo]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPagoRecargo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_paquete]
	-- Add the parameters for the stored procedure here
	@id_paquete int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPaquete
	where id_paquete=@id_paquete
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_paquete]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPaquete
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_paquete_servicio]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPaqueteServicio
	where ((id_paquete=@id_paquete)and (id_servicio=@id_servicio))
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_paquete_servicio]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPaqueteServicio
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
	@id_perfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPerfil 
	WHERE id_perfil=@id_perfil
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID_PERFIL,PERFIL FROM TBL_PERFILES 
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_producto]
	-- Add the parameters for the stored procedure here
	@id_producto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblProducto
	WHERE id_producto=@id_producto
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_producto]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblProducto
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_socio] 
	-- Add the parameters for the stored procedure here
	@id_socio  int,
	@num_socio int,
	@nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50),
	@telefono varchar(20),
	@fecha_nacimiento datetime,
	@direccion text,
	@activo int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Tblsocio SET num_socio=@num_socio, 
						  nombre=@nombre, 
						  ap_paterno=@ap_paterno, 
						  ap_materno=@ap_materno, 
						  telefono=@telefono, 
						  direccion=@direccion, 
						  fecha_nacimiento=@fecha_nacimiento, 
						  fecha_baja=getdate(),
						  activo=@activo, 
						  fecha_modificacion= getdate()
	WHERE id_socio=@id_socio

END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_recargo]
	-- Add the parameters for the stored procedure here
	@id_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRecargo
	WHERE id_recargo=@id_recargo
END




GO

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_recargo]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRecargo
END




GO

GO

--Indexes of table dbo.TBL_MODULOS
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TBL_MODULOS] ADD CONSTRAINT [PK_TC_MODULOS] PRIMARY KEY CLUSTERED ([ID_MODULO]) 
GO

--Indexes of table dbo.TBL_PERFILES
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TBL_PERFILES] ADD CONSTRAINT [PK_TBL_PERFILES] PRIMARY KEY CLUSTERED ([ID_PERFIL]) 
GO

--Indexes of table dbo.TBL_REL_PERFIL_MODULO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] ADD CONSTRAINT [PK_TBL_REL_PERFIL_MODULO] PRIMARY KEY CLUSTERED ([ID_REL]) 
GO

--Indexes of table dbo.TBL_USUARIOS
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TBL_USUARIOS] ADD CONSTRAINT [PK_TBL_USUARIOS] PRIMARY KEY CLUSTERED ([ID_USUARIO]) 
GO

--Indexes of table dbo.TblAsignacion
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblAsignacion] ADD CONSTRAINT [PK__TblAsign__C3F7F9662DC3BF0D] PRIMARY KEY CLUSTERED ([id_asignacion]) 
GO

--Indexes of table dbo.TblChecador
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblChecador] ADD CONSTRAINT [PK__TblCheca__F23389AE571DA169] PRIMARY KEY CLUSTERED ([id_entrada_salida]) 
GO

--Indexes of table dbo.TblChecadorSocio
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblChecadorSocio] ADD CONSTRAINT [PK__TblChecaSocio__F23389AE571DA169] PRIMARY KEY CLUSTERED ([id_entrada_salida]) 
GO

--Indexes of table dbo.TblEmpleado
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblEmpleado] ADD CONSTRAINT [PK__TblEmple__88B513945010C962] PRIMARY KEY CLUSTERED ([id_empleado]) 
GO

CREATE UNIQUE NONCLUSTERED INDEX [uniqueEmpleado] ON [dbo].[TblEmpleado]  ([num_empleado]) WITH IGNORE_DUP_KEY
GO

--Indexes of table dbo.TblHistorialFisico
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblHistorialFisico] ADD CONSTRAINT [PK__TblHisto__5432EB6090D1B0A4] PRIMARY KEY CLUSTERED ([id_historial_fisico]) 
GO

--Indexes of table dbo.TblHistorialMedico
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblHistorialMedico] ADD CONSTRAINT [PK__TblHisto__FA1C62073B3AB819] PRIMARY KEY CLUSTERED ([id_historial_medico]) 
GO

--Indexes of table dbo.TblMembresia
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblMembresia] ADD CONSTRAINT [PK__TblMembr__2EB820E13410AED2] PRIMARY KEY CLUSTERED ([id_membresia]) 
GO

--Indexes of table dbo.TblPago
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblPago] ADD CONSTRAINT [PK__TblPago__0941B074FFF048B6] PRIMARY KEY CLUSTERED ([id_pago]) 
GO

--Indexes of table dbo.TblPagoRecargo
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblPagoRecargo] ADD CONSTRAINT [PK__TblPagoR__3607D45F38BD622A] PRIMARY KEY CLUSTERED ([id_pago_recargo]) 
GO

--Indexes of table dbo.TblPaquete
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblPaquete] ADD CONSTRAINT [PK__paquete__609C3BCB912CD0D5] PRIMARY KEY CLUSTERED ([id_paquete]) 
GO

--Indexes of table dbo.TblPaqueteServicio
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblPaqueteServicio] ADD CONSTRAINT [PK__TblPaque__B6613C3699942D56] PRIMARY KEY CLUSTERED ([id_paquete], [id_servicio]) 
GO

--Indexes of table dbo.TblProducto
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblProducto] ADD CONSTRAINT [PK__TblProdu__FF341C0D2265516E] PRIMARY KEY CLUSTERED ([id_producto]) 
GO

--Indexes of table dbo.TblRecargo
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblRecargo] ADD CONSTRAINT [PK__TblRecar__EAE53A7DEABF2A96] PRIMARY KEY CLUSTERED ([id_recargo]) 
GO

--Indexes of table dbo.TblRegistroVisita
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblRegistroVisita] ADD CONSTRAINT [PK__TblVigen__4F6EB5DCE75BC47F] PRIMARY KEY CLUSTERED ([id_vigencia]) 
GO

--Indexes of table dbo.TblServicio
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblServicio] ADD CONSTRAINT [PK__servicio__6FD07FDCE96A2E25] PRIMARY KEY CLUSTERED ([id_servicio]) 
GO

--Indexes of table dbo.TblSocio
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblSocio] ADD CONSTRAINT [PK_TblSocio] PRIMARY KEY CLUSTERED ([id_socio]) 
GO

--Indexes of table dbo.TblSocioMembresia
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblSocioMembresia] ADD CONSTRAINT [PK__TblSocio__1FBBEA743AF98D43] PRIMARY KEY CLUSTERED ([id_socio_membresia]) 
GO

--Indexes of table dbo.TblVenta
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblVenta] ADD CONSTRAINT [PK__TblVenta__459533BF8BA2C101] PRIMARY KEY CLUSTERED ([id_venta]) 
GO

--Indexes of table dbo.TblVentaProducto
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[TblVentaProducto] ADD CONSTRAINT [PK__TblVenta__8A66727F67B3C720] PRIMARY KEY CLUSTERED ([id_venta], [id_producto]) 
GO

--Foreign Keys

USE [Gym]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] WITH CHECK ADD CONSTRAINT [FK_TBL_REL_PERFIL_MODULO_TC_MODULOS] 
	FOREIGN KEY ([ID_MODULO]) REFERENCES [dbo].[TBL_MODULOS] ([ID_MODULO])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] CHECK CONSTRAINT [FK_TBL_REL_PERFIL_MODULO_TC_MODULOS]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] WITH CHECK ADD CONSTRAINT [FK_TBL_REL_PERFIL_MODULO_TBL_PERFILES] 
	FOREIGN KEY ([ID_PERFIL]) REFERENCES [dbo].[TBL_PERFILES] ([ID_PERFIL])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] CHECK CONSTRAINT [FK_TBL_REL_PERFIL_MODULO_TBL_PERFILES]
GO
ALTER TABLE [dbo].[TBL_USUARIOS] WITH NOCHECK ADD CONSTRAINT [FK_TBL_USUARIOS_TBL_PERFILES] 
	FOREIGN KEY ([ID_PERFIL]) REFERENCES [dbo].[TBL_PERFILES] ([ID_PERFIL])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
	NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[TBL_USUARIOS] CHECK CONSTRAINT [FK_TBL_USUARIOS_TBL_PERFILES]
GO
ALTER TABLE [dbo].[TblAsignacion] WITH CHECK ADD CONSTRAINT [FK__TblAsigna__id_pa__6B24EA82] 
	FOREIGN KEY ([id_paquete]) REFERENCES [dbo].[TblPaquete] ([id_paquete])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblAsignacion] CHECK CONSTRAINT [FK__TblAsigna__id_pa__6B24EA82]
GO
ALTER TABLE [dbo].[TblChecador] WITH CHECK ADD CONSTRAINT [FK_TblChecador_TblEmpleado] 
	FOREIGN KEY ([id_empleado]) REFERENCES [dbo].[TblEmpleado] ([id_empleado])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblChecador] CHECK CONSTRAINT [FK_TblChecador_TblEmpleado]
GO
ALTER TABLE [dbo].[TblChecadorSocio] WITH CHECK ADD CONSTRAINT [FK_TblChecador_TblSocio] 
	FOREIGN KEY ([id_socio]) REFERENCES [dbo].[TblSocio] ([id_socio])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblChecadorSocio] CHECK CONSTRAINT [FK_TblChecador_TblSocio]
GO
ALTER TABLE [dbo].[TblHistorialFisico] WITH CHECK ADD CONSTRAINT [FK_TblHistorialFisico_TblSocio] 
	FOREIGN KEY ([id_socio]) REFERENCES [dbo].[TblSocio] ([id_socio])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblHistorialFisico] CHECK CONSTRAINT [FK_TblHistorialFisico_TblSocio]
GO
ALTER TABLE [dbo].[TblHistorialMedico] WITH CHECK ADD CONSTRAINT [FK_TblHistorialMedico_TblSocio] 
	FOREIGN KEY ([id_socio]) REFERENCES [dbo].[TblSocio] ([id_socio])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblHistorialMedico] CHECK CONSTRAINT [FK_TblHistorialMedico_TblSocio]
GO
ALTER TABLE [dbo].[TblPago] WITH CHECK ADD CONSTRAINT [FK__TblPago__id_empl__75A278F5] 
	FOREIGN KEY ([ID_USUARIO]) REFERENCES [dbo].[TBL_USUARIOS] ([ID_USUARIO])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblPago] CHECK CONSTRAINT [FK__TblPago__id_empl__75A278F5]
GO
ALTER TABLE [dbo].[TblPago] WITH CHECK ADD CONSTRAINT [FK__TblPago__id_paqu__6FE99F9F] 
	FOREIGN KEY ([id_paquete]) REFERENCES [dbo].[TblPaquete] ([id_paquete])
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblPago] CHECK CONSTRAINT [FK__TblPago__id_paqu__6FE99F9F]
GO
ALTER TABLE [dbo].[TblPago] WITH CHECK ADD CONSTRAINT [FK_TblPago_TblSocio] 
	FOREIGN KEY ([id_socio]) REFERENCES [dbo].[TblSocio] ([id_socio])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblPago] CHECK CONSTRAINT [FK_TblPago_TblSocio]
GO
ALTER TABLE [dbo].[TblPagoRecargo] WITH CHECK ADD CONSTRAINT [FK_TblPagoRecargo_TblPago] 
	FOREIGN KEY ([id_pago]) REFERENCES [dbo].[TblPago] ([id_pago])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblPagoRecargo] CHECK CONSTRAINT [FK_TblPagoRecargo_TblPago]
GO
ALTER TABLE [dbo].[TblPagoRecargo] WITH CHECK ADD CONSTRAINT [FK__TblPagoRe__id_re__797309D9] 
	FOREIGN KEY ([id_recargo]) REFERENCES [dbo].[TblRecargo] ([id_recargo])
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblPagoRecargo] CHECK CONSTRAINT [FK__TblPagoRe__id_re__797309D9]
GO
ALTER TABLE [dbo].[TblPaquete] WITH CHECK ADD CONSTRAINT [FK__TblPaquet__id_em__5441852A] 
	FOREIGN KEY ([ID_USUARIO]) REFERENCES [dbo].[TBL_USUARIOS] ([ID_USUARIO])
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblPaquete] CHECK CONSTRAINT [FK__TblPaquet__id_em__5441852A]
GO
ALTER TABLE [dbo].[TblPaqueteServicio] WITH CHECK ADD CONSTRAINT [FK__TblPaquet__id_pa__164452B1] 
	FOREIGN KEY ([id_paquete]) REFERENCES [dbo].[TblPaquete] ([id_paquete])
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblPaqueteServicio] CHECK CONSTRAINT [FK__TblPaquet__id_pa__164452B1]
GO
ALTER TABLE [dbo].[TblPaqueteServicio] WITH CHECK ADD CONSTRAINT [FK__TblPaquet__id_se__173876EA] 
	FOREIGN KEY ([id_servicio]) REFERENCES [dbo].[TblServicio] ([id_servicio])
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblPaqueteServicio] CHECK CONSTRAINT [FK__TblPaquet__id_se__173876EA]
GO
ALTER TABLE [dbo].[TblSocioMembresia] WITH CHECK ADD CONSTRAINT [FK_TblSocioMembresia_TblPaquete] 
	FOREIGN KEY ([id_paquete]) REFERENCES [dbo].[TblPaquete] ([id_paquete])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblSocioMembresia] CHECK CONSTRAINT [FK_TblSocioMembresia_TblPaquete]
GO
ALTER TABLE [dbo].[TblSocioMembresia] WITH CHECK ADD CONSTRAINT [FK_TblSocioMembresia_TblSocio] 
	FOREIGN KEY ([id_socio]) REFERENCES [dbo].[TblSocio] ([id_socio])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblSocioMembresia] CHECK CONSTRAINT [FK_TblSocioMembresia_TblSocio]
GO
ALTER TABLE [dbo].[TblVenta] WITH CHECK ADD CONSTRAINT [FK__TblVenta__id_emp__5165187F] 
	FOREIGN KEY ([ID_USUARIO]) REFERENCES [dbo].[TBL_USUARIOS] ([ID_USUARIO])
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblVenta] CHECK CONSTRAINT [FK__TblVenta__id_emp__5165187F]
GO
ALTER TABLE [dbo].[TblVentaProducto] WITH CHECK ADD CONSTRAINT [FK__TblVentaP__id_pr__22AA2996] 
	FOREIGN KEY ([id_producto]) REFERENCES [dbo].[TblProducto] ([id_producto])
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblVentaProducto] CHECK CONSTRAINT [FK__TblVentaP__id_pr__22AA2996]
GO
ALTER TABLE [dbo].[TblVentaProducto] WITH CHECK ADD CONSTRAINT [FK__TblVentaP__id_ve__21B6055D] 
	FOREIGN KEY ([id_venta]) REFERENCES [dbo].[TblVenta] ([id_venta])
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
ALTER TABLE [dbo].[TblVentaProducto] CHECK CONSTRAINT [FK__TblVentaP__id_ve__21B6055D]
GO
