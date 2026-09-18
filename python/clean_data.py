import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

DATASET_DIR = BASE_DIR / "datasets"

OUTPUT_DIR = DATASET_DIR / "cleaned"

OUTPUT_DIR.mkdir(exist_ok=True)

files = [

    "customers.csv",

    "restaurants.csv",

    "menu_items.csv",

    "riders.csv",

    "orders.csv",

    "payments.csv",

    "deliveries.csv",

    "app_events.csv",

    "ratings_reviews.csv",

    "promotions.csv"

]

for file in files:

    print(f"\nCleaning {file}")

    df = pd.read_csv(

        DATASET_DIR / file

    )

    # remove duplicates

    df = df.drop_duplicates()

    # remove empty rows

    df = df.dropna()

    # save cleaned file

    df.to_csv(

        OUTPUT_DIR / file,

        index=False

    )

    print(

        f"Completed {file}"

    )

print("\nAll datasets cleaned")