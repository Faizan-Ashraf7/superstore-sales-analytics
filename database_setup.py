import sqlite3
import pandas as pd

# 1. Load the clean CSV
print("Loading clean CSV...")
df = pd.read_csv('data/cleaned_superstore_data.csv')

# 2. Create standard local database engine
print("Creating database pipeline...")
conn = sqlite3.connect('portfolio_database.db')

# 3. Push data to a SQL table
df.to_sql('superstore_data', conn, if_exists='replace', index=False)

# 4. Read your SQL file and execute the first query to prove it works
print("Running SQL query...")
with open('analysis_queries.sql', 'r') as file:
    sql_script = file.read()

# We'll just run the Top 5 Cities query as a quick test
test_query = """
SELECT city, state, ROUND(SUM(sales), 2) AS total_sales
FROM superstore_data
GROUP BY city, state
ORDER BY total_sales DESC
LIMIT 5;
"""
result = pd.read_sql_query(test_query, conn)

print("\n--- TOP 5 CITIES RESULT ---")
print(result)
print("---------------------------\n")

conn.close()