USE [master]
GO
/****** Object:  Database [MuOnline]    Script Date: 12/24/2024 13:36:01 ******/
CREATE DATABASE [MuOnline] ON  PRIMARY 
( NAME = N'MuOnline_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MuOnline.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'MuOnline_Log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MuOnline_log.ldf' , SIZE = 3464KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MuOnline] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MuOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MuOnline] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MuOnline] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MuOnline] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MuOnline] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MuOnline] SET ARITHABORT OFF
GO
ALTER DATABASE [MuOnline] SET AUTO_CLOSE ON
GO
ALTER DATABASE [MuOnline] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MuOnline] SET AUTO_SHRINK ON
GO
ALTER DATABASE [MuOnline] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MuOnline] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MuOnline] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MuOnline] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MuOnline] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MuOnline] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MuOnline] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MuOnline] SET  DISABLE_BROKER
GO
ALTER DATABASE [MuOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MuOnline] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MuOnline] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MuOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MuOnline] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MuOnline] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MuOnline] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MuOnline] SET  READ_WRITE
GO
ALTER DATABASE [MuOnline] SET RECOVERY SIMPLE
GO
ALTER DATABASE [MuOnline] SET  MULTI_USER
GO
ALTER DATABASE [MuOnline] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [MuOnline] SET DB_CHAINING OFF
GO
USE [MuOnline]
GO
/****** Object:  Table [dbo].[MK_Server]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MK_Server](
	[rei_do_mk] [smallint] NOT NULL,
	[recorde_on] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEMB_STAT]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MEMB_STAT](
	[memb___id] [varchar](10) NOT NULL,
	[ConnectStat] [tinyint] NULL,
	[ServerName] [varchar](50) NULL,
	[IP] [varchar](15) NULL,
	[ConnectTM] [smalldatetime] NULL,
	[DisConnectTM] [smalldatetime] NULL,
	[OnlineHours] [int] NULL,
 CONSTRAINT [PK_MEMB_STAT] PRIMARY KEY CLUSTERED 
(
	[memb___id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MEMB_INFO]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MEMB_INFO](
	[memb_guid] [int] IDENTITY(1,1) NOT NULL,
	[memb___id] [varchar](10) NOT NULL,
	[memb__pwd] [varchar](10) NOT NULL,
	[memb_name] [varchar](10) NOT NULL,
	[sno__numb] [char](18) NOT NULL,
	[post_code] [char](6) NULL,
	[addr_info] [varchar](50) NULL,
	[addr_deta] [varchar](50) NULL,
	[tel__numb] [varchar](20) NULL,
	[phon_numb] [varchar](15) NULL,
	[mail_addr] [varchar](50) NULL,
	[fpas_ques] [varchar](50) NULL,
	[fpas_answ] [varchar](50) NULL,
	[job__code] [char](2) NULL,
	[appl_days] [datetime] NULL,
	[modi_days] [datetime] NULL,
	[out__days] [datetime] NULL,
	[true_days] [datetime] NULL,
	[mail_chek] [char](1) NULL,
	[bloc_code] [char](1) NOT NULL,
	[ctl1_code] [char](1) NOT NULL,
	[AccountLevel] [int] NOT NULL,
	[AccountExpireDate] [smalldatetime] NOT NULL,
	[gold] [int] NOT NULL,
	[Cash] [int] NOT NULL,
	[Lock] [int] NOT NULL,
	[Bloc_Expire] [smalldatetime] NULL,
 CONSTRAINT [PK_MEMB_INFO_1] PRIMARY KEY NONCLUSTERED 
(
	[memb_guid] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [IX_MEMB_INFO_1] ON [dbo].[MEMB_INFO] 
(
	[memb___id] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_MEMB_DETAIL] ON [dbo].[MEMB_INFO] 
(
	[sno__numb] DESC,
	[memb_name] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterSkillTree]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterSkillTree](
	[Name] [varchar](50) NOT NULL,
	[MasterLevel] [int] NULL,
	[MasterPoint] [int] NULL,
	[MasterExperience] [bigint] NULL,
 CONSTRAINT [PK_MasterSkillTree] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marry]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marry](
	[Character] [varchar](15) NOT NULL,
	[MarryCharacter] [varchar](15) NOT NULL,
	[MarriedOn] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOG_CREDITOS]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOG_CREDITOS](
	[id_creditos] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](10) NULL,
	[valor] [int] NOT NULL,
	[data] [smalldatetime] NOT NULL,
	[ip] [char](15) NULL,
	[tipo] [smallint] NOT NULL,
 CONSTRAINT [PK_LOG_CREDITOS] PRIMARY KEY CLUSTERED 
(
	[id_creditos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemLog]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemLog](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[Acc] [varchar](10) NULL,
	[Name] [varchar](10) NULL,
	[ItemCode] [varbinary](32) NULL,
	[SN] [int] NULL,
	[iName] [varchar](50) NULL,
	[iLvl] [varchar](50) NULL,
	[iSkill] [smallint] NULL,
	[iLuck] [smallint] NULL,
	[iExt] [varchar](500) NULL,
	[iSet] [smallint] NULL,
	[i380] [smallint] NULL,
	[iJh] [smallint] NULL,
	[SentDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuildMember]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildMember](
	[Name] [varchar](10) NOT NULL,
	[G_Name] [varchar](8) NOT NULL,
	[G_Level] [tinyint] NULL,
	[G_Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_GuildMember] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_GuildMember] ON [dbo].[GuildMember] 
(
	[G_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guild]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Guild](
	[G_Name] [varchar](8) NOT NULL,
	[G_Mark] [varbinary](32) NULL,
	[G_Score] [int] NULL,
	[G_Master] [varchar](10) NULL,
	[G_Count] [int] NULL,
	[G_Notice] [varchar](60) NULL,
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[G_Type] [int] NOT NULL,
	[G_Rival] [int] NOT NULL,
	[G_Union] [int] NOT NULL,
	[MemberCount] [int] NULL,
 CONSTRAINT [PK_Guild] PRIMARY KEY CLUSTERED 
(
	[G_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IDX_GUILD_G_RIVAL] ON [dbo].[Guild] 
(
	[G_Rival] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_GUILD_G_UNION] ON [dbo].[Guild] 
(
	[G_Union] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_GUILD_NUMBER] ON [dbo].[Guild] 
(
	[Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameServerInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameServerInfo](
	[Number] [int] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[ZenCount] [int] NULL,
	[AceItemCount] [int] NULL,
 CONSTRAINT [PK_GameServerInfo] PRIMARY KEY NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtWarehouse]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExtWarehouse](
	[AccountID] [varchar](10) NOT NULL,
	[Items] [varbinary](1920) NULL,
	[Money] [int] NULL,
	[Number] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventSantaClaus]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventSantaClaus](
	[Name] [varchar](10) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_EventSantaClaus] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventLeoTheHelper]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventLeoTheHelper](
	[Name] [varchar](10) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_EventLeoTheHelper] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DefaultClassType]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DefaultClassType](
	[Class] [tinyint] NOT NULL,
	[Level] [smallint] NULL,
	[LevelUpPoint] [smallint] NULL,
	[Strength] [smallint] NULL,
	[Dexterity] [smallint] NULL,
	[Vitality] [smallint] NULL,
	[Energy] [smallint] NULL,
	[Leadership] [smallint] NULL,
	[Inventory] [varbinary](1728) NULL,
	[MagicList] [varbinary](180) NULL,
	[Life] [real] NULL,
	[MaxLife] [real] NULL,
	[Mana] [real] NULL,
	[MaxMana] [real] NULL,
	[MapNumber] [smallint] NULL,
	[MapPosX] [smallint] NULL,
	[MapPosY] [smallint] NULL,
	[Quest] [varbinary](50) NULL,
	[DbVersion] [tinyint] NULL,
	[EffectList] [varbinary](208) NULL,
 CONSTRAINT [PK_DefaultClassType] PRIMARY KEY CLUSTERED 
(
	[Class] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomStoreOffline]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomStoreOffline](
	[AccountID] [varchar](10) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[IP] [varchar](15) NOT NULL,
	[ServerName] [varchar](50) NULL,
 CONSTRAINT [PK_CustomStoreOffline] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomStore]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomStore](
	[Name] [varchar](10) NOT NULL,
	[Active] [tinyint] NOT NULL,
	[Type] [smallint] NOT NULL,
	[StoreName] [varchar](36) NULL,
 CONSTRAINT [PK_CustomStore] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestKillCount]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestKillCount](
	[Name] [varchar](10) NOT NULL,
	[QuestIndex] [int] NULL,
	[MonsterClass1] [int] NULL,
	[KillCount1] [int] NULL,
	[MonsterClass2] [int] NULL,
	[KillCount2] [int] NULL,
	[MonsterClass3] [int] NULL,
	[KillCount3] [int] NULL,
	[MonsterClass4] [int] NULL,
	[KillCount4] [int] NULL,
	[MonsterClass5] [int] NULL,
	[KillCount5] [int] NULL,
 CONSTRAINT [PK_QuestKillCount] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PShopItemValue]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PShopItemValue](
	[Name] [varchar](10) NOT NULL,
	[Slot] [int] NOT NULL,
	[Serial] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_PShopItemValue] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Slot] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PcPointData]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PcPointData](
	[AccountID] [varchar](10) NOT NULL,
	[PcPoint] [int] NULL,
	[LastAwardedDate] [datetime] NULL,
 CONSTRAINT [PK_PcPointData] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OptionData]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OptionData](
	[Name] [varchar](10) NOT NULL,
	[SkillKey] [binary](20) NULL,
	[GameOption] [tinyint] NULL,
	[Qkey] [tinyint] NULL,
	[Wkey] [tinyint] NULL,
	[Ekey] [tinyint] NULL,
	[ChatWindow] [tinyint] NULL,
	[Rkey] [tinyint] NULL,
	[QWERLevel] [int] NULL,
 CONSTRAINT [PK_OptionData] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MuMakerFinderMaker]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MuMakerFinderMaker](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AC] [varchar](10) NOT NULL,
	[PJ] [varchar](10) NOT NULL,
	[Vault] [smallint] NOT NULL,
	[Invent] [smallint] NOT NULL,
	[ExtraW] [smallint] NOT NULL,
	[NumExtraW] [smallint] NOT NULL,
	[Pos] [smallint] NOT NULL,
	[Item] [varchar](32) NOT NULL,
	[Serial] [varchar](8) NOT NULL,
	[FullEXE] [bit] NULL,
	[ExeAnc] [bit] NULL,
	[Full380] [bit] NULL,
	[FullJoH] [bit] NULL,
	[FullScK] [bit] NULL,
	[CodeItems] [varchar](4000) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MuCastle_SIEGE_GUILDLIST]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MuCastle_SIEGE_GUILDLIST](
	[MAP_SVR_GROUP] [int] NOT NULL,
	[GUILD_NAME] [varchar](8) NOT NULL,
	[GUILD_ID] [int] NOT NULL,
	[GUILD_INVOLVED] [bit] NOT NULL,
	[GUILD_SCORE] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [IX_MuCastle_SIEGE_GUILDLIST] ON [dbo].[MuCastle_SIEGE_GUILDLIST] 
(
	[MAP_SVR_GROUP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuCastle_REG_SIEGE]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MuCastle_REG_SIEGE](
	[MAP_SVR_GROUP] [int] NOT NULL,
	[REG_SIEGE_GUILD] [varchar](8) NOT NULL,
	[REG_MARKS] [int] NOT NULL,
	[IS_GIVEUP] [tinyint] NOT NULL,
	[SEQ_NUM] [int] NOT NULL,
 CONSTRAINT [IX_ATTACK_GUILD_SUBKEY] UNIQUE NONCLUSTERED 
(
	[MAP_SVR_GROUP] ASC,
	[REG_SIEGE_GUILD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [IX_ATTACK_GUILD_KEY] ON [dbo].[MuCastle_REG_SIEGE] 
(
	[MAP_SVR_GROUP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuCastle_NPC]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuCastle_NPC](
	[MAP_SVR_GROUP] [int] NOT NULL,
	[NPC_NUMBER] [int] NOT NULL,
	[NPC_INDEX] [int] NOT NULL,
	[NPC_DF_LEVEL] [int] NOT NULL,
	[NPC_RG_LEVEL] [int] NOT NULL,
	[NPC_MAXHP] [int] NOT NULL,
	[NPC_HP] [int] NOT NULL,
	[NPC_X] [tinyint] NOT NULL,
	[NPC_Y] [tinyint] NOT NULL,
	[NPC_DIR] [tinyint] NOT NULL,
	[NPC_CREATEDATE] [datetime] NOT NULL,
 CONSTRAINT [IX_NPC_SUBKEY] UNIQUE NONCLUSTERED 
(
	[MAP_SVR_GROUP] ASC,
	[NPC_NUMBER] ASC,
	[NPC_INDEX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_NPC_PK] ON [dbo].[MuCastle_NPC] 
(
	[MAP_SVR_GROUP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuCastle_MONEY_STATISTICS]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuCastle_MONEY_STATISTICS](
	[MAP_SVR_GROUP] [int] NOT NULL,
	[LOG_DATE] [datetime] NOT NULL,
	[MONEY_CHANGE] [money] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_MuCastle_MONEY_STATISTICS] ON [dbo].[MuCastle_MONEY_STATISTICS] 
(
	[MAP_SVR_GROUP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_MuCastle_MONEY_STATISTICS_NC] ON [dbo].[MuCastle_MONEY_STATISTICS] 
(
	[MAP_SVR_GROUP] ASC,
	[LOG_DATE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuCastle_DATA]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MuCastle_DATA](
	[MAP_SVR_GROUP] [int] NOT NULL,
	[SIEGE_START_DATE] [datetime] NOT NULL,
	[SIEGE_END_DATE] [datetime] NOT NULL,
	[SIEGE_GUILDLIST_SETTED] [bit] NOT NULL,
	[SIEGE_ENDED] [bit] NOT NULL,
	[CASTLE_OCCUPY] [bit] NOT NULL,
	[OWNER_GUILD] [varchar](8) NOT NULL,
	[MONEY] [money] NOT NULL,
	[TAX_RATE_CHAOS] [int] NOT NULL,
	[TAX_RATE_STORE] [int] NOT NULL,
	[TAX_HUNT_ZONE] [int] NOT NULL,
 CONSTRAINT [PK_MuCastle_DATA] PRIMARY KEY CLUSTERED 
(
	[MAP_SVR_GROUP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WarehouseGuild]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WarehouseGuild](
	[Guild] [varchar](10) NOT NULL,
	[Items] [varbinary](1920) NULL,
	[Money] [int] NULL,
	[EndUseDate] [smalldatetime] NULL,
	[DbVersion] [tinyint] NULL,
	[pw] [smallint] NULL,
 CONSTRAINT [PK_warehouseguild] PRIMARY KEY CLUSTERED 
(
	[Guild] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[warehouse]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[warehouse](
	[AccountID] [varchar](10) NOT NULL,
	[Items] [varbinary](1920) NULL,
	[Money] [int] NULL,
	[EndUseDate] [smalldatetime] NULL,
	[DbVersion] [tinyint] NULL,
	[pw] [smallint] NULL,
 CONSTRAINT [PK_warehouse] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_WaitFriend]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_WaitFriend](
	[GUID] [int] NOT NULL,
	[FriendGuid] [int] NOT NULL,
	[FriendName] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_T_WaitFriend] ON [dbo].[T_WaitFriend] 
(
	[GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_PetItem_Info]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_PetItem_Info](
	[ItemSerial] [int] NOT NULL,
	[Pet_Level] [smallint] NULL,
	[Pet_Exp] [int] NULL,
 CONSTRAINT [PK_T_Pet_Info] PRIMARY KEY CLUSTERED 
(
	[ItemSerial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_FriendMain]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FriendMain](
	[GUID] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[FriendCount] [tinyint] NULL,
	[MemoCount] [int] NULL,
	[MemoTotal] [int] NULL,
 CONSTRAINT [PK_T_FriendMain] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_T_FriendMain] ON [dbo].[T_FriendMain] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_FriendMail]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FriendMail](
	[MemoIndex] [int] NOT NULL,
	[GUID] [int] NOT NULL,
	[FriendName] [varchar](10) NULL,
	[wDate] [smalldatetime] NOT NULL,
	[Subject] [varchar](50) NULL,
	[bRead] [bit] NOT NULL,
	[Memo] [varbinary](1000) NULL,
	[Photo] [binary](18) NULL,
	[Dir] [tinyint] NULL,
	[Act] [tinyint] NULL,
 CONSTRAINT [PK_T_FriendMemo] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC,
	[MemoIndex] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_FriendList]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FriendList](
	[GUID] [int] NOT NULL,
	[FriendGuid] [int] NULL,
	[FriendName] [varchar](10) NULL,
	[Del] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_T_FriendList] ON [dbo].[T_FriendList] 
(
	[GUID] ASC,
	[FriendGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_CGuid]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CGuid](
	[GUID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_T_CGuid] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_T_CGuid_Name] ON [dbo].[T_CGuid] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RankingTvT]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RankingTvT](
	[Name] [varchar](10) NOT NULL,
	[Kills] [int] NOT NULL,
	[Deads] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingKingPlayer]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RankingKingPlayer](
	[Name] [varchar](10) NOT NULL,
	[Score] [int] NULL,
	[Score_semanal] [int] NULL,
 CONSTRAINT [PK_RankingKingPlayer] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingKingGuild]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RankingKingGuild](
	[Name] [varchar](8) NOT NULL,
	[Score] [int] NULL,
	[Score_semanal] [int] NULL,
 CONSTRAINT [PK_RankingKingGuild] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingIllusionTemple]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RankingIllusionTemple](
	[Name] [varchar](10) NOT NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_RankingIllusionTemple] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingGvG]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RankingGvG](
	[Guild] [varchar](8) NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_RankingGvG] PRIMARY KEY CLUSTERED 
(
	[Guild] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingDuel]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RankingDuel](
	[Name] [varchar](10) NOT NULL,
	[WinScore] [int] NULL,
	[LoseScore] [int] NULL,
	[WinScore_semanal] [int] NOT NULL,
 CONSTRAINT [PK_RankingDuel] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingDevilSquare]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RankingDevilSquare](
	[Name] [varchar](10) NOT NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_RankingDevilSquare] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingChaosCastle]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RankingChaosCastle](
	[Name] [varchar](10) NOT NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_RankingChaosCastle] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingBloodCastle]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RankingBloodCastle](
	[Name] [varchar](10) NOT NULL,
	[Score] [int] NULL,
	[Score_semanal] [int] NULL,
 CONSTRAINT [PK_RankingBloodCastle] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RankingBattleRoyale]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RankingBattleRoyale](
	[Name] [varchar](10) NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_RankingBattleRoyale] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WZ_CW_INFO]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WZ_CW_INFO](
	[MAP_SVR_GROUP] [int] NULL,
	[CRYWOLF_OCCUFY] [int] NULL,
	[CRYWOLF_STATE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomJewelBank]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomJewelBank](
	[AccountID] [varchar](10) NOT NULL,
	[Bless] [int] NOT NULL,
	[Soul] [int] NOT NULL,
	[Life] [int] NOT NULL,
	[Creation] [int] NOT NULL,
	[Guardian] [int] NOT NULL,
	[GemStone] [int] NOT NULL,
	[Harmony] [int] NOT NULL,
	[Chaos] [int] NOT NULL,
	[LowStone] [int] NOT NULL,
	[HighStone] [int] NOT NULL,
 CONSTRAINT [PK_JewelBank] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomGift]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomGift](
	[AccountID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_CustomGift] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomAttackOffline]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomAttackOffline](
	[AccountID] [varchar](10) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[IP] [varchar](15) NOT NULL,
	[ServerName] [varchar](50) NULL,
 CONSTRAINT [PK_CustomAttackOffline] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomAttack]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomAttack](
	[Name] [varchar](10) NOT NULL,
	[Active] [smallint] NOT NULL,
	[Skill] [smallint] NULL,
	[Map] [smallint] NULL,
	[PosX] [smallint] NULL,
	[PosY] [smallint] NULL,
	[AutoBuff] [smallint] NULL,
	[OffPvP] [smallint] NULL,
	[AutoReset] [smallint] NULL,
	[AutoAddStr] [int] NULL,
	[AutoAddAgi] [int] NULL,
	[AutoAddVit] [int] NULL,
	[AutoAddEne] [int] NULL,
	[AutoAddCmd] [int] NULL,
 CONSTRAINT [PK_CustomAttack] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Character]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Character](
	[AccountID] [varchar](10) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[cLevel] [int] NULL,
	[LevelUpPoint] [int] NULL,
	[Class] [tinyint] NULL,
	[Experience] [int] NULL,
	[Strength] [int] NULL,
	[Dexterity] [int] NULL,
	[Vitality] [int] NULL,
	[Energy] [int] NULL,
	[Leadership] [int] NULL,
	[Inventory] [varbinary](1728) NULL,
	[MagicList] [varbinary](180) NULL,
	[Money] [int] NULL,
	[Life] [real] NULL,
	[MaxLife] [real] NULL,
	[Mana] [real] NULL,
	[MaxMana] [real] NULL,
	[BP] [real] NULL,
	[MaxBP] [real] NULL,
	[Shield] [real] NULL,
	[MaxShield] [real] NULL,
	[MapNumber] [smallint] NULL,
	[MapPosX] [smallint] NULL,
	[MapPosY] [smallint] NULL,
	[MapDir] [tinyint] NULL,
	[PkCount] [int] NULL,
	[PkLevel] [int] NULL,
	[PkTime] [int] NULL,
	[MDate] [smalldatetime] NULL,
	[LDate] [smalldatetime] NULL,
	[CtlCode] [tinyint] NULL,
	[DbVersion] [tinyint] NULL,
	[Quest] [varbinary](50) NULL,
	[ChatLimitTime] [smallint] NULL,
	[FruitPoint] [int] NULL,
	[EffectList] [varbinary](208) NULL,
	[FruitAddPoint] [int] NOT NULL,
	[FruitSubPoint] [int] NOT NULL,
	[ResetCount] [int] NOT NULL,
	[MasterResetCount] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deads] [int] NOT NULL,
	[Bloc_Expire] [smalldatetime] NULL,
	[ItemStart] [tinyint] NOT NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CashLog]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CashLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](16) NULL,
	[Amount] [money] NULL,
	[SentDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountCharacter]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountCharacter](
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[GameID1] [varchar](10) NULL,
	[GameID2] [varchar](10) NULL,
	[GameID3] [varchar](10) NULL,
	[GameID4] [varchar](10) NULL,
	[GameID5] [varchar](10) NULL,
	[GameIDC] [varchar](10) NULL,
	[MoveCnt] [tinyint] NULL,
	[ExtClass] [int] NOT NULL,
 CONSTRAINT [PK_AccountCharacter] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[UFN_MD5_ENCODEVALUE]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for user-defined function UFN_MD5_ENCODEVALUE : 
--

/****** ??:  ??????? dbo.UFN_MD5_ENCODEVALUE    ????: 2006-11-8 21:18:35 ******/

