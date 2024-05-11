--Get all songs by a specific artist:

SELECT Songs.SongTitle, Songs.Duration
FROM Songs
JOIN Albums ON Songs.AlbumID = Albums.AlbumID
JOIN Artists ON Albums.ArtistID = Artists.ArtistID
WHERE Artists.ArtistName = 'Artist 1';

--Get the total duration of all songs on an album:
SELECT Albums.AlbumTitle, SUM(TIME_TO_SEC(Songs.Duration)) AS TotalDuration
FROM Albums
JOIN Songs ON Albums.AlbumID = Songs.AlbumID
GROUP BY Albums.AlbumTitle;
 --Find the artist with the most albums:
SELECT Artists.ArtistName, COUNT(Albums.AlbumID) AS NumAlbums
FROM Artists
LEFT JOIN Albums ON Artists.ArtistID = Albums.ArtistID
GROUP BY Artists.ArtistName
ORDER BY NumAlbums DESC
LIMIT 1;

--Get all albums released in a specific year:
SELECT Albums.AlbumTitle, Artists.ArtistName
FROM Albums
JOIN Artists ON Albums.ArtistID = Artists.ArtistID
WHERE Albums.ReleaseYear = 2020;

--Find the longest song in the database:
SELECT Songs.SongTitle, Songs.Duration
FROM Songs
ORDER BY TIME_TO_SEC(Songs.Duration) DESC
LIMIT 1;

--Count the number of songs for each artist:
SELECT Artists.ArtistName, COUNT(Songs.SongID) AS NumSongs
FROM Artists
LEFT JOIN Albums ON Artists.ArtistID = Albums.ArtistID
LEFT JOIN Songs ON Albums.AlbumID = Songs.AlbumID
GROUP BY Artists.ArtistName;


--Get all albums with no songs:
SELECT Albums.AlbumTitle
FROM Albums
LEFT JOIN Songs ON Albums.AlbumID = Songs.AlbumID
WHERE Songs.SongID IS NULL;

--Update the name of an artist:

UPDATE Artists
SET ArtistName = 'New Artist Name'
WHERE ArtistID = 1;


--Update the release year of an album:

UPDATE Albums
SET ReleaseYear = 2022
WHERE AlbumID = 3;


--Update the duration of a song:

UPDATE Songs
SET Duration = '00:03:45'
WHERE SongID = 2;


--Update the album title and artist for an album:

UPDATE Albums
JOIN Artists ON Albums.ArtistID = Artists.ArtistID
SET Albums.AlbumTitle = 'New Album Title', Albums.ArtistID = 2
WHERE Albums.AlbumID = 4 AND Artists.ArtistName = 'Artist 1';


--Update the song title and album for a song:

UPDATE Songs
JOIN Albums ON Songs.AlbumID = Albums.AlbumID
SET Songs.SongTitle = 'New Song Title', Songs.AlbumID = 2
WHERE Songs.SongID = 5 AND Albums.AlbumTitle = 'Album 4';