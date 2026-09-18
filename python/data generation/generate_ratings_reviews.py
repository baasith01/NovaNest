import pandas as pd
import random
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
DATASET_DIR = BASE_DIR / "datasets"

orders_df = pd.read_csv(
    DATASET_DIR/"orders.csv"
)

ratings = []

sample_orders = orders_df.sample(
    30000,
    random_state=42
)

for i,row in sample_orders.iterrows():

    if row["order_status"]=="Cancelled":

        continue

    ratings.append({

        "review_id":f"RV{i:07d}",

        "order_id":row["order_id"],

        "customer_id":row["customer_id"],

        "restaurant_rating":random.randint(
            3,
            5
        ),

        "delivery_rating":random.randint(
            3,
            5
        )
    })

ratings_df = pd.DataFrame(
    ratings
)

ratings_df.to_csv(

    DATASET_DIR/"ratings_reviews.csv",

    index=False

)

print("ratings_reviews.csv created")