USE [master]
GO
/****** Object:  Database [coop]    Script Date: 4/10/2015 1:24:50 PM ******/
CREATE DATABASE [coop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'coop', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\coop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'coop_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\coop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  StoredProcedure [dbo].[Sp_Advisor]    Script Date: 4/10/2015 1:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sp_Advisor](
	@ID int=0 output,
	@AdvisorName nvarchar(100) = null,
	@AEmail nvarchar(100) = null,
	@APhone varchar(50) = null,
	@ACell varchar(50) = null,
	@AArea nvarchar(100) = null,
	@AUsername nvarchar(100) = null,
	@APassword nvarchar(100) = null,
	@Type char(2) = null
)
as 
	begin
		if(@Type='L')
			select * from tbl_Advisor where AUsername = @AUsername and APassword = @APassword
	end
	begin
		if(@Type='A')
			select * from tbl_Advisor
	end


GO
/****** Object:  StoredProcedure [dbo].[Sp_CoopForm]    Script Date: 4/10/2015 1:24:50 PM ******/
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
	@WorkTerm varchar(50)=null,
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
				insert into tbl_CoopForm(StudentName,StudentID,AdvisorName,Oraganization,WorkTerm,Year,ReportMonth,JobTitle,LikeIntership,AdequatelyPrepared,Curriculum,
							Expectation,Requirement,AboutCoopAdvisor,AgencySupervisor,SupervisorActive,Attendance,Punctuality,Structured,
							OverStructured,Problems,HelpProblems,Learning,Rewarding,ObjectiveEstablished,Recommend,SelfEvaluation,DutiesPerformed,
							Comments)
					values(@StudentName,@StudentID,@AdvisorName,@Oraganization,@WorkTerm,@Year,@ReportMonth,@JobTitle,@LikeIntership,@AdequatelyPrepared,@Curriculum,
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
				select * from tbl_CoopForm where AdvisorName = @AdvisorName
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
		if(@Type='C')
			begin
				select distinct(Oraganization) from tbl_CoopForm
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
							'COUNT(*) as Total_Feed_Back, SUM(case when ' + @Questionnaires + ' = '+'''Yes Definitely'''+' then 1 else 0 end)as Yes_Definitely,
							SUM(case when ' + @Questionnaires + ' = '+'''Yes'''+' then 1 else 0 end)as Yes,
							SUM(case when ' + @Questionnaires + ' = '+'''SomeWhat'''+' then 1 else 0 end)as Some_What,
							SUM(case when ' + @Questionnaires + ' = '+'''No'''+' then 1 else 0 end)as No,
							SUM(case when ' + @Questionnaires + ' = '+'''Definitely Not'''+' then 1 else 0 end)as Definitely_Not' +
							' from tbl_CoopForm where Oraganization = ' +''''+ @Oraganization +''''  
				EXEC(@SQL)
			end
	end







GO
/****** Object:  StoredProcedure [dbo].[sp_Products_Select]    Script Date: 4/10/2015 1:24:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_StudentEvalForm]    Script Date: 4/10/2015 1:24:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_StudentInfo]    Script Date: 4/10/2015 1:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_StudentInfo]
(
	@ID int=0 output,
	@StudentID int = null,
	@SFname varchar(50) = null,
	@SLname varchar (50) = null,
	@SProgram varchar(50) = null,
	@SEmail varchar(50) = null,
	@SAddress1 varchar(50) = null,
	@SAddress2 varchar(50) = null,
	@SCity varchar(50) = null,
	@SProvince varchar(50) = null,
	@SPostalCode varchar(50) = null,
	@SPhone varchar(50) = null,
	@SCell varchar(50) =null,
	@SPassword varchar(50) =null ,
	@SNewPassword varchar(50) = null,
	@Type varchar(10) = null
)
as
	begin
		if(@Type='I')
			begin
			if not exists(select * from tbl_Student where StudentID=@StudentID)
				begin
					insert into dbo.tbl_Student(StudentID,SFname,SLname,SProgram,SEmail,SAddress1,SAddress2,SCity,SProvince,SPostalCode,SPhone,SCell,SPassword)
							values(@StudentID,@SFname,@SLname,@SProgram,@SEmail,@SAddress1,@SAddress2,@SCity,@SProvince,@SPostalCode,@SPhone,@SCell,@SPassword)
					select * from tbl_student where StudentID=@StudentID
				end
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
	/*** Stored procedure for Login  (Condition in backend)***/
	begin 
		if(@Type='L')
			begin
				select * from dbo.tbl_Student where StudentId=@StudentId and SPassword=@SPassword
			end
	end
	begin
		if(@Type='U')
			begin
				update tbl_Student set SFname=@SFname,SLname=@SLname,SProgram=@SProgram,SEmail=@SEmail,SAddress1=@SAddress1,SAddress2=@SAddress2,
				SProvince=@SProvince,SPostalCode=@SPostalCode,SPhone=@SPhone,SCell=@SCell where StudentID=@StudentID
				select * from tbl_Student where StudentID=@StudentID
			end
	end






GO
/****** Object:  StoredProcedure [dbo].[Sp_WorkTerm]    Script Date: 4/10/2015 1:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_WorkTerm]
(
	@Id int=0 output,
	@StudentID int = null,
	@CompanyName nvarchar(50) = null,
	@CompanyAddress1 nvarchar(50) = null,
	@CompanyAddress2 nvarchar(50) = null,
	@City nvarchar(50) = null,
	@Province nvarchar(50) = null,
	@PostalCode nvarchar(50) = null,
	@WorkTerm nvarchar(50) =null,
	@Position nvarchar(50) = null,
	@Duties nvarchar(250) =null,
	@AUsername nvarchar(50) =null,
	@Grade nvarchar(50) =null,
	@Type varchar(10) =null
)
as
	begin
		if(@Type='I')
			begin
				insert into dbo.tbl_WorkTerm(StudentID,CompanyName,CompanyAddress1,CompanyAddress2,City,Province,PostalCode,WorkTerm,Position,Duties,AUsername,Grade)
							values(@StudentID,@CompanyName,@CompanyAddress1,@CompanyAddress2,@City,@Province,@PostalCode,@WorkTerm,@Position,@Duties,@AUsername,@Grade)
				select * from tbl_WorkTerm where StudentID=@StudentID
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
	begin
		if(@Type='Up')
			begin
				if not exists(select * from tbl_WorkTerm where StudentID=@StudentID and WorkTerm=@WorkTerm and Grade=@Grade)
				begin
					UPDATE tbl_WorkTerm SET
					StudentID=@StudentID, Grade=@Grade, WorkTerm=@WorkTerm
					WHERE StudentID=@StudentID 
					select * from tbl_WorkTerm where StudentID=@StudentID and WorkTerm=@WorkTerm and Grade=@Grade 
				end
				else
				begin
					select 0
				end
			end

	end


GO
/****** Object:  Table [dbo].[tbl_Advisor]    Script Date: 4/10/2015 1:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Advisor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdvisorName] [nvarchar](100) NULL,
	[AEmail] [nvarchar](100) NULL,
	[APhone] [varchar](50) NULL,
	[ACell] [varchar](50) NULL,
	[AArea] [nvarchar](100) NULL,
	[AUsername] [nvarchar](50) NOT NULL,
	[APassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Advisor_1] PRIMARY KEY CLUSTERED 
(
	[AUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CompanyRating]    Script Date: 4/10/2015 1:24:50 PM ******/
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
/****** Object:  Table [dbo].[tbl_CoopForm]    Script Date: 4/10/2015 1:24:50 PM ******/
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
	[WorkTerm] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[tbl_CoWorkers]    Script Date: 4/10/2015 1:24:50 PM ******/
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
/****** Object:  Table [dbo].[tbl_Student]    Script Date: 4/10/2015 1:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[SFname] [varchar](50) NULL,
	[SLname] [varchar](50) NULL,
	[SProgram] [varchar](50) NULL,
	[SEmail] [varchar](50) NULL,
	[SAddress1] [varchar](50) NULL,
	[SAddress2] [varchar](50) NULL,
	[SCity] [varchar](50) NULL,
	[SProvince] [varchar](50) NULL,
	[SPostalCode] [varchar](50) NULL,
	[SPhone] [varchar](50) NULL,
	[SCell] [varchar](50) NULL,
	[SPassword] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StudentEvalForm]    Script Date: 4/10/2015 1:24:50 PM ******/
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
/****** Object:  Table [dbo].[tbl_WorkTerm]    Script Date: 4/10/2015 1:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WorkTerm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CompanyName] [nvarchar](50) NULL,
	[CompanyAddress1] [nvarchar](100) NULL,
	[CompanyAddress2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[WorkTerm] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Duties] [nvarchar](250) NULL,
	[AUsername] [nvarchar](50) NULL,
	[Grade] [nvarchar](50) NULL,
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
