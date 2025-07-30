"""Restaurant Food Order System

Check if restaurant is open.
If open→ check if dish is available.
If available → check if customer wants home delivery."""

restaurant_name = "habibi"
dish = "abcd"


search_hotel = input("enter the name of the hotel: ")
if search_hotel == restaurant_name:
    print("restaurant is open")
    dish_available = input("enter the dish you want to order: ")
    if dish_available == dish:
        print("dish available")
        delivery = input("do you want home delivery? (Y / N): ")
        if delivery == 'Y':
            print("your food will be delivered to your address")
        else:
            if delivery == 'N':
                print("food won't be delivered to your address as you have selected the the N option")
            else:
                print("yout input is invalid")
    else:
        print("dish is not available")
else:
    print("data not available")