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
