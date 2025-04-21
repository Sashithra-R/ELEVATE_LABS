# ELEVATE_LABS
Data Analyst Intern in Elevate Labs

Tasks Completed on Day 1

DATASET USED - Netflix Movies and TV Shows

1. Handle Missing Values
- Replaced missing values in text columns like `director`, `cast`, `country`, etc., with `"Unknown"`.
- Filled missing values in numerical columns (`duration_int`, `year_added`, `month_added`) with `-1`.

2. Remove Duplicate Rows
- Removed exact duplicate entries using `.drop_duplicates()`.

3. Standardize Text Values
- Further standardization (like USA vs United States) wasn't needed as values were already consistent.

4. Convert Date Formats
- Converted the `date_added` column to proper `datetime` format using `pd.to_datetime()`.

5. Rename Column Headers
- Renamed columns to be lowercase and replaced spaces with underscores for consistency.

6. Check and Fix Data Types
- Ensured all columns have appropriate data types (e.g., int for year/month, string for text fields).

7. Clean and Split the `duration` Column
- Split `duration` into two separate columns:
  - `duration_int`: the numeric part (e.g., 90)
  - `duration_type`: the type (e.g., Minutes, Seasons)

8. Extract Year and Month from Date
- Extracted `year_added` and `month_added` from `date_added` for easier time-based analysis.
