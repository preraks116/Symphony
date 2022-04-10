DROP DATABASE IF EXISTS `SYMPHONY`;
CREATE SCHEMA `SYMPHONY`;
USE `SYMPHONY`;
DROP TABLE IF EXISTS `USER`;

CREATE TABLE `USER` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` char(30) NOT NULL,
  `USER_EMAIL` char(30),
  `USER_PASSWORD` char(20) NOT NULL,
  `USER_REGISTRATION_DATE` date NOT NULL,
  `USER_STATE` CHAR(20),
  `USER_COUNTRY` CHAR(20) NOT NULL,
  `USER_MOBILE_NUMBER` INT(10),
  `USER_IMG` CHAR(20),
  PRIMARY KEY (`USER_ID`),
  KEY(`USER_EMAIL`)
);


DROP TABLE IF EXISTS `ARTIST`;

CREATE TABLE `ARTIST` (
  `ARTIST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ARTIST_NAME` varchar(100) NOT NULL,
  `ARTIST_FOLLOWERS` int(11),
  `ARTIST_CATEGORY` varchar(100) NOT NULL,
  `ARTIST_IMG` varchar(100),
  PRIMARY KEY (`ARTIST_ID`),
  KEY(`ARTIST_NAME`)
);


DROP TABLE IF EXISTS `ALBUM`;
CREATE TABLE `ALBUM` (
  `ALBUM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ALBUM_NAME` varchar(30) NOT NULL,
  `ALBUM_RELEASE_DATE` DATE,
  `ARTIST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ALBUM_ID`),
  CONSTRAINT `ALBUM_FK_ARTIST` FOREIGN KEY (`ARTIST_ID`) REFERENCES `ARTIST` (`ARTIST_ID`),
  KEY(`ALBUM_NAME`)
);


DROP TABLE IF EXISTS `SONG`;
CREATE TABLE `SONG` (
  `SONG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SONG_TITLE` varchar(100) NOT NULL,
  `SONG_LENGTH` int(11) NOT NULL,
  `SONG_LYRICS` varchar(1000) NOT NULL,
  `DATE_ADDED` date NOT NULL,
  `SONG_PATH` varchar(50) NOT NULL,
  `ALBUM_ID` int(11) NOT NULL,
  `ARTIST_ID` int(11) NOT NULL,
  `TOTAL_LIKES` INT(11) DEFAULT 0,
  PRIMARY KEY (`SONG_ID`),
  CONSTRAINT `SONG_FK_ALBUM` FOREIGN KEY (`ALBUM_ID`) REFERENCES `ALBUM` (`ALBUM_ID`),
  CONSTRAINT `SONG_FK_ARTIST` FOREIGN KEY (`ARTIST_ID`) REFERENCES `ARTIST` (`ARTIST_ID`),
  KEY(`SONG_LYRICS`)
);


DROP TABLE IF EXISTS `PLAYLIST`;
CREATE TABLE `PLAYLIST` (
  `USER_ID` int(11) NOT NULL,
  `PLAYLIST_TITLE` char(30) NOT NULL,
  `PLAYLIST_DESCRIPTION` char(30),
  `PLAYLIST_SAVES` INT(11), 
  `IS_SECRET` BOOL,
  PRIMARY KEY (`USER_ID`, `PLAYLIST_TITLE`),
  KEY(`PLAYLIST_TITLE`),
  CONSTRAINT `PLAYLIST_FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);


DROP TABLE IF EXISTS `PODCAST`;
CREATE TABLE `PODCAST` (
  `PODCAST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PODCAST_TITLE` varchar(30) NOT NULL,
  `PODCAST_CATEGORY` varchar(30) NOT NULL,
  `PODCAST_NUMBER_OF_EPISODES` int(11) NOT NULL,
  `PODCAST_TOTAL_DURATION` int(11) NOT NULL,
  `PODCAST_COVER_IMG` varchar(50) NOT NULL,
  `ARTIST_ID` int(11) NOT NULL, 
  KEY(`PODCAST_TITLE`),
  PRIMARY KEY (`PODCAST_ID`),
  CONSTRAINT `PODCAST_FK_ARTIST` FOREIGN KEY (`ARTIST_ID`) REFERENCES `ARTIST` (`ARTIST_ID`)
);


