import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
DATASET_DIR = BASE_DIR / "datasets"

files = {

    "customers": "customers.csv",

    "restaurants": "restaurants.csv",

    "menu_items": "menu_items.csv",

    "riders": "riders.csv"

}

for dataset_name, file_name in files.items():

    print(f"\n----- {dataset_name.upper()} -----")

    df = pd.read_csv(
        DATASET_DIR / file_name
    )

    print(f"Rows: {len(df)}")

    print(f"Columns: {len(df.columns)}")

    print(f"Duplicates: {df.duplicated().sum()}")

    print(f"Missing Values:\n")

    print(df.isnull().sum())

print("\nValidation Complete")