-- ??? : UFN_MD5_ENCODEVALUE()
-- ?? : ?????? ???? ???? MD5 ?? ??
CREATE FUNCTION [dbo].[UFN_MD5_ENCODEVALUE]
(
	@btInStr		VARCHAR(10),
	@btInStrIndex		VARCHAR(10)
)
RETURNS BINARY(16)
AS  
BEGIN 
	DECLARE	@btOutVal	BINARY(16)

	EXEC master..XP_MD5_EncodeKeyVal @btInStr, @btInStrIndex, @btOutVal OUT

	RETURN 	@btOutVal
END
GO
/****** Object:  UserDefinedFunction [dbo].[UFN_MD5_CHECKVALUE]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for user-defined function UFN_MD5_CHECKVALUE : 
--

/****** ??:  ??????? dbo.UFN_MD5_CHECKVALUE    ????: 2006-11-8 21:18:35 ******/

-- ??? : UFN_MD5_ENCODEVALUE()
-- ?? : ?????? ???? MD5 ?? ???? ??? ??
CREATE FUNCTION [dbo].[UFN_MD5_CHECKVALUE]
(
	@btInStr		VARCHAR(10),
	@btInStrIndex		VARCHAR(10),
	@btInVal		BINARY(16)
)
RETURNS TINYINT 
AS  
BEGIN 
	DECLARE	@iOutResult	TINYINT

	EXEC master..XP_MD5_CheckValue @btInStr, @btInVal, @btInStrIndex, @iOutResult OUT

	RETURN 	@iOutResult
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_Get_DBID]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[WZ_Get_DBID]
 

as
/*begin
select * from WZ_CreateCharacter_Version
end*/
BEGIN
	SELECT 1 as Version
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CreateCharacter_GetVersion]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_CreateCharacter_GetVersion]
AS
BEGIN
	SELECT 1
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CreateCharacter]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE Procedure [dbo].[WZ_CreateCharacter] 
	@AccountID		varchar(10),		--// °èÁ¤ Á¤º¸ 
	@Name			varchar(10),		--// Ä³¸¯ÅÍ 
	@Class			tinyint			--// Class Type
AS
Begin

	SET NOCOUNT ON
	SET	XACT_ABORT ON
	DECLARE		@Result		tinyint

	--//  °á°ú°ª ÃÊ±âÈ­ 
	SET @Result = 0x00	

	--====================================================================================
	--	 Ä³¸¯ÅÍ Á¸Àç¿©ºÎ È®ÀÎ 
	--====================================================================================
	If EXISTS ( SELECT  Name  FROM  Character WHERE Name = @Name )
	begin
		SET @Result	= 0x01				--// µ¿ÀÏ Ä³¸¯ÅÍ¸í Á¸Àç 						
		GOTO ProcEnd						
	end 

	BEGIN TRAN
	--====================================================================================
	--	 °èÁ¤ Á¸Àç ¿©ºÎ È®ÀÎ  ¹× ºó ½½·Ô Á¤º¸ È®ÀÎÇÏ¿© ÀúÀå 		
	--====================================================================================
	If NOT EXISTS ( SELECT  Id  FROM  AccountCharacter WHERE Id = @AccountID )
		begin
			INSERT INTO dbo.AccountCharacter(Id, GameID1, GameID2, GameID3, GameID4, GameID5, GameIDC) 
			VALUES(@AccountID, @Name, NULL, NULL, NULL, NULL, NULL)

			SET @Result  = @@Error
		end 
	else
		begin
			--// Ä³¸¯ÅÍ ºó ½½·Ô ¼³Á¤ 
			Declare @g1 varchar(10), @g2 varchar(10), @g3 varchar(10), @g4 varchar(10), @g5 varchar(10)						
			SELECT @g1=GameID1, @g2=GameID2, @g3=GameID3, @g4=GameID4, @g5=GameID5 FROM dbo.AccountCharacter Where Id = @AccountID 			

			if( ( @g1 Is NULL) OR (Len(@g1) = 0))
				begin
					UPDATE AccountCharacter SET  GameID1 = @Name
					WHERE Id = @AccountID
										
					SET @Result  = @@Error
				end 
			else	 if( @g2  Is NULL OR Len(@g2) = 0)
				begin
					UPDATE AccountCharacter SET  GameID2 = @Name
					WHERE Id = @AccountID

					SET @Result  = @@Error
				end 
			else	 if( @g3  Is NULL OR Len(@g3) = 0)
				begin			
					UPDATE AccountCharacter SET  GameID3 = @Name
					WHERE Id = @AccountID

					SET @Result  = @@Error
				end 
			else	 if( @g4 Is NULL OR Len(@g4) = 0)
				begin
					UPDATE AccountCharacter SET  GameID4 = @Name
					WHERE Id = @AccountID

					SET @Result  = @@Error
				end 
			else	 if( @g5 Is NULL OR Len(@g5) = 0)
				begin
					UPDATE AccountCharacter SET  GameID5 = @Name
					WHERE Id = @AccountID

					SET @Result  = @@Error
				end 		
			else 
				--// ÇØ´ç ºó ½½·Ô Á¤º¸°¡ Á¸Àç ÇÏÁö ¾Ê´Ù. 	
				begin					
					SET @Result	= 0x03							
					GOTO TranProcEnd								
				end 			 
		end 

	
	

	--====================================================================================
	--	 Ä³¸¯ÅÍ Á¤º¸ ÀúÀå 
	--====================================================================================
	if( @Result <> 0 )
		begin
			GOTO TranProcEnd		
		end 
	else
		begin
			INSERT INTO dbo.Character(AccountID, Name, cLevel, LevelUpPoint, Class, Strength, Dexterity, Vitality, Energy, Leadership, Inventory, MagicList, 
					Life, MaxLife, Mana, MaxMana, BP, MaxBP, Shield, MaxShield, MapNumber, MapPosX, MapPosY, MDate, LDate, Quest, DbVersion, EffectList )
			SELECT @AccountID As AccountID, @Name As Name, Level, LevelUpPoint, @Class As Class, 
				Strength, Dexterity, Vitality, Energy, Leadership, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, 0, 0, 0, 0, MapNumber, MapPosX, MapPosY,
				getdate() As MDate, getdate() As LDate, Quest, DbVersion, EffectList
			FROM  DefaultClassType WHERE Class = @Class				

			SET @Result = @@Error
		end 

TranProcEnd:	-- GOTO
	IF ( @Result  <> 0 )
		ROLLBACK TRAN
	ELSE
		COMMIT	TRAN

ProcEnd:
	SET NOCOUNT OFF
	SET	XACT_ABORT OFF

	--====================================================================================
	--  °á°ú°ª ¹ÝÈ¯ Ã³¸® 
	-- 0x00 : Ä³¸¯ÅÍ Á¸Àç, 0x01 : ¼º°ø¿Ï·á, 0x02 : Ä³¸¯ÅÍ »ý¼º ½ÇÆÐ , 0x03 : ºó½½·Ô Á¸ÀçÇÏÁö ¾Ê´Â´Ù   
	--====================================================================================
	SELECT
	   CASE @Result
	      WHEN 0x00 THEN 0x01		--// ¼º°ø ¹ÝÈ¯ 
	      WHEN 0x01 THEN 0x00		--// Ä³¸¯ÅÍ Á¸Àç 
	      WHEN 0x03 THEN 0x03		--// ºó½½·ÔÀÌ Á¸ÀçÇÏÁö ¾Ê´Â´Ù. 
	      ELSE 0x02				--// ±âÅ¸ ¿¡·¯ÄÚµå´Â »ý¼º »øÆÐ ¹ÝÈ¯  
	   END AS Result 
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CONNECT_MEMB]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CONNECT_MEMB : 
--

CREATE PROCEDURE [dbo].[WZ_CONNECT_MEMB]
@memb___id varchar(10),
@ServerName  varchar(50),
@IP varchar(20)	
 AS
Begin	
set nocount on
	Declare  @find_id varchar(10)	
	Declare  @ConnectStat tinyint
	Set @find_id = 'NOT'
	Set @ConnectStat = 1		-- ?? ?? ? 1 = ??, 0 = ??X

	select @find_id = S.memb___id from MEMB_STAT S INNER JOIN MEMB_INFO I ON S.memb___id = I.memb___id 
	       where I.memb___id = @memb___id

	if( @find_id = 'NOT' )
	begin		
		insert into MEMB_STAT (memb___id,ConnectStat,ServerName,IP,ConnectTM)
		values(@memb___id,  @ConnectStat, @ServerName, @IP, getdate())
	end
	else		
		update MEMB_STAT set ConnectStat = @ConnectStat,
					 ServerName = @ServerName,IP = @IP,
					 ConnectTM = getdate()
       	 where memb___id = @memb___id
end
GO
/****** Object:  StoredProcedure [dbo].[WZ_BattleRoyaleRanking]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_BattleRoyaleRanking] 
@Account varchar(10),
@Name varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

IF NOT EXISTS (SELECT Name FROM RankingBattleRoyale WHERE Name=@Name)
BEGIN
	 INSERT INTO RankingBattleRoyale (Name,Score) VALUES (@Name,1)
END
ELSE
BEGIN
	UPDATE RankingBattleRoyale SET Score=Score+1 WHERE Name=@Name
END

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_FriendDel]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_FriendDel : 
--

-- ??? ???? ????.
CREATE procedure [dbo].[WZ_FriendDel]
	@Name varchar(10),  @FriendName varchar(10)

as 

BEGIN
	DECLARE @ErrorCode int
	DECLARE @UserGuid  int
	DECLARE @FriendGuid  int

	Set		nocount on

	SET @ErrorCode = 0

	-- ?? GUID? ???.
	if NOT EXISTS ( select GUID FROM T_FriendMain where Name=@Name)
	  BEGIN
		SET @ErrorCode = 3
		GOTO EndProc

	  END
	else
	  BEGIN
		select @UserGuid = GUID FROM T_FriendMain where Name=@Name
	
		IF ( @@Error  <> 0   )
		begin
			SET @ErrorCode = 4
		end

	  END

	-- ??? GUID? ???.
	if NOT EXISTS ( select GUID FROM T_FriendMain where Name=@FriendName )
	  BEGIN
		SET @ErrorCode = 5
		GOTO EndProc
	  END
 	ELSE
	  BEGIN
		select @FriendGuid = GUID FROM T_FriendMain where Name=@FriendName

		IF ( @@Error  <> 0 )
		begin
			SET @ErrorCode = 6
		end

	end

	-- ?????? ???? ??? ????.
	if NOT EXISTS (SELECT GUID FROM T_FriendList where GUID = @UserGuid AND FriendGuid = @FriendGuid  )
	begin
		SET @ErrorCode = 2
		GOTO EndProc
	end
	
	-- ????.
	DELETE FROM T_FriendList where GUID = @UserGuid AND FriendGuid = @FriendGuid  
	
	IF ( @@Error  <> 0 )
		SET @ErrorCode	= @@Error
	else SET @ErrorCode	= 1

	IF( @ErrorCode = 1 )
	BEGIN
		UPDATE T_FriendList SET Del=1 where GUID=@FriendGuid AND FriendGuid=@UserGuid
	END

EndProc:

	Set		nocount off
	select @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_FriendAdd]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_FriendAdd : 
--

-- ?? ??? ????.
/* ?? : 
 1 : ??
 2 : ?? ?? ???? ???? ??
 3 : ??  GUID? ???? ???.
 4 : ?? GUID? ??? ????.
 5 : ??? GUID? ???? ???.
 6 : ??? GUID? ??? ????.
*/
CREATE procedure [dbo].[WZ_FriendAdd]
	@Name varchar(10),  @FriendName varchar(10)