DROP TABLE IF EXISTS `EPISODE`;
CREATE TABLE `EPISODE` (
  `PODCAST_ID` int(11) NOT NULL ,
  `EPISODE_TITLE` varchar(30) NOT NULL,
  `EPISODE_NUMBER` INT(3),
  `EPISODE_DURATION` INT(6),
  `EPISODE_RELEASE_DATE` DATE,
  `EPISODE_DESCRIPTION` varchar(50),
  PRIMARY KEY (`PODCAST_ID`,`EPISODE_TITLE`),
  CONSTRAINT `EPISODE_FK_PODCAST` FOREIGN KEY (`PODCAST_ID`) REFERENCES `PODCAST` (`PODCAST_ID`)
);


DROP TABLE IF EXISTS `PLAN`;
CREATE TABLE `PLAN` (
  `PLAN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLAN_NAME` varchar(30) NOT NULL,
  `PLAN_COST` INT(11),
  PRIMARY KEY (`PLAN_ID`)
);


DROP TABLE IF EXISTS `SAVES`;
CREATE TABLE `SAVES` (
  `USER_ID` int(11) NOT NULL,
  `PLAYLIST_TITLE` char(30) NOT NULL,
  PRIMARY KEY (`USER_ID`, `PLAYLIST_TITLE`),
 CONSTRAINT `SAVES_FK_PLAYLIST` FOREIGN KEY (`PLAYLIST_TITLE`) REFERENCES `PLAYLIST` (`PLAYLIST_TITLE`)
);


DROP TABLE IF EXISTS `NORMAL_USERS`;
CREATE TABLE `NORMAL_USERS` (
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `NUSERS_FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);


DROP TABLE IF EXISTS `PREMIUM_USERS`;
CREATE TABLE `PREMIUM_USERS` (
  `USER_ID` int(11) NOT NULL,
  `PLAN_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `PUSERS_FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
  CONSTRAINT `PUSERS_FK_PLAN` FOREIGN KEY (`PLAN_ID`) REFERENCES `PLAN` (`PLAN_ID`)
);


DROP TABLE IF EXISTS `STATE_TO_COUNTRY`;
CREATE TABLE `STATE_TO_COUNTRY` (
  `STATE` varchar(30) NOT NULL,
  `COUNTRY` varchar(30) NOT NULL,
  PRIMARY KEY (`STATE`)
);


DROP TABLE IF EXISTS `LIKES`;
CREATE TABLE `LIKES` (
  `USER_ID` int(11) NOT NULL,
  `SONG_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`, `SONG_ID`),
  CONSTRAINT `LIKES_FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
  CONSTRAINT `LIKES_FK_SONG` FOREIGN KEY (`SONG_ID`) REFERENCES `SONG` (`SONG_ID`)
);


DROP TABLE IF EXISTS `SONG_GENRE`;
CREATE TABLE `SONG_GENRE` (
  `SONG_ID` int(11) NOT NULL,
  `GENRE` varchar(30) NOT NULL,
  PRIMARY KEY (`SONG_ID`, `GENRE`),
  CONSTRAINT `SONG_GENRE_FK_SONG` FOREIGN KEY (`SONG_ID`) REFERENCES `SONG` (`SONG_ID`)
);


DROP TABLE IF EXISTS `SONG_LYRICS_TO_IS_EXPLICIT`;
CREATE TABLE `SONG_LYRICS_TO_IS_EXPLICIT` (
  `SONG_ID` int(11) NOT NULL,
  `SONG_LYRICS` varchar(1000) NOT NULL,
  `IS_EXPLICIT` BOOL NOT NULL,
  PRIMARY KEY (`SONG_LYRICS`),
  CONSTRAINT `SONG_LYRICS_TO_IS_EXPLICIT_FK_SONG` FOREIGN KEY (`SONG_LYRICS`) REFERENCES `SONG` (`SONG_LYRICS`)
);


