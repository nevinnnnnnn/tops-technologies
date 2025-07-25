print("1. Check balance \n2. make deposits \n3. withdraw amount")
bal = 1000
choice = int(input("enter a choice: "))
if choice == 1:
    pin = input("enter your PIN: ") #1234
    if pin == "1234":
        print("avaliable balance: ", bal)
    else:
        print("invalid pin")
    
elif choice == 2:
    dep = float(input("enter the amount to be deposited: "))
    if dep > 0:
        bal = bal + dep
        print("current balance: ", bal)
    else:
        print("invalid deposit amount")
elif choice == 3:
    wit = float(input("enter the amount to withdraw: "))
    if(wit > 0):
        if(wit <= bal):
            bal = bal - wit
            print("remaining balance ", bal)
        else:
            print("insufficient balance")
else:
    print("invalid choice")