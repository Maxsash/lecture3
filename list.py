import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

#creating a database engine, handles the database. Need to put databse_url value
engine = create_engine(os.getenv("DATABASE_URL"))
#creating a scoped session. Keeps separate session for different people
db = scoped_session(sessionmaker(bind=engine))

def main():
    #running the sql commands
    flights = db.execute("SELECT origin, destination, duration FROM flights").fetchall()
    for flight in flights:
        print(f"{flight.origin} to {flight.destination}, {flight.duration} minutes.")

if __name__ == "__main__":
    main()