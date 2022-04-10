# Symphony

## Music database created for DNA project 4

## Team Members
Prerak Srivastava - 2020111013

Parth Maradia - 2020111006

Harshita - 2020101078

## Demo Video Link

https://drive.google.com/file/d/1X6CbCBJhCHv3fXniBXGume3X-8AWS0Yx/view?usp=sharing

## List of Commands
 
1. Insert User (`INSERT`)
> Function to implement input in USER

2. Get all Albums by a Artist (`QUERY : PROJECTION`)
> Function to display all the albums by a particular artist

3. Query Song by Genre (`QUERY : PROJECTION`)
> Get all song names with a input genre say “Pop”

4. Get Artist with max followers (`QUERY : AGGREGATE`)
> Get the name of the artist with maximum followers

5. Remove User By Email (`DELETE`)
> Remove a user from the USER table who has a given email 

6. Update User Contact (`UPDATE`)
> Update a given user's contact

7. Insert Song (`INSERT`)
> Insert a new song into the SONG relation

8. Get Podcasts of greater than 1 hour duration (`QUERY : SELECTION`)
> Get all podcasts that have a duration greater than 1 hour

9. Get Playlist with max saves (`QUERY : AGGREGATE`)
> Get playlist with maximum saves

10. Get Podcast with minimum duration (`QUERY : AGGREGATE`)
> Get the podcast with the shortest duration

11. Get artist with over 1 lakh followers (`QUERY : SELECTION`)
> Get all artists that have more than 1 lakh followers

12. Query Podcast Language (`QUERY : SEARCH`)
>  Get all podcasts available in a given language

13. Get all songs in album (`QUERY : SELECTION`)
> Get all songs in a given album

14. Get premium users with specific plan (`QUERY : SEARCH`)
> Get names of all permium users with a particular pl

15. Add an episode in a existing podcast (`INSERT`)
> Adds a new episode in an existing podcast

16. Analysis of popular album (`QUERY : ANALYSIS`)
> List of popular albums based on average likes on all songs in the album

17. User Likes Song (`UPDATE + INSERT`)
> Increments song's likes when user likes it

18. User Follows Artist (`UPDATE + INSERT`)
> When a user follows a artist, update artist_followers and insert a record in FOLLOWS

19. User Saves Playlist (`UPDATE + INSERT`)
>  When a user saves a new playlist, update playlist_saves in PLAYLIST and insert a record in SAVES

20. Top Genres for a User (`ANALYSIS`)
> List of top genres for a user based on song likes
 
21. Exit
> EXIT

### Requirements

* Python3
```sh
$ sudo apt-get update
$ sudo apt-get install python3.8
```
* MySQL
* PyMySQL
```sh
$ sudo apt-get install python3-pip
$ pip3 install pymysql
```

### Installation

You will need to replicate the SYMPHONY databse on your local machine, for which the dump.sql file is provided herewith.

Open your MySQL server and run the following command to import the database:

```sh
$ docker exec -i mysql sh -c 'exec mysql -uroot -ppassword' < dump.sql
```

You might need to enter your password in the next step.

To run the CLI, change your directory to the cloned folder and run the following command:

```sh
$ python3 symphony.py
```

``` diff
If you are using Docker to run MySQL, you might need to first change your port to 5005 (or the port you use) by replacing the following lines for connecting the database in the symphony.py file: 
```

```sh
con = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              db='SYMPHONY',
                              port='5005',
                              cursorclass=pymysql.cursors.DictCursor)
```
near lines 674-675.

## HAPPY LISTENING !!!
