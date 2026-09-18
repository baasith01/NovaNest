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

personas = [
    "Student",
    "Working Professional",
    "Family"
]

customers = []

for i in range(1,5001):

    persona = random.choice(personas)

    if persona == "Student":

        occupation = "Student"

    elif persona == "Working Professional":

        occupation = random.choice([

            "Software Engineer",

            "Teacher",

            "Doctor",

            "Designer",

            "Accountant",

            "Business Owner"

        ])

    else:

        occupation = random.choice([

            "Homemaker",

            "Teacher",

            "Business Owner"

        ])

    customers.append({

        "customer_id":f"C{i:06d}",

        "customer_name":fake.name(),

        "age":random.randint(18,60),

        "gender":random.choice([

            "Male",

            "Female"

        ]),

        "city":random.choices(

            cities,

            weights=city_weights

        )[0],

        "persona":persona,

        "occupation":occupation,

        "signup_date":fake.date_between(

            start_date="-2y",

            end_date="today"

        ),

        "subscription_type":random.choice([

            "Free",

            "Premium"

        ]),

        "acquisition_channel":random.choice([

            "Instagram",

            "Google",

            "Referral",

            "Campus Campaign",

            "YouTube"

        ])
    })

df = pd.DataFrame(customers)

df.to_csv(

    DATASET_DIR/"customers.csv",

    index=False

)

print(df.head())

print("customers.csv created")