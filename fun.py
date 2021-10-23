import subprocess as sp
import pymysql
import pymysql.cursors 
from datetime import date

# is_explicit in insert song last mein karte hain

def query_song():
    
    # Select all song names with a input genre “Folk”

    try:
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
    

def option2():
    """
    Function to implement option 1
    """
    print("Not implemented")


def option3():
    """
    Function to implement option 2
    """
    print("Not implemented")


def option4():
    """
    Function to implement option 3
    """
    print("Not implemented")

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
        song_id =  cur.execute("SELECT SONG_ID FROM SONG ORDER BY SONG_ID DESC LIMIT 1;")
        print(type(song_id))
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
        albumid = cur.execute(Q1)
        
        Q2 = "SELECT ARTIST_ID FROM ARTIST WHERE ARTIST_NAME = " + '"' + row['artist'] + '"' + ";"
        artistid = cur.execute(Q2)
        
        query = "INSERT INTO SONG (SONG_TITLE, SONG_LENGTH, SONG_LYRICS, DATE_ADDED, SONG_PATH ,ALBUM_ID, ARTIST_ID) VALUES ('%s', '%d', '%s', '%s', '%s','%d', '%d');" %(
           row['name'], row['length'],row['lyrics'], row['date'],row['path'], albumid, artistid)
        
        cur.execute(query)
        print("here")
        
        # for i in sep:
        #     q = "INSERT INTO SONG_GENRE (SONG_ID, GENRE) VALUES ('%d', '%s');" % (song_id,i)
        #     cur.execute(q)

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
        # print(query)
        row = cur.execute(query)
        print("Podcasts whose length is greater than 1 hour: ")
        for i in row:
            print(i)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)
    return

def hireAnEmployee():
    """
    This is a sample function implemented for the refrence.
    This example is related to the Employee Database.
    In addition to taking input, you are required to handle domain errors as well
    For example: the SSN should be only 9 characters long
    Sex should be only M or F
    If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
    HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new employee's details: ")
        name = (input("Name (Fname Minit Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Minit"] = name[1]
        row["Lname"] = name[2]
        row["Ssn"] = input("SSN: ")
        row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
        row["Address"] = input("Address: ")
        row["Sex"] = input("Sex: ")
        row["Salary"] = float(input("Salary: "))
        row["Dno"] = int(input("Dno: "))

        query = "INSERT INTO USER(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Dno) VALUES('%s', '%c', '%s', '%s', '%s', '%s', '%c', '%f', '%d')" % (
            row["Fname"], row["Minit"], row["Lname"], row["Ssn"], row["Bdate"], row["Address"], row["Sex"], row["Salary"], row["Dno"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        insertuser()
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    elif(ch == 5):
        removeuserbyemail()
    elif(ch == 6):
        updateusercontact()
    elif(ch == 7):
        insertsong()
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
                print("1. Insert User")  # Hire an Employee
                print("2. Option 2")  # Fire an Employee
                print("3. Option 3")  # Promote Employee
                print("4. Option 4")  # Employee Statistics
                print("5. Remove User By Email")
                print("6. Update User Contact")
                print("7. Insert Song")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 8:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
