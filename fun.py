import subprocess as sp
import pymysql
import pymysql.cursors 
from datetime import date


def analysis_popular_albums(): 
    """
    List of popular albums based on average likes on all song
    """
    try:
        query = "SELECT ALBUM_NAME FROM ALBUM,LIKES ORDER BY COUNT( SELECT * FROM LIKES, ALBUM WHERE LIKES.SONG_ID IN (SELECT SONG_ID FROM SONG, ALBUM WHERE SONG.ALBUM_ID = ALBUM.ALBUM_ID) )/COUNT(SELECT * SONGS, ALBUM WHERE ALBUM.ALBUM_ID = SONG.SONG_ID ) DESC LIMIT 10;"
        cur.execute(query)
        row = cur.fetchall()
        print("Popular albums: ")
        for i in row:
            print(i['ALBUM_NAME'])
        
        con.commit()
        print("Query executed successfully")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return

        

def addEpisode():
    """
    add a new episode in a existing podcast
    TO DEBUG
    """
    try:
        # Takes user details as input
        row = {}
        print("Enter new episode's details: ")
        
        row["podcast_name"] = input("Podcast Name: ")

        Q = "SELECT PODCAST_ID FROM PODCAST WHERE PODCAST_NAME = '%s' ;" % row["podcast_name"]
        cur.execute()
        list = cur.fetchall()
        podcast_id = list[0]["PODCAST_ID"]

        row['title'] = input("Title: ")
        row['number'] = input("Number: ")
        row['duration'] = input("Duration: ")
        row['release_date'] = date.today()
        row['desc'] = input("Description: ")

        query = "INSERT INTO EPISODE (PODCAST_ID, EPISODE_TITLE, EPISODE_NUMBER, EPISODE_DURATION,EPISODE_RELEASE_DATE, EPISODE_DESCRIPTION ) VALUES ('%d', '%s', '%d', '%d', '%s', '%s');" % (
            podcast_id, row['title'], row['number'], row['duration'], row['release_date'], row['desc'])
        
        cur.execute(query)
        con.commit()
        print("Podcast added successfully")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return



def query_podcastlanguage():
    """
    Select all podcasts available in a given language
    """
    try:
        row = input("Podcast Language: ")
        query = "SELECT PODCAST_TITLE FROM PODCAST, PODCAST_LANGUAGE WHERE PODCAST_LANGUAGE.LANGUAGE = '%s' AND PODCAST.PODCAST_ID = PODCAST_LANGUAGE.PODCAST_ID;" %(row)
        
        cur.execute(query)
        list = cur.fetchall()
        #print(list)
        #print(type(list))

        print("Podcasts in the given language: ")
        for s in list:
            print(s["PODCAST_TITLE"])
            
        con.commit()
        print("Query executed successfully")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return
    
def query_song_in_album():

    """
    Select all songs in a given album
    """

    try:
        row = input("Album Name: ")
        query = "SELECT SONG_TITLE FROM SONG,ALBUM WHERE ALBUM_NAME = '%s' AND ALBUM.ALBUM_ID = SONG.ALBUM_ID;" %(row)
        
        cur.execute(query)
        list = cur.fetchall()
        # print(list)
        # print(type(list))


        print("Songs in the given album: ")
        for s in list:
            print(s["SONG_TITLE"])
            
        con.commit()
        print("Query executed successfully")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return




# is_explicit in insert song last mein karte hain
def query_song():
    """
    Select all song names with a input genre say “Pop”
    """
    try:
        # print("Enter Song Genre: ")
        row = input("Genre: ")
        query = "SELECT SONG_TITLE FROM SONG_GENRE, SONG WHERE SONG_GENRE.GENRE = '%s' AND SONG.SONG_ID = SONG_GENRE.SONG_ID;" %(row)
        
        cur.execute(query)
        list = cur.fetchall()
        # print(list)
        # print(type(list))

        for s in list:
            print(s["SONG_TITLE"])


        con.commit()
        print("Query executed successfully")
        
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return
    

def removeuserbyemail():
    """
    Function to remove from USER
    """
    try:
        # Takes user details as input
        print("Enter user's email: ")
        row = input("Email: ")


        query = "DELETE FROM USER WHERE USER_EMAIL = '%s';" %(
            row)
        
        # print(query)
        cur.execute(query)
        con.commit()
        print("User removed successfully")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return    

