import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parents[2]

DATASET_DIR = BASE_DIR / "datasets" / "cleaned"

customers = pd.read_csv(
    DATASET_DIR / "customers.csv"
)

print("\n===== CUSTOMER INTELLIGENCE =====")

print("\n1. Customers by City")

print(
    customers["city"]
    .value_counts()
)

print("\n2. Customers by Persona")

print(
    customers["persona"]
    .value_counts()
)

print("\n3. Subscription Types")

print(
    customers["subscription_type"]
    .value_counts()
)

print("\n4. Acquisition Channels")

print(
    customers["acquisition_channel"]
    .value_counts()
)

customers["signup_date"] = pd.to_datetime(
    customers["signup_date"]
)

customers["signup_month"] = (
    customers["signup_date"]
    .dt.to_period("M")
)

print("\n5. Monthly Customer Growth")

print(
    customers["signup_month"]
    .value_counts()
    .sort_index()
)