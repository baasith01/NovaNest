import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parents[2]

DATASET_DIR = BASE_DIR / "datasets" / "cleaned"

restaurants = pd.read_csv(
    DATASET_DIR/"restaurants.csv"
)

print("\n===== RESTAURANT INTELLIGENCE =====")

print("\n1. Restaurants by City")

print(
    restaurants["city"]
    .value_counts()
)

print("\n2. Restaurants by Cuisine")

print(
    restaurants["cuisine_type"]
    .value_counts()
)

print("\n3. Restaurant Types")

print(
    restaurants["restaurant_type"]
    .value_counts()
)

print("\n4. Average Rating by Cuisine")

print(

    restaurants

    .groupby(

        "cuisine_type"

    )["avg_rating"]

    .mean()

    .round(2)

    .sort_values(

        ascending=False

    )

)

print("\n5. Average Commission Percentage")

print(

    round(

        restaurants[

            "commission_percentage"

        ].mean(),

        2

    )

)