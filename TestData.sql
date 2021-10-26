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
INSERT INTO `PODCAST` VALUES (1,'Morning Motivation', 'Motivation', 2, 400, 'Parth talks about morning motivation', 3) , (2,'How do i know who I am', 'Spiritual', 1, 200, 'Spirituality decoded with Gurudev', 1), (3,'The Ranveer Show', 'Trivia', 3, 730, 'Life is a never ending self improvement game', 1);
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
INSERT INTO `COUNTRY_TO_COUNTRY_CODE` VALUES (91, 'India') , (86, 'China') , (1 , 'USA');
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
