# Initializing the airline management system
import sqlite3

conn = sqlite3.connect('airplanes.db', password='REDACTED')

# Create cursor object to execute SQL statements
cursor = conn.cursor()

# Execute SQL queries

# Create a table
create_table_query = '''
    CREATE TABLE IF NOT EXISTS airplanes (
        id INTEGER PRIMARY KEY,
        airplaneName TEXT,
    )
'''
cursor.execute(create_table_query)

# Insert data into the table
insert_data_query = '''
    INSERT INTO airplanes (name, age, department)
    VALUES (?, ?, ?)
'''
airplane_data = ( '723423', 'Starlight')
cursor.execute(insert_data_query, airplane_data)

# Fetch data from the table
select_data_query = '''
    SELECT * FROM airplanes
'''
cursor.execute(select_data_query)
result = cursor.fetchall()

# Print the fetched data
for row in result:
    print(row)

# Commit the changes and close the connection
conn.commit()
conn.close()
