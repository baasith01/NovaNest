import pandas as pd
import numpy as np
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

DATASET_DIR = BASE_DIR / "datasets"

orders = pd.read_csv(
    DATASET_DIR/"cleaned"/"orders.csv"
)

orders["order_datetime"] = pd.to_datetime(
    orders["order_datetime"]
)

# -------------------------

# Peak Hour Flag

orders["hour"] = (

    orders["order_datetime"]

    .dt.hour

)

orders["peak_hour_flag"] = np.where(

    orders["hour"].between(12,14)

    |

    orders["hour"].between(18,21),

    1,

    0

)

# -------------------------

# Weekend Flag

orders["weekend_flag"] = np.where(

    orders["order_datetime"]

    .dt.dayofweek

    >=5,

    1,

    0

)

# -------------------------

# Cancellation Flag

orders["cancellation_flag"] = np.where(

    orders["order_status"]

    =="Cancelled",

    1,

    0

)

# -------------------------

# Discount Percentage

orders["discount_percentage"]=(

    orders["discount_amount"]

    /

    orders["order_amount"]

)*100

orders["discount_percentage"]=(

    orders["discount_percentage"]

    .round(2)

)

# -------------------------

# Estimated Profit

orders["estimated_profit"]=(
    
    orders["final_amount"]

    *0.20

).round(2)

# -------------------------

# Order Size

orders["order_size"]=pd.cut(

    orders["final_amount"],

    bins=[0,400,900,100000],

    labels=[

        "Small",

        "Medium",

        "Large"

    ]

)

# -------------------------

ENGINEERED_DIR = (

    DATASET_DIR

    /"engineered"

)

ENGINEERED_DIR.mkdir(

    exist_ok=True

)

orders.to_csv(

    ENGINEERED_DIR/

    "orders_engineered.csv",

    index=False

)

print(

    "orders_engineered.csv created"

)