  /*****************************************************************************************
  Project 2	- 5
  Date						 programmer		  Note
  10/3/2019-10/23/2019    Ashley Provolt	  created database and tables.
											  creating information in tables.
											  Adding joins to tables.
											  inserts PROC to artist, borrower, and CD.
											  Update PROC to artist, borrower, and CD.
											  delete PROC to artist, borrower, and CD.
*******************************************************************************************/
 --Project 2
use master
go

if DB_ID('disk_inventoryap')  is not null
	drop database disk_inventoryap
go

create database disk_inventoryap
go

use disk_inventoryap;
go

--creating tables

create table borrower (
	borrower_ID int not null identity primary key,
	borrower_FName varchar(100) not null,
	borrower_LName varchar(100) not null
);

create table artist_type	(
	 artist_type_ID int not null primary key,
	 artist_description varchar(100) not null
);

create table artist (
	artist_ID int not null identity primary key,
	artist_type_ID int not null references artist_type(artist_type_ID),
	artist_FName varchar(100) not null,
	artist_LName varchar(100) null
);

create table genre (
	genre_ID int not null primary key,
	description varchar(255) not null
);

create table status (
	status_ID int not null primary key,
	description varchar(255) not null
);

create table CD (
	CD_ID int not null identity primary key,
	CD_Name varchar(100) not null,
	release_Date smalldatetime not null,
	genre_ID int not null references genre(genre_ID),
	status_ID int not null references status(status_ID)
);

create table CD_artist (
	artist_ID int not null identity references artist(artist_ID),
	CD_ID int not null references CD(CD_ID),
	primary key(artist_ID, CD_ID) 	
);

--drop table borrower_CD;

create table borrower_CD (
	borrower_ID int not null references borrower(borrower_ID),
	CD_ID       int not null references CD(CD_ID),
	borrower_date smalldatetime not null,
	returned_date smalldatetime null
	primary key(borrower_ID, CD_ID, borrower_date)
);



if SUSER_ID('disk_inventoryap') is null
create login diskap with password = 'MSPress#1',
	DEFAULT_DATABASE = disk_inventoryap;

if USER_ID('diskap') is null
create user diskap;

alter role db_datareader add member diskap;
go

  /************************************************************
  Project 3
  Date		   programmer        Note
  10/10/2019    Ashley Provolt	  creating information in tables
*****************************************************************/
--project 3
USE [disk_inventoryap]
GO
-- genre
--delete from genre;
INSERT INTO [dbo].[genre]
           ([genre_ID], [description])
     VALUES
           (1, 'rock'),
		   (2, 'Metal'),
		   (3, 'hip hop'),
		   (4, 'Rap'),
		   (5, 'country'),
		   (6, 'jazz')
		  
Go


-- Status
INSERT INTO [dbo].[status]
           ([status_ID], [description])
     VALUES
           (1, 'available'),
		   (2, 'being borrowed'),
		   (3, 'unavailable')
GO

--artist_type
INSERT INTO [dbo].[artist_type]
           ([artist_type_ID]
           ,[artist_description])
     VALUES
           ( 1 ,'single artist')
		   ,(2  ,'Group artists')
GO





--artist
INSERT INTO [dbo].[artist]
           ([artist_type_ID]
		   ,[artist_FName]
           ,[artist_LName])
     VALUES
           (2, 'Breaking Benjamon', NULL)
		   ,(2, 'Diciple', NULL)
		   ,(1, 'Taylor','Swift')
		   ,(1, 'Demi', 'Lavato')
		   ,(1, 'Phora', NULL)
		   ,(1, 'NF', NULL)
		   ,(1, 'Ed', 'Sheeran')
		   ,(2, 'Maroon 5', Null)
		   ,(1, 'Jacob', 'Lee')
		   ,(1, 'G-Eazy', NULL)
		   ,(1, 'Bazzi', NULL)
		   ,(2, 'Demon Hunter', NULL)
		   ,(1, 'Chris', 'Brown')
		   ,(2, 'Five Finger Death Punch', NULL)
		   ,(1, 'Lauren', 'Daigle')
		   ,(2, 'Casting Crowns', NULL)
		   ,(1, 'Crowder', NULL)
		   ,(2, 'Jars Of Clay', NULL)
		   ,(2, 'Thousand Foot Krutch', NULL)
		   ,(1, 'Julia', 'Michaels')
		   ,(1, 'Faouzia', Null)
GO