DROP TABLE IF EXISTS `PODCAST_LANGUAGE`;
CREATE TABLE `PODCAST_LANGUAGE` (
  `PODCAST_ID` int(11) NOT NULL,
  `LANGUAGE` varchar(30) NOT NULL,
  PRIMARY KEY (`PODCAST_ID`,`LANGUAGE`),
  CONSTRAINT `PODCAST_LANGUAGE_FK_PODCAST` FOREIGN KEY (`PODCAST_ID`) REFERENCES `PODCAST` (`PODCAST_ID`)
);


DROP TABLE IF EXISTS `COUNTRY_TO_COUNTRY_CODE`;
CREATE TABLE `COUNTRY_TO_COUNTRY_CODE` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY_CODE` int(3) NOT NULL,
  `USER_COUNTRY` char(20) NOT NULL,

  PRIMARY KEY (`USER_ID`, `COUNTRY_CODE`),
  CONSTRAINT `COUNTRY_TO_COUNTRY_CODE_FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`)
);


DROP TABLE IF EXISTS `FOLLOWS`;
CREATE TABLE `FOLLOWS` (
  `USER_ID` int(11) NOT NULL,
  `ARTIST_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`, `ARTIST_ID`),
  CONSTRAINT `FOLLOWS_FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
  CONSTRAINT `FOLLOWS_FK_ARTIST` FOREIGN KEY (`ARTIST_ID`) REFERENCES `ARTIST` (`ARTIST_ID`)
);

