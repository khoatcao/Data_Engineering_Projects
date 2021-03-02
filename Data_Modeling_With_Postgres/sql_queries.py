'''
# drop table if it already created in database
songplay_table_drop = "DROP TABLE IF EXISTS songplay"
time_table_drop = "DROP TABLE IF EXISTS time"
users_table_drop = "DROP TABLE IF EXISTS users"
songs_table_drop = "DROP TABLE IF EXISTS songs" 
artists_table_drop = "DROP TABLE IF EXISTS artists"
# create tables the core table of start schema parent table

songplay_table_create = ("""create table songplay(
    songplay_id SERIAL,
    start_time timestamp NOT NULL, 
    user_id  VARCHAR not null,
    song_id VARCHAR, 
    artist_id VARCHAR,
    session_id INT,
    location VARCHAR,
    user_agent VARCHAR,
    PRIMARY KEY (songplay_id),
    FOREIGN KEY (start_time)
    REFERENCES time (start_time)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (song_id)
    REFERENCES songs (song_id)
    ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (user_id)
    REFERENCES users (user_id)
    ON UPDATE CASCADE ON DELETE CASCADE)
""")

songplay_table_create = ("""CREATE TABLE songplay (
    songplay_id SERIAL,
    start_time timestamp NOT NULL,
    user_id VARCHAR NOT NULL,
    song_id VARCHAR,
    artist_id VARCHAR,
    session_id INT,
    location VARCHAR,
    user_agent VARCHAR,
    PRIMARY KEY (songplay_id),
    FOREIGN KEY (start_time)
    REFERENCES time (start_time)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (user_id)
    REFERENCES users (user_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (song_id)
    REFERENCES songs (song_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id)
    ON UPDATE CASCADE ON DELETE CASCADE
    )
""")
# create child table
time_table_create = ("""CREATE TABLE time(
    start_time timestamp,
    hour INT,
    day INT,
    week INT,
    month VARCHAR,
    year INT,
    weekday VARCHAR,
    PRIMARY KEY (start_time))
""")

# create second child table

user_table_create =("""CREATE TABLE users(
    user_id VARCHAR,
    first_name VARCHAR,
    last_name VARCHAR,
    gender VARCHAR,
    level VARCHAR,
    PRIMARY KEY (user_id))

""")

# create songs child table
song_table_create = ("""CREATE TABLE songs (
    song_id VARCHAR,
    title VARCHAR,
    artist_id VARCHAR,
    year INT,
    duration numeric,
    PRIMARY KEY (song_id),
    FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id)
    ON UPDATE CASCADE ON DELETE CASCADE)
""")

artist_table_create = ("""CREATE TABLE artists(
    artist_id VARCHAR,
    name VARCHAR,
    location VARCHAR,
    latitude REAL,
    longitude REAL,
    PRIMARY KEY (artist_id))
""")

# insert records
# command syntax
# INSERT into table(column1,column2,...,coln) VALUES(value1,value2,value3,value4,value5,....,value n);

songplay_table_insert = ("""INSERT INTO songplay (start_time,user_id,song_id,artist_id,session_id,location,user_agent) VALUES(%s,%s,%s,%s,%s,%s,%s);""")
time_table_insert = ("""INSERT INTO time (start_time,hour,day,week,month,year,weekday) VALUES(%s,%s,%s,%s,%s,%s,%s);""")
users_table_insert = ("""INSERT INTO users (user_id,first_name,last_name,gender,level) VALUES(%s,%s,%s,%s.%s);""")
songs_table_insert = ("""INSERT INTO songs (song_id,title,artist_id,year,duration) ) VALUES(%s,%s,%s,%s,%s);""")
artists_table_insert = ("""INSERT INTO artists(artist_id,name,location,latitude,longitude) VALUES(%s,%s,%s,%s,%s);""")

# select commands in sql

song_select = ("""select songs.song_id,songs.artist_id,artists.artist_id
from songs 
inner join artists 
on songs.artist_id = artists.artists_id where songs.title = %s and songs.duration = %s and artists.name = %s """)   


# Query lists 

create_table_queries =   [songplay_table_create,time_table_create,user_table_create,song_table_create,artist_table_create]
drop_table_queries   =   [songplay_table_drop,time_table_drop,users_table_drop,songs_table_drop,artists_table_drop]
'''
songplay_table_drop = "DROP TABLE IF EXISTS songplays"
user_table_drop = "DROP TABLE IF EXISTS users"
song_table_drop = "DROP TABLE IF EXISTS songs"
artist_table_drop = "DROP TABLE IF EXISTS artists"
time_table_drop = "DROP TABLE IF EXISTS time"

# CREATE TABLES
songplay_table_create = (
    """
    CREATE TABLE IF NOT EXISTS songplays (songplay_id serial,
    start_time timestamp, user_id int, level varchar, song_id varchar,
    artist_id varchar, session_id int, location varchar, user_agent varchar)
    """
)

user_table_create = (
    """
    CREATE TABLE IF NOT EXISTS users (user_id int, first_name varchar,
    last_name varchar, gender varchar, level varchar)
    """
)

song_table_create = (
    """
    CREATE TABLE IF NOT EXISTS songs (song_id varchar, title varchar,
    artist_id varchar, year int, duration numeric)
    """
)

artist_table_create = (
    """
    CREATE TABLE IF NOT EXISTS artists (artist_id varchar, name varchar,
    location varchar, lattitude numeric, longitude numeric)
    """
)

time_table_create = (
    """
    CREATE TABLE IF NOT EXISTS time (start_time timestamp, hour int, day int,
    week int, month int, year int, weekday varchar)
    """
)

# INSERT RECORDS
songplay_table_insert = (
    """
    INSERT INTO songplays (start_time, user_id, level, song_id,
    artist_id, session_id, location, user_agent)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """)

user_table_insert = (
    """
    INSERT INTO users (user_id, first_name, last_name, gender, level)
    VALUES(%s, %s, %s, %s, %s)
    """)

song_table_insert = (
    """
    INSERT INTO songs (song_id, title, artist_id, year, duration)
    VALUES (%s, %s, %s, %s, %s)
    """)


artist_table_insert = (
    """
    INSERT INTO artists (artist_id, name, location, lattitude, longitude)
    VALUES (%s, %s, %s, %s, %s)
    """)


time_table_insert = (
    """
    INSERT INTO time (start_time, hour, day, week, month, year, weekday)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
    """)

# FIND SONGS
song_select = (
    """
    SELECT songs.song_id, artists.artist_id
    FROM songs
    JOIN artists ON artists.artist_id = songs.artist_id
    WHERE   songs.title = %s
    AND     songs.artist_id = %s
    AND     songs.duration = %s
    """)

# QUERY LISTS
create_table_queries = [
    songplay_table_create, user_table_create, song_table_create,
    artist_table_create, time_table_create
]
drop_table_queries = [
    songplay_table_drop, user_table_drop, song_table_drop, artist_table_drop,
    time_table_drop
]
