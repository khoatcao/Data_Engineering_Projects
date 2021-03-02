import psycopg2
from sql_queries import  drop_table_queries,create_table_queries

class databaseconnection :
    # init variables needed
    def __init__(self) :
        try :
            self.connection = psycopg2.connect("dbname = 'studatabase' user = 'postgres' host = 'localhost' password = '123456789' port = '5432' " )
            self.connection.autocommit = True
            # open a cursor to perform database operations 
            self.cursor = self.connection.cursor()
        except : 
            print("Can not connect to databae")
    # method to create database in postgresql
    def create_database(self) :
        drop_command = ("DROP DATABASE IF EXISTS sparkifydb")
        create_command = ("CREATE DATABASE sparkifydb with encoding 'utf8' TEMPLATE template0")
        self.cursor.execute(drop_command)
        self.cursor.execute(create_command)
        self.connection.close() # close connection to the database
    def connect_sparkifydb(self) :
        self.connection = psycopg2.connect("dbname = 'sparkifydb' user = 'postgres' host = 'localhost' password = '123456789' port = '5432'")
        self.cursor = self.connection.cursor()
    def drop_table(self) :
        for query in drop_table_queries :
            self.cursor.execute(query)
            # commit all changes to the database
            self.connection.commit()
    def create_tables(self) :
        for query in create_table_queries :
            self.cursor.execute(query)
            self.connection.commit()

# create a main function to execute program
def main() :    
    connection = databaseconnection()
    #connection.create_database()
    connection.connect_sparkifydb()
    connection.drop_table()
    connection.create_tables()
    #self.connection.close() # close connection the database 
# telling the program there is something to execute  
if __name__== "__main__" :
    main()
    