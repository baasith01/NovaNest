import pandas as pd
import random
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

DATASET_DIR = BASE_DIR / "datasets"

orders_df = pd.read_csv(
    DATASET_DIR / "orders.csv"
)

payments = []

deliveries = []

payment_methods = [

    "UPI",

    "Credit Card",

    "Debit Card",

    "Cash",

    "Wallet"

]

for _, row in orders_df.iterrows():

    order_id = row["order_id"]

    rider_id = row["rider_id"]

    payment_id = f"P{order_id[1:]}"

    delivery_id = f"DV{order_id[1:]}"

    payment_method = random.choices(

        payment_methods,

        weights=[55,15,10,10,10]

    )[0]

    payment_status = (

        "Refunded"

        if row["order_status"]=="Cancelled"

        else "Success"

    )

    distance = round(

        random.uniform(1,12),

        1

    )

    delivery_duration = random.randint(

        15,

        60

    )

    deliveries.append({

        "delivery_id":delivery_id,

        "order_id":order_id,

        "rider_id":rider_id,

        "distance_km":distance,

        "delivery_duration":delivery_duration

    })

    payments.append({

        "payment_id":payment_id,

        "order_id":order_id,

        "payment_method":payment_method,

        "payment_status":payment_status

    })

payments_df = pd.DataFrame(

    payments

)

deliveries_df = pd.DataFrame(

    deliveries

)

payments_df.to_csv(

    DATASET_DIR/"payments.csv",

    index=False

)

deliveries_df.to_csv(

    DATASET_DIR/"deliveries.csv",

    index=False

)

print("payments.csv created")

print("deliveries.csv created")