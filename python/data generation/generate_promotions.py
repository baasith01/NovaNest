import pandas as pd
import random
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
DATASET_DIR = BASE_DIR / "datasets"

promo_types = [

    "Flat Discount",

    "Percentage Discount",

    "Free Delivery",

    "Cashback"

]

promotions = []

for i in range(1,201):

    promotions.append({

        "promo_id":f"PR{i:04d}",

        "promo_name":f"Campaign_{i}",

        "promo_type":random.choice(
            promo_types
        ),

        "discount_percentage":random.randint(
            5,
            40
        ),

        "campaign_budget":random.randint(
            10000,
            100000
        )
    })

df = pd.DataFrame(
    promotions
)

df.to_csv(
    DATASET_DIR/"promotions.csv",
    index=False
)

print("promotions.csv created")