as 

BEGIN
	DECLARE @ErrorCode int
	DECLARE @UserGuid  int
	DECLARE @FriendGuid  int

	Set		nocount on 	
	SET	XACT_ABORT ON


	SET @ErrorCode = 0

	-- FriendName GUID? ??????
	if NOT EXISTS ( select GUID FROM T_FriendMain where Name=@FriendName )
	  BEGIN
		SET @ErrorCode = 5
		GOTO EndProc
	  END
 	ELSE
	  BEGIN
		select @FriendGuid = GUID FROM T_FriendMain where Name=@FriendName

		IF ( @@Error  <> 0 )
		begin
			SET @ErrorCode = 6
			GOTO EndProc
		end

	end


	-- Name GUID? ??????
	if NOT EXISTS ( select GUID FROM T_FriendMain where Name=@Name)
	  BEGIN
		SET @ErrorCode = 3
		GOTO EndProc

	  END
	else
	  BEGIN
		select @UserGuid = GUID FROM T_FriendMain where Name=@Name
	
		IF ( @@Error  <> 0   )
		begin
			SET @ErrorCode = 4
			GOTO EndProc
		end
	
	  END

	-- ?? ?????? ???? ??? ?????.
	if EXISTS (SELECT GUID FROM T_FriendList where GUID = @UserGuid AND FriendGuid = @FriendGuid  )
	begin
		SET @ErrorCode = 2
		GOTO EndProc
	end

	/*-- ?? ?????? ???? ??? ?????.
	if EXISTS (SELECT GUID FROM T_FriendList where GUID = @FriendGuid AND FriendGuid = @UserGuid  )
	begin
		SET @ErrorCode = 2
		GOTO EndProc
	end
	*/
	BEGIN TRAN

	-- ??? ?????.
	INSERT INTO T_FriendList (GUID, FriendGuid, FriendName ) 
		VALUES ( @UserGuid, @FriendGuid, @FriendName)
	
	IF ( @@Error  <> 0 )
		SET @ErrorCode	= @@Error
	else 
	  BEGIN
		DELETE FROM T_WaitFriend where GUID = @UserGuid AND FriendGuid = @FriendGuid
		IF ( @@Error  <> 0 )
		begin
			SET @ErrorCode	= @@Error
		end
	  END

	/*-- ?? ??? ?????.
	INSERT INTO T_FriendList (GUID, FriendGuid, FriendName ) 
		VALUES ( @FriendGuid, @UserGuid,  @Name)

	IF ( @@Error  <> 0 )
		SET @ErrorCode	= @@Error
	else 
	  BEGIN
		DELETE FROM T_WaitFriend where GUID = @FriendGuid AND FriendGuid = @UserGuid
		IF ( @@Error  <> 0 )
		begin
			SET @ErrorCode	= @@Error
		end
	  END
*/
--EndTranProc:
	IF ( @ErrorCode  <> 0 )
	  BEGIN
		ROLLBACK TRAN
	  END
	ELSE
	  BEGIN
		COMMIT TRAN
		SET @ErrorCode	= 1
	  END
	


EndProc:

	SET	XACT_ABORT OFF
	Set		nocount off
	select @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_DISCONNECT_MEMB]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_DISCONNECT_MEMB : 
--

CREATE PROCEDURE [dbo].[WZ_DISCONNECT_MEMB]
@memb___id varchar(10)
 AS
Begin	
set nocount on
	Declare  @find_id varchar(10)	
	Declare @ConnectStat tinyint
	Set @ConnectStat = 0		-- ?? ?? ? 1 = ??, 0 = ??X
	Set @find_id = 'NOT'
	select @find_id = S.memb___id from MEMB_STAT S INNER JOIN MEMB_INFO I ON S.memb___id = I.memb___id 
	       where I.memb___id = @memb___id

	if( @find_id <> 'NOT' )	-- ?? ?? ??? ?? ??? ???? ???? ??
	begin		
		update MEMB_STAT set ConnectStat = @ConnectStat, DisConnectTM = getdate()
		 where memb___id = @memb___id
	end
end
GO
/****** Object:  StoredProcedure [dbo].[WZ_DesblocAccount]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_DesblocAccount] 
@Account varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

UPDATE MEMB_INFO SET bloc_code = 0 where memb___id = @Account and bloc_code = 1 and bloc_expire < GETDATE()

UPDATE Character SET CtlCode = 0 where AccountID = @Account and CtlCode = 1 and bloc_expire < GETDATE()

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_DelMail]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_DelMail : 
--

CREATE procedure [dbo].[WZ_DelMail]
	@Name varchar(10),  @MemoIndex int
as 

BEGIN
	DECLARE @ErrorCode int
	DECLARE @UserGuid  int

	SET	XACT_ABORT ON
	Set	nocount on 	

	SET @ErrorCode = 0

	-- Name GUID? ??????
	if NOT EXISTS ( select GUID FROM T_FriendMain where Name=@Name)
	  BEGIN
		SET @ErrorCode = 2
		GOTO EndProc

	  END
	else
	  BEGIN
		select @UserGuid = GUID FROM T_FriendMain where Name=@Name
	
		IF ( @@Error  <> 0   )
		begin
			SET @ErrorCode = 3
			GOTO EndProc
		end
	
	  END

	if NOT EXISTS ( select MemoIndex FROM T_FriendMail  where MemoIndex=@MemoIndex AND GUID=@UserGuid)
	  BEGIN
		SET @ErrorCode = 4
		GOTO EndProc
	  END

	BEGIN TRAN

	-- ??? ?????.
	DELETE FROM T_FriendMail where MemoIndex=@MemoIndex AND GUID=@UserGuid
	IF ( @@Error  <> 0 )
		SET @ErrorCode	= 5
	else 
	  BEGIN
		update T_FriendMain set MemoTotal=MemoTotal-1 where GUID = @UserGuid
		IF ( @@Error  <> 0 )
		begin
			SET @ErrorCode	= 6
		end
	  END

	IF ( @ErrorCode  <> 0 )
	  BEGIN
		ROLLBACK TRAN
	  END
	ELSE
	  BEGIN
		COMMIT TRAN
		SET @ErrorCode	= 1
	  END
	
EndProc:

	SET	XACT_ABORT OFF
	Set		nocount off
	select @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_DeleteCharacter]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_DeleteCharacter] 
@Account varchar(10),
@Name varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET	XACT_ABORT ON

DECLARE @Result tinyint

SET @Result = 0

If NOT EXISTS ( SELECT  Name  FROM  Character WHERE Name = @Name )
	begin
		SET @Result	= 0
	end
else
	begin
		SET @Result = 1
		DELETE FROM Character WHERE AccountID = @Account AND Name= @Name
		DELETE FROM OptionData WHERE Name = @Name
		DELETE FROM QuestKillCount WHERE Name = @Name
		DELETE FROM MasterSkillTree WHERE Name = @Name
		DELETE FROM EventLeoTheHelper WHERE Name = @Name
		DELETE FROM EventSantaClaus WHERE Name = @Name
		DELETE FROM RankingDuel WHERE Name = @Name
		DELETE FROM RankingBloodCastle WHERE Name = @Name
		DELETE FROM RankingChaosCastle WHERE Name = @Name
		DELETE FROM RankingDevilSquare WHERE Name = @Name
		DELETE FROM RankingIllusionTemple WHERE Name = @Name
		DELETE FROM RankingKingPlayer WHERE Name = @Name
	end

SELECT @Result

SET NOCOUNT OFF
SET	XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_CW_InfoSave]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[WZ_CW_InfoSave]

@iMapServerGroup int,
@iState int,
@iOccupy int

AS
Begin
set nocount on

UPDATE WZ_CW_INFO
SET CRYWOLF_OCCUFY=@iOccupy, CRYWOLF_STATE=@iState
WHERE MAP_SVR_GROUP=@iMapServerGroup

end
GO
/****** Object:  StoredProcedure [dbo].[WZ_CW_InfoLoad]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_CW_InfoLoad]

@MapServerGroup int
AS
Begin
set nocount on

SELECT CRYWOLF_OCCUFY, CRYWOLF_STATE FROM WZ_CW_INFO
WHERE MAP_SVR_GROUP=@MapServerGroup

end
GO
/****** Object:  StoredProcedure [dbo].[WZ_WriteMail]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_WriteMail : 
--

-- ??? ????.
/*
 return 
 
 2 : ?? ???? GUID? ???? ???.
 3 : ?? ???? ?? ???? ???? ? ? ??.
 4 : ??? ????? ????
 5 : ??? ?? ??? ?????.
 6 : ??? ?? 6 ???
 10 ?? : ??
*/
CREATE procedure [dbo].[WZ_WriteMail]
	@SendName 	varchar(10), 
	@RecvName 	varchar(10),
	@Subject	varchar(32),
	@Dir		tinyint,
	@Act		tinyint

as
BEGIN
	Set		nocount on 	

	DECLARE 	@userguid	int
	DECLARE 	@memocount	int
	DECLARE	@return		int
	DECLARE	@MemoTotal	int
	DECLARE 	@FriendLevel  	int

	SET	XACT_ABORT ON

	SET @return	= 0

	-- ?? ???? GUID? ???
	SELECT @userguid=GUID, @MemoTotal=MemoTotal FROM T_FriendMain where Name= @RecvName
	if( @@ROWCOUNT < 1 )
	BEGIN
		SET @return = 2
		GOTO EndProc
	END

	IF( @MemoTotal > 49 )
	BEGIN
		SET @return = 5
		GOTO EndProc
	END

	-- ??? ??? ???. 
	select  @FriendLevel=cLevel FROM Character where Name=@RecvName
	IF( @@Error <> 0 )
	  begin
		SET @return = 2		
		GOTO EndProc
	  end
	ELSE 
	  BEGIN
		-- ??? 6?? ??? 
		if( @FriendLevel < 6 )
		  begin
			SET @return = 6
			GOTO EndProc
		  end
	  END

	begin transaction

	-- ?? ???? ?? ??? ???.
	update T_FriendMain set @memocount = MemoCount = MemoCount+1, MemoTotal=MemoTotal+1 where Name = @RecvName
	if( @@error <> 0 )
	BEGIN
		SET @return = 3
		GOTO EndProcTran
	END	

		
	-- ??? ????.
	INSERT INTO T_FriendMail (MemoIndex, GUID, FriendName, wDate, Subject,bRead,  Dir,  Act) VALUES(@memocount,@userguid, @SendName, getdate(), @Subject, 0,  @Dir, @Act)
	if( @@error <> 0 )
	BEGIN
		SET @return = 4
		GOTO EndProcTran
	END

EndProcTran:
	if ( @return  <> 0 )
	begin	
		rollback transaction
	end 
	else
	begin
		commit transaction
		SET @return = @memocount
	end	
	
EndProc:
	SET	XACT_ABORT OFF
	Set		nocount off
	
	SELECT @return, @userguid
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_WaitFriendDel]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_WaitFriendDel : 
--

-- ??? ???? ????.
CREATE procedure [dbo].[WZ_WaitFriendDel]
	@Name varchar(10),  @FriendName varchar(10)

as
BEGIN
	DECLARE @ErrorCode int
	DECLARE @UserGuid  int
	DECLARE @FriendGuid  int

	Set		nocount on 	

	SET @ErrorCode = 2

	-- ?? GUID? ???.
	if NOT EXISTS ( select GUID FROM T_FriendMain where Name=@Name)
	  BEGIN
		SET @ErrorCode = 0
		GOTO EndProc

	  END
	else
	  BEGIN
		select @UserGuid = GUID FROM T_FriendMain where Name=@Name
	
		IF ( @@Error  <> 0   )
		begin
			SET @ErrorCode = 7
		end

	  END

	-- ??? GUID? ???.
	if NOT EXISTS ( select GUID FROM T_FriendMain where Name=@FriendName )
	  BEGIN
		SET @ErrorCode = 0
		GOTO EndProc
	  END
 	ELSE
	  BEGIN
		select @FriendGuid = GUID FROM T_FriendMain where Name=@FriendName

		IF ( @@Error  <> 0 )
		begin
			SET @ErrorCode = 7
		end

	end

	-- ?????? ???? ??? ????.
	if NOT EXISTS (SELECT GUID FROM T_WaitFriend where GUID = @UserGuid AND FriendGuid = @FriendGuid  )
	begin
		SET @ErrorCode = 0
		GOTO EndProc
	end
	
	-- ????.
	DELETE FROM T_WaitFriend where GUID = @UserGuid AND FriendGuid = @FriendGuid  
	
	IF ( @@Error  <> 0 )
		SET @ErrorCode	= @@Error

	-- ? #BUG_FIX_20040421_03
	IF( @ErrorCode = 2 )
	BEGIN
		UPDATE T_FriendList SET Del=1 where GUID=@FriendGuid AND FriendGuid=@UserGuid
	END
	-- ? #BUG_FIX_20040421_03	

EndProc:

	Set		nocount off
	select @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_WaitFriendAdd]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_WaitFriendAdd : 
--

/*  ?? ?? ??? ??? ????.
-- Name :?? ?? 
-- FriendName : ?? ??

return : 
	0 : ??,
 	2 : ?? GUID ?? ??
       	3 : ?? GUID ?? ??
	4 : ?? ?? ??
	5 : ?? ?? ??
	6 : ?? ??? 6 ???

-- ** ?? ???? ?? ???? ?
*/
CREATE procedure [dbo].[WZ_WaitFriendAdd]
	@Name varchar(10), @FriendName varchar(10)
as
BEGIN
	DECLARE @ErrorCode int
	DECLARE @UserGuid  int
	DECLARE @FriendGuid  int
	DECLARE @FriendLevel  int

	SET NOCOUNT ON
	SET	XACT_ABORT ON
	

	SET @ErrorCode = 1

	-- GUID? ???.
	if EXISTS (select  GUID FROM T_FriendMain where Name=@Name)
  	  BEGIN
		select @UserGuid = GUID FROM T_FriendMain where Name=@Name
		IF ( @@Error  <> 0 )
		BEGIN
			SET @ErrorCode	= 7
			GOTO EndProc
		END
	  END
	else
	  BEGIN
		SET @ErrorCode	= 0
		GOTO EndProc
	  END

	-- GUID? ???.
	if EXISTS (select  GUID FROM T_FriendMain where Name=@FriendName)
	  BEGIN
		select @FriendGuid = GUID FROM T_FriendMain where Name=@FriendName
		IF ( @@Error  <> 0 )
		BEGIN
			SET @ErrorCode	= 7
			GOTO EndProc
		END
  	  END
	else
	  BEGIN
		SET @ErrorCode	= 0
		GOTO EndProc
  	  END

	-- ??? ??? ???. 
	select  @FriendLevel=cLevel FROM Character where Name=@FriendName
	IF( @@Error <> 0 )
	  begin
		SET @ErrorCode = 7	
		GOTO EndProc
	  end
	ELSE 
	  BEGIN
		-- ??? 6?? ??? 
		if( @FriendLevel < 6 )
		  begin
			SET @ErrorCode = 6
			GOTO EndProc
		  end
	  END

	if EXISTS (SELECT GUID FROM T_FriendList where GUID = @UserGuid AND FriendGuid = @FriendGuid  )
	begin
		SET @ErrorCode = 4
		GOTO EndProc
	end

	BEGIN TRAN

	-- ??? ??? ?? ???? ???..
	if EXISTS (SELECT GUID FROM T_FriendList where GUID = @FriendGuid AND FriendGuid =  @UserGuid )
	begin
		UPDATE T_FriendList SET Del=0 where GUID=@FriendGuid AND FriendGuid=@UserGuid
		SET @ErrorCode = 8
		GOTO EndTranProc
	end

	-- ?? ?? ???? ?????.
	INSERT INTO T_FriendList (GUID, FriendGuid, FriendName, Del ) 
		VALUES ( @UserGuid, @FriendGuid, @FriendName, 1)
	
	IF ( @@Error  <> 0 )
	BEGIN
		SET @ErrorCode	= 7
		GOTO EndTranProc
	END	

	-- ??? ?? ??? ??? ???
	INSERT INTO T_WaitFriend (GUID, FriendName, FriendGuid ) 
				VALUES ( @FriendGuid, @Name, @UserGuid)
	
	IF ( @@Error  <> 0 )
	BEGIN
		SET @ErrorCode	= 7
		GOTO EndTranProc
	END


