 /************************************************************
  Project 3
  Date		   programmer        Note
  10/10/2019    Ashley Provolt	  creating 	information in tables
*****************************************************************/

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
           ('We are bit alone', 06/29/2004, 1, 3)
		   ,('Red', 10/22/2012, 3, 1)
		   ,('Yours truly forever', 08/18/2017, 4, 2)
		   ,('Extremist', 03/18/2014, 2, 1)
		   ,('Fearless', 11/11/2008, 5, 2)
		   ,('1989', 10/27/2014, 3, 3)
		   ,('Sincerely Yours', 05/18/2014, 4, 1)
		   ,('Dark before dawn', 06/23/2015, 1, 2)
		   ,('Outlive', 03/31/2017, 2, 2)
		   ,('Set It Off', 04/14/2000, 1, 3)
		   ,('Phenomenon', 09/30/2003, 1, 2)
		   ,('Confident', 10/16/2015, 3, 1)
		   ,('Love is hell', 10/05/2018, 4, 3)
		   ,('Dear Agony', 09/29/2009, 1, 1)
		   ,('Summer of Darkness', 05/04/2004, 2, 2)
		   ,('V', 08/29/2014, 3, 2)
		   ,('Percption', 10/06/2017, 4, 2)
		   ,('Overexposed', 06/20/2012, 3, 1)
		   ,('How can it be', 04/14/2015, 3, 2)
		   ,('Thrive', 01/28/2014, 3, 1)
		   ,('Philosophical sessions', 01/11/2019, 3, 2)
GO

INSERT INTO [dbo].[CD]
           ([CD_Name]
		   ,[release_Date]
           ,[genre_ID]
           ,[status_ID])
     VALUES
           ('Red Pill Blues', 11/3/2017, 3,1)
GO
--update CD
UPDATE [dbo].[CD]
   SET [CD_Name] = 'Therapy Session' ,
	[release_Date] = 4/22/2016
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
           (10, 16, 11/16/2018, 12/29/2018)
		   ,(14, 5, 10/14/2018, 01/18/2019)
		   ,(11, 1, 10/22/2018, 12/15/2018)
		   ,(18, 9, 12/14/2018, NULL)
		   ,(9, 18, 01/01/2019, 03/03/2019)
		   ,(17, 19, 02/14/2019, 05/25/2019)
		   ,(9, 6, 03/08/2019, 06/01/2019)
		   ,(10, 18, 11/02/2019, NULL)
		   ,(4, 15, 3/10/2019, 10/08/2019)
		   ,(12, 5, 07/14/2019, 10/15/2019)
		   ,(1, 15, 09/01/2019, NULL)
		   ,(1, 5, 10/01/2019, NULL)
		   ,(3, 12, 09/10/2018, NULL)
		   ,(16, 13, 08/20/2019, NULL)
		   ,(2, 11, 05/17/2019, NULL)
		   ,(15, 17, 08/16/2019, NULL)
		   ,(10, 9, 06/22/2019, NULL)
		   ,(14, 21, 07/04/2019, NULL)
		   ,(5, 19, 09/25/2019, NULL)
		   ,(6, 8, 09/12/2019, 10/10/2019)
GO

--borrower
select borrower_ID, CD_ID, borrower_date, returned_date
from borrower_CD
order by borrower_ID;
