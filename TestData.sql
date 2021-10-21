LOCK TABLES `USER` WRITE;
INSERT INTO `USER` VALUES (1,'parth','marth@paradia.com','bum bum','2010-10-10','surat','india','91','968745128','hogi kahi'),(2,'harshita','hippo@yahoo.com','diga diga','2010-10-11','delhi','india','91','999999999','mil nahi rhi'),(3,'prerak','bihari@babu@hotmail.com','nigga nigaa','2010-10-12','banglore','india','91','888888888','mil nahi') ;
UNLOCK TABLES;

LOCK TABLES `ARTIST` WRITE;
INSERT INTO `ARTIST` VALUES (1,'parth','50000','Banta Rapper','Too hot to handle' ) , (2,'harshita','6000','bathroom singer','helo'), (3,'Bihari','1','Bojpuri','Rinkiya ke papa')   ;
UNLOCK TABLES;

LOCK TABLES `ALBUM` WRITE;
INSERT INTO `ALBUM` VALUES (1,'nahi degi', '2020-10-5' , 'Not available', 2) , ( 2 ,'who gives a shit', '2020-1-4' , 'wow bhaiya', 3), (3,'chad', '2020-11-16' , 'hue hue hue', 1)  ;
UNLOCK TABLES;

LOCK TABLE `SONG` WRITE;
INSERT INTO `SONG` VALUES (1,'dhoom dhoom','120','meh', 'rock' , '2015-6-9' ,'modi', 'img not found' , 1 , 1 ),(2,'mera mann kehne laga','250','hoga kahi', 'casual' , '2015-8-9' ,'hippo', 'img2' , 2 , 2 ), (3,'litti choka','560','thak gaya vro', 'bhojpuri' , '2015-6-3' ,'lalu', 'e laddo lo' , 3 , 3 ); 
UNLOCK TABLES;
-- CREATE TABLE `SONG` (
--   `SONG_ID` int(11) NOT NULL AUTO_INCREMENT,
--   `SONG_TITLE` varchar(100) NOT NULL,
--   `SONG_LENGTH` int(11) NOT NULL,
--   `SONG_LYRICS` varchar(1000) NOT NULL,
--   `SONG_GENRE` char(30) NOT NULL,
--   `DATE_ADDED` date NOT NULL,
--   `SONG_PATH` varchar(50) NOT NULL,
--   `SONG_COVER_IMG` varchar(50) NOT NULL,
--   `ALBUM_ID` int(11) NOT NULL,
--   `ARTIST_ID` int(11) NOT NULL,
--   PRIMARY KEY (`SONG_ID`),
--   CONSTRAINT `SONG_FK_ALBUM` FOREIGN KEY (`ALBUM_ID`) REFERENCES `ALBUM` (`ALBUM_ID`),
--   CONSTRAINT `SONG_FK_ARTIST` FOREIGN KEY (`ARTIST_ID`) REFERENCES `ARTIST` (`ARTIST_ID`),
--   KEY(`SONG_LYRICS`)
-- );