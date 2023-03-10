USE [project_backup]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/8/2022 9:37:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/8/2022 9:37:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/8/2022 9:37:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](25) NULL,
	[phoneNumber] [nvarchar](25) NULL,
	[address] [nvarchar](25) NULL,
	[aid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/8/2022 9:37:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[cus_id] [int] NULL,
	[totalmoney] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/8/2022 9:37:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[oid] [int] NULL,
	[pid] [int] NULL,
	[quantity] [int] NULL,
	[price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/8/2022 9:37:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pname] [nvarchar](100) NOT NULL,
	[price] [money] NULL,
	[quantity] [int] NOT NULL,
	[describe] [nvarchar](100) NULL,
	[images] [varchar](100) NULL,
	[detail] [nvarchar](1000) NULL,
	[cid] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([aid], [Username], [Password], [role]) VALUES (1, N'sa', N'123', 1)
INSERT [dbo].[Account] ([aid], [Username], [Password], [role]) VALUES (14, N'abc', N'123', 0)
INSERT [dbo].[Account] ([aid], [Username], [Password], [role]) VALUES (15, N'phantu', N'123', 0)
INSERT [dbo].[Account] ([aid], [Username], [Password], [role]) VALUES (16, N'ledung', N'123', 0)
INSERT [dbo].[Account] ([aid], [Username], [Password], [role]) VALUES (17, N'quangtruong', N'123', 0)
INSERT [dbo].[Account] ([aid], [Username], [Password], [role]) VALUES (20, N'maigiang', N'123', 0)
INSERT [dbo].[Account] ([aid], [Username], [Password], [role]) VALUES (21, N'tuanlinh', N'123', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [name]) VALUES (1, N'BIKE')
INSERT [dbo].[Category] ([cid], [name]) VALUES (2, N'WHEEL')
INSERT [dbo].[Category] ([cid], [name]) VALUES (3, N'HANDLEBARS')
INSERT [dbo].[Category] ([cid], [name]) VALUES (4, N'SADDLES')
INSERT [dbo].[Category] ([cid], [name]) VALUES (5, N'BIKE CARE')
INSERT [dbo].[Category] ([cid], [name]) VALUES (6, N'APPAREL')
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [name], [phoneNumber], [address], [aid]) VALUES (1, N'PHAN TU ', N'0123456789', N'FPT', 15)
INSERT [dbo].[Customer] ([id], [name], [phoneNumber], [address], [aid]) VALUES (4, N'Mai Giang', N'123445768', N'ABSDGSDGS', 20)
INSERT [dbo].[Customer] ([id], [name], [phoneNumber], [address], [aid]) VALUES (5, N'Tuan linh', N'12423562', N'nha', 21)
INSERT [dbo].[Customer] ([id], [name], [phoneNumber], [address], [aid]) VALUES (6, N'SA', N'123456678', N'SA', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (1, CAST(N'2022-11-02' AS Date), 1, 4550.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (2, CAST(N'2022-11-02' AS Date), 1, 4550.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (3, CAST(N'2022-11-02' AS Date), 1, 44.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (4, CAST(N'2022-11-02' AS Date), 1, 44.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (5, CAST(N'2022-11-02' AS Date), 1, 122.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (6, CAST(N'2022-11-02' AS Date), 1, 122.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (7, CAST(N'2022-11-02' AS Date), 1, 6153.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (8, CAST(N'2022-11-02' AS Date), 1, 6153.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (9, CAST(N'2022-11-02' AS Date), 1, 2900.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (10, CAST(N'2022-11-02' AS Date), 1, 6000.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (11, CAST(N'2022-11-02' AS Date), 1, 4000.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (16, CAST(N'2022-11-03' AS Date), 1, 2000.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (17, CAST(N'2022-11-07' AS Date), 1, 2000.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (18, CAST(N'2022-11-07' AS Date), 1, 21.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (19, CAST(N'2022-11-07' AS Date), 1, 45.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (20, CAST(N'2022-11-07' AS Date), 1, 4800.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (21, CAST(N'2022-11-07' AS Date), 1, 176.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (22, CAST(N'2022-11-07' AS Date), 1, 2600.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (23, CAST(N'2022-11-07' AS Date), 1, 14400.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (24, CAST(N'2022-11-07' AS Date), 1, 10400.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (25, CAST(N'2022-11-07' AS Date), 1, 539.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (26, CAST(N'2022-11-07' AS Date), 1, 340.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (27, CAST(N'2022-11-08' AS Date), 1, 35000.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (28, CAST(N'2022-11-08' AS Date), 1, 45.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (29, CAST(N'2022-11-08' AS Date), 1, 44.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (30, CAST(N'2022-11-08' AS Date), 1, 51.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (31, CAST(N'2022-11-08' AS Date), 1, 2000.0000)
INSERT [dbo].[Order] ([id], [date], [cus_id], [totalmoney]) VALUES (32, CAST(N'2022-11-08' AS Date), 1, 20000.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (1, 2, 1, 2500.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (1, 20, 1, 50.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (1, 5, 1, 2000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (2, 2, 1, 2500.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (2, 20, 1, 50.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (2, 5, 1, 2000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (3, 26, 1, 44.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (4, 26, 1, 44.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (5, 35, 1, 21.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (7, 41, 3, 51.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (7, 5, 3, 2000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (8, 41, 3, 51.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (8, 5, 3, 2000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (10, 6, 2, 3000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (11, 11, 1, 4000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (9, 14, 10, 29000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (16, 1, 1, 2000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (17, 5, 1, 2000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (18, 36, 1, 21.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (19, 33, 1, 45.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (20, 50, 1, 4800.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (23, 52, 6, 2400.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (25, 22, 11, 49.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (27, 16, 10, 3500.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (29, 26, 1, 44.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (30, 41, 1, 51.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (32, 44, 5, 4000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (5, 33, 1, 45.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (5, 43, 1, 56.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (6, 35, 1, 21.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (6, 33, 1, 45.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (6, 43, 1, 56.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (9, 13, 1, 2900.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (21, 26, 4, 44.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (24, 55, 4, 2600.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (26, 34, 17, 20.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (31, 1, 1, 2000.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (22, 55, 1, 2600.0000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (28, 33, 1, 45.0000)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (1, N'DOGMA F DURA ACE Di2', 2000.0000, 8, N'The Art of Balance', N'img/dura_ace_i2.png', N'Seven of the last 11 Tours de France have been conquered on a DOGMA, and the latest generation is now ready to continue that legacy of success. This is the culmination of all of our skill and experience, a masterpiece of engineering that offers advancements in handling, comfort, and aerodynamics all wrapped in a package that can climb, descend, and sprint with equal flair. Whatever the road throws at you, the DOGMA F is always the right bike.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (2, N'DOGMA F RED ETAP AXS', 2500.0000, 9, N'The Art of Balance', N'img/red_etap_axs.png', N'Seven of the last 10 Tours de France have been conquered on a DOGMA, and the latest generation is now ready to continue that legacy of success. This is the culmination of all of our skill and experience, a masterpiece of engineering that offers advancements in handling, comfort, and aerodynamics all wrapped in a package that can climb, descend, and sprint with equal flair. Whatever the road throws at you, the DOGMA F is always the right bike.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (3, N'DOGMA F CUSTOM BUILT', 2000.0000, 10, N'The Art of Balance', N'img/custom_built.png', N'Seven of the last 10 Tours de France have been conquered on a DOGMA, and the latest generation is now ready to continue that legacy of success. This is the culmination of all of our skill and experience, a masterpiece of engineering that offers advancements in handling, comfort, and aerodynamics all wrapped in a package that can climb, descend, and sprint with equal flair. Whatever the road throws at you, the DOGMA F is always the right bike.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (4, N'DOGMA F12 SUPER RECORD EPS', 2000.0000, 10, N'End of Discussion Again', N'img/super_record_eps.png', N'We asked our designers and engineers to transfer the amazing riding experience of DOGMA F12 to the new PRINCE.

The result is a bicycle with technical characteristics and performance standards that outperform many high end Road bikes on the market today, and the reason that the PRINCE  is a real alternative to DOGMA F12

The Prince inherits the DOGMA F12 total cable integration system, called TiCR, which enables a significant aerodynamic advantage.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (5, N'PRINCE ULTEGRA 11S', 2000.0000, 0, N'Positive and Pure Emotion', N'img/ultegra_11s.png', N'We asked our designers and engineers to transfer the amazing riding experience of DOGMA F12 to the new PRINCE.

The result is a bicycle with technical characteristics and performance standards that outperform many high end Road bikes on the market today, and the reason that the PRINCE  is a real alternative to DOGMA F12

The Prince inherits the DOGMA F12 total cable integration system, called TiCR, which enables a significant aerodynamic advantage.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (6, N'GAN 105', 3000.0000, 0, N'Born for long distances: unstoppable', N'img/gan_105.png', N'The Gan 105 Road Bike, derived directly from the Dogma F8, features modifications that create a less extreme frame while still maintaining Pinarello''s specific style and feel. Frame asymmetry and a high-strength carbon build are the main features passed along from the F8, providing you with a comfort-optimized build. Its carbon build features unidirectional finishing that is used to absorb all vibrations from the tarmac to ensure all-day comfort in the saddle. Pinarello''s Onda Fork delivers optimal stability, precise turns, and shock reduction to further increase the overall comfort provided by the Gan 105 frame.

', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (7, N'Bolide HR', 2000.0000, 6, N'IT MARKED AN ERA ... DOMINATING THE HOUR', N'img/bolide_HR.jpg', N'BOLIDE F HR 3D is the first and fastest high performance 3D printed bike ever built. Specifically deisgned for Filippo Ganna''s hour record attempt.

The concept behind this unique Bolide F HR 3D is to blend strength and stiffness with aero gains, relying on a production method that would allow for millimetre-perfect sizing. 

Working closely with Filippo Ganna and the INEOS Grenadier’s team to develop this revolutionary product is part of the Pinarello company DNA. The result of such extreme research, the spirit of innovation it engenders and the technology it creates is then spread through the whole range of Pinarello products.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (8, N'MAAT ITALIAN', 4000.0000, 15, N'BORN TO FLY IN AN OVAL...FAST!', N'img/maat_italia.png', N'Maat is the most advanced track bike on the market and was conceived by listening to and involving technicians and athletes of the Italian National Team in all the design phases, from the definition of the technical characteristics of the frame and the design of the new integrated handlebar, to the study of particular specifications. geometries that can also be used in Sprint tests, given the exceptional lateral stiffness.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (9, N'Crossista Ultegra RX', 5000.0000, 15, N'FOR THOSE WHO RIDE THROUGH MUD AND OBSTACLES: IMPASSABLE!', N'img/cossista_ultegra_RX.png', N'The Crossista is our weapon dedicated to Cyclocross competitions. On this model the geometries have been optimized and the rear triangle is equipped with “felex stays” technology ensuring precise handling in the technical sections of the most difficult tracks. The shapes of the frame are designed for the ergonomics of carrying on the shoulder when overcoming obstacles and the profiles of the tubes have been designed to minimize accumulations of mud. Thanks to the combination of maxim', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (10, N'Crossista + Ultegra RX', 4000.0000, 15, N'FOR THOSE WHO RIDE THROUGH MUD AND OBSTACLES: IMPASSABLE!', N'img/cossista+ultegra_RX.png', N'The Crossista is our weapon dedicated to Cyclocross competitions. On this model the geometries have been optimized and the rear triangle is equipped with “felex stays” technology ensuring precise handling in the technical sections of the most difficult tracks. The shapes of the frame are designed for the ergonomics of carrying on the shoulder when overcoming obstacles and the profiles of the tubes have been designed to minimize accumulations of mud. Thanks to the combination of maxim', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (11, N'MAAT ITALIAN', 4000.0000, 14, N'BORN TO FLY IN AN OVAL...FAST!', N'img/maat_italia.png', N'Maat is the most advanced track bike on the market and was conceived by listening to and involving technicians and athletes of the Italian National Team in all the design phases, from the definition of the technical characteristics of the frame and the design of the new integrated handlebar, to the study of particular specifications. geometries that can also be used in Sprint tests, given the exceptional lateral stiffness.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (12, N'Grevil F EKAR', 2600.0000, 15, N'FULL GAS EVERYWHERE', N'img/grevil_f_ekar.png', N'If you want to win a Gravel race, this is the bike for you. This is the off-road DOGMA. 

The versatile GREVIL F is ready for anything. It can accommodate any kind of wheel or tyre combination, adapting to your every need, giving you the freedom to push the limits and compete with yourself. 

Even off road, aerodynamics count. Every watt saved brings you closer to victory, so the GREVIL F’s design puts a major focus on aerodynamics and rigidity. If you want to triumph on every terrain, this is the bike for you. This is the off-road DOGMA.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (13, N'Nytro Gravel Force', 2900.0000, 14, N'An explosive boost!', N'img/nytro_gravel_force.png', N'Evolution of the Nytro Road electric road bike the new Nytro Gravel is the bike to challenge gravel and any type of terrain with pedal assistance, ready for your adventures in any situation. Made with asymmetrical carbon fiber frame T700 is a premium E-Bike for performance and handling while keeping the weight low thanks to the motor and battery of the Fazua Evation system located in the down tube and also offering more space for tires up to 700x42c or 650Bx2.1 ".', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (14, N'Grevil Force', 2900.0000, 15, N'UNIQUE DESIGN, PINARELLO DNA…', N'img/grevil_force.png', N'If you want to win a Gravel race, this is the bike for you. This is the off-road DOGMA. 

The versatile GREVIL F is ready for anything. It can accommodate any kind of wheel or tyre combination, adapting to your every need, giving you the freedom to push the limits and compete with yourself. 

Even off road, aerodynamics count. Every watt saved brings you closer to victory, so the GREVIL F’s design puts a major focus on aerodynamics and rigidity. If you want to triumph on every terrain, this is the bike for you. This is the off-road DOGMA.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (15, N'Grevil Ekar', 2900.0000, 15, N'UNIQUE DESIGN, PINARELLO DNA…', N'img/grevil_ekar.png', N'If you want to win a Gravel race, this is the bike for you. This is the off-road DOGMA. 

The versatile GREVIL F is ready for anything. It can accommodate any kind of wheel or tyre combination, adapting to your every need, giving you the freedom to push the limits and compete with yourself. 

Even off road, aerodynamics count. Every watt saved brings you closer to victory, so the GREVIL F’s design puts a major focus on aerodynamics and rigidity. If you want to triumph on every terrain, this is the bike for you. This is the off-road DOGMA.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (16, N'Grevil GRX', 3500.0000, 5, N'UNIQUE DESIGN, PINARELLO DNA…', N'img/grevil_grx.png', N'If you want to win a Gravel race, this is the bike for you. This is the off-road DOGMA. 

The versatile GREVIL F is ready for anything. It can accommodate any kind of wheel or tyre combination, adapting to your every need, giving you the freedom to push the limits and compete with yourself. 

Even off road, aerodynamics count. Every watt saved brings you closer to victory, so the GREVIL F’s design puts a major focus on aerodynamics and rigidity. If you want to triumph on every terrain, this is the bike for you. This is the off-road DOGMA.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (17, N'Nytro Grinta Apex', 3400.0000, 13, N'ALL ROAD PLEASURE', N'img/nitro_grinta_apex.png', N'The new NYTRO GRINTA is pure freedom. Gravel has wonderfully expanded the possibilities of traveling on roads that were not even contemplated by road cyclists until yesterday. With NYTRO GRINTA you can go even further thanks to the thrust of its Fazua Evation engine able to support you to overcome the obstacles between you and the fun!The Fazua Motor offers three levels of assistance: Breeze: a gentle, constant and 100 watts strong tailwind even at low rider powerRiver: progressive and very sporty mode, for a smooth riding experience. The strength of the support precisely follows your foot and your own power. Give a lot - and get a lot from the motor (max. 210 watts)Rocket: aggressive assistance that helps you to tackle the steepest sections even with moderate driver power (max. 250 watts)', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (18, N'Nytro Gravel Force', 3400.0000, 11, N'An explosive boost!', N'img/nytro_gravel_force.png', N'The new NYTRO GRINTA is pure freedom. Gravel has wonderfully expanded the possibilities of traveling on roads that were not even contemplated by road cyclists until yesterday. With NYTRO GRINTA you can go even further thanks to the thrust of its Fazua Evation engine able to support you to overcome the obstacles between you and the fun!

The Fazua Motor offers three levels of assistance: 

Breeze: a gentle, constant and 100 watts strong tailwind even at low rider power
River: progressive and very sporty mode, for a smooth riding experience. The strength of the support precisely follows your foot and your own power. Give a lot - and get a lot from the motor (max. 210 watts)
Rocket: aggressive assistance that helps you to tackle the steepest sections even with moderate driver power (max. 250 watts)', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (19, N'Nytro Urbanist Deore', 2000.0000, 12, N'MOVE FAST!', N'img/urbanist_deore.png', N'The new NYTRO URBANIST is the ideal choice for city mobility thanks to its low weight that allows it to be easily loaded onto vehicles and taken to the office.

NYTRO URBANIST offers powerful and natural assistance, perfect for the city and for your weekend away.
The Fazua Motor offers three levels of assistance: 
Breeze: a gentle, constant and 100 watts strong tailwind even at low rider power
River: progressive and very sporty mode, for a smooth riding experience. The strength of the support precisely follows your foot and your own power. Give a lot - and get a lot from the motor (max. 210 watts)
Rocket: an a ggressive assistance that helps you to tackle the steepest sections even with moderate driver power (max. 250 watts)', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (20, N'MOST ULTRAFAST 40 DISC', 50.0000, 35, NULL, N'img/most_ultrafast_40_disc.jpg', NULL, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (21, N'Talon Aero 1k Di2', 51.0000, 22, NULL, N'img/talon_aero_1k_di2.jpg', NULL, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (22, N'Talon Ultra Light', 49.0000, 0, NULL, N'img/talon_ultra_light.jpg', NULL, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (23, N'Jaguar GR Di2', 43.0000, 34, NULL, N'img/jaguar_gr_di2.jpg', NULL, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (25, N'Jaguar XA Aero Di2', 43.0000, 23, NULL, N'img/jaguar_xa_aero_di2.jpg', NULL, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (26, N'Jaguar XFC Aero TiCR', 44.0000, 27, NULL, N'img/jaguar_xfc_aero_ticr.jpg', NULL, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (27, N'Lynx Aircross', 46.0000, 35, NULL, N'img/lynx_aircross.jpg', NULL, 4)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (33, N'Lynx NS Carbon', 45.0000, 49, NULL, N'img/lynx_ns_carbon.jpg', NULL, 4)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (34, N'Synthetic Greese', 20.0000, 112, NULL, N'img/synthetic_greese.jpg', NULL, 5)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (35, N'Gel Degreaser', 21.0000, 87, NULL, N'img/gel_degreaser.jpg', NULL, 5)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (36, N'Dry Lube', 21.0000, 33, NULL, N'img/dry_lube.jpg', NULL, 5)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (37, N'Hoodie', 20.0000, 39, NULL, N'hoodie_corporate_navy.jpg', NULL, 6)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (41, N'Cap Art Logo Black', 51.0000, 63, NULL, N'img/cap_art_logo_black.jpg', NULL, 6)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (42, N'Cap Corporate Navy', 50.0000, 76, NULL, N'img/cap_corporate_navy.jpg', NULL, 6)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (43, N'Cap Trucker Black', 56.0000, 77, NULL, N'img/cap_trucker_black.jpg', NULL, 6)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (44, N'BOLIDE F HR 3D', 4000.0000, 1, N'THE FIRST HIGH PERFORMANCE 3D PRINTED BIKE', N'img/bolide_F_HR_3D.png', N'BOLIDE F HR 3D is the first and fastest high performance 3D printed bike ever built. Specifically deisgned for Filippo Ganna''s hour record attempt.  The concept behind this unique Bolide F HR 3D is to blend strength and stiffness with aero gains, relying on a production method that would allow for millimetre-perfect sizing.   Working closely with Filippo Ganna and the INEOS Grenadier’s team to develop this revolutionary product is part of the Pinarello company DNA. The result of such extreme research, the spirit of innovation it engenders and the technology it creates is then spread through the whole range of Pinarello products.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (45, N'BOLIDE F', 3500.0000, 8, N'OUR FASTEST BIKE EVER!', N'img/bolide_F.png', N'Originally created exclusively for Team Sky in 2013, the Bolide became legendary in 2015 when Sir Bradley Wiggins used the Bolide HR to break the Hour Record. Pinarello then introduced the Bolide TT in 2016, which went on to win countless TT competitions during grand tours, national and world championships on the road while also storming to unparalleled success on the track, winning multiple medals on team and individual pursuit at world championships and at the Olympics.  Building on that impressive foundation, Pinarello has incorporated the latest technological advances, including impressive recent developments in Computational Fluid Dynamics that have helped Pinarello’s engineers to significantly improve aerodynamics on the new Bolide F. Pinarello’s engineers were able to not only design a more aerodynamic bike, but also reduce the weight of the frame kit and brakes by 170g.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (46, N'BOLIDE TR FORCE', 4000.0000, 5, N'JEWEL FOR THRIATHLETES…A WINNING ALLY!', N'img/bolide_TR_Force.png', N'BOLIDE TR is Pinarello''s answer to the evolution of the Triathlon world. Brought by Cameron Wurf to debut in the fantastic scenery of Kona, in Hawaii it immediately set the record in the road segment that it already held since the last edition. BOLIDE TR is made of TorayCa T700 UD carbon which, thanks to its extraordinary stiffness and comfort characteristics, makes it perfect for all triathletes engaged in the toughest no-draft competitions. The PinaLab technicians worked on driveability and comfort, also designing object holders perfectly integrated on the frame tested in the wind tunnel.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (47, N'BOLIDE TR FORCE', 4000.0000, 9, N'JEWEL FOR THRIATHLETES…A WINNING ALLY!', N'img/bolide_TR_Force.png', N'BOLIDE TR is Pinarello''s answer to the evolution of the Triathlon world. Brought by Cameron Wurf to debut in the fantastic scenery of Kona, in Hawaii it immediately set the record in the road segment that it already held since the last edition. BOLIDE TR is made of TorayCa T700 UD carbon which, thanks to its extraordinary stiffness and comfort characteristics, makes it perfect for all triathletes engaged in the toughest no-draft competitions. The PinaLab technicians worked on driveability and comfort, also designing object holders perfectly integrated on the frame tested in the wind tunnel.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (48, N'BOLIDE TR ULTEGRA
', 4600.0000, 8, N'JEWEL FOR THRIATHLETES…A WINNING ALLY!', N'img/bolide_TR_ultegra.png', N'BOLIDE TR is Pinarello''s answer to the evolution of the Triathlon world. Brought by Cameron Wurf to debut in the fantastic scenery of Kona, in Hawaii it immediately set the record in the road segment that it already held since the last edition. BOLIDE TR is made of TorayCa T700 UD carbon which, thanks to its extraordinary stiffness and comfort characteristics, makes it perfect for all triathletes engaged in the toughest no-draft competitions. The PinaLab technicians worked on driveability and comfort, also designing object holders perfectly integrated on the frame tested in the wind tunnel.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (50, N'BOLIDE TR ULTEGRA DI2', 4800.0000, 3, N'JEWEL FOR THRIATHLETES…A WINNING ALLY!', N'img/bolide_TR_ultegra_Di12.png', N'BOLIDE TR is Pinarello''s answer to the evolution of the Triathlon world. Brought by Cameron Wurf to debut in the fantastic scenery of Kona, in Hawaii it immediately set the record in the road segment that it already held since the last edition. BOLIDE TR is made of TorayCa T700 UD carbon which, thanks to its extraordinary stiffness and comfort characteristics, makes it perfect for all triathletes engaged in the toughest no-draft competitions. The PinaLab technicians worked on driveability and comfort, also designing object holders perfectly integrated on the frame tested in the wind tunnel.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (51, N'PRINCE FORCE ETAP AXS 12S', 2000.0000, 7, N'POSITIVE AND PURE EMOTION', N'img/prince_force_etep_axs.png', N'We asked our designers and engineers to transfer the amazing riding experience of DOGMA F12 to the new PRINCE.

The result is a bicycle with technical characteristics and performance standards that outperform many high end Road bikes on the market today, and the reason that the PRINCE  is a real alternative to DOGMA F12

The Prince inherits the DOGMA F12 total cable integration system, called TiCR, which enables a significant aerodynamic advantage.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (52, N'PRINCE ULTEGRA DI2 12S', 2400.0000, 0, N'POSITIVE AND PURE EMOTION', N'img/prince_ultegra_di2.png', N'We asked our designers and engineers to transfer the amazing riding experience of DOGMA F12 to the new PRINCE.

The result is a bicycle with technical characteristics and performance standards that outperform many high end Road bikes on the market today, and the reason that the PRINCE  is a real alternative to DOGMA F12

The Prince inherits the DOGMA F12 total cable integration system, called TiCR, which enables a significant aerodynamic advantage.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (55, N'PARIS 105 11S', 2600.0000, 7, N'BUILT FOR ENDURANCE READY TO CONQUER THE VICTORY', N'img/paris_105_11s.png', N'Paris is a bicycle developed and created to ensure maximun comfort without forgetting the racing spirit of every Pinarello bicycle.

The biggest difference from Dogma and Prince is in fact the Reach and Stack: a real balance found by our PinaLab technicians about a geometric solution that legthens the bike and makes it more comfortable to ride, without losing the reactivity, a key feature for a road bike.

Thanks to its particular characteristics, Paris reveals his distinctive focus on the long distance keeping the Pinarello DNA.', 1)
INSERT [dbo].[Product] ([id], [pname], [price], [quantity], [describe], [images], [detail], [cid]) VALUES (56, N'PARIS RIVAL AXS 12S', 3000.0000, 8, N'BUILT FOR ENDURANCE READY TO CONQUER THE VICTORY', N'img/paris_rival_axs.png', N'Paris is a bicycle developed and created to ensure maximun comfort without forgetting the racing spirit of every Pinarello bicycle.

The biggest difference from Dogma and Prince is in fact the Reach and Stack: a real balance found by our PinaLab technicians about a geometric solution that legthens the bike and makes it more comfortable to ride, without losing the reactivity, a key feature for a road bike.

Thanks to its particular characteristics, Paris reveals his distinctive focus on the long distance keeping the Pinarello DNA.', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [fk_Orders_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [fk_Orders_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_OrderLine_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_OrderLine_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_OrderLine_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_OrderLine_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_product_p_info] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_product_p_info]
GO
