"""Railway Ticket Booking System
Problem:
Check if the train is available.

If available → check if seats are available.

If seats available → check if payment is successful."""

available_train = 1212123
seatsAvailable = True

trainNo = int(input("enter the train number to check the availability of the train: "))
if trainNo == available_train:
    print(f"train no. {trainNo} is available")
    if seatsAvailable == True:
        print(f"seats are available for train no. {trainNo}")
        paymentStatus = (input("have you done your payment? (Y/N): "))
        if paymentStatus == 'Y':
            print("payment done")
        else:
            if paymentStatus == 'N':
                print("payment not done")
            else:
                print("invalid input")
    else:
        print("sorry, No seats available")
else:
    print(f"train no. {trainNo} is not available")


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



"""College Admission System

Check if marks ≥ 80 (eligible).
If eligible → check if preferred course has seats.
If seats available → confirm admission."""

available_course = "CS"
total_marks = float(input("enter the marks: "))

if total_marks >= 80:
    print("you are eligible for the admissions")
    course = input("enter the course want to pursue: (CS)")
    if course == available_course:
        print("course is available")
        seats_available = input("seats are available.. do you want to confirm? (Y/N)")
        if seats_available == 'Y':
            print("admissions confirmed")
        else:
            if seats_available == 'N':
                print("sorry, no seats available")
            else:
                print("invalid input")
    else:
        print("Seats are not available for the course you opted")
else:
    print("you are not eligible")




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



"""Hospital Appointment Booking

Check if doctor is available.
If available → check if slot is available.
If slot available → confirm appointment."""

available_doctor = "Dr. Abc"
doctor = input("search for a doctor with whom you want to book an appointment: ")

if doctor == available_doctor:
    print("doc available")
    slots_available = input("are slots available (enter Y if slots are available, else enter N): ")
    if slots_available == 'Y':
        print("slots are available")
        appointment = input("do you want to confirm the appointment? (Y/ N): ")
        if appointment == 'Y':
            print("appointment booked")
        elif appointment == 'N':
            print("appointment cancelled")
        else:
            print("invalid input")
    elif slots_available == 'N':
        print("slots are not available")
    else:
        print("invalid input")
else:
    print("doc not available")