def updateusercontact():
    """
    Function to update USER
    """
    try:
        # Takes user details as input
        print("Enter user's email: ")
        row = input("Email: ")
        print("Enter new user's contact: ")
        row['mobile'] = input("Mobile: ")
        query = "UPDATE USER SET USER_MOBILE_NUMBER = '%s' WHERE USER_EMAIL = '%s';" %(
            row['mobile'], row)
        # print(query)
        cur.execute(query)
        con.commit()
        print("User updated successfully")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return

def insertuser():
    """
    Function to implement input in USER
    """
    try:
        # Takes user details as input
        row = {}
        print("Enter new user's details: ")
        global user_id
        row['name'] = input("Name: ")
        row['email'] = input("Email: ")
        row['password'] = input("Password: ")
        row['registration_date'] = date.today()
        row['state'] = input("State: ")
        row['country'] = input("Country: ")
        row['mobile'] = input("Mobile: ")
        # row['img'] = input("Image: ")

        query = "INSERT INTO USER (USER_NAME, USER_EMAIL, USER_PASSWORD, USER_REGISTRATION_DATE, USER_STATE, USER_COUNTRY, USER_MOBILE_NUMBER, USER_IMG) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', NULL);" %(
           row['name'], row['email'], row['password'], row['registration_date'], row['state'], row['country'], row['mobile'])
        
        # print(query)
        cur.execute(query)
        con.commit()
        print("User added successfully")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return
    

def insertsong():
    
    try:
        # Takes user details as input
        cur.execute("SELECT SONG_ID FROM SONG ORDER BY SONG_ID DESC LIMIT 1;")
        song_id = cur.fetchall()

        row = {}
        print("Enter new song's details: ")
        row['name'] = input("Name: ")
        row['length'] = input("Length: ")
        row['lyrics'] = input("Lyrics: ")

        gnr = input("Genre: ")
        sep = {}
        sep = gnr.split(',')  
            

        row['date'] = date.today()
        row['path'] = input("Path: ")
        row['album'] = input("Album: ")
        row['artist'] = input("Artist: ")
        
        Q1 = "SELECT ALBUM_ID FROM ALBUM WHERE ALBUM_NAME = " + '"' + row['album'] + '"' + ";"
        cur.execute(Q1)
        albumid = cur.fetchall()
        
        Q2 = "SELECT ARTIST_ID FROM ARTIST WHERE ARTIST_NAME = " + '"' + row['artist'] + '"' + ";"
        cur.execute(Q2)
        artistid = cur.fetchall()
        
        
        query = "INSERT INTO SONG (SONG_TITLE, SONG_LENGTH, SONG_LYRICS, DATE_ADDED, SONG_PATH ,ALBUM_ID, ARTIST_ID) VALUES ('%s', '%s', '%s', '%s', '%s','%d', '%d');" %(
            row['name'], row['length'],row['lyrics'], row['date'],row['path'], int(albumid[0]["ALBUM_ID"]), int(artistid[0]["ARTIST_ID"]))
        
        cur.execute(query)
        
        for i in sep:
            q = "INSERT INTO SONG_GENRE (SONG_ID, GENRE) VALUES ('%d', '%s');" % (song_id[0]["SONG_ID"] + 1,i)
            cur.execute(q)

        con.commit()
        print("Song inserted successfully")

    except Exception as e:
        con.rollback()
        print("Failed to insert song into database")
        print(">>>>>>>>>>>>>", e)
    return
     
def getonehrpodcast():
    """
    Function to get all podcasts whose length is greater than 1 hour
    """
    try:
        
        query = "SELECT * FROM PODCAST WHERE PODCAST_TOTAL_DURATION >= 3600;"
        cur.execute(query)
        row = cur.fetchall()
        
        print("Podcasts whose duration is greater than 1 hour: ")
        for i in row:
            print(i['PODCAST_TITLE'])
            
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)
    return

def getalbumsbyartist():
    """
    Function to get all albums by a particular artist
    """
    try:
        print("Enter artist's name: ")
        row = input("Artist: ")
        query = "SELECT ALBUM_NAME FROM ALBUM, ARTIST WHERE ARTIST.ARTIST_NAME = '%s' AND ALBUM.ARTIST_ID = ARTIST.ARTIST_ID;" %(row)
        cur.execute(query)
        row = cur.fetchall()
        print("Albums by artist: ")
        for i in row:
            print(i['ALBUM_NAME'])
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)
    return

