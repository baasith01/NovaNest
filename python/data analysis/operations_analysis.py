import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parents[2]

DATASET_DIR = BASE_DIR / "datasets" / "cleaned"

orders = pd.read_csv(
    DATASET_DIR/"orders.csv"
)

deliveries = pd.read_csv(
    DATASET_DIR/"deliveries.csv"
)

orders["order_datetime"] = pd.to_datetime(
    orders["order_datetime"]
)

orders["order_hour"] = (
    orders["order_datetime"]
    .dt.hour
)

orders["order_month"] = (
    orders["order_datetime"]
    .dt.month_name()
)

print("\n===== OPERATIONS INTELLIGENCE =====")

print("\n1. Order Status")

print(
    orders["order_status"]
    .value_counts()
)

print("\n2. Peak Order Hours")

print(
    orders["order_hour"]
    .value_counts()
    .sort_index()
)

print("\n3. Top 10 Order Months")

print(
    orders["order_month"]
    .value_counts()
)

print("\n4. Average Delivery Time")

print(
    round(
        deliveries["delivery_duration"]
        .mean(),
        2
    )
)

print("\n5. Average Delivery Distance")

print(
    round(
        deliveries["distance_km"]
        .mean(),
        2
    )
)