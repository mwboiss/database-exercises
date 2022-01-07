#Problem 3a
SELECT * FROM albums;
#Answer: 31

#Problem 3b
SELECT DISTINCT artist from albums;
#Answer: 23

#Problem 3c
DESCRIBE albums;
#Answer: id

#Problem 3d
SELECT min(release_date) FROM albums;
SELECT max(release_date) FROM albums;
#Answer: 1967 and 2011

#Problem 4a
SELECT name FROM albums WHERE artist = 'Pink Floyd';
#Answer: 'The Dark Side of the Moon' and 'The Wall'

#Problem 4b
SELECT Release_date from albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
#Answer: 1967

#Problem 4c
SELECT genre FROM albums WHERE name = 'Nevermind';
#Answer: Grunge, Alternative rock

#Problem 4d
SELECT name FROM albums WHERE Release_date BETWEEN 1990 AND 1999;
#Answer: The Bodygaurd, Jagged Little Pill, Come on Over, Falling into you, Let's Talk About Love, Dangerous, The Immaculate Collection, Titanic: Music from the Motion Picture, Metallica, Nevermind, Supernatural

#Problem 4e
SELECT name FROM albums WHERE sales < 20;
#Answer: Grease: The Original Soundtrack from the Motion Picture, Bad, Sgt. Pepper's Lonely Hearts Club Band, Dirty Dancing, Let's Talk About Love, Dangerous, The Immaculate Collection, Abbey RToad, Born in the U.S.A., Brother in Arms, Titanic: Music from the Motion Picture, Nevermind, The Wall

#Problem 4f
SELECT name FROM albums WHERE genre = "Rock";
#Answer: Sgt. Pepper's Lonely Hearts Club Band, 1, Abbey Road, Born in the U.S.A., Supernatural