EndTranProc:
	IF ( (@ErrorCode  = 1) OR (@ErrorCode  = 8) )
	  BEGIN
		COMMIT TRAN
	  END
	ELSE
	  BEGIN
		ROLLBACK TRAN
	  END
	
EndProc:

	SET	XACT_ABORT OFF

	SET NOCOUNT OFF

	select @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_UserGuidCreate]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_UserGuidCreate : 
--

/*
-- ??? ?? GUID? ???? ???? GUID? ????.

*/
CREATE procedure [dbo].[WZ_UserGuidCreate]
	@Name varchar(10)
as 
BEGIN
	DECLARE @ErrorCode int
	DECLARE @UserGuid  int

	SET @ErrorCode = 1
	SET @UserGuid = -1

	SET	XACT_ABORT ON
	Set		nocount on 		


	-- GUID? ??????
	if EXISTS ( select GUID FROM T_CGuid where Name=@Name ) 
	  BEGIN
		SET @ErrorCode = 0
		goto EndProc
	  END

	BEGIN TRAN

	-- ???? ????? GUID? ????.
	INSERT INTO T_CGuid (Name) VALUES(@Name)

	IF ( @@Error  <> 0 )
	  BEGIN
		SET @ErrorCode	= 2
	  END
	ELSE 
	  BEGIN
		select @UserGuid = GUID FROM T_CGuid where Name=@Name
		IF ( @@Error  <> 0 )
		  BEGIN
			SET @ErrorCode	= 3
		  END
		ELSE 
		  BEGIN
			INSERT INTO T_FriendMain ( GUID, Name, FriendCount, MemoCount) VALUES(@UserGuid, @Name,1,10)
			IF ( @@Error  <> 0 )
				SET @ErrorCode	= 4
		  END
	  END

EndTranProc:
	IF ( @@Error  <> 0 )
		ROLLBACK TRAN
	ELSE COMMIT TRAN

EndProc:
	select @ErrorCode
	SET	XACT_ABORT OFF

	Set		nocount off
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_TvTRanking]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_TvTRanking] 
@Account varchar(10),
@Name varchar(10),
@KillCount int,
@DeadCount int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

IF NOT EXISTS (SELECT Name FROM RankingTvT WHERE Name=@Name)
BEGIN

	 INSERT INTO RankingTvT (Name,Kills,Deads) VALUES (@Name,@KillCount,@DeadCount)

END
ELSE
BEGIN

	UPDATE RankingTvT SET Kills=Kills+@KillCount, Deads=Deads+@DeadCount WHERE Name=@Name

END

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetRewardAll]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_SetRewardAll] 
@AccountGM varchar(10),
@NameGM varchar(10),
@Type int,
@Value int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

-- Tipo 1: Update Cash | Wcoin
	IF @Type = 1 
	BEGIN
		--UPDATE CashShopData SET WCoinC = WCoinC + @Value
		--Para Season 4
		UPDATE MEMB_INFO SET Cash = Cash + @Value
	END
	
-- Tipo 2: Update Gold | WcoinP
	IF @Type = 2 
	BEGIN
		--UPDATE CashShopData SET WCoinP = WCoinP + @Value
		--Para Season 4
		UPDATE MEMB_INFO SET Gold = Gold + @Value 
	END

-- Tipo 3: Update PcPoints | GoblinPoints
	IF @Type = 3 
	BEGIN
		--UPDATE CashShopData SET GoblinPoint = GoblinPoint + @Value
		--Para Season 4
		UPDATE PcPointdata SET PcPoint = PcPoint + @Value 
	END
	
SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetReward]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[WZ_SetReward] 
@Account varchar(10),
@Name varchar(10),
@AccountGM varchar(10),
@NameGM varchar(10),
@Type int,
@Value int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

-- Tipo 1: Update Cash | Wcoin
	IF @Type = 1 
	BEGIN
		--UPDATE CashShopData SET WCoinC = WCoinC + @Value WHERE AccountID = @Account
		--Para Season 4
		UPDATE MEMB_INFO SET Cash = Cash + @Value WHERE memb___id = @Account 
	END
	
-- Tipo 2: Update Gold | WcoinP
	IF @Type = 2 
	BEGIN
		--UPDATE CashShopData SET WCoinP = WCoinP + @Value WHERE AccountID = @Account
		--Para Season 4
		UPDATE MEMB_INFO SET Gold = Gold + @Value WHERE memb___id = @Account 
	END

-- Tipo 3: Update PcPoints | GoblinPoints
	IF @Type = 3 
	BEGIN
		--UPDATE CashShopData SET GoblinPoint = GoblinPoint + @Value WHERE AccountID = @Account
		--Para Season 4
		UPDATE PcPointdata SET PcPoint = PcPoint + @Value WHERE AccountID = @Account 
	END
	

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetResetInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_SetResetInfo] 
@Account varchar(10),
@Name varchar(10),
@Reset int,
@ResetDay int,
@ResetWek int,
@ResetMon int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

UPDATE Character SET ResetCount=@Reset WHERE AccountID=@Account AND Name=@Name
UPDATE PcPointData Set PcPoint=PcPoint +1000 WHERE AccountID=@account

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetMasterResetInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_SetMasterResetInfo] 
@Account varchar(10),
@Name varchar(10),
@Reset int,
@MasterReset int,
@MasterResetDay int,
@MasterResetWek int,
@MasterResetMon int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

UPDATE Character SET ResetCount=@Reset,MasterResetCount=@MasterReset WHERE AccountID=@Account AND Name=@Name

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetMarryInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_SetMarryInfo] @name varchar(10), @MarryCharacter varchar(10)
AS
BEGIN


SET NOCOUNT ON
SET XACT_ABORT ON


INSERT INTO [dbo].[Marry] (Character, MarryCharacter) VALUES  (@name , @MarryCharacter);


SET NOCOUNT OFF
SET XACT_ABORT OFF


END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetGuildDelete]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_SetGuildDelete : 
--

CREATE PROCEDURE  [dbo].[WZ_SetGuildDelete]
	@GuildName		varchar(10)
As
Begin
	SET NOCOUNT ON
	Declare		@Result		int
	Set @Result	= 1 

	Begin Transaction									
		--// Guild member db delete
		DELETE GuildMember WHERE G_Name = @GuildName		
		If @@Error <> 0 
		begin			
			Set @Result	= 0 -- DB Error 
			goto PROBLEM	
		end

		--// Guild  Main DB? ??
		DELETE Guild WHERE G_Name = @GuildName
		DELETE RankingKingGuild WHERE Name = @GuildName			
		If @@Error <> 0 
			begin
				Set @Result	= 0  --  DB Error
				goto PROBLEM	
			end	
		else goto SUCESS

	PROBLEM:
		rollback transaction
 
	SUCESS:
   		commit transaction		
				
	-- ??? RETURN
	SELECT @Result  As Result
	SET NOCOUNT OFF
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetDivorceInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_SetDivorceInfo] @name varchar(10), @MarryCharacter varchar(10)
AS
BEGIN


SET NOCOUNT ON
SET XACT_ABORT ON


DELETE FROM [dbo].[Marry] where Character = @name OR MarryCharacter = @MarryCharacter


SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetCoin]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_SetCoin] 
@Account varchar(10),
@Name varchar(10),
@Value1 int,
@Value2 int,
@Value3 int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

-- Tipo 1: Update Cash | Wcoin
	IF @Value1 > 0 or @Value1 < 0
	BEGIN
		--UPDATE CashShopData SET WCoinC = WCoinC + @Value1 WHERE AccountID = @Account
		--Para Season 4
		UPDATE MEMB_INFO SET Cash = Cash + @Value1 WHERE memb___id = @Account 
	END
	
-- Tipo 2: Update Gold | WcoinP
	IF @Value2 > 0 or @Value2 < 0
	BEGIN
		--UPDATE CashShopData SET WCoinP = WCoinP + @Value2 WHERE AccountID = @Account
		--Para Season 4
		UPDATE MEMB_INFO SET Gold = Gold + @Value2 WHERE memb___id = @Account 
	END

-- Tipo 3: Update PcPoints | GoblinPoints
	IF @Value3 > 0 or @Value3 < 0 
	BEGIN
		--UPDATE CashShopData SET GoblinPoint = GoblinPoint + @Value3 WHERE AccountID = @Account
		--Para Season 4
		UPDATE PcPointdata SET PcPoint = PcPoint + @Value3 WHERE AccountID = @Account 
	END
	

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SetAccountLevel]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_SetAccountLevel] 
@Account varchar(10),
@AccountLevel int,
@AccountExpireTime int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @CurrentAccountLevel int
DECLARE @CurrentAccountExpireDate smalldatetime

SELECT @CurrentAccountLevel=AccountLevel,@CurrentAccountExpireDate=AccountExpireDate FROM MEMB_INFO WHERE memb___id=@Account

IF(@CurrentAccountLevel = @AccountLevel)
BEGIN
	SET @CurrentAccountLevel = @CurrentAccountLevel

	SET @CurrentAccountExpireDate = DATEADD(second,@AccountExpireTime,@CurrentAccountExpireDate)
END
ELSE
BEGIN
	SET @CurrentAccountLevel = @AccountLevel

	SET @CurrentAccountExpireDate = DATEADD(second,@AccountExpireTime,getdate())
END

UPDATE MEMB_INFO SET AccountLevel=@CurrentAccountLevel,AccountExpireDate=@CurrentAccountExpireDate WHERE memb___id=@Account

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_RenameCharacter]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_RenameCharacter] 
@Account varchar(10),
@OldName varchar(10),
@NewName varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET	XACT_ABORT ON

DECLARE @Result tinyint

SET @Result = 1

If EXISTS ( SELECT  Name  FROM  Character WHERE Name = @NewName )
	begin
		SET @Result	= 1
	end
else
	begin
		SET @Result = 0		
		UPDATE Character SET Name = @NewName WHERE Name = @OldName AND AccountID = @Account
		UPDATE AccountCharacter SET GameID1 = @NewName WHERE GameID1 = @OldName AND Id = @Account
		UPDATE AccountCharacter SET GameID2 = @NewName WHERE GameID2 = @OldName AND Id = @Account
		UPDATE AccountCharacter SET GameID3 = @NewName WHERE GameID3 = @OldName AND Id = @Account
		UPDATE AccountCharacter SET GameID4 = @NewName WHERE GameID4 = @OldName AND Id = @Account
		UPDATE AccountCharacter SET GameID5 = @NewName WHERE GameID5 = @OldName AND Id = @Account
		UPDATE AccountCharacter SET GameIDC = @NewName WHERE GameIDC = @OldName AND Id = @Account
		UPDATE Guild SET G_Master = @NewName WHERE G_Master = @OldName
		UPDATE GuildMember SET Name = @NewName WHERE Name = @OldName
		UPDATE OptionData SET Name = @NewName WHERE Name = @OldName
		UPDATE T_CGuid SET Name = @NewName WHERE Name = @OldName
		UPDATE T_FriendList SET FriendName = @NewName WHERE FriendName = @OldName
		UPDATE T_FriendMail SET FriendName = @NewName WHERE FriendName = @OldName
		UPDATE T_FriendMain SET Name = @NewName WHERE Name = @OldName
		UPDATE T_WaitFriend SET FriendName = @NewName WHERE FriendName = @OldName
		UPDATE QuestKillCount SET Name = @NewName WHERE Name = @OldName
		UPDATE MasterSkillTree SET Name = @NewName WHERE Name = @OldName
		UPDATE EventLeoTheHelper SET Name = @NewName WHERE Name = @OldName
		UPDATE EventSantaClaus SET Name = @NewName WHERE Name = @OldName
		UPDATE RankingDuel SET Name = @NewName WHERE Name = @OldName
		UPDATE RankingBloodCastle SET Name = @NewName WHERE Name = @OldName
		UPDATE RankingChaosCastle SET Name = @NewName WHERE Name = @OldName
		UPDATE RankingDevilSquare SET Name = @NewName WHERE Name = @OldName
		UPDATE RankingIllusionTemple SET Name = @NewName WHERE Name = @OldName
		UPDATE RankingKingPlayer SET Name = @NewName WHERE Name = @OldName
	end

SELECT @Result

SET NOCOUNT OFF
SET	XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_RankingIllusionTemple]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_RankingIllusionTemple] 
@Account varchar(10),
@Name varchar(10),
@Score int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

IF NOT EXISTS (SELECT Name FROM RankingIllusionTemple WHERE Name=@Name)
BEGIN

	 INSERT INTO RankingIllusionTemple (Name,Score) VALUES (@Name,@Score)

END
ELSE
BEGIN

	UPDATE RankingIllusionTemple SET Score=Score+@Score WHERE Name=@Name

END

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_RankingDevilSquare]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_RankingDevilSquare] 
@Account varchar(10),
@Name varchar(10),
@Score int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

IF NOT EXISTS (SELECT Name FROM RankingDevilSquare WHERE Name=@Name)
BEGIN

	 INSERT INTO RankingDevilSquare (Name,Score) VALUES (@Name,@Score)

END
ELSE
BEGIN

	UPDATE RankingDevilSquare SET Score=Score+@Score WHERE Name=@Name

END

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_RankingChaosCastle]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_RankingChaosCastle] 
@Account varchar(10),
@Name varchar(10),
@Score int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

IF NOT EXISTS (SELECT Name FROM RankingChaosCastle WHERE Name=@Name)
BEGIN

	 INSERT INTO RankingChaosCastle (Name,Score) VALUES (@Name,@Score)

END
ELSE
BEGIN

	UPDATE RankingChaosCastle SET Score=Score+@Score WHERE Name=@Name

END

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_RankingBloodCastle]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_RankingBloodCastle] 
@Account varchar(10),
@Name varchar(10),
@Score int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

IF NOT EXISTS (SELECT Name FROM RankingBloodCastle WHERE Name=@Name)
BEGIN

	 INSERT INTO RankingBloodCastle (Name,Score) VALUES (@Name,@Score)

END
ELSE
BEGIN

	UPDATE RankingBloodCastle SET Score=Score+@Score WHERE Name=@Name

END

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GvGRanking]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_GvGRanking] 
@Guild varchar(8)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

IF NOT EXISTS (SELECT Guild FROM RankingGvG WHERE Guild=@Guild)
BEGIN

	 INSERT INTO RankingGvG (Guild,Score) VALUES (@Guild,1)
END
ELSE
BEGIN
	UPDATE RankingGvG SET Score=Score+1 WHERE Guild=@Guild
END

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GuildCreate]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_GuildCreate : 
--

CREATE procedure [dbo].[WZ_GuildCreate]
	@GuildName	varchar(8),
	@MasterName 	varchar(10)
as 
BEGIN
	DECLARE @ErrorCode int

	SET @ErrorCode = 0
	SET XACT_ABORT ON

	Set		nocount on 		
	begin transaction

	-- ??? ????.	
	INSERT	INTO Guild (G_Name, G_Master) VALUES (@GuildName, @MasterName)
	IF ( @@Error  <> 0 )
	BEGIN
		SET @ErrorCode	= 1
	END

       	-- ??? ????? ?? ???
	IF ( @ErrorCode  =  0 )
	BEGIN
		-- ?? ???? ????.
		INSERT GuildMember (Name, G_Name, G_Level) VALUES (@MasterName, @GuildName, 1)
		IF ( @@Error  <> 0 )
		BEGIN
			SET @ErrorCode	= 2
		END
	END

	IF ( @ErrorCode  <> 0 )
		rollback transaction
	ELSE
		commit transaction

	select @ErrorCode

	Set 	nocount off 
	SET XACT_ABORT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetResetInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_GetResetInfo]
@Account varchar(10),
@Name varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @Reset int
DECLARE @ResetDay int
DECLARE @ResetWek int
DECLARE @ResetMon int

SELECT @Reset=ResetCount,@ResetDay=0,@ResetWek=0,@ResetMon=0 FROM Character WHERE AccountID=@Account AND Name=@Name

SELECT @Reset AS Reset,@ResetDay AS ResetDay,@ResetWek AS ResetWek,@ResetMon AS ResetMon

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetMasterResetInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_GetMasterResetInfo]
@Account varchar(10),
@Name varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @MasterReset int
DECLARE @MasterResetDay int
DECLARE @MasterResetWek int
DECLARE @MasterResetMon int

SELECT @MasterReset=MasterResetCount,@MasterResetDay=0,@MasterResetWek=0,@MasterResetMon=0 FROM Character WHERE AccountID=@Account AND Name=@Name

