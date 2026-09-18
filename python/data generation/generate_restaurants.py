import pandas as pd
import random
from faker import Faker
from pathlib import Path

fake = Faker("en_IN")

BASE_DIR = Path(__file__).resolve().parent.parent
DATASET_DIR = BASE_DIR / "datasets"

cities = [
    "Chennai",
    "Bangalore",
    "Hyderabad",
    "Coimbatore",
    "Vijayawada"
]

city_weights = [
    30,
    25,
    20,
    15,
    10
]

restaurant_types = [
    "Cloud Kitchen",
    "Premium Restaurant",
    "Budget Restaurant",
    "Cafe",
    "Fast Food Chain"
]

cuisines = [
    "South Indian",
    "Biryani",
    "North Indian",
    "Chinese",
    "Pizza",
    "Burger",
    "Healthy Foods",
    "Desserts",
    "Beverages"
]

cuisine_weights = [
    25,
    20,
    15,
    10,
    10,
    10,
    5,
    3,
    2
]

restaurants = []

for i in range(1,1501):

    restaurants.append({

        "restaurant_id":f"R{i:05d}",

        "restaurant_name":fake.company(),

        "city":random.choices(
            cities,
            weights=city_weights
        )[0],

        "restaurant_type":random.choice(
            restaurant_types
        ),

        "cuisine_type":random.choices(
            cuisines,
            weights=cuisine_weights
        )[0],

        "opening_year":random.randint(
            2016,
            2026
        ),

        "avg_rating":round(
            random.uniform(
                3.5,
                5.0
            ),
            1
        ),

        "delivery_radius_km":round(
            random.uniform(
                2,
                10
            ),
            1
        ),

        "commission_percentage":random.randint(
            15,
            30
        )
    })

df = pd.DataFrame(restaurants)

df.to_csv(
    DATASET_DIR/"restaurants.csv",
    index=False
)

print("restaurants.csv created")