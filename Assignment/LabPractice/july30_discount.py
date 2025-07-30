"""
total amount
above 5000 - 10 per dis

"""

total_amount = int(input("enter total amount: "))
if total_amount > 0:
    if total_amount >= 5000:
        discount = 0.2
        final_amount = total_amount - (total_amount * discount)
        print(f"you got 20% discount ({total_amount * discount}), final amount {final_amount}")
    else:
        if total_amount >= 3000:
           discount = 0.1
           final_amount = total_amount - (total_amount * discount)
           print(f"you got 10% discount ({total_amount * discount}), final amount {final_amount}")
        else:
            if total_amount >= 2000:
                discount = 0.05
                final_amount = total_amount - (total_amount * discount)
                print(f"you got 5% discount ({total_amount * discount}), total amount - {final_amount}")
            else:
                print(f"you are not eligible for discount, amount to pay {total_amount}")
else:
    print("invalid amount")