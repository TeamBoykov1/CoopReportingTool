USE [master]
GO
/****** Object:  Database [coop]    Script Date: 2015-03-20 12:22:37 AM ******/
CREATE DATABASE [coop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'coop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\coop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'coop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\coop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [coop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [coop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [coop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [coop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [coop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [coop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [coop] SET ARITHABORT OFF 
GO
ALTER DATABASE [coop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [coop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [coop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [coop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [coop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [coop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [coop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [coop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [coop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [coop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [coop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [coop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [coop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [coop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [coop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [coop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [coop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [coop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [coop] SET RECOVERY FULL 
GO
ALTER DATABASE [coop] SET  MULTI_USER 
GO
ALTER DATABASE [coop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [coop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [coop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [coop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'coop', N'ON'
GO
USE [coop]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Advisorinfo]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_Advisorinfo]
(
	
	@AdvisorName nvarchar(100),
	@AEmail nvarchar(100),
	@APhone int,
	@ACell int,
	@AArea nvarchar(100),
	@AUsername nvarchar(100),
	@APassword varchar(50),
	@Type varchar(10)
)
as
	begin
		
				insert into dbo.tbl_Advisor(AdvisorName,AEmail,APhone,ACell,AArea,AUsername,APassword)
							values(@AdvisorName,@AEmail,@APhone,@ACell,@AArea,@AUsername,@APassword)
			
	end
	




GO
/****** Object:  StoredProcedure [dbo].[Sp_CoopForm]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_CoopForm](
	@Id int=0 output,
	@StudentName varchar(50)=null,
	@StudentID int=null,
	@AdvisorName nvarchar(50)=null,
	@Oraganization varchar(50)=null,
	@Year int =null,
	@ReportMonth varchar(50)=null,
	@JobTitle varchar(50)=null,
	@LikeIntership varchar(50)=null,
	@AdequatelyPrepared varchar(50)=null,
	@Curriculum varchar(50)=null,
	@Expectation varchar(50)=null,
	@Requirement varchar(50)=null,
	@AboutCoopAdvisor varchar(50)=null,
	@AgencySupervisor varchar(50)=null,
	@SupervisorActive varchar(50)=null,
	@Attendance varchar(50)=null,
	@Punctuality varchar(50)=null,
	@Structured varchar(50)=null,
	@OverStructured varchar(50)=null,
	@Problems varchar(50)=null,
	@HelpProblems varchar(50)=null,
	@Learning varchar(50)=null,
	@Rewarding varchar(50)=null,
	@ObjectiveEstablished varchar(50)=null,
	@Recommend varchar(50)=null,
	@SelfEvaluation varchar(50)=null,
	@DutiesPerformed nvarchar(250)=null,
	@Comments nvarchar(50)=null,
	@SQL varchar(500)=null,
	@Questionnaires varchar(50)=null,
	@Type char(2)=null
)
as 
	begin
		if(@Type='I')
			begin
				if not exists(select * from tbl_CoopForm where StudentID=@StudentID and ReportMonth=@ReportMonth and year=@year)
				begin
				insert into tbl_CoopForm(StudentName,StudentID,AdvisorName,Oraganization,Year,ReportMonth,JobTitle,LikeIntership,AdequatelyPrepared,Curriculum,
							Expectation,Requirement,AboutCoopAdvisor,AgencySupervisor,SupervisorActive,Attendance,Punctuality,Structured,
							OverStructured,Problems,HelpProblems,Learning,Rewarding,ObjectiveEstablished,Recommend,SelfEvaluation,DutiesPerformed,
							Comments)
					values(@StudentName,@StudentID,@AdvisorName,@Oraganization,@Year,@ReportMonth,@JobTitle,@LikeIntership,@AdequatelyPrepared,@Curriculum,
							@Expectation,@Requirement,@AboutCoopAdvisor,@AgencySupervisor,@SupervisorActive,@Attendance,@Punctuality,@Structured,
							@OverStructured,@Problems,@HelpProblems,@Learning,@Rewarding,@ObjectiveEstablished,@Recommend,@SelfEvaluation,@DutiesPerformed,
							@Comments)
					select * from tbl_CoopForm where StudentID=@StudentID and ReportMonth=@ReportMonth and year=@year
				end
			end
	end
	begin
		if(@Type='A')
			begin
				select * from tbl_CoopForm	
			end
	end
	begin
		if(@Type='S')
			begin
				select * from tbl_CoopForm where StudentID = @StudentID
			end
	end
	begin
		if(@Type='M')
			begin
				select * from tbl_CoopForm where ReportMonth = @ReportMonth
			end
	end
	begin
		if(@Type='SM')
			begin
				select * from tbl_CoopForm where StudentID = @StudentID and ReportMonth = @ReportMonth
			end
	end
	begin
		if(@Type='R')
			begin
				select * from tbl_CoopForm where Id =@Id
			end
	end
	begin
		if(@Type='GR')
			begin 
				SET @SQL = 
							'select ' + 
							'COUNT(*) as Total_Feed_Back, SUM(case when ' + @Questionnaires + ' = '+'''Yes Definitely'''+' then 1 else 0 end)as Yes_Deffinitly,
							SUM(case when ' + @Questionnaires + ' = '+'''Yes'''+' then 1 else 0 end)as Yes,
							SUM(case when ' + @Questionnaires + ' = '+'''SomeWhat'''+' then 1 else 0 end)as Some_What,
							SUM(case when ' + @Questionnaires + ' = '+'''No'''+' then 1 else 0 end)as No,
							SUM(case when ' + @Questionnaires + ' = '+'''Definitely Not'''+' then 1 else 0 end)as Definitely_Not' +
							' from tbl_CoopForm '
				EXEC(@SQL)
			end
	end





GO
/****** Object:  StoredProcedure [dbo].[sp_Products_Select]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Products_Select]
    @Organization varchar(255),
    @ColumnName varchar(255)
AS
BEGIN
DECLARE @SQL varchar(500)
SET @SQL = 
'select ' + 
'COUNT(*) ' + @ColumnName +
', SUM(case when ' + @ColumnName + ' = '+'''Excellent'''+' then 1 else 0 end)as Excellent' +
'  from tbl_StudentEvalForm where Organization = ' + @Organization  
EXEC(@SQL)
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_StudentEvalForm]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_StudentEvalForm]
(
	@Id int=0 output,
	@StudentName varchar(50) = null,
	@StudentId int = null,
	@Organization varchar(50)= null,
	@JobTitle varchar(50)= null,
	@Term varchar(50)= null,
	@Year int= null,
	@InterestInWork nvarchar(50)= null,
	@AbilityToLearn nvarchar(50)= null,
	@QualityofWork nvarchar(50)= null,
	@ProblemSolving nvarchar(50)= null,
	@TeamWork nvarchar(50)= null,
	@Dependability nvarchar(50)= null,
	@ResponseToSupervision nvarchar(50)= null,
	@Reflection nvarchar(50)= null,
	@Resoursefulness nvarchar(50)= null,
	@EthicalBehaviour nvarchar(50)= null,
	@AppreciationofDiversity nvarchar(50)= null,
	@EnterpreneurialOrientation nvarchar(50)= null,
	@WrittenCommunication nvarchar(50)= null,
	@OralCommuniation nvarchar(50)= null,
	@InterpersonalCommunication nvarchar(50)= null,
	@OverallPerformanceRating nvarchar(50)= null,
	@SupervisorsComments nvarchar(50)=null,
	@SupervisorsRecommendations nvarchar(50)=null,
	@NextWorkTerm varchar(50)=null,
	@OfferNextWorkTerm varchar(50)=null,
	@OfferStatus varchar(50)=null,
	@NextWorkTermFrom varchar(50)=null,
	@NextWorkTermTo varchar(50)=null,
	@SupervisorsName varchar(50)= null,
	@SupervisorsTitle varchar(50)= null,
	@Currentdate date = null,
	@ManagerName varchar(50)=null,
	@Report varchar(50)=null,
	@SQL varchar(500)=null,
	@Questionnaires varchar(50)=null,
	@Type char(2)=null
)
as
	begin
		if(@Type='I')
			begin
				if not exists(select * from tbl_StudentEvalForm where StudentID=@StudentID and Term=@Term and year=@year)
				begin
				insert into tbl_StudentEvalForm(StudentName,StudentId,Organization,JobTitle,Term,year,InterestInWork,AbilityToLearn,QualityofWork,
							ProblemSolving,TeamWork,Dependability,ResponseToSupervision,Reflection,Resoursefulness,EthicalBehaviour,
							AppreciationofDiversity,EnterpreneurialOrientation,WrittenCommunication,OralCommuniation,InterpersonalCommunication,
							OverallPerformanceRating,SupervisorsComments,SupervisorsRecommendations,NextWorkTerm,OfferNextWorkTerm,
							OfferStatus,NextWorkTermFrom,NextWorkTermTo,SupervisorsName,SupervisorsTitle,Currentdate,ManagerName)
							values(@StudentName,@StudentId,@Organization,@JobTitle,@Term,@year,@InterestInWork,@AbilityToLearn,@QualityofWork,
							@ProblemSolving,@TeamWork,@Dependability,@ResponseToSupervision,@Reflection,@Resoursefulness,@EthicalBehaviour,
							@AppreciationofDiversity,@EnterpreneurialOrientation,@WrittenCommunication,@OralCommuniation,@InterpersonalCommunication,
							@OverallPerformanceRating,@SupervisorsComments,@SupervisorsRecommendations,@NextWorkTerm,@OfferNextWorkTerm,
							@OfferStatus,@NextWorkTermFrom,@NextWorkTermTo,@SupervisorsName,@SupervisorsTitle,@Currentdate,@ManagerName)
				select * from tbl_StudentEvalForm where StudentID=@StudentID and Term=@Term and year=@year
				end
			end
	end
	begin
		if(@Type='A')
			begin
				select * from tbl_StudentEvalForm
			end
	end
	begin
		if(@Type='S')
			begin
				select * from tbl_StudentEvalForm where StudentId=@StudentId
			end
	end
	begin
		if(@Type='C')
			begin
				select distinct(Organization) from tbl_StudentEvalForm
			end
	end
	begin
		if(@Type='SR')
			begin
				select * from tbl_StudentEvalForm where Id = @Id
			end
	end
	begin
		if(@Type='GR')
			begin 
				SET @SQL = 
							'select ' + 
							'COUNT(*) as Total_Feed_Back, SUM(case when ' + @Questionnaires + ' = '+'''Excellent'''+' then 1 else 0 end)as Excellent,
							SUM(case when ' + @Questionnaires + ' = '+'''Very Good'''+' then 1 else 0 end)as Very_Good,
							SUM(case when ' + @Questionnaires + ' = '+'''Good'''+' then 1 else 0 end)as Good,
							SUM(case when ' + @Questionnaires + ' = '+'''Fair'''+' then 1 else 0 end)as Fair,
							SUM(case when ' + @Questionnaires + ' = '+'''Bad'''+' then 1 else 0 end)as Bad' +
							'  from tbl_StudentEvalForm where Organization = ' +''''+ @Organization +''''  
				EXEC(@SQL)
			end
	end






GO
/****** Object:  StoredProcedure [dbo].[Sp_StudentInfo]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_StudentInfo]
(
	@StudentID int,
	@SFname nvarchar(50),
	@SLname nvarchar (50),
	@SProgram nvarchar(50),
	@SEmail nvarchar(50),
	@SAddress1 nvarchar(50),
	@SAddress2 nvarchar(50),
	@SCity nvarchar(50),
	@SProvince nvarchar(50),
	@SPostalCode varchar(50),
	@SPhone int=0,
	@SCell int=0,
	@SPassword varchar(50),
	@Type varchar(10)
)
as
	begin
		if(@Type='I')
			begin
				insert into dbo.tbl_Student(StudentID,SFname,SLname,SProgram,SEmail,SAddress1,SAddress2,SCity,SProvince,SPostalCode,SPhone,SCell,SPassword)
							values(@StudentID,@SFname,@SLname,@SProgram,@SEmail,@SAddress1,@SAddress2,@SCity,@SProvince,@SPostalCode,@SPhone,@SCell,@SPassword)
			end
	end
	begin
		if(@Type='A')
			begin
				select * from dbo.tbl_Student
			end
	end
	begin
		if(@Type='S')
			begin
				select * from dbo.tbl_Student where StudentId=@StudentId
			end
	end




GO
/****** Object:  StoredProcedure [dbo].[Sp_WorkTerm]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_WorkTerm]
(
	@Id int=0 output,
	@StudentID int,
	@CompanyName nvarchar(50),
	@CompanyAddress1 nvarchar(50),
	@CompanyAddress2 nvarchar(50),
	@City nvarchar(50),
	@Province nvarchar(50),
	@PostalCode nvarchar(50),
	@WorkTerm nvarchar(50),
	@Position nvarchar(50),
	@Duties nvarchar(250),
	@AUsername nvarchar(50),
	@Grade nvarchar(50),
	@Type varchar(10)
)
as
	begin
		if(@Type='I')
			begin
				insert into dbo.tbl_WorkTerm(StudentID,CompanyName,CompanyAddress1,CompanyAddress2,City,Province,PostalCode,WorkTerm,Position,Duties,AUsername,Grade)
							values(@StudentID,@CompanyName,@CompanyAddress1,@CompanyAddress2,@City,@Province,@PostalCode,@WorkTerm,@Position,@Duties,@AUsername,@Grade)
			end
	end
	begin
		if(@Type='A')
			begin
				select * from dbo.tbl_WorkTerm
			end
	end
	begin
		if(@Type='S')
			begin
				select * from dbo.tbl_WorkTerm where StudentId=@StudentID
			end
	end







GO
/****** Object:  Table [dbo].[tbl_Advisor]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Advisor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdvisorName] [nvarchar](100) NULL,
	[AEmail] [nvarchar](100) NULL,
	[APhone] [int] NULL,
	[ACell] [int] NULL,
	[AArea] [nvarchar](100) NULL,
	[AUsername] [nvarchar](50) NOT NULL,
	[APassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Advisor_1] PRIMARY KEY CLUSTERED 
(
	[AUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CompanyRating]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CompanyRating](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Rating] [nvarchar](50) NULL,
	[Comments] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_CompanyRating] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CoopForm]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CoopForm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NULL,
	[StudentID] [int] NULL,
	[AdvisorName] [nvarchar](100) NULL,
	[Oraganization] [varchar](50) NULL,
	[Year] [int] NULL,
	[ReportMonth] [varchar](50) NULL,
	[JobTitle] [varchar](50) NULL,
	[LikeIntership] [varchar](50) NULL,
	[AdequatelyPrepared] [varchar](50) NULL,
	[Curriculum] [varchar](50) NULL,
	[Expectation] [varchar](50) NULL,
	[Requirement] [varchar](50) NULL,
	[AboutCoopAdvisor] [varchar](50) NULL,
	[AgencySupervisor] [varchar](50) NULL,
	[SupervisorActive] [varchar](50) NULL,
	[Attendance] [varchar](50) NULL,
	[Punctuality] [varchar](50) NULL,
	[Structured] [varchar](50) NULL,
	[OverStructured] [varchar](50) NULL,
	[Problems] [varchar](50) NULL,
	[HelpProblems] [varchar](50) NULL,
	[Learning] [varchar](50) NULL,
	[Rewarding] [varchar](50) NULL,
	[ObjectiveEstablished] [varchar](50) NULL,
	[Recommend] [varchar](50) NULL,
	[SelfEvaluation] [varchar](50) NULL,
	[DutiesPerformed] [nvarchar](50) NULL,
	[Comments] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_CoopForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CoWorkers]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CoWorkers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CName] [nvarchar](50) NULL,
	[CEmail] [nvarchar](100) NULL,
	[CPosition] [nvarchar](50) NULL,
	[CPhone] [nvarchar](50) NULL,
	[LinkedInProfile] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_CoWorkers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Student]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[SFname] [nvarchar](50) NULL,
	[SLname] [nvarchar](50) NULL,
	[SProgram] [nvarchar](50) NULL,
	[SEmail] [nvarchar](max) NULL,
	[SAddress1] [nvarchar](50) NULL,
	[SAddress2] [nvarchar](50) NULL,
	[SCity] [nvarchar](50) NULL,
	[SProvince] [nvarchar](50) NULL,
	[SPostalCode] [nvarchar](50) NULL,
	[SPhone] [int] NULL,
	[SCell] [int] NULL,
	[SPassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Student_1] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_StudentEvalForm]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StudentEvalForm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NULL,
	[StudentID] [int] NULL,
	[Organization] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[Term] [varchar](50) NULL,
	[year] [int] NULL,
	[InterestInWork] [nvarchar](50) NULL,
	[AbilityToLearn] [nvarchar](50) NULL,
	[QualityofWork] [nvarchar](50) NULL,
	[ProblemSolving] [nvarchar](50) NULL,
	[TeamWork] [nvarchar](50) NULL,
	[Dependability] [nvarchar](50) NULL,
	[ResponseToSupervision] [nvarchar](50) NULL,
	[Reflection] [nvarchar](50) NULL,
	[Resoursefulness] [nvarchar](50) NULL,
	[EthicalBehaviour] [nvarchar](50) NULL,
	[AppreciationofDiversity] [nvarchar](50) NULL,
	[EnterpreneurialOrientation] [nvarchar](50) NULL,
	[WrittenCommunication] [nvarchar](50) NULL,
	[OralCommuniation] [nvarchar](50) NULL,
	[InterpersonalCommunication] [nvarchar](50) NULL,
	[OverallPerformanceRating] [nvarchar](50) NULL,
	[SupervisorsComments] [nvarchar](50) NULL,
	[SupervisorsRecommendations] [nvarchar](50) NULL,
	[NextWorkTerm] [varchar](50) NULL,
	[OfferNextWorkTerm] [varchar](50) NULL,
	[OfferStatus] [varchar](50) NULL,
	[NextWorkTermFrom] [varchar](50) NULL,
	[NextWorkTermTo] [varchar](50) NULL,
	[SupervisorsName] [varchar](50) NULL,
	[SupervisorsTitle] [nvarchar](50) NULL,
	[Currentdate] [date] NULL,
	[ManagerName] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_StudentEvalForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_WorkTerm]    Script Date: 2015-03-20 12:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WorkTerm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[CompanyAddress1] [nvarchar](100) NOT NULL,
	[CompanyAddress2] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[WorkTerm] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Duties] [nvarchar](250) NOT NULL,
	[AUsername] [nvarchar](50) NOT NULL,
	[Grade] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_WorkTerm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [coop] SET  READ_WRITE 
GO