--Borrower
INSERT INTO [dbo].[borrower]
           ([borrower_FName]
           ,[borrower_LName])
     VALUES
           ('James', 'Lee')
		   ,('Jacob', 'johnson')
		   ,('Tim', 'Brown')
		   ,('Dave', 'San')
		   ,('Sue', 'Davedson')
		   ,('Terra', 'joy')
		   ,('John', 'Smith')
		   ,('Tamie', 'White')
		   ,('Tom', 'Nicolas')
		   ,('Nick', 'jim')
		   ,('Ben', 'jackson')
		   ,('Jonny', 'Michaels')
		   ,('Beth', 'Clancy')
		   ,('Carly', 'clay')
		   ,('jessica', 'Sims')
		   ,('Timothy', 'pilot')
		   ,('Luke', 'Wilson')
		   ,('Tyler', 'Locket')
		   ,('Bobby', 'Wagner')
		   ,('Justin', 'Britt')
GO
-- Delete a borrower
DELETE FROM [dbo].[borrower]
      WHERE borrower_ID = 20;
GO



--CD
INSERT INTO [dbo].[CD]
           ([CD_Name]
		   ,[release_Date]
           ,[genre_ID]
           ,[status_ID])
     VALUES
           ('We are bit alone', '06/29/2004', 1, 3)
		   ,('Red', '10/22/2012', 3, 1)
		   ,('Yours truly forever', '08/18/2017', 4, 2)
		   ,('Extremist', '03/18/2014', 2, 1)
		   ,('Fearless', '11/11/2008', 5, 2)
		   ,('1989', '10/27/2014', 3, 3)
		   ,('Sincerely Yours', '05/18/2014', 4, 1)
		   ,('Dark before dawn', '06/23/2015', 1, 2)
		   ,('Outlive', '03/31/2017', 2, 2)
		   ,('Set It Off', '04/14/2000', 1, 3)
		   ,('Phenomenon', '09/30/2003', 1, 2)
		   ,('Confident', '10/16/2015', 3, 1)
		   ,('Love is hell', '10/05/2018', 4, 3)
		   ,('Dear Agony', '09/29/2009', 1, 1)
		   ,('Summer of Darkness', '05/04/2004', 2, 2)
		   ,('V', '08/29/2014', 3, 2)
		   ,('Percption', '10/06/2017', 4, 2)
		   ,('Overexposed', '06/20/2012', 3, 1)
		   ,('How can it be', '04/14/2015', 3, 2)
		   ,('Thrive', '01/28/2014', 3, 1)
		   ,('Philosophical sessions', '01/11/2019', 3, 2)
GO

INSERT INTO [dbo].[CD]
           ([CD_Name]
		   ,[release_Date]
           ,[genre_ID]
           ,[status_ID])
     VALUES
           ('Red Pill Blues', '11/3/2017', 3,1)
GO
--update CD
UPDATE [dbo].[CD]
   SET [CD_Name] = 'Therapy Session' ,
	[release_Date] = '4/22/2016'
	WHERE 	CD_ID = 13;
GO






--CD_artist 
set IDENTITY_INSERT [dbo].[CD_artist] ON
go
INSERT INTO [dbo].[CD_artist]
           ([CD_ID], [artist_ID])
     VALUES
           (22, 8)	--Need to add in 20 also for artist
		   ,(22, 20)
		   ,(16, 8)
		   ,(6, 3)
		   ,(2, 3)
		   ,(10, 19)
		   ,(8, 1)
		   ,(21, 9)
		   ,(9, 12)
		   ,(14, 1)
		   ,(18, 8)
		   ,(12, 4)
		   ,(17, 6)
		   ,(13, 5)
		   ,(11, 19)
		   ,(3, 5)
		   ,(7, 5)
		   ,(20, 17)
		   ,(1, 1)
		   ,(19, 15)
		   ,(4, 12)

GO



--borrower_CD
INSERT INTO [dbo].[borrower_CD]
           ([borrower_ID]
           ,[CD_ID]
           ,[borrower_date]
           ,[returned_date])
     VALUES
           (10, 16, '11/16/2018', '12/29/2018')
		   ,(14, 5, '10/14/2018', '01/18/2019')
		   ,(11, 1, '10/22/2018', '12/15/2018')
		   ,(18, 9, '12/14/2018', NULL)
		   ,(9, 18, '01/01/2019', '03/03/2019')
		   ,(17, 19, '02/14/2019', '05/25/2019')
		   ,(9, 6, '03/08/2019', '06/01/2019')
		   ,(10, 18, '11/02/2019', NULL)
		   ,(4, 15, '3/10/2019', '10/08/2019')
		   ,(12, 5, '07/14/2019', '10/15/2019')
		   ,(1, 15, '09/01/2019', NULL)
		   ,(1, 5, '10/01/2019', NULL)
		   ,(3, 12, '09/10/2018', NULL)
		   ,(16, 13, '08/20/2019', NULL)
		   ,(2, 11, '05/17/2019', NULL)
		   ,(15, 17, '08/16/2019', NULL)
		   ,(10, 9, '06/22/2019', NULL)
		   ,(14, 21, '07/04/2019', NULL)
		   ,(5, 19, '09/25/2019', NULL)
		   ,(6, 8, '09/12/2019', '10/10/2019')
