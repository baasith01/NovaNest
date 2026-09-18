import pandas as pd
import random
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
DATASET_DIR = BASE_DIR / "datasets"

customers_df = pd.read_csv(
    DATASET_DIR/"customers.csv"
)

event_types = [

    "App Open",

    "Restaurant View",

    "Menu View",

    "Add To Cart",

    "Checkout",

    "Order Complete"

]

events = []

for i in range(1,100001):

    customer = customers_df.sample(
        1
    ).iloc[0]

    events.append({

        "event_id":f"E{i:07d}",

        "customer_id":customer[
            "customer_id"
        ],

        "event_type":random.choice(
            event_types
        )
    })

events_df = pd.DataFrame(
    events
)

events_df.to_csv(

    DATASET_DIR/"app_events.csv",

    index=False

)

print("app_events.csv created")