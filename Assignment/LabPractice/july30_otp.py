username = "nevin"
password = "12345"
OTP = "0987"

YOUR_USERNAME = input("enter your username: ")
if YOUR_USERNAME == username:
    pswd = input("enter your passoword: ")
    if pswd == password:
        print("authentication done")
        entered_otp = int(input("enter the otp: "))
        if entered_otp == OTP:
            print("verification done")
        else:
            print("incorrect attempt")
    else:
        print("password incorrect")
else:
    print("username incorrect")