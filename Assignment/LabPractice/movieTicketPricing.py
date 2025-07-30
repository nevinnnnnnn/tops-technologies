age = int(input("enter the age: "))
if age < 5 and age > 60:
    print("ticket is free")
elif age <=18 and age >=5:
    print("price for ticket is 100 rupee")
elif age <= 60 and age >= 19:
    print("price for ticket is 200 rupee")
else:
    print("age is invalid")