SELECT @MasterReset AS MasterReset,@MasterResetDay AS MasterResetDay,@MasterResetWek AS MasterResetWek,@MasterResetMon AS MasterResetMon

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetMarryInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[WZ_GetMarryInfo] @name varchar(10), @MarryCharacter varchar(10)
AS
BEGIN


SET NOCOUNT ON
SET XACT_ABORT ON


DECLARE @countYou int
DECLARE @countHim int


DECLARE @Startdate datetime2 = '2016-01-01 00:00:00.0000000';
DECLARE @marriedOnEnd datetime2
DECLARE @marriedOn int


DECLARE @nameGet1 varchar(10)
DECLARE @nameGet2 varchar(10)
/*DECLARE @marriedOn int*/
SELECT @countYou=Count(*) FROM [dbo].[Marry] WHERE Character = @name OR MarryCharacter = @name /*You are already married*/
SELECT @countHim=Count(*) FROM [dbo].[Marry] WHERE Character = @MarryCharacter OR MarryCharacter = @MarryCharacter /*He/She is already married*/
SELECT @nameGet1=MarryCharacter FROM [dbo].[Marry] WHERE Character = @name
SELECT @nameGet2=Character FROM [dbo].[Marry] WHERE MarryCharacter = @name


SELECT @marriedOnEnd=MarriedOn FROM [dbo].[Marry] WHERE Character = @name OR MarryCharacter = @name /*Married date*/
SELECT @marriedOn=DATEDIFF(SECOND, @Startdate, @marriedOnEnd)


SELECT @countYou AS CountYou, @countHim AS CountHim, @marriedOn AS MarriedOn, @nameGet1 AS NameGet1, @nameGet2 AS NameGet2


SET NOCOUNT OFF
SET XACT_ABORT OFF


END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetItemSerial]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_GetItemSerial : 
--

CREATE procedure [dbo].[WZ_GetItemSerial]
as
BEGIN	
	DECLARE @ItemSerial	int
	set nocount on
	begin transaction

		update GameServerInfo set @ItemSerial = ItemCount = ItemCount+1
			
		if ( @@error  <> 0 )
		begin	
			rollback transaction
			select -1
		end 
		else
		begin
			commit transaction				
			select @ItemSerial
		end
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetCoin]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_GetCoin]
@Account varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @Coin1 int
DECLARE @Coin2 int
DECLARE @Coin3 int

SELECT @Coin1=Cash FROM MEMB_INFO WHERE memb___id=@Account
SELECT @Coin2=Gold FROM MEMB_INFO WHERE memb___id=@Account
SELECT @Coin3=PcPoint FROM PcPointData where AccountID=@Account 

SELECT @Coin1 AS Coin1,@Coin2 AS Coin2,@Coin3 AS Coin3

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetAccountLevel]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_GetAccountLevel] 
@Account varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @CurrentAccountLevel int
DECLARE @CurrentAccountExpireDate smalldatetime

SELECT @CurrentAccountLevel = AccountLevel, @CurrentAccountExpireDate = AccountExpireDate FROM MEMB_INFO WHERE memb___id = @account

IF (@CurrentAccountLevel <> 0 AND GETDATE() > @CurrentAccountExpireDate)
BEGIN
	SET @CurrentAccountLevel = 0
	UPDATE MEMB_INFO SET AccountLevel = @CurrentAccountLevel WHERE memb___id = @account
END

SELECT @CurrentAccountLevel as AccountLevel, @CurrentAccountExpireDate as AccountExpireDate

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_CustomTop]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[WZ_CustomTop]
	@type		SMALLINT,
	@class		SMALLINT
As
Begin

	SET NOCOUNT ON	

	IF @type = 1 
	BEGIN
		IF @class < 0
			Select top 5 name as VALUE1, resetcount as VALUE2 from Character order by ResetCount desc
		ELSE
			Select top 5 name as VALUE1, resetcount as VALUE2 from Character where Class >= @class and Class <= @class+2 order by ResetCount desc
	END
	
	IF @type = 2 
	BEGIN
		IF @class < 0
			Select top 5 name as VALUE1, masterresetcount as VALUE2 from Character order by masterResetCount desc,ResetCount desc
		ELSE
			Select top 5 name as VALUE1, masterresetcount as VALUE2 from Character where Class >= @class and Class <= @class+2 order by masterResetCount desc,ResetCount desc
	END

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CustomRanking]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	[dbo].[WZ_CustomRanking]
	@type		SMALLINT
As
Begin
	
	SET NOCOUNT ON	

	IF @type = 0 
	BEGIN
			Select top 10 name as VALUE1, masterresetcount as VALUE2 from Character order by MasterResetCount desc, ResetCount desc
	END
	
	IF @type = 1 
	BEGIN
			Select top 10 name as VALUE1, resetcount as VALUE2 from Character order by ResetCount desc, cLevel desc
	END
	
	IF @type = 2 
	BEGIN
			Select top 10 name as VALUE1, cLevel as VALUE2 from Character order by cLevel desc
	END
	
	IF @type = 3 
	BEGIN
			Select top 10 name as VALUE1, Score as VALUE2 from RankingBloodCastle order by Score desc
	END
	
	IF @type = 4 
	BEGIN
			Select top 10 name as VALUE1, Score as VALUE2 from RankingDevilSquare order by Score desc
	END
	
	
	--WAITFOR DELAY '00:00:02';

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CustomMonsterReward]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_CustomMonsterReward] 
@Account varchar(10),
@Name varchar(10),
@MonsterClass int,
@MapNumber int,
@RewardValue1 int,
@RewardValue2 int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

UPDATE MEMB_INFO SET Cash=Cash+0 WHERE memb___id=@Account

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_CustomArenaRanking]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[WZ_CustomArenaRanking] 
@Account varchar(10),
@Name varchar(10),
@ArenaNumber int,
@UserScore int,
@UserRank int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

IF(@ArenaNumber = 0)
BEGIN

IF(@UserRank = 1)
BEGIN

UPDATE MEMB_INFO SET Cash=Cash+0 WHERE memb___id=@Account

END

END

SET NOCOUNT OFF
SET XACT_ABORT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_SetSiegeGuildOK]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_SetSiegeGuildOK : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ???? ???? ??? ????? ????? ??? ??.
--// ??	: ???? 1? 
--// ???	: 2004.12.04
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_SetSiegeGuildOK]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN					-- ????? ??? ????.
		UPDATE MuCastle_DATA
		SET SIEGE_GUILDLIST_SETTED = 1
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		SELECT 1 As QueryResult	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult	-- ????? ??? ???? ???? ????? ????.
	END

	
	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_SetSiegeGuildInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_SetSiegeGuildInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ???? ???? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.12.04
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_SetSiegeGuildInfo]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@szGuildName		VARCHAR(8),	-- ????? ? ????
	@iGuildID		INT,		-- ?/?? ?? ??? ?
	@iGuildInvolved		INT,		-- ??? ?? ??? ????? ?
	@iGuildScore		INT
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	INSERT INTO MuCastle_SIEGE_GUILDLIST
	VALUES (@iMapSvrGroup, @szGuildName, @iGuildID, @iGuildInvolved, @iGuildScore)
	
	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ResetSiegeGuildInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ResetSiegeGuildInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ???? ???? ??? ??.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ResetSiegeGuildInfo]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		-- ???? ????? ??? ??? ??.
		DELETE MuCastle_SIEGE_GUILDLIST
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		SELECT 1 As QueryResult	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult	-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ResetRegSiegeInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ResetRegSiegeInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ???? ?? ???? ??? ??.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ResetRegSiegeInfo]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		-- ???? ????? ??? ??? ??.
		DELETE MuCastle_REG_SIEGE
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		SELECT 1 As QueryResult	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult	-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ResetCastleTaxInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ResetCastleTaxInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? ??? ??.
--// ??	: ???? 1? 
--// ???	: 2004.12.21
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ResetCastleTaxInfo]
	@iMapSvrGroup		SMALLINT			-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		UPDATE MuCastle_DATA 
		SET MONEY = 0, TAX_RATE_CHAOS = 0, TAX_RATE_STORE = 0, TAX_HUNT_ZONE = 0
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		SELECT 1 As QueryResult			-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult			-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ResetCastleSiege]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ResetCastleSiege : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ????? ????? (?? ??? ??? ?)
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ResetCastleSiege]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		-- 1 . ?? ??? ???? ??? ???? ??? ??.
		UPDATE MuCastle_DATA 
		SET 	SIEGE_GUILDLIST_SETTED = 0,
			SIEGE_ENDED = 0
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		-- 2 . ?? ???? ??? ??? ??.
		-- ???? ?? ??? ?? ? ??? ??? ? ??? ??? ?? -> ???? ?? ? ?? ??
--		DELETE MuCastle_REG_SIEGE
--		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		--DBCC CHECKIDENT ('MuCastle_REG_SIEGE', RESEED, 0)

		-- 3 . ???? ????? ??? ??? ??.
		DELETE MuCastle_SIEGE_GUILDLIST
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		SELECT 1 As QueryResult	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult	-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ReqRegGuildMark]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ReqRegGuildMark : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ???? ??? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ReqRegGuildMark]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@szGuildName		VARCHAR(8)	-- ????? ? ????
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName)
	BEGIN
		DECLARE	@bIS_GIVEUP	INT
		SELECT @bIS_GIVEUP = IS_GIVEUP FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName

		-- ???? ??? ??? ?? ???.
		IF (@bIS_GIVEUP = 0)
		BEGIN
			UPDATE MuCastle_REG_SIEGE 
			SET REG_MARKS = REG_MARKS + 1
			WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName
	
			SELECT 1 As QueryResult, REG_MARKS
			FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED)
			WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName
		END
		ELSE
		BEGIN
			SELECT 0 As QueryResult, 0 As REG_MARKS
		END
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult, 0 As REG_MARKS
	END


	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ReqRegAttackGuild]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ReqRegAttackGuild : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ???? ??? ??? ??? ??.
