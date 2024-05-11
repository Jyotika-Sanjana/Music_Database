-- Create the database
CREATE DATABASE music_db;

-- Use the database
USE music_db;

-- Create the tables
CREATE TABLE Artists (
    ArtistID INT AUTO_INCREMENT PRIMARY KEY,
    ArtistName VARCHAR(100) NOT NULL
);

CREATE TABLE Albums (
    AlbumID INT AUTO_INCREMENT PRIMARY KEY,
    AlbumTitle VARCHAR(100) NOT NULL,
    ReleaseYear YEAR,
    ArtistID INT NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

CREATE TABLE Songs (
    SongID INT AUTO_INCREMENT PRIMARY KEY,
    SongTitle VARCHAR(100) NOT NULL,
    Duration TIME NOT NULL,
    AlbumID INT NOT NULL,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

-- Insert data into the tables
INSERT INTO Artists (ArtistName) VALUES
    ('Artist 1'),
    ('Artist 2'),
    ('Artist 3');

INSERT INTO Albums (AlbumTitle, ReleaseYear, ArtistID) VALUES
    ('Album 1', 2020, 1),
    ('Album 2', 2019, 2),
    ('Album 3', 2021, 3),
    ('Album 4', 2018, 1);

INSERT INTO Songs (SongTitle, Duration, AlbumID) VALUES
    ('Song 1', '00:03:25', 1),
    ('Song 2', '00:04:12', 1),
    ('Song 3', '00:03:48', 2),
    ('Song 4', '00:02:59', 3),
    ('Song 5', '00:03:37', 4);

-- Query examples
SELECT ArtistName, AlbumTitle, SongTitle, Duration
FROM Artists
JOIN Albums ON Artists.ArtistID = Albums.ArtistID
JOIN Songs ON Albums.AlbumID = Songs.AlbumID;

SELECT AlbumTitle, COUNT(SongTitle) AS NumSongs
FROM Albums
JOIN Songs ON Albums.AlbumID = Songs.AlbumID
GROUP BY AlbumTitle;


