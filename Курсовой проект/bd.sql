USE [RCD-actual]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20.06.2022 12:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id_Order] [int] IDENTITY(1,1) NOT NULL,
	[Where1] [nvarchar](max) NOT NULL,
	[Where2] [nvarchar](max) NOT NULL,
	[What] [nvarchar](max) NOT NULL,
	[TypeDil] [int] NOT NULL,
	[TypePay] [int] NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_pay]    Script Date: 20.06.2022 12:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_pay](
	[id_td] [int] IDENTITY(1,1) NOT NULL,
	[NameTD] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Type_pay] PRIMARY KEY CLUSTERED 
(
	[id_td] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeDelivery]    Script Date: 20.06.2022 12:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeDelivery](
	[id_typed] [int] IDENTITY(1,1) NOT NULL,
	[Name_d] [nvarchar](max) NOT NULL,
	[cost_d] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TypeDelivery] PRIMARY KEY CLUSTERED 
(
	[id_typed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Userss]    Script Date: 20.06.2022 12:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Userss](
	[Id_user] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[SecondName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Userss] PRIMARY KEY CLUSTERED 
(
	[Id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Type_pay] FOREIGN KEY([TypePay])
REFERENCES [dbo].[Type_pay] ([id_td])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Type_pay]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TypeDelivery] FOREIGN KEY([TypeDil])
REFERENCES [dbo].[TypeDelivery] ([id_typed])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TypeDelivery]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Userss] FOREIGN KEY([id_user])
REFERENCES [dbo].[Userss] ([Id_user])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Userss]
GO