GO

--borrower
select borrower_ID, CD_ID, borrower_date, returned_date
from borrower_CD
order by borrower_ID;


 /************************************************************
  Project 4
  Date		   programmer        Note
  10/16/2019    Ashley Provolt	 Adding joins to tables
*****************************************************************/
--Project 4
Use disk_inventoryap; 
go

--3. CD and Artist
  select CD_Name as 'Disk Name', artist_FName as 'Artist first name', artist_LName as 'Artist last name', CONVERT(varchar(10), release_date, 101) as 'release date'
  from 	CD  join CD_artist
  on CD.CD_ID = CD_artist.CD_ID
  join artist on artist.artist_ID = CD_artist.artist_ID
  where artist_type_ID = 1
  order by artist_LName, artist_FName, CD_Name; 
  go

--4. View call on artist_ID and showing first and last name
drop view if exists View_Individual_Artist;
go
Create view View_Individual_Artist as
select	artist_ID, artist_FName, artist_LName
from artist
where artist_type_ID = 1;
go
select artist_FName as FirstName, artist_LName as LastName
from View_Individual_Artist;

--5. CD, artist and release date
select CD_Name as 'CD Name', artist_FName as 'group Artist', CONVERT(varchar(10), release_date, 101) as 'release date' 
from CD 
join CD_artist on CD.CD_ID = CD_artist.CD_ID 
join artist on artist.artist_ID = CD_artist.artist_ID
where artist.artist_ID not in(select artist_ID 
	from View_Individual_Artist)
	order by artist_FName, CD_Name;

--6. CD borrowed and who borrowed them
select	borrower_FName as 'First', borrower_LName as 'Last', CD_Name as 'CD Name', CONVERT(varchar(10), borrower_date, 120) as 'Borrowed Date', 
CONVERT(varchar(10), returned_date, 120) as 'Returned Date'
from borrower
join borrower_CD on borrower.borrower_ID = borrower_CD.borrower_ID
join CD on CD.CD_ID = borrower_CD.CD_ID
order by borrower_LName, borrower_FName, CD_Name, borrower_date, returned_date;

--7. How many times CD has been borrowed
select CD.CD_ID as 'CD ID', CD_Name 'CD Name', COUNT(*)	as 'Times Borrowed'
from CD
join borrower_CD on CD.CD_ID = borrower_CD.CD_ID
group by CD.CD_ID, CD_Name
order by CD.CD_ID;

--8. Outstanding or on-loan
select CD_Name as 'CD Name', CONVERT(varchar(10), borrower_date, 120) as 'Borrowed Date',
 CONVERT(varchar(10), returned_date, 120) as 'Returned Date', borrower_LName 'Last Name'
from CD
join borrower_CD on borrower_CD.CD_ID = CD.CD_ID
join borrower on borrower.borrower_ID = borrower_CD.borrower_ID
where returned_date IS NULL
order by CD_Name;

 /************************************************************************
  Project 5
  Date		   programmer        Note
  10/23/2019    Ashley Provolt	 inserts PROC to artist, borrower, and CD.
								 Update	 PROC to artist, borrower, and CD.
								 delete	 PROC to artist, borrower, and CD.
***************************************************************************/

--project 5
use disk_inventoryap;
go

--artist
DROP PROC if exists sp_insArtist;
go
Create PROC sp_insArtist
	@artist_type int,
	@artist_fName nvarchar(100),
	@artist_lName nvarchar(100) = null
AS
BEGIN TRY
INSERT INTO [dbo].[artist]
           ([artist_type_ID]
           ,[artist_FName]
           ,[artist_LName])
     VALUES
           ( @artist_type
		   ,@artist_fName
		   ,@artist_lName)
END TRY 
BEGIN CATCH
	     PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
END CATCH;

EXEC sp_insArtist 1, 'Bruno', 'Mars';
EXEC sp_insArtist  'prince', null;
go
select * from artist;


