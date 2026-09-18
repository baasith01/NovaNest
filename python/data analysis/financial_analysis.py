import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parents[2]

DATASET_DIR = BASE_DIR / "datasets" / "cleaned"

orders = pd.read_csv(
    DATASET_DIR/"orders.csv"
)

print("\n===== FINANCIAL INTELLIGENCE =====")

print("\n1. Total Revenue")

print(

    round(

        orders["final_amount"]

        .sum(),

        2

    )

)

print("\n2. Average Order Value")

print(

    round(

        orders["final_amount"]

        .mean(),

        2

    )

)

print("\n3. Total Discounts Given")

print(

    round(

        orders["discount_amount"]

        .sum(),

        2

    )

)

print("\n4. Average Discount")

print(

    round(

        orders["discount_amount"]

        .mean(),

        2

    )

)

print("\n5. Total Delivery Fees")

print(

    round(

        orders["delivery_fee"]

        .sum(),

        2

    )

)