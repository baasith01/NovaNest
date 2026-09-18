import pandas as pd
import random
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
DATASET_DIR = BASE_DIR / "datasets"

# Load restaurants dataset
restaurants_df = pd.read_csv(
    DATASET_DIR / "restaurants.csv"
)

# Food items categorized by cuisine
food_catalog = {

    "South Indian": [
        "Masala Dosa",
        "Idli",
        "Vada",
        "Pongal",
        "Uttapam"
    ],

    "Biryani": [
        "Chicken Biryani",
        "Mutton Biryani",
        "Veg Biryani",
        "Paneer Biryani"
    ],

    "North Indian": [
        "Butter Naan",
        "Paneer Butter Masala",
        "Dal Makhani",
        "Chole Bhature"
    ],

    "Chinese": [
        "Fried Rice",
        "Noodles",
        "Manchurian",
        "Spring Roll"
    ],

    "Pizza": [
        "Margherita Pizza",
        "Farmhouse Pizza",
        "Veg Pizza",
        "Pepperoni Pizza"
    ],

    "Burger": [
        "Veg Burger",
        "Chicken Burger",
        "Cheese Burger"
    ],

    "Healthy Foods": [
        "Salad Bowl",
        "Grilled Chicken",
        "Protein Bowl"
    ],

    "Desserts": [
        "Brownie",
        "Chocolate Cake",
        "Ice Cream"
    ],

    "Beverages": [
        "Mojito",
        "Cold Coffee",
        "Lemon Juice"
    ]
}

menu_items = []

for i in range(1, 15001):

    restaurant = restaurants_df.sample(
        1
    ).iloc[0]

    cuisine = restaurant["cuisine_type"]

    item_name = random.choice(
        food_catalog[cuisine]
    )

    menu_items.append({

        "item_id": f"M{i:06d}",

        "restaurant_id": restaurant["restaurant_id"],

        "cuisine_type": cuisine,

        "item_name": item_name,

        "price": random.randint(
            80,
            700
        ),

        "preparation_time": random.randint(
            10,
            45
        )
    })

menu_df = pd.DataFrame(menu_items)

menu_df.to_csv(
    DATASET_DIR / "menu_items.csv",
    index=False
)

print("menu_items.csv created successfully")