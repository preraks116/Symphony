LOCK TABLES `USER` WRITE;
INSERT INTO `USER` VALUES (1,'parth','marth@paradia.com','bum bum','2010-10-10','surat','india','96874128','hogi kahi'),(2,'harshita','hippo@yahoo.com','diga diga','2010-10-11','delhi','india','99999999','mil nahi rhi'),(3,'prerak','bihari@babu@hotmail.com','nigga nigaa','2010-10-12','banglore','india','88888888','mil nahi') ;
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

LOCK TABLE `PLAYLIST` WRITE;
INSERT INTO `PLAYLIST` VALUES (1,'playlist 1', 'desc 1', '10' , true) , (2,'playlist 2', 'desc 2', '11' , false) , (3,'playlist 3', 'desc 3', '13' , true), (1,'playlist 4', 'desc 4', '14' , false), (2,'playlist 5', 'desc 5', '15' , false), (3,'playlist 6', 'desc 6', '16' , true);  
UNLOCK TABLE;

LOCK TABLE `PODCAST` WRITE;
INSERT INTO `PODCAST` VALUES (1, )
UNLOCK TABLE;

-- DROP TABLE IF EXISTS `PODCAST`;
-- CREATE TABLE `PODCAST` (
--   `PODCAST_ID` int(11) NOT NULL AUTO_INCREMENT,
--   `PODCAST_TITLE` varchar(30) NOT NULL,
--   `PODCAST_CATEGORY` varchar(30) NOT NULL,
--   `PODCAST_NUMBER_OF_EPISODES` int(11) NOT NULL,
--   `PODCAST_TOTAL_DURATION` int(11) NOT NULL,
--   `PODCAST_COVER_IMG` varchar(50) NOT NULL,
--   `ARTIST_ID` int(11) NOT NULL, 
--   PRIMARY KEY (`PODCAST_ID`),
--   CONSTRAINT `PODCAST_FK_ARTIST` FOREIGN KEY (`ARTIST_ID`) REFERENCES `ARTIST` (`ARTIST_ID`)
-- );