--// ??	: ???? 1? 
--// ???	: 2004.11.22
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ReqRegAttackGuild]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@szGuildName		VARCHAR(8)	-- ????? ? ????
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	DECLARE	@iMaxRegGuildCount	INT					-- ??? ?? ??? ? ?? ?? ?
	DECLARE	@iCurRegGuildCount	INT					-- ?? ??? ??? ?? ?
	SET 		@iMaxRegGuildCount	= 100

	SELECT @iCurRegGuildCount = COUNT(*) FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED)  WHERE MAP_SVR_GROUP = @iMapSvrGroup
	IF (@iCurRegGuildCount >= @iMaxRegGuildCount)
	BEGIN
			SELECT 6 As QueryResult					-- ??? ??? ?? N?? ???
	END
	ELSE
	BEGIN
		IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED) 
					WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName)
		BEGIN
			SELECT 2 As QueryResult					-- ?? ???? ??
		END
		ELSE
		BEGIN
			DECLARE @szOwnGuildName		VARCHAR(8)
			SELECT @szOwnGuildName = OWNER_GUILD FROM MuCastle_DATA WHERE MAP_SVR_GROUP = @iMapSvrGroup
	
			-- ?? ??? ??? ??? ??
			IF (@szOwnGuildName = @szGuildName)
			BEGIN
				SELECT 3 As QueryResult				-- ??? ???
			END
			ELSE
			BEGIN
				IF NOT EXISTS ( SELECT G_Name FROM Guild  WITH (READUNCOMMITTED) WHERE G_Name = @szGuildName)
				BEGIN
					SELECT 4 As QueryResult			-- ????? ???? ??
				END
				ELSE
				BEGIN
					DECLARE @szGuildMaster			VARCHAR(10)
					DECLARE @iGuildMasterLevel			INT
					DECLARE @iGuildMemberCount			INT
					
					SELECT @szGuildMaster = G_Master FROM Guild WHERE G_Name = @szGuildName
					SELECT @iGuildMasterLevel = cLevel FROM Character WHERE Name = @szGuildMaster
					SELECT @iGuildMemberCount = COUNT(*) FROM GuildMember WHERE G_Name = @szGuildName
					
					IF (@iGuildMasterLevel <1)
					BEGIN
						SELECT 5 As QueryResult		-- ?????? ??? ??
					END
					ELSE
					BEGIN
						IF (@iGuildMemberCount <1)
						BEGIN
							SELECT 8 As QueryResult	-- ??? ?? ??
						END
						ELSE
						BEGIN
							DECLARE @iMAX_SEQNUM	INT	-- ?? ?? ????
							DECLARE @iNXT_SEQNUM	INT	-- ?? ????
							SELECT @iMAX_SEQNUM = MAX(SEQ_NUM) FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED)  WHERE MAP_SVR_GROUP = @iMapSvrGroup
							
							IF (@iMAX_SEQNUM IS NULL)
								SET @iNXT_SEQNUM	= 1
							ELSE
								SET @iNXT_SEQNUM	= @iMAX_SEQNUM + 1

							INSERT INTO MuCastle_REG_SIEGE 
							VALUES (@iMapSvrGroup, @szGuildName, 0, 0, @iNXT_SEQNUM)
					
							SELECT 1 As QueryResult	-- ?? ??
						END
					END
				END
			END
		END
	END

	
	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ReqNpcUpgrade]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ReqNpcUpgrade : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ??? NPC? ????? ??.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ReqNpcUpgrade]
	@iMapSvrGroup		SMALLINT,		-- ??? ??
	@iNpcNumber		INT,			-- NPC??
	@iNpcIndex		INT,			-- NPC???
	@iNpcUpType		INT,			-- NPC????? ?? (1:???/2:???/3:??HP)
	@iNpcUpValue		INT			-- NPC????? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_NPC  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex)
	BEGIN
		IF (@iNpcUpType = 1)			-- ???
		BEGIN
			UPDATE MuCastle_NPC 
			SET NPC_DF_LEVEL = @iNpcUpValue
			WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex
	
			SELECT 1 As QueryResult	-- NPC? ???? ????? ????.
		END
		ELSE IF (@iNpcUpType = 2) 		-- ???
		BEGIN
			UPDATE MuCastle_NPC 
			SET NPC_RG_LEVEL = @iNpcUpValue
			WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex
	
			SELECT 1 As QueryResult	-- NPC? ???? ????? ????.
		END
		ELSE IF (@iNpcUpType = 3) 		-- ??HP
		BEGIN
			UPDATE MuCastle_NPC 
			SET NPC_MAXHP = @iNpcUpValue, NPC_HP = @iNpcUpValue
			WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex
	
			SELECT 1 As QueryResult	-- NPC? ???? ????? ????.
		END
		ELSE
		BEGIN
			SELECT 2 As QueryResult	-- ????? ??? ?????.
		END
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult		-- NPC? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ReqNpcUpdate]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ReqNpcUpdate : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ??? NPC ??? ???? -> NPC ??? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.12.15
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ReqNpcUpdate]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@iNpcNumber		INT,		-- NPC??
	@iNpcIndex		INT,		-- NPC???
	@iNpcDfLevel		INT,		-- ??? ??
	@iNpcRgLevel		INT,		-- ???? ??
	@iNpcMaxHp		INT,		-- ?? HP
	@iNpcHp		INT,		-- HP
	@btNpcX		TINYINT,	-- ?? - X
	@btNpcY		TINYINT,	-- ?? - Y
	@btNpcDIR		TINYINT	-- ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_NPC  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex)
	BEGIN
		-- ?? NPC? ???? -> ?? ??
		
		UPDATE MuCastle_NPC
		SET	NPC_NUMBER		= @iNpcNumber, 
			NPC_INDEX		= @iNpcIndex, 
			NPC_DF_LEVEL	= @iNpcDfLevel, 
			NPC_RG_LEVEL	= @iNpcRgLevel, 
			NPC_MAXHP		= @iNpcMaxHp, 
			NPC_HP		= @iNpcHp,
			NPC_X			= @btNpcX,
			NPC_Y			= @btNpcY, 
			NPC_DIR		= @btNpcDIR
		WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex
	END
	ELSE
	BEGIN
		-- ?? NPC? ???? ??? -> ?? ??

		INSERT INTO MuCastle_NPC VALUES (
			@iMapSvrGroup	,	-- MAP_SVR_GROUP
			@iNpcNumber,		-- NPC_NUMBER
			@iNpcIndex,		-- NPC_INDEX
			@iNpcDfLevel,		-- NPC_DF_LEVEL
			@iNpcRgLevel,		-- NPC_RG_LEVEL
			@iNpcMaxHp,		-- NPC_MAXHP
			@iNpcHp,		-- NPC_HP
			@btNpcX,		-- NPC_X
			@btNpcY,		-- NPC_Y
			@btNpcDIR,		-- NPC_DIR
			GetDate()		-- NPC_CREATEDATE
		)
	END



	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ReqNpcRepair]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ReqNpcRepair : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ??? NPC? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ReqNpcRepair]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@iNpcNumber		INT,		-- NPC??
	@iNpcIndex		INT		-- NPC???
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_NPC  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex)
	BEGIN
		UPDATE MuCastle_NPC 
		SET  NPC_HP = NPC_MAXHP
		WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex

		SELECT 1 As QueryResult, NPC_HP, NPC_MAXHP		-- NPC? ???? ????? ????.
		FROM MuCastle_NPC  WITH (READUNCOMMITTED) 
		WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex
	END
	ELSE
	BEGIN
		SELECT 2 As QueryResult, 0 As NPC_HP, 0 As NPC_MAXHP	-- NPC? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ReqNpcRemove]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ReqNpcRemove : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ??? NPC? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.26
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ReqNpcRemove]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@iNpcNumber		INT,		-- NPC??
	@iNpcIndex		INT		-- NPC???
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_NPC  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex)
	BEGIN
		DELETE MuCastle_NPC
		WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex

		SELECT 1 As QueryResult	-- NPC? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 2 As QueryResult	-- NPC? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ReqNpcBuy]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ReqNpcBuy : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ??? NPC? ????. (NPC ??? ????.)
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ReqNpcBuy]
	@iMapSvrGroup		SMALLINT,		-- ??? ??
	@iNpcNumber		INT,			-- NPC??
	@iNpcIndex		INT,			-- NPC???
	@iNpcDfLevel		INT,			-- ??? ??
	@iNpcRgLevel		INT,			-- ???? ??
	@iNpcMaxHp		INT,			-- ?? HP
	@iNpcHp		INT,			-- HP
	@btNpcX		TINYINT,		-- ?? - X
	@btNpcY		TINYINT,		-- ?? - Y
	@btNpcDIR		TINYINT		-- ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_NPC  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and NPC_NUMBER = @iNpcNumber and NPC_INDEX = @iNpcIndex)
	BEGIN
		SELECT 4 As QueryResult		-- ?? NPC? ?? ???? ??.
	END
	ELSE
	BEGIN
		INSERT INTO MuCastle_NPC VALUES (
			@iMapSvrGroup	,		-- MAP_SVR_GROUP
			@iNpcNumber,			-- NPC_NUMBER
			@iNpcIndex,			-- NPC_INDEX
			@iNpcDfLevel,			-- NPC_DF_LEVEL
			@iNpcRgLevel,			-- NPC_RG_LEVEL
			@iNpcMaxHp,			-- NPC_MAXHP
			@iNpcHp,			-- NPC_HP
			@btNpcX,			-- NPC_X
			@btNpcY,			-- NPC_Y
			@btNpcDIR,			-- NPC_DIR
			GetDate()			-- NPC_CREATEDATE
		)
		
		SELECT 1 As QueryResult		-- NPC?? ??
	END



	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ModifyTaxRate]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ModifyTaxRate : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ModifyTaxRate]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@iTaxKind		INT,		-- ??? ?? (1:????? / 2:??)
	@iTaxRate		INT		-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF (@iTaxKind = 1)			-- ??? ?? ????
	BEGIN
		IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
					WHERE MAP_SVR_GROUP = @iMapSvrGroup)
		BEGIN
			UPDATE MuCastle_DATA 
			SET TAX_RATE_CHAOS = @iTaxRate
			WHERE MAP_SVR_GROUP = @iMapSvrGroup
	
			SELECT @iTaxKind As TaxKind, 1 As QueryResult, TAX_RATE_CHAOS As TaxRate	-- ????? ??? ???? ????? ????.
			FROM MuCastle_DATA
			WHERE MAP_SVR_GROUP = @iMapSvrGroup
		END
		ELSE
		BEGIN
			SELECT @iTaxKind As TaxKind, 0 As QueryResult, 0 As TaxRate				-- ????? ??? ???? ???? ????? ????.
		END
	END
	ELSE IF (@iTaxKind = 2)			-- ?? ?? ??
	BEGIN
		IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
					WHERE MAP_SVR_GROUP = @iMapSvrGroup)
		BEGIN
			UPDATE MuCastle_DATA 
			SET TAX_RATE_STORE = @iTaxRate
			WHERE MAP_SVR_GROUP = @iMapSvrGroup
	
			SELECT @iTaxKind As TaxKind, 1 As QueryResult, TAX_RATE_STORE As TaxRate	-- ????? ??? ???? ????? ????.
			FROM MuCastle_DATA
			WHERE MAP_SVR_GROUP = @iMapSvrGroup
		END
		ELSE
		BEGIN
			SELECT @iTaxKind As TaxKind, 0 As QueryResult, 0 As TaxRate				-- ????? ??? ???? ???? ????? ????.
		END
	END
	ELSE IF (@iTaxKind = 3)			-- ??? ??? ?? ??
	BEGIN
		IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
					WHERE MAP_SVR_GROUP = @iMapSvrGroup)
		BEGIN
			UPDATE MuCastle_DATA 
			SET TAX_HUNT_ZONE = @iTaxRate
			WHERE MAP_SVR_GROUP = @iMapSvrGroup
	
			SELECT @iTaxKind As TaxKind, 1 As QueryResult, TAX_HUNT_ZONE As TaxRate	-- ????? ??? ???? ????? ????.
			FROM MuCastle_DATA
			WHERE MAP_SVR_GROUP = @iMapSvrGroup
		END
		ELSE
		BEGIN
			SELECT @iTaxKind As TaxKind, 0 As QueryResult, 0 As TaxRate				-- ????? ??? ???? ???? ????? ????.
		END
	END
	ELSE
	BEGIN
		SELECT @iTaxKind As TaxKind, 0 As QueryResult, 0 As TaxRate					-- ????? ???? ???.
	END


	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ModifySiegeEnd]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ModifySiegeEnd : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ?? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ModifySiegeEnd]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@iSiegeEnded		INT		-- ?? ?? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		UPDATE MuCastle_DATA 
		SET SIEGE_ENDED = @iSiegeEnded
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		SELECT 1 As QueryResult	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult	-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ModifyMoney]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ModifyMoney : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ModifyMoney]
	@iMapSvrGroup		SMALLINT,			-- ??? ??
	@iMoneyChange	MONEY				-- ????? ??? ?
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		DECLARE	@iTotMoney	MONEY
		SELECT @iTotMoney = MONEY FROM MuCastle_DATA
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		IF (@iTotMoney + @iMoneyChange < 0)
		BEGIN
			SELECT 2 As QueryResult, MONEY	--  ?? ?? ?? ??? ?? ???? ???? ???.
			FROM MuCastle_DATA
			WHERE MAP_SVR_GROUP = @iMapSvrGroup		
		END
		ELSE
		BEGIN
			UPDATE MuCastle_DATA 
			SET MONEY = @iTotMoney + @iMoneyChange
			WHERE MAP_SVR_GROUP = @iMapSvrGroup
	
			SELECT 1 As QueryResult, MONEY	-- ????? ??? ???? ??? ? ??? ???? ????? ????.
			FROM MuCastle_DATA
			WHERE MAP_SVR_GROUP = @iMapSvrGroup		
		END

		-- ?? ?? ????? ?? ???? ? ??? ?? ??
		INSERT MuCastle_MONEY_STATISTICS VALUES (@iMapSvrGroup, GetDate(), @iMoneyChange)
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult, 0 As MONEY		-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ModifyGuildMarkReset]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ModifyGuildMarkReset : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? ???? ????? ??? ??.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ModifyGuildMarkReset]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@szGuildName		VARCHAR(8)	-- ????? ? ????
As
Begin
	BEGIN TRANSACTION

	DECLARE		@iMarkCount	INT	-- ???? ??
	DECLARE		@bIsGiveUp	INT	-- ?? ????

	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName)
	BEGIN
		SELECT @iMarkCount = REG_MARKS, @bIsGiveUp = IS_GIVEUP
		FROM MuCastle_REG_SIEGE
		WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName

		IF (@iMarkCount > 0)
		BEGIN
			IF (@bIsGiveUp = 0)
			BEGIN
				UPDATE MuCastle_REG_SIEGE 
				SET REG_MARKS = 0
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName
		
				SELECT 1 As QueryResult, @iMarkCount As DEL_MARKS	--????? ??? ?? ??? ??? ??? ??.
			END
			ELSE
			BEGIN
				SELECT 2 As QueryResult, 0 As DEL_MARKS			--?? ??? ?????. (?? -> ?? ?)
			END
		END
		ELSE
		BEGIN
			SELECT 1 As QueryResult, 0 As DEL_MARKS				--??? ???? ???? ?? ??? ???? ??
		END
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult, 0 As DEL_MARKS					--????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ModifyGuildMarkRegCount]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ModifyGuildMarkRegCount : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? ???? ????? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ModifyGuildMarkRegCount]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@szGuildName		VARCHAR(8),	-- ????? ? ????
	@iMarkCount		INT		-- ???? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName)
	BEGIN
		UPDATE MuCastle_REG_SIEGE 
		SET REG_MARKS = @iMarkCount
		WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName

		SELECT 1 As QueryResult	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult	--????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ModifyGuildGiveUp]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ModifyGuildGiveUp : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? ????? ?? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ModifyGuildGiveUp]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@szGuildName		VARCHAR(8),	-- ????? ? ????
	@iIsGiveUp		INT		-- ?? ?? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName)
	BEGIN
		DECLARE	@iMarkCount	INT
		SELECT @iMarkCount = REG_MARKS FROM MuCastle_REG_SIEGE  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName

		UPDATE MuCastle_REG_SIEGE 
		SET IS_GIVEUP = @iIsGiveUp, REG_MARKS = 0
		WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName

		SELECT 1 As QueryResult, @iMarkCount As DEL_MARKS	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 2 As QueryResult, 0 As DEL_MARKS			-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ModifyCastleSchedule]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ModifyCastleSchedule : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ????? (????, ????) ? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ModifyCastleSchedule]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@dtStartDate		DATETIME,	-- ????
	@dtEndDate		DATETIME	-- ????
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		UPDATE MuCastle_DATA 
		SET SIEGE_START_DATE = CONVERT(datetime,@dtStartDate,20), SIEGE_END_DATE = CONVERT(datetime,@dtEndDate,20)
		WHERE MAP_SVR_GROUP = @iMapSvrGroup

		SELECT 1 As QueryResult	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult	-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_ModifyCastleOwnerInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_ModifyCastleOwnerInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ??? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_ModifyCastleOwnerInfo]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@iCastleOccupied	INT,		-- ?? ??? ???? (0:NPC ??)
	@szOwnGuildName	VARCHAR(8)	-- ?? ??? ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		UPDATE MuCastle_DATA 
		SET CASTLE_OCCUPY = @iCastleOccupied, OWNER_GUILD = @szOwnGuildName
		WHERE MAP_SVR_GROUP = @iMapSvrGroup
		
				UPDATE PcPointData SET
		PcPoint = PcPoint + 5000
		WHERE AccountID in
		(SELECT DISTINCT C.AccountID FROM Character C INNER JOIN GuildMember GM ON C.Name = GM.Name WHERE G_Name IN 
		(SELECT G_Name FROM Guild WHERE G_Name = @szOwnGuildName OR G_Union IN
		(SELECT G_Union FROM Guild WHERE G_Name = @szOwnGuildName AND G_Union != 0)))
		
				UPDATE MEMB_INFO SET
		Cash = Cash + 2500,
		gold = gold + 1000
		WHERE memb___id in
		(SELECT DISTINCT C.AccountID FROM Character C INNER JOIN GuildMember GM ON C.Name = GM.Name WHERE G_Name IN 
		(SELECT G_Name FROM Guild WHERE G_Name = @szOwnGuildName OR G_Union IN
		(SELECT G_Union FROM Guild WHERE G_Name = @szOwnGuildName AND G_Union != 0)))

		SELECT 1 As QueryResult	-- ????? ??? ???? ????? ????.
	END
	ELSE
	BEGIN
		SELECT 0 As QueryResult	-- ????? ??? ???? ???? ????? ????.
	END

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetSiegeGuildInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetSiegeGuildInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ???? ???? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.12.04
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetSiegeGuildInfo]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	SELECT * 
	FROM MuCastle_SIEGE_GUILDLIST  WITH (READUNCOMMITTED) 
	WHERE MAP_SVR_GROUP = @iMapSvrGroup

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetOwnerGuildMaster]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetOwnerGuildMaster : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ??? ??? ????? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.22
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetOwnerGuildMaster]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON	

	IF EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN				-- ????? ??? ????.
		DECLARE	@iIsCastleOccupied	TINYINT
		DECLARE	@szGuildName		VARCHAR(8)

		SELECT @iIsCastleOccupied = CASTLE_OCCUPY, @szGuildName = OWNER_GUILD FROM MuCastle_DATA WHERE MAP_SVR_GROUP = @iMapSvrGroup

		IF (@iIsCastleOccupied = 1)
		BEGIN
			IF (@szGuildName <> '')			
			BEGIN		-- ?? ??? ??? ????? ????.
				IF EXISTS ( SELECT G_Master FROM Guild  WITH (READUNCOMMITTED)
							WHERE G_Name = @szGuildName)
				BEGIN
					SELECT 1 As QueryResult, @szGuildName As OwnerGuild, G_Master As OwnerGuildMaster FROM Guild  WITH (READUNCOMMITTED) WHERE G_Name = @szGuildName
				END
				ELSE
				BEGIN	-- ???? ? ??? ???? ???. (??? ???? ?)
					SELECT 4 As QueryResult, '' As OwnerGuild, '' As OwnerGuildMaster
				END
			END
			ELSE
			BEGIN		-- ????? ?????.
				SELECT 3 As QueryResult, '' As OwnerGuild, '' As OwnerGuildMaster
			END
		END
		ELSE
		BEGIN			-- ?? ??? ??.
			SELECT 2 As QueryResult, '' As OwnerGuild, '' As OwnerGuildMaster
		END
	END
	ELSE
	BEGIN				-- ????? ??? ???? ???.
		SELECT 0 As QueryResult, '' As OwnerGuild, '' As OwnerGuildMaster
	END


	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetGuildMarkRegInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetGuildMarkRegInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? ??? ???? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetGuildMarkRegInfo]
	@iMapSvrGroup		SMALLINT,	-- ??? ??
	@szGuildName		VARCHAR(8)	-- ????? ? ????
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON	

	SELECT * FROM MuCastle_REG_SIEGE WITH (READUNCOMMITTED)
	WHERE MAP_SVR_GROUP = @iMapSvrGroup and REG_SIEGE_GUILD = @szGuildName
	ORDER BY SEQ_NUM ASC

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetCsGuildUnionInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetCsGuildUnionInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ??? ????? ???? ????.
--// ??	: ???? 1? 
--// ???	: 2004.12.03
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetCsGuildUnionInfo]
	@szGuildName		VARCHAR(8)	-- ????? ??? ?? ???
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	DECLARE	@iG_Union	INT
	SET		@iG_Union	= -1	-- ??? ? ?? ????? ????
	
	IF EXISTS ( SELECT G_Name FROM Guild  WITH (READUNCOMMITTED) 
				WHERE G_Name = @szGuildName)
	BEGIN				-- ?? ??? ??? ????.
		SELECT @iG_Union = G_Union
		FROM Guild WITH (READUNCOMMITTED) 
		WHERE G_Name = @szGuildName
	END

	-- ?? ??? ???? ???? ????.
	IF (@iG_Union = 0)
	BEGIN
		SELECT @szGuildName As GUILD_NAME
	END
	ELSE
	BEGIN
		-- ??? ????? ??? ????? ????.
		SELECT G_Name As GUILD_NAME
		FROM Guild WITH (READUNCOMMITTED) 
		WHERE G_Union = @iG_Union
	END
	
	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetCastleTotalInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetCastleTotalInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ????? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetCastleTotalInfo]
	@iMapSvrGroup		SMALLINT,			-- ??? ??
	@iCastleEventCycle	INT				-- ??? ??
As
Begin
	DECLARE	@iCastleSiegeTerm			INT
	SET		@iCastleSiegeTerm			= @iCastleEventCycle		-- ??? ?? (?? 14?)
	DECLARE	@iFirstCreate				INT
	SET		@iFirstCreate				= 0
	
	BEGIN TRANSACTION
	
	SET NOCOUNT ON	

	IF NOT EXISTS ( SELECT MAP_SVR_GROUP FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
				WHERE MAP_SVR_GROUP = @iMapSvrGroup)
	BEGIN
		DECLARE	@dtStartDate			datetime
		DECLARE	@dtEndDate			datetime
		DECLARE	@dtStartDateString		varchar(32)
		DECLARE	@dtEndDateString		varchar(32)

		SET		@dtStartDate			= GetDate()
		SET		@dtEndDate			= DATEADD(dd, @iCastleSiegeTerm, GetDate())
		SET		@dtStartDateString		= CONVERT(datetime, CAST(DATEPART(YY, @dtStartDate) AS char(4)) + '-' + CAST(DATEPART(MM, @dtStartDate) AS char(2)) + '-' + CAST(DATEPART(DD, @dtStartDate) AS char(2)) + ' 00:00:00' ,20)
		SET		@dtEndDateString		= CONVERT(datetime, CAST(DATEPART(YY, @dtEndDate) AS char(4)) + '-' + CAST(DATEPART(MM, @dtEndDate) AS char(2)) + '-' + CAST(DATEPART(DD, @dtEndDate) AS char(2)) + ' 00:00:00' ,20)


		INSERT INTO MuCastle_DATA  VALUES (
			@iMapSvrGroup,			-- MAP_SVR_GROUP
			@dtStartDateString,			-- SIEGE_START_DATE
			@dtEndDateString,			-- SIEGE_END_DATE
			0,					-- SIEGE_GUILDLIST_SETTED
			0,					-- SIEGE_ENDED
			0,					-- CASTLE_OCCUPY
			'',					-- OWNER_GUILD
			0,					-- MONEY
			0,					-- TAX_RATE_CHAOS
			0,					-- TAX_RATE_STORE
			0					-- TAX_HUNT_ZONE
		)

		SET @iFirstCreate				= 1
	END

	SELECT	 MAP_SVR_GROUP, 
			DATEPART(YY,SIEGE_START_DATE)	As SYEAR, 
			DATEPART(MM,SIEGE_START_DATE)	As SMONTH, 
			DATEPART(DD,SIEGE_START_DATE)	As SDAY, 
			DATEPART(YY,SIEGE_END_DATE)	As EYEAR, 
			DATEPART(MM,SIEGE_END_DATE)	As EMONTH, 
			DATEPART(DD,SIEGE_END_DATE)	As EDAY, 
			SIEGE_GUILDLIST_SETTED, 
			SIEGE_ENDED, 
			CASTLE_OCCUPY, 
			OWNER_GUILD, 
			MONEY, 
			TAX_RATE_CHAOS,
			TAX_RATE_STORE,
			TAX_HUNT_ZONE,
			@iFirstCreate As FIRST_CREATE
	FROM MuCastle_DATA  WITH (READUNCOMMITTED)
	WHERE MAP_SVR_GROUP = @iMapSvrGroup

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetCastleTaxInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetCastleTaxInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ????? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetCastleTaxInfo]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON	

	SELECT MONEY, TAX_RATE_CHAOS, TAX_RATE_STORE, TAX_HUNT_ZONE FROM MuCastle_DATA  WITH (READUNCOMMITTED) 
	WHERE MAP_SVR_GROUP = @iMapSvrGroup

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetCastleNpcInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetCastleNpcInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? NPC ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetCastleNpcInfo]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON	

	SELECT * FROM MuCastle_NPC WITH (READUNCOMMITTED)
	WHERE MAP_SVR_GROUP = @iMapSvrGroup

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetCastleMoneyStsRange]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetCastleMoneyStsRange : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? ?? ????? ????.
--// ??	: ???? 1? 
--// ???	: 2005.02.22
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetCastleMoneyStsRange]
	@iMapSvrGroup		SMALLINT,		-- ??? ??
	@iTaxDateStart		DATETIME,
	@iTaxDateEnd		DATETIME
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	CREATE TABLE #T_REG_TAXSTT  (
		[TaxDate] [datetime] NOT NULL ,
		[TaxInc] [money] NOT NULL ,
		[TaxDec] [money] NOT NULL 
	) ON [PRIMARY]
	
	IF (@iTaxDateStart <= @iTaxDateEnd)
	BEGIN
		DECLARE	@iTaxDate		DATETIME
		SET		@iTaxDate		= @iTaxDateStart

		WHILE(@iTaxDate <= @iTaxDateEnd)
		BEGIN
			DECLARE	@dtLogDateStart	DATETIME
			DECLARE	@dtLogDateEnd	DATETIME

			DECLARE	@iTaxInc		MONEY
			DECLARE	@iTaxDec		MONEY
		
			DECLARE	@iYEAR		INT
			DECLARE	@iMONTH		INT
			DECLARE	@iDAY			INT
		
			SELECT	@iYEAR		= DATEPART(YY, @iTaxDate)
			SELECT	@iMONTH		= DATEPART(MM, @iTaxDate)
			SELECT	@iDAY			= DATEPART(DD, @iTaxDate)
			
			SET		@dtLogDateStart	= CAST(@iYEAR AS VARCHAR(4)) + '-' + CAST(@iMONTH AS VARCHAR(2))  + '-' + CAST(@iDAY AS VARCHAR(4)) + ' 00:00:00'
			SET		@dtLogDateEnd	= CAST(@iYEAR AS VARCHAR(4)) + '-' + CAST(@iMONTH AS VARCHAR(2))  + '-' + CAST(@iDAY AS VARCHAR(4)) + ' 23:59:59'
					
			SELECT @iTaxInc = SUM(MONEY_CHANGE) FROM MuCastle_MONEY_STATISTICS  WITH (READUNCOMMITTED) 
			WHERE MAP_SVR_GROUP = 0 and LOG_DATE BETWEEN @dtLogDateStart AND @dtLogDateEnd and MONEY_CHANGE >= 0
			
			SELECT @iTaxDec = SUM(MONEY_CHANGE) FROM MuCastle_MONEY_STATISTICS  WITH (READUNCOMMITTED) 
			WHERE MAP_SVR_GROUP = 0 and LOG_DATE BETWEEN @dtLogDateStart AND @dtLogDateEnd and MONEY_CHANGE < 0

			IF @iTaxInc IS NULL
				SET @iTaxInc = 0
			IF @iTaxDec IS NULL
				SET @iTaxDec = 0
						
			INSERT INTO #T_REG_TAXSTT VALUES (@dtLogDateStart, @iTaxInc, @iTaxDec)

			SET @iTaxDate				= DATEADD(DD, 1, @iTaxDate)
		END
	END
	
	SELECT * FROM #T_REG_TAXSTT

	DROP TABLE #T_REG_TAXSTT

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetCastleMoneySts]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetCastleMoneySts : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? ?? ????? ????.
--// ??	: ???? 1? 
--// ???	: 2005.02.22
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetCastleMoneySts]
	@iMapSvrGroup		SMALLINT,		-- ??? ??
	@iTaxDate		DATETIME
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON
	
	DECLARE	@iTaxInc		MONEY
	DECLARE	@iTaxDec		MONEY
	
	DECLARE	@iYEAR		INT
	DECLARE	@iMONTH		INT
	DECLARE	@iDAY			INT
	
	DECLARE	@dtLogDateStart	DATETIME
	DECLARE	@dtLogDateEnd	DATETIME
	
	SELECT	@iYEAR		= DATEPART(YY, @iTaxDate)
	SELECT	@iMONTH		= DATEPART(MM, @iTaxDate)
	SELECT	@iDAY			= DATEPART(DD, @iTaxDate)
	
	SET		@dtLogDateStart	= CAST(@iYEAR AS VARCHAR(4)) + '-' + CAST(@iMONTH AS VARCHAR(2))  + '-' + CAST(@iDAY AS VARCHAR(4)) + ' 00:00:00'
	SET		@dtLogDateEnd	= CAST(@iYEAR AS VARCHAR(4)) + '-' + CAST(@iMONTH AS VARCHAR(2))  + '-' + CAST(@iDAY AS VARCHAR(4)) + ' 23:59:59'
	
	SELECT @iTaxInc = SUM(MONEY_CHANGE) FROM MuCastle_MONEY_STATISTICS  WITH (READUNCOMMITTED) 
	WHERE MAP_SVR_GROUP = 0 and LOG_DATE BETWEEN @dtLogDateStart AND @dtLogDateEnd and MONEY_CHANGE >= 0
	
	SELECT @iTaxDec = SUM(MONEY_CHANGE) FROM MuCastle_MONEY_STATISTICS  WITH (READUNCOMMITTED) 
	WHERE MAP_SVR_GROUP = 0 and LOG_DATE BETWEEN @dtLogDateStart AND @dtLogDateEnd and MONEY_CHANGE < 0
	
	IF @iTaxInc IS NULL
		SET @iTaxInc = 0
	IF @iTaxDec IS NULL
		SET @iTaxDec = 0

	SELECT @dtLogDateStart As TaxDate, @iTaxInc As TaxInc, @iTaxDec As TaxDec

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetCalcRegGuildList]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetCalcRegGuildList : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ?? ???? ?? ??? ???? ???? ???? ?????. (?? N??)
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetCalcRegGuildList]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON	

	DECLARE T_CURSOR CURSOR FAST_FORWARD
	FOR SELECT TOP 100 * FROM MuCastle_REG_SIEGE	WHERE MAP_SVR_GROUP = @iMapSvrGroup AND IS_GIVEUP = 0 ORDER BY SEQ_NUM DESC
	
	OPEN T_CURSOR
	
	DECLARE	@iMapSvrNum			INT
	DECLARE	@szRegGuild			VARCHAR(8)
	DECLARE	@iRegMarks			INT
	DECLARE	@iIsGiveUp			INT
	DECLARE	@iSeqNum			INT

	DECLARE	@iGuildMemberCount		INT
	DECLARE	@iGuildMasterLevel		INT

	CREATE TABLE #T_REG_GUILDLIST  (
		[REG_SIEGE_GUILD] [varchar] (8) NOT NULL ,
		[REG_MARKS] [int] NOT NULL ,
		[GUILD_MEMBER] [int] NOT NULL ,
		[GM_LEVEL] [int] NOT NULL ,
		[SEQ_NUM] [int] NOT NULL 
	) ON [PRIMARY]
	
	FETCH FROM T_CURSOR INTO @iMapSvrNum, @szRegGuild, @iRegMarks, @iIsGiveUp, @iSeqNum
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF EXISTS ( SELECT G_Name FROM Guild  WITH (READUNCOMMITTED) WHERE G_Name = @szRegGuild)
		BEGIN
			DECLARE @szGuildMaster	VARCHAR(10)
			SELECT @szGuildMaster = G_Master FROM Guild  WHERE G_Name = @szRegGuild

			IF EXISTS ( SELECT Name FROM Character WITH (READUNCOMMITTED) WHERE Name = @szGuildMaster)
			BEGIN
				-- ???? ?? ??? ????? ???? ???? ??? ???.
				SELECT @iGuildMemberCount = COUNT(*) FROM GuildMember WHERE G_Name = @szRegGuild
				SELECT @iGuildMasterLevel = cLevel FROM Character WHERE Name = @szGuildMaster

				INSERT INTO #T_REG_GUILDLIST VALUES (@szRegGuild, @iRegMarks, @iGuildMemberCount, @iGuildMasterLevel, @iSeqNum)
			END
		END
		
		FETCH FROM T_CURSOR INTO @iMapSvrGroup, @szRegGuild, @iRegMarks, @iIsGiveUp, @iSeqNum
	END
	
	CLOSE T_CURSOR
	
	DEALLOCATE T_CURSOR

	SELECT * FROM #T_REG_GUILDLIST

	DROP TABLE #T_REG_GUILDLIST

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_GetAllGuildMarkRegInfo]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_GetAllGuildMarkRegInfo : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ?? ? (????) ? ?? ??? ??? ???? ??? ????.
--// ??	: ???? 1? 
--// ???	: 2004.11.09
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_GetAllGuildMarkRegInfo]
	@iMapSvrGroup		SMALLINT	-- ??? ??
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON	

	SELECT TOP 100 * FROM MuCastle_REG_SIEGE WITH (READUNCOMMITTED)
	WHERE MAP_SVR_GROUP = @iMapSvrGroup
	ORDER BY SEQ_NUM DESC

	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[WZ_CS_CheckSiegeGuildList]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Definition for stored procedure WZ_CS_CheckSiegeGuildList : 
--

--//************************************************************************
--// << ? ??? - ?? ???? >>
--// 
--// ??	: ???????? ??? ????.
--// ??	: MuStudio 
--// ???	: 2005.01.11
--// ???	: 2005.03.15
--// ???	: ???
--// 
--//************************************************************************

CREATE PROCEDURE	[dbo].[WZ_CS_CheckSiegeGuildList]
	@szGuildName		varchar(8)
As
Begin
	BEGIN TRANSACTION
	
	SET NOCOUNT ON

	DECLARE @iEnd INT

	SELECT @iEnd = SIEGE_ENDED FROM MuCastle_DATA

	IF @iEnd = 1
	BEGIN
		SELECT 0 As QueryResult
	END
	ELSE IF EXISTS ( SELECT GUILD_NAME FROM MuCastle_SIEGE_GUILDLIST  WITH (READUNCOMMITTED) 
				WHERE GUILD_NAME = @szGuildName)
	BEGIN
		SELECT 1 As QueryResult	
	END
	ELSE
	BEGIN
		IF EXISTS ( SELECT REG_SIEGE_GUILD FROM MuCastle_REG_SIEGE WITH (READUNCOMMITTED) 
				WHERE REG_SIEGE_GUILD = @szGuildName AND IS_GIVEUP = 0)
		BEGIN
			SELECT 1 As QueryResult
		END
		ELSE
		BEGIN
			SELECT 0 As QueryResult	
		END
	END


	IF(@@Error <> 0 )
		ROLLBACK TRANSACTION
	ELSE	
		COMMIT TRANSACTION

	SET NOCOUNT OFF	
