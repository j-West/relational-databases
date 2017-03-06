--  Query all of the entries in the Genre table

  SELECT * FROM Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.

  INSERT INTO Artist (ArtistName, YearEstablished) VALUES ("BEETZ by Billy", 2017);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ("Billyz Fresh BEETZ", "02/13/2017", 43373, "BillyZ BEETZ Label", 29, 12);

-- Using the INSERT statement, add some songs that are on that album to the Song table.

  INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ("Frezhest BEET", 1000, "02/13/2017", 12, 29, 25);
  INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ("Ol Legg BEET", 1200, "02/13/2017", 12, 29, 25);
  INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ("First BEET", 1200, "02/13/2017", 12, 29, 25);
  INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ("Good BEET", 1400, "02/13/2017", 12, 29, 25);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.

  SELECT s.Title AS Song_Title, alb.Title AS Album_Title, art.ArtistName FROM Song s
  LEFT JOIN Album alb ON s.AlbumId = alb.AlbumId
  LEFT JOIN Artist art ON s.ArtistId = art.ArtistId
  WHERE s.ArtistId = 29;

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

  SELECT  Album.Title AS Album_Title, COUNT(Song.AlbumId) AS Songs_In_Album
  FROM Song
  LEFT JOIN Album ON Song.AlbumId = Album.AlbumId
  GROUP BY Album.Title;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

  SELECT Artist.ArtistName AS Artist_Name, COUNT(Song.ArtistId) AS Songs_By_Artist
  FROM Song
  LEFT JOIN Artist ON Song.ArtistId = Artist.ArtistId
  GROUP BY Artist.ArtistName;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

  SELECT Genre.Label AS Genre_Name, COUNT(Song.GenreId) AS Songs_By_Genre
  FROM Song
  LEFT JOIN Genre ON Song.GenreId = Genre.GenreId
  GROUP BY Genre.Label;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

  SELECT Album.Title, MAX(Album.AlbumLength) As Album_Length
  FROM Album;


-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

  SELECT Song.Title, MAX(Song.SongLength) As Song_Length
  FROM Song;

-- Modify the previous query to also display the title of the album.

  SELECT Song.Title AS Song_Title, Album.Title AS Album_Title, MAX(Song.SongLength) As Song_Length
  FROM Song
  LEFT JOIN Album ON Song.AlbumId = Album.AlbumId;
