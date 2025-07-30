"""Online Shopping Payment System

Check if item is in stock.
If in stock → check if payment method selected.
If selected → check if payment successful.
"""

item = "toys"

searched_item = input("Enter the item: ")
if searched_item == item:
    print("Available in stock")
    selected_payment = input("Select the payment method (1. Cash  2. UPI  3. Credit/Debit Card): ")
    
    if selected_payment == '1':
        print("Payment done successfully via Cash.")
    elif selected_payment == '2':
        print("Payment done successfully via UPI payment mode.")
    elif selected_payment == '3':
        print("Payment done successfully via Credit/Debit Card.")
    else:
        print("Invalid mode of payment selected.")
else:
    print("Item not available in stock.")