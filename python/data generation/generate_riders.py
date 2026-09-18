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

vehicle_types = [
    "Bike",
    "Scooter"
]

shift_types = [
    "Morning",
    "Afternoon",
    "Evening",
    "Night"
]

riders = []

for i in range(1, 4001):

    joining_year = random.randint(2020, 2026)

    riders.append({

        "rider_id": f"D{i:05d}",

        "rider_name": fake.name(),

        "city": random.choices(
            cities,
            weights=city_weights
        )[0],

        "vehicle_type": random.choice(
            vehicle_types
        ),

        "experience_years": random.randint(
            0,
            8
        ),

        "joining_year": joining_year,

        "shift_type": random.choice(
            shift_types
        )
    })

riders_df = pd.DataFrame(riders)

riders_df.to_csv(
    DATASET_DIR / "riders.csv",
    index=False
)

print("riders.csv created successfully")