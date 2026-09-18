import pandas as pd
import random
from pathlib import Path
from faker import Faker

fake = Faker("en_IN")

BASE_DIR = Path(__file__).resolve().parent.parent

DATASET_DIR = BASE_DIR / "datasets"

# Load datasets

customers_df = pd.read_csv(
    DATASET_DIR / "customers.csv"
)

restaurants_df = pd.read_csv(
    DATASET_DIR / "restaurants.csv"
)

menu_df = pd.read_csv(
    DATASET_DIR / "menu_items.csv"
)

riders_df = pd.read_csv(
    DATASET_DIR / "riders.csv"
)

TOTAL_ORDERS = 50000

orders = []

for i in range(1, TOTAL_ORDERS + 1):

    customer = customers_df.sample(
        1
    ).iloc[0]

    restaurant = restaurants_df.sample(
        1
    ).iloc[0]

    restaurant_id = restaurant[
        "restaurant_id"
    ]

    restaurant_items = menu_df[

        menu_df["restaurant_id"]

        == restaurant_id

    ]

    # fallback protection

    if restaurant_items.empty:

        continue

    item = restaurant_items.sample(
        1
    ).iloc[0]

    rider = riders_df[

        riders_df["city"]

        == restaurant["city"]

    ]

    if rider.empty:

        rider = riders_df

    rider = rider.sample(
        1
    ).iloc[0]

    quantity = random.randint(
        1,
        4
    )

    order_amount = (

        item["price"]

        * quantity

    )

    # Persona based discounts

    persona = customer["persona"]

    if persona == "Student":

        discount = random.randint(
            30,
            100
        )

    elif persona == "Working Professional":

        discount = random.randint(
            10,
            70
        )

    else:

        discount = random.randint(
            0,
            50
        )

    delivery_fee = random.randint(
        20,
        60
    )

    final_amount = (

        order_amount

        - discount

        + delivery_fee

    )

    if final_amount < 50:

        final_amount = 50

    order_status = random.choices(

        [

            "Delivered",

            "Cancelled"

        ],

        weights=[96,4]

    )[0]

    order_datetime = fake.date_time_between(

        start_date="-365d",

        end_date="now"

    )

    orders.append({

        "order_id":f"O{i:07d}",

        "customer_id":customer["customer_id"],

        "restaurant_id":restaurant_id,

        "item_id":item["item_id"],

        "rider_id":rider["rider_id"],

        "order_datetime":order_datetime,

        "quantity":quantity,

        "order_amount":order_amount,

        "discount_amount":discount,

        "delivery_fee":delivery_fee,

        "final_amount":final_amount,

        "order_status":order_status

    })

orders_df = pd.DataFrame(
    orders
)

orders_df.to_csv(

    DATASET_DIR/"orders.csv",

    index=False

)

print(

    f"{len(orders_df)} orders created"

)