 /************************************************************
  Project 4
  Date		   programmer        Note
  10/16/2019    Ashley Provolt	 Adding joins to tables
*****************************************************************/

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