--update for artist 
DROP PROC if exists sp_UPArtist;
go
Create PROC sp_UPArtist
	@artist_ID int,
	@artist_type int,
	@artist_fName nvarchar(100),
	@artist_lName nvarchar(100) = null
AS
begin try
UPDATE [dbo].[artist]
   SET [artist_type_ID] = @artist_type 
      ,[artist_FName] = @artist_fName
      ,[artist_LName] = @artist_lName
 WHERE artist_ID = @artist_ID
END TRY 
BEGIN CATCH
	     PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
END CATCH;

EXEC sp_UPArtist 22, 1, 'Brunooo', 'Mars';
EXEC sp_UPArtist  'prince', null;

 --delete artist
DROP PROC if exists sp_DeleteArtist;
go
Create PROC sp_DeleteArtist
	@artist_ID int,
	@artist_type int,
	@artist_fName nvarchar(100),
	@artist_lName nvarchar(100) = null
AS
begin try
DELETE FROM [dbo].[artist]
      WHERE artist_ID = @artist_ID
 end try
 begin catch
 	     PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
 end catch

 EXEC sp_DeleteArtist 22, 1, 'Brunooo', 'Mars';


 -- borrower insert
DROP PROC if exists sp_insBorrower;
go
Create PROC sp_insBorrower
	@borrower_FName nvarchar(100),
	@borrower_LName nvarchar(100) 
as
begin try
	INSERT INTO [dbo].[borrower]
           ([borrower_FName]
           ,[borrower_LName])
     VALUES
           (@borrower_FName
		   ,@borrower_LName)
end try 
begin catch
	 PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
end catch

EXEC  sp_insBorrower  'Jimmy', 'deen';
go

--Update borrower
DROP PROC if exists sp_UPborrower;
go
Create PROC sp_UPborrower
	@borrower_ID int,
	@borrower_FName nvarchar(100),
	@borrower_LName nvarchar(100) 
AS
begin try
UPDATE [dbo].[borrower]
   SET [borrower_FName] = @borrower_FName
      ,[borrower_LName] = @borrower_LName
 WHERE borrower_ID =  @borrower_ID

END try
BEGIN CATCH
	     PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
END CATCH;

EXEC sp_UPborrower 22, 'Jimmy', 'Dean';
go

--delete borrower
DROP PROC if exists sp_Deleteborrower;
go
Create PROC sp_Deleteborrower
	@borrower_ID int,
	@borrower_FName nvarchar(100),
	@borrower_LName nvarchar(100) 
AS
begin try
DELETE FROM [dbo].[borrower]
      WHERE borrower_ID = @borrower_ID
end try
begin catch
	     PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
end catch 

EXEC sp_Deleteborrower 22, 'Jimmy', 'Dean';
go


-- CD insert
   DROP PROC if exists sp_insCD;
go
Create PROC sp_insCD
	@CD_Name nvarchar(100),
	@release_Date smalldatetime,
	@genre_ID int,
	@status_ID int 
AS
begin try
INSERT INTO [dbo].[CD]
           ([CD_Name]
           ,[release_Date]
           ,[genre_ID]
           ,[status_ID])
     VALUES
           ( @CD_Name
           ,@release_Date
           ,@genre_ID
           ,@status_ID)
end try
begin catch
    PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
end catch

EXEC sp_insCD 'War', '03/1/2019', 2, 1;
go

--update CD
     DROP PROC if exists sp_UPCD;
go
Create PROC sp_UPCD
	@CD_ID int,
	@CD_Name nvarchar(100),
	@release_Date smalldatetime,
	@genre_ID int,
	@status_ID int 
AS
begin try
UPDATE [dbo].[CD]
   SET [CD_Name] = @CD_Name
      ,[release_Date] = @release_Date
      ,[genre_ID] = @genre_ID
      ,[status_ID] = @status_ID
 WHERE CD_ID = @CD_ID
end try
begin catch
    PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
end catch

EXEC  sp_UPCD 23, 'WAR', '03/1/2019', 2, 1;

-- delete CD
     DROP PROC if exists sp_deleteCD;
go
Create PROC sp_deleteCD
	@CD_ID int,
	@CD_Name nvarchar(100),
	@release_Date smalldatetime,
	@genre_ID int,
	@status_ID int 
AS
begin try
DELETE FROM [dbo].[CD]
      WHERE CD_ID = @CD_ID
end try
begin catch
    PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(200), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(200), ERROR_MESSAGE());
end catch

EXEC sp_deleteCD  23, 'WAR', '03/1/2019', 2, 1;
 go