End
GO
/****** Object:  StoredProcedure [dbo].[QuestMaker]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QuestMaker] (@AccountID VARCHAR(10), @Name VARCHAR(10))
AS
UPDATE Character
SET Quest=0xFFFFFF
WHERE AccountID=@AccountID AND Name=@Name
GO
/****** Object:  StoredProcedure [dbo].[MMK_QuestMaker]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MMK_QuestMaker] (@AccountID VARCHAR(10), @Name VARCHAR(10))
AS
UPDATE Character
SET Quest=0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
WHERE AccountID=@AccountID AND Name=@Name
GO
/****** Object:  StoredProcedure [dbo].[MMK_ItemMakerWareHous]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MMK_ItemMakerWareHous] (@AccountID VARCHAR(10))
AS
INSERT INTO warehouse (AccountID, Items, Money) VALUES (@AccountID, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0)
GO
/****** Object:  StoredProcedure [dbo].[MMK_ItemMakerInventory]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MMK_ItemMakerInventory] (@AccountID VARCHAR(10), @Name VARCHAR(10))
AS
UPDATE Character
SET Inventory=0x16EC8E225D26003F00081D000000000016EC8E07B994003F00081D00000000001D6C899B70AB003F00781D00000000001D6C89989CC2003F00881D00000000001D6C89DEAD7D003F00981D00000000001D6C895B374C003F00A81D00000000001D6C89F13CDF003F00B81D00000000000568F74D6E4D003F00C00000000000004000FF211F98000000D00000000000000C68615A5907003F00D0000000000000160032A91FAE000000D000000000000015003299ABB9000000D0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
WHERE AccountID=@AccountID AND Name=@Name
GO
/****** Object:  Table [dbo].[CustomQuest]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomQuest](
	[Name] [varchar](10) NOT NULL,
	[Quest] [int] NOT NULL,
	[MonsterCount] [int] NOT NULL,
 CONSTRAINT [PK_CustomQuest] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomNpcQuest]    Script Date: 12/24/2024 13:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CustomNpcQuest](
	[Name] [varchar](10) NOT NULL,
	[Quest] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[MonsterCount] [int] NOT NULL,
 CONSTRAINT [PK_CustomNpcQuest] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Quest] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Server_rei_do_mk]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MK_Server] ADD  CONSTRAINT [DF_Server_rei_do_mk]  DEFAULT ((0)) FOR [rei_do_mk]
GO
/****** Object:  Default [DF__MEMB_STAT__Onlin__22751F6C]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MEMB_STAT] ADD  CONSTRAINT [DF__MEMB_STAT__Onlin__22751F6C]  DEFAULT ((0)) FOR [OnlineHours]
GO
/****** Object:  Default [DF_MEMB_INFO_mail_chek]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MEMB_INFO] ADD  CONSTRAINT [DF_MEMB_INFO_mail_chek]  DEFAULT ((0)) FOR [mail_chek]
GO
/****** Object:  Default [DF_MEMB_INFO_AccountLevel]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MEMB_INFO] ADD  CONSTRAINT [DF_MEMB_INFO_AccountLevel]  DEFAULT ((0)) FOR [AccountLevel]
GO
/****** Object:  Default [DF__MEMB_INFO__Accou__04E4BC85]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MEMB_INFO] ADD  DEFAULT ((0)) FOR [AccountExpireDate]
GO
/****** Object:  Default [DF_MEMB_INFO_cash]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MEMB_INFO] ADD  CONSTRAINT [DF_MEMB_INFO_cash]  DEFAULT ((0)) FOR [gold]
GO
/****** Object:  Default [DF_MEMB_INFO_Cash_1]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MEMB_INFO] ADD  CONSTRAINT [DF_MEMB_INFO_Cash_1]  DEFAULT ((0)) FOR [Cash]
GO
/****** Object:  Default [DF__MEMB_INFO__Lock__634EBE90]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MEMB_INFO] ADD  DEFAULT ((0)) FOR [Lock]
GO
/****** Object:  Default [DF_Marry_MarriedOn]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Marry] ADD  CONSTRAINT [DF_Marry_MarriedOn]  DEFAULT (getdate()) FOR [MarriedOn]
GO
/****** Object:  Default [DF__LOG_CREDI__valor__2BFE89A6]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[LOG_CREDITOS] ADD  DEFAULT ((0)) FOR [valor]
GO
/****** Object:  Default [DF__LOG_CREDIT__data__2CF2ADDF]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[LOG_CREDITOS] ADD  DEFAULT (getdate()) FOR [data]
GO
/****** Object:  Default [DF__LOG_CREDIT__tipo__2DE6D218]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[LOG_CREDITOS] ADD  DEFAULT ((0)) FOR [tipo]
GO
/****** Object:  Default [DF__ItemLog__SentDat__2FCF1A8A]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[ItemLog] ADD  DEFAULT (getdate()) FOR [SentDate]
GO
/****** Object:  Default [DF__GuildMemb__G_Sta__01D345B0]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[GuildMember] ADD  CONSTRAINT [DF__GuildMemb__G_Sta__01D345B0]  DEFAULT ((0)) FOR [G_Status]
GO
/****** Object:  Default [DF_Guild_G_Score]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Guild] ADD  CONSTRAINT [DF_Guild_G_Score]  DEFAULT ((0)) FOR [G_Score]
GO
/****** Object:  Default [DF__Guild__G_Type__0D7A0286]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Guild] ADD  CONSTRAINT [DF__Guild__G_Type__0D7A0286]  DEFAULT ((0)) FOR [G_Type]
GO
/****** Object:  Default [DF__Guild__G_Rival__0E6E26BF]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Guild] ADD  CONSTRAINT [DF__Guild__G_Rival__0E6E26BF]  DEFAULT ((0)) FOR [G_Rival]
GO
/****** Object:  Default [DF__Guild__G_Union__0F624AF8]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Guild] ADD  CONSTRAINT [DF__Guild__G_Union__0F624AF8]  DEFAULT ((0)) FOR [G_Union]
GO
/****** Object:  Default [DF__Guild__MemberCou__10566F31]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Guild] ADD  CONSTRAINT [DF__Guild__MemberCou__10566F31]  DEFAULT ((0)) FOR [MemberCount]
GO
/****** Object:  Default [DF_GameServerInfo_Number]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[GameServerInfo] ADD  CONSTRAINT [DF_GameServerInfo_Number]  DEFAULT ((0)) FOR [Number]
GO
/****** Object:  Default [DF_GameServerInfo_ZenCount]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[GameServerInfo] ADD  CONSTRAINT [DF_GameServerInfo_ZenCount]  DEFAULT ((0)) FOR [ZenCount]
GO
/****** Object:  Default [DF__DefaultCl__Level__72910220]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[DefaultClassType] ADD  CONSTRAINT [DF__DefaultCl__Level__72910220]  DEFAULT ((0)) FOR [Level]
GO
/****** Object:  Default [DF__DefaultCl__Level__73852659]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[DefaultClassType] ADD  CONSTRAINT [DF__DefaultCl__Level__73852659]  DEFAULT ((0)) FOR [LevelUpPoint]
GO
/****** Object:  Default [DF__DefaultCl__Leade__719CDDE7]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[DefaultClassType] ADD  CONSTRAINT [DF__DefaultCl__Leade__719CDDE7]  DEFAULT ((0)) FOR [Leadership]
GO
/****** Object:  Default [DF__CustomSto__Activ__15DA3E5D]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomStore] ADD  DEFAULT ((0)) FOR [Active]
GO
/****** Object:  Default [DF__CustomStor__Type__16CE6296]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomStore] ADD  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF__PShopItemV__Slot__1B9317B3]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[PShopItemValue] ADD  DEFAULT ((0)) FOR [Slot]
GO
/****** Object:  Default [DF__PShopItem__Seria__1C873BEC]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[PShopItemValue] ADD  DEFAULT ((0)) FOR [Serial]
GO
/****** Object:  Default [DF__PShopItem__Value__1D7B6025]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[PShopItemValue] ADD  DEFAULT ((0)) FOR [Value]
GO
/****** Object:  Default [DF_MuCastle_Data_SEIGE_ENDED]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MuCastle_DATA] ADD  CONSTRAINT [DF_MuCastle_Data_SEIGE_ENDED]  DEFAULT ((0)) FOR [SIEGE_ENDED]
GO
/****** Object:  Default [DF_MuCastle_Data_CASTLE_OCCUPY]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MuCastle_DATA] ADD  CONSTRAINT [DF_MuCastle_Data_CASTLE_OCCUPY]  DEFAULT ((0)) FOR [CASTLE_OCCUPY]
GO
/****** Object:  Default [DF_MuCastle_Data_MONEY]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MuCastle_DATA] ADD  CONSTRAINT [DF_MuCastle_Data_MONEY]  DEFAULT ((0)) FOR [MONEY]
GO
/****** Object:  Default [DF_MuCastle_Data_TAX_RATE]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MuCastle_DATA] ADD  CONSTRAINT [DF_MuCastle_Data_TAX_RATE]  DEFAULT ((0)) FOR [TAX_RATE_CHAOS]
GO
/****** Object:  Default [DF_MuCastle_DATA_TAX_RATE_STORE]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MuCastle_DATA] ADD  CONSTRAINT [DF_MuCastle_DATA_TAX_RATE_STORE]  DEFAULT ((0)) FOR [TAX_RATE_STORE]
GO
/****** Object:  Default [DF_MuCastle_DATA_TAX_HUNT_ZONE]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[MuCastle_DATA] ADD  CONSTRAINT [DF_MuCastle_DATA_TAX_HUNT_ZONE]  DEFAULT ((0)) FOR [TAX_HUNT_ZONE]
GO
/****** Object:  Default [DF_warehouse_Money]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[warehouse] ADD  CONSTRAINT [DF_warehouse_Money]  DEFAULT ((0)) FOR [Money]
GO
/****** Object:  Default [DF__warehouse__DbVer__690797E6]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[warehouse] ADD  CONSTRAINT [DF__warehouse__DbVer__690797E6]  DEFAULT ((0)) FOR [DbVersion]
GO
/****** Object:  Default [DF__warehouse__pw__69FBBC1F]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[warehouse] ADD  CONSTRAINT [DF__warehouse__pw__69FBBC1F]  DEFAULT ((0)) FOR [pw]
GO
/****** Object:  Default [DF_T_Pet_Info_Pet_Level]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_PetItem_Info] ADD  CONSTRAINT [DF_T_Pet_Info_Pet_Level]  DEFAULT ((0)) FOR [Pet_Level]
GO
/****** Object:  Default [DF_T_Pet_Info_Pet_Exp]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_PetItem_Info] ADD  CONSTRAINT [DF_T_Pet_Info_Pet_Exp]  DEFAULT ((0)) FOR [Pet_Exp]
GO
/****** Object:  Default [DF_T_FriendMain_MemoCount]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_FriendMain] ADD  CONSTRAINT [DF_T_FriendMain_MemoCount]  DEFAULT ((10)) FOR [MemoCount]
GO
/****** Object:  Default [DF_T_FriendMain_MemoTotal]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_FriendMain] ADD  CONSTRAINT [DF_T_FriendMain_MemoTotal]  DEFAULT ((0)) FOR [MemoTotal]
GO
/****** Object:  Default [DF_T_FriendMemo_MemoIndex]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_FriendMail] ADD  CONSTRAINT [DF_T_FriendMemo_MemoIndex]  DEFAULT ((10)) FOR [MemoIndex]
GO
/****** Object:  Default [DF_T_FriendMemo_wDate]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_FriendMail] ADD  CONSTRAINT [DF_T_FriendMemo_wDate]  DEFAULT (getdate()) FOR [wDate]
GO
/****** Object:  Default [DF_T_FriendMemo_MemoRead]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_FriendMail] ADD  CONSTRAINT [DF_T_FriendMemo_MemoRead]  DEFAULT ((0)) FOR [bRead]
GO
/****** Object:  Default [DF_T_FriendMemo_Dir]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_FriendMail] ADD  CONSTRAINT [DF_T_FriendMemo_Dir]  DEFAULT ((0)) FOR [Dir]
GO
/****** Object:  Default [DF_T_FriendMemo_Action]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_FriendMail] ADD  CONSTRAINT [DF_T_FriendMemo_Action]  DEFAULT ((0)) FOR [Act]
GO
/****** Object:  Default [DF_T_FriendList_Del]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[T_FriendList] ADD  CONSTRAINT [DF_T_FriendList_Del]  DEFAULT ((0)) FOR [Del]
GO
/****** Object:  Default [DF_RankingTvT_Kills]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[RankingTvT] ADD  CONSTRAINT [DF_RankingTvT_Kills]  DEFAULT ((0)) FOR [Kills]
GO
/****** Object:  Default [DF_RankingTvT_Deads]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[RankingTvT] ADD  CONSTRAINT [DF_RankingTvT_Deads]  DEFAULT ((0)) FOR [Deads]
GO
/****** Object:  Default [DF__RankingGv__Score__7D0E9093]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[RankingGvG] ADD  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_RankingDuel_WinScore_semanal]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[RankingDuel] ADD  CONSTRAINT [DF_RankingDuel_WinScore_semanal]  DEFAULT ((0)) FOR [WinScore_semanal]
GO
/****** Object:  Default [DF_RankingBloodCastle_Score]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[RankingBloodCastle] ADD  CONSTRAINT [DF_RankingBloodCastle_Score]  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_RankingBloodCastle_Score_semanal]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[RankingBloodCastle] ADD  CONSTRAINT [DF_RankingBloodCastle_Score_semanal]  DEFAULT ((0)) FOR [Score_semanal]
GO
/****** Object:  Default [DF__RankingBa__Score__7FEAFD3E]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[RankingBattleRoyale] ADD  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF__CustomJew__Bless__02C769E9]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [Bless]
GO
/****** Object:  Default [DF__CustomJewe__Soul__03BB8E22]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [Soul]
GO
/****** Object:  Default [DF__CustomJewe__Life__04AFB25B]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [Life]
GO
/****** Object:  Default [DF__CustomJew__Creat__05A3D694]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [Creation]
GO
/****** Object:  Default [DF__CustomJew__Guard__0697FACD]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [Guardian]
GO
/****** Object:  Default [DF__CustomJew__GemSt__078C1F06]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [GemStone]
GO
/****** Object:  Default [DF__CustomJew__Harmo__0880433F]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [Harmony]
GO
/****** Object:  Default [DF__CustomJew__Chaos__09746778]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [Chaos]
GO
/****** Object:  Default [DF__CustomJew__LowSt__0A688BB1]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [LowStone]
GO
/****** Object:  Default [DF__CustomJew__HighS__0B5CAFEA]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomJewelBank] ADD  DEFAULT ((0)) FOR [HighStone]
GO
/****** Object:  Default [DF_CustomGift_date]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomGift] ADD  CONSTRAINT [DF_CustomGift_date]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF_Character_cLevel]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_cLevel]  DEFAULT ((1)) FOR [cLevel]
GO
/****** Object:  Default [DF_Character_LevelUpPoint]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_LevelUpPoint]  DEFAULT ((0)) FOR [LevelUpPoint]
GO
/****** Object:  Default [DF_Character_Experience]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Experience]  DEFAULT ((0)) FOR [Experience]
GO
/****** Object:  Default [DF__Character__Leade__7A672E12]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF__Character__Leade__7A672E12]  DEFAULT ((0)) FOR [Leadership]
GO
/****** Object:  Default [DF_Character_Money]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Money]  DEFAULT ((0)) FOR [Money]
GO
/****** Object:  Default [DF_Character_MapDir]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_MapDir]  DEFAULT ((0)) FOR [MapDir]
GO
/****** Object:  Default [DF_Character_PkCount]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_PkCount]  DEFAULT ((0)) FOR [PkCount]
GO
/****** Object:  Default [DF_Character_PkLevel]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_PkLevel]  DEFAULT ((3)) FOR [PkLevel]
GO
/****** Object:  Default [DF_Character_PkTime]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_PkTime]  DEFAULT ((0)) FOR [PkTime]
GO
/****** Object:  Default [DF_Character_CtlCode]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_CtlCode]  DEFAULT ((0)) FOR [CtlCode]
GO
/****** Object:  Default [DF__Character__DbVer__787EE5A0]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF__Character__DbVer__787EE5A0]  DEFAULT ((0)) FOR [DbVersion]
GO
/****** Object:  Default [DF__Character__Quest__797309D9]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF__Character__Quest__797309D9]  DEFAULT ((0)) FOR [Quest]
GO
/****** Object:  Default [DF__Character__ChatL__7B5B524B]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF__Character__ChatL__7B5B524B]  DEFAULT ((0)) FOR [ChatLimitTime]
GO
/****** Object:  Default [DF_Character_FruitPoint]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_FruitPoint]  DEFAULT ((0)) FOR [FruitPoint]
GO
/****** Object:  Default [DF__Character__Fruit__4F67C174]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF__Character__Fruit__4F67C174]  DEFAULT ((0)) FOR [FruitAddPoint]
GO
/****** Object:  Default [DF__Character__Fruit__505BE5AD]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF__Character__Fruit__505BE5AD]  DEFAULT ((0)) FOR [FruitSubPoint]
GO
/****** Object:  Default [DF__Character__Reset__515009E6]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF__Character__Reset__515009E6]  DEFAULT ((0)) FOR [ResetCount]
GO
/****** Object:  Default [DF__Character__Maste__7CF981FA]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF__Character__Maste__7CF981FA]  DEFAULT ((0)) FOR [MasterResetCount]
GO
/****** Object:  Default [DF_Character_Kills]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Kills]  DEFAULT ((0)) FOR [Kills]
GO
/****** Object:  Default [DF_Character_Deads]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Deads]  DEFAULT ((0)) FOR [Deads]
GO
/****** Object:  Default [DF__Character__ItemS__7849DB76]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[Character] ADD  DEFAULT ((0)) FOR [ItemStart]
GO
/****** Object:  Default [DF__CashLog__SentDat__31B762FC]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CashLog] ADD  DEFAULT (getdate()) FOR [SentDate]
GO
/****** Object:  Default [DF__AccountCh__MoveC__7A3223E8]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[AccountCharacter] ADD  CONSTRAINT [DF__AccountCh__MoveC__7A3223E8]  DEFAULT ((0)) FOR [MoveCnt]
GO
/****** Object:  Default [df_AccountCharacter_ExtClass]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[AccountCharacter] ADD  CONSTRAINT [df_AccountCharacter_ExtClass]  DEFAULT ((0)) FOR [ExtClass]
GO
/****** Object:  Default [DF_CustomQuest_Quest]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomQuest] ADD  CONSTRAINT [DF_CustomQuest_Quest]  DEFAULT ((0)) FOR [Quest]
GO
/****** Object:  Default [DF__CustomQue__Monst__11158940]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomQuest] ADD  DEFAULT ((0)) FOR [MonsterCount]
GO
/****** Object:  Default [DF_CustomNpcQuest_Quest]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomNpcQuest] ADD  CONSTRAINT [DF_CustomNpcQuest_Quest]  DEFAULT ((0)) FOR [Quest]
GO
/****** Object:  Default [DF_CustomNpcQuest_Count]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomNpcQuest] ADD  CONSTRAINT [DF_CustomNpcQuest_Count]  DEFAULT ((0)) FOR [Count]
GO
/****** Object:  Default [DF_CustomNpcQuest_MonsterQtd]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomNpcQuest] ADD  CONSTRAINT [DF_CustomNpcQuest_MonsterQtd]  DEFAULT ((0)) FOR [MonsterCount]
GO
/****** Object:  ForeignKey [FK_CustomQuest_Character]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomQuest]  WITH CHECK ADD  CONSTRAINT [FK_CustomQuest_Character] FOREIGN KEY([Name])
REFERENCES [dbo].[Character] ([Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomQuest] CHECK CONSTRAINT [FK_CustomQuest_Character]
GO
/****** Object:  ForeignKey [FK_CustomNpcQuest_Character]    Script Date: 12/24/2024 13:36:02 ******/
ALTER TABLE [dbo].[CustomNpcQuest]  WITH CHECK ADD  CONSTRAINT [FK_CustomNpcQuest_Character] FOREIGN KEY([Name])
REFERENCES [dbo].[Character] ([Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomNpcQuest] CHECK CONSTRAINT [FK_CustomNpcQuest_Character]
GO
