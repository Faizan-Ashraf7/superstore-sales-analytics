import pandas as pd

# 1. Load the raw Kaggle dataset
# Update the filename below if yours is named differently!
df = pd.read_csv('data/SampleSuperstore.csv', encoding='windows-1252')

# 2. Standardize column names (lowercase, replace spaces/hyphens with underscores)
df.columns = df.columns.str.lower().str.replace(' ', '_').str.replace('-', '_')

# 3. Remove any duplicate records
df.drop_duplicates(inplace=True)

# 4. Handle missing values by dropping rows with nulls in critical business columns
df.dropna(subset=['sales', 'profit', 'category'], inplace=True)

# 5. Export the clean dataset to load into Power BI and SQL
df.to_csv('data/cleaned_superstore_data.csv', index=False)
print(f"Success! Cleaned {len(df)} rows. Check your data folder for 'cleaned_superstore_data.csv'.")