def getartistwith1lakhfollower():
    """
    Function to get artist with over 1 lakh followers
    """
    try:
        query = "SELECT ARTIST_NAME FROM ARTIST WHERE ARTIST_FOLLOWERS >= 100000;"
        cur.execute(query)
        row = cur.fetchall()
        print("Artist with over 1 lakh followers: ")
        
        for i in row:
            print(i['ARTIST_NAME'])
            
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)
    return


def getartistmaxfollower():
    """
    Function to get artist with maximum followers
    """
    try:
        query = "SELECT ARTIST_NAME FROM ARTIST WHERE ARTIST_FOLLOWERS = (SELECT MAX(ARTIST_FOLLOWERS) FROM ARTIST);"
        cur.execute(query)
        row = cur.fetchall()
        print("Artist with maximum followers: ")
        print(row[0]['ARTIST_NAME'])
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)
    return

def playlistwithmaxsaves():
    """
    Function to get playlist with maximum saves
    """
    try:
        print("Playlist with maximum saves: ")
        query = "SELECT * FROM PLAYLIST WHERE PLAYLIST_SAVES = (SELECT MAX(PLAYLIST_SAVES) FROM PLAYLIST);"
        cur.execute(query)
        row = cur.fetchall()
        print("podcasts with minimum duration: ")
        print(row[0]['PLAYLIST_TITLE'])
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)
    return

def premiumuser():
    """
    Function to get playlist with maximum saves
    """
    try:
        print("Enter the plan name: ")
        row = input("PLAN: ")
        query = "SELECT PLAN_ID FROM PLAN WHERE PLAN_NAME = '%s';" %(row)
        cur.execute(query)
        planid = cur.fetchall()
        print("Users with this plan: ")
        Q2 = "SELECT USER_NAME FROM PREMIUM_USERS WHERE PLAN_ID = '%d';" %(planid[0]['PLAN_ID'])
        cur.execute(Q2)
        userid = cur.fetchall()

        for i in userid:
            print(i["USER_NAME"])

        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)
    return

def mindurationpodcast():
    """
    Function to get podcast with minimum duration
    """
    try:
        print("Podcast with minimum duration: ")
        query = "SELECT PODCAST_TITLE FROM PODCAST WHERE PODCAST_TOTAL_DURATION = (SELECT MIN(PODCAST_TOTAL_DURATION) FROM PODCAST);"
        cur.execute(query)
        row = cur.fetchall()
        print(row[0]['PODCAST_TITLE'])
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)
    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        insertuser()
    elif(ch == 2):
        getalbumsbyartist()     # query
    elif(ch == 3):
        query_song()    # query
    elif(ch == 4):
        getartistmaxfollower()  # query
    elif(ch == 5):
        removeuserbyemail()
    elif(ch == 6):
        updateusercontact() 
    elif(ch == 7):
        insertsong()
    elif(ch == 8):
        getonehrpodcast()   # query
    elif(ch == 9):
        playlistwithmaxsaves()  # query
    elif(ch == 10):
        mindurationpodcast()
    elif(ch == 11):
        getartistwith1lakhfollower()    # query
    elif(ch == 12):
        query_podcastlanguage()
    elif(ch == 13):
        query_song_in_album()
    elif(ch == 14):
        premiumuser()
    elif(ch == 15):
        addEpisode()
    elif(ch == 16):
        analysis_popular_albums()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="password",
                              db='SYMPHONY',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Insert User")  
                print("2. Get All Albums By Artist") 
                print("3. Query Song")  
                print("4. Get Artist with max followers") 
                print("5. Remove User By Email")
                print("6. Update User Contact")
                print("7. Insert Song")
                print("8. Get Podcasts of greater than 1 hour duration")
                print("9. Get Playlist with max saves")
                print("10. Get Podcast with minimum duration")
                print("11. Get artist with over 1 lakh followers")
                print("12. Query Podcast Language")
                print("13. Get all songs in album")
                print("14. Get premium users with specific plan")
                print("15. Add an episode in a existing podcast")
                print("16. Analysis of popular album")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 17:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