DROP TABLE IF EXISTS `HAS/FROM`;
CREATE TABLE `HAS/FROM` (
  -- Playlist(user_id, playlist_title) has song(song_id) from album(album_id)

  `USER_ID` int(11) NOT NULL,
  `PLAYLIST_TITLE` char(30) NOT NULL,
  `SONG_ID` INT(11) NOT NULL,
  `ALBUM_ID` INT(11) NOT NULL,
  PRIMARY KEY (`PLAYLIST_TITLE`, `USER_ID`,`SONG_ID`),
  CONSTRAINT `HAS/FROM_FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
  CONSTRAINT `HAS/FROM_FK_SONG` FOREIGN KEY (`SONG_ID`) REFERENCES `SONG` (`SONG_ID`)
);

LOCK TABLE `USER` WRITE;
INSERT INTO `USER` VALUES (1,'Parth','marth@paradia.com','pass1','2010-10-10','Surat','India','968741289','profile_parth.jpeg'),(2,'Harshita','harshita@yahoo.com','1512','2020-1-11','Delhi','India','999999998','harshita.png'),(3,'Prerak','prerak@hotmail.com','regrets','2010-10-12','Los Angeles','USA','888888889','picture.img'),(4,'Hari','hari@gmail.com','password','2009-10-11','Chin Chan','China','123989897','profileHari.jpeg'),(5,'Rahul','rahul@gmail.com','pass1512','2010-4-10','Mumbai', 'India','989908989','profile_img.jpg');
UNLOCK TABLE;

LOCK TABLE `ARTIST` WRITE;
INSERT INTO `ARTIST` VALUES (1,'Eminem','46000000','Rap','../img/artist/Eminem.png' ) , (2,'Harry Styles','32000000','Pop','../img/artist/Harry_Styles.png'), (3,'Travis Scott','50000000','Electronic','../img/artist/Kanye_West.png') , (4,'Justin Beiber','84000000','Pop','../img/artist/Justin_Beiber.png') , (5,'Martin Garrix','10000000','EDM','../img/artist/Martin_Garrix.png');
UNLOCK TABLE;

LOCK TABLE `ALBUM` WRITE;
INSERT INTO `ALBUM` VALUES (1,'The Feels', '2021-10-5', 2) , (2 ,'After All', '2010-11-4', 3), (3,'Alone', '2007-11-16', 1), (4, 'Paradise', '2007-11-16', 5), (5,'Shivers', '2003-9-21', 4) ;
UNLOCK TABLE;

LOCK TABLE `SONG` WRITE;
INSERT INTO `SONG` VALUES (1,'dhoom dhoom','120','dhoom machale dhooom machale', '2015-6-9' ,'../song/dhoom' , 1 , 5 , 990),(2,'mera mann kehne laga','250','paas aake na tu door ja' , '2015-8-9' ,'../song/mann' , 2 , 4, 100 ), (3,'smack that','560','smack that all on the floor' , '2015-6-3' , '../song/smack that' , 3 , 3 ,200), (4,'jeena jeena','260','ha seekha meine jeena jeena', '2015-4-9' ,'../song/jeena jeena' , 4 , 2 , 910),(5,'firework','20','coz baby you are a fiiirrreee wooork', '2015-8-9' ,'../song/firework' , 5 , 1, 1100 ), (6,'fairytale','760','im in love with a fairytale' , '2015-6-3' , '../song/fairytale' , 1 , 5 ,1400) , (7,'teeth','526','fight so dirty, but your love s so sweet' , '2015-6-3' , '../song/teeth' , 2 , 4 ,769), (8,'grenade','860','i ll catch your grenade' , '2019-8-4' , '../song/grenade' , 3 , 3 ,959), (9,'dancin','764','get up on the floor dancin up till dawn' , '2015-6-9' , '../song/dancin' , 4 , 2 ,1369), (10,'tokyo drift','578','fast and furiousssss' , '2017-1-3' , '../song/tokyo drift' , 5 , 1 ,7678); 
UNLOCK TABLE;

LOCK TABLE `LIKES` WRITE;
INSERT INTO `LIKES` VALUES (1 , 10) , (1 , 3) , (1 , 7), (2, 9), (2, 4), (2, 10), (2, 8), (3, 4), (3, 5), (4, 10), (4, 9), (5, 8);
UNLOCK TABLE;

LOCK TABLE `PLAYLIST` WRITE;
INSERT INTO `PLAYLIST` VALUES (1,'Workout', 'For my monday gym mornings', 1 , true) , (1,'Long Drive', 'For long drives!', 11 , false) , (3,'My Songs', 'Just my liked songs', 1 , true), (4,'Fire', 'Best songs I know', 10000 , false), (5,'Not Boring', 'desc 5', 15 , false), (3,'playlist', 'playlist', 1 , true);  
UNLOCK TABLE;

LOCK TABLE `PODCAST` WRITE;
INSERT INTO `PODCAST` VALUES (1,'Morning Motivation', 'Motivation', 2, 4000, 'Parth talks about morning motivation', 3) , (2,'How do i know who I am', 'Spiritual', 1, 200, 'Spirituality decoded with Gurudev', 1), (3,'The Ranveer Show', 'Trivia', 3, 730, 'Life is a never ending self improvement game', 1);
UNLOCK TABLE;

LOCK TABLE `PODCAST_LANGUAGE` WRITE;
INSERT INTO `PODCAST_LANGUAGE` VALUES (1 , 'hindi') , (1 , 'english') , (1 , 'gujarati'),(2 , 'hindi') , (2 , 'english'), (3 , 'tamil'), (3 , 'hindi');
UNLOCK TABLE;

LOCK TABLE `EPISODE` WRITE;
INSERT INTO `EPISODE` VALUES (1,'drink water', 1 , 260 , '2020-5-8' , 'parth talks about important topics') , (1, 'wake up early', 2 , 140 , '2020-6-8' , 'prerak sir gives valuable advice') , (2,'know yourself ', 1 , 200 , '2020-8-8' , 'harshita helps you find out your inner self') , (3,'GK with Alia Bhatt ', 1 , 200 , '2020-1-8' , 'we test iq of Ms.Alia Bhatt'),(3,'GK with Karan Johar', 2 , 230 , '2020-5-8' , 'Karan Johar shows his real college degree'), (3,'GK with Myself', 3 , 300 , '2020-2-8' , 'I test my iq in front of real audience')  ;    
UNLOCK TABLE;

LOCK TABLE `PLAN` WRITE;
INSERT INTO `PLAN` VALUES (1 , 'plan1' , 50000) , (2 , 'plan2' , 6000 ), (3 , 'plan3' , 57000), (4 , 'plan4' , 5000), (5 , 'plan5' , 50);
UNLOCK TABLE;

LOCK TABLE `PREMIUM_USERS` WRITE;
INSERT INTO `PREMIUM_USERS` VALUES (5 , 2) , (2 , 1) , (3 , 2);
UNLOCK TABLE;

LOCK TABLE `NORMAL_USERS` WRITE;
INSERT INTO `NORMAL_USERS` VALUES (1) , (4);
UNLOCK TABLE;

LOCK TABLE `STATE_TO_COUNTRY` WRITE;
INSERT INTO `STATE_TO_COUNTRY` VALUES ('Karnataka', 'India') , ('California' , 'USA') , ('Maharashtra' , 'India') , ('Delhi' , 'India') , ('Uttar Pradesh' , 'India'); 
UNLOCK TABLE;

LOCK TABLE `SONG_GENRE` WRITE;
INSERT INTO `SONG_GENRE` VALUES (1,'pop'), (1, 'hip-hop'), (1, 'electronic'), (2, 'pop'), (2, 'jazz'), (3, 'jazz'), (3, 'latin'), (3, 'blues'), (4, 'pop'), (4, 'hip-hop'), (4, 'metal'), (5, 'jazz'), (5, 'metal'), (5, 'country'), (6, 'jazz'), (6, 'pop'), (7, 'rock'), (7, 'electronic'), (8, 'blues'), (8, 'latin'), (9, 'hip-hop'), (9, 'pop'), (10, 'latin');
UNLOCK TABLE;

LOCK TABLE `SONG_LYRICS_TO_IS_EXPLICIT` WRITE;
INSERT INTO `SONG_LYRICS_TO_IS_EXPLICIT` VALUES (1,'dhoom machale dhooom machale',1) , (2, 'paas aake na tu door ja' ,0) , (3, 'smack that all on the floor',0) , (4, 'ha seekha meine jeena jeena',1) , (5, 'coz baby you are a fiiirrreee wooork',0) , (6, 'im in love with a fairytale',1) , (7, 'fight so dirty, but your love s so sweet',0) , (8, 'i ll catch your grenade',0) , (9, 'get up on the floor dancin up till dawn',1) , (10, 'fast and furiousssss',0);
UNLOCK TABLE;

LOCK TABLE `COUNTRY_TO_COUNTRY_CODE` WRITE;
INSERT INTO `COUNTRY_TO_COUNTRY_CODE` VALUES (1 , 91, 'India') , (2 , 91, 'India') , (5 , 91, 'India') , (4 ,86, 'China') , (3, 1 , 'USA');
UNLOCK TABLE;

LOCK TABLE `FOLLOWS` WRITE;
INSERT INTO `FOLLOWS` VALUES (5, 2) , (2, 2) , (3, 2), (4, 1), (2, 1 ), (3, 1),(2, 4),(5, 4), (1, 3),(2, 3),(3, 3),(5, 5), (1, 5);
UNLOCK TABLE;

LOCK TABLE `HAS/FROM` WRITE;
INSERT INTO `HAS/FROM` VALUES (4,'Fire', 1, 1),(1,'Workout', 1 , 1), (1,'Workout', 2 , 2), (2,'Long Drive', 3,3), (5 , 'My Songs',4,4), (5 , 'My Songs', 5,5), (4,'Fire', 6 , 5), (4,'Fire', 7 , 4) , (4 ,'Fire',8,3), (3,'playlist', 9,2), (3,'playlist', 10, 1);
UNLOCK TABLE;

LOCK TABLE `SAVES` WRITE;
INSERT INTO `SAVES` VALUES (1,'Workout'), (2 ,'Workout') , (3 ,'Long Drive') , (4 ,'Long Drive') , (5 ,'Long Drive') , (6 ,'My Songs') , (7 ,'My Songs') , (8 ,'Workout') , (9 ,'My Songs') , (10 ,'Not Boring');
UNLOCK TABLE;