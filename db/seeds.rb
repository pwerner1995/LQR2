Drink.find_or_create_by(name: "Tito's", price: 24)
Drink.find_or_create_by(name: "Svedka", price: 20)
Drink.find_or_create_by(name: "Smirnoff", price: 19)
Drink.find_or_create_by(name: "Ciroc", price: 30)

Store.find_or_create_by(name: "Bottle King", location:"Jersey")
Store.find_or_create_by(name: "Wine & Spirits", location:"Flatiron")

StoreDrink.find_or_create_by(drink_id:1, store_id:1)
StoreDrink.find_or_create_by(drink_id:2, store_id:1)
StoreDrink.find_or_create_by(drink_id:3, store_id:1)
StoreDrink.find_or_create_by(drink_id:4, store_id:1)
StoreDrink.find_or_create_by(drink_id:1, store_id:2)
StoreDrink.find_or_create_by(drink_id:3, store_id:2)