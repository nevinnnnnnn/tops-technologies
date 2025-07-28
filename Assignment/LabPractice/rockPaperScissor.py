print("rules: rock beats scissors, paper beats rock, scissors beats papaer")

choice1 = int(input("enter a choice for user 1: 1. rock    2. paper    3. scissors "))
choice2 = int(input("enter a choice for user 2: 1. rock    2. paper    3. scissors "))

if choice1 == 1 and choice2 == 1:
    print("no points")
elif choice1 == 1 and choice2 == 2:
    print("points to user 2")
elif choice1 == 1 and choice2 == 3:
    print("points to user 1")
elif choice1 == 2 and choice2 == 1:
    print("points to user 1")
elif choice1 == 2 and choice2 == 2:
    print("no points")
elif choice1 == 2 and choice2 == 3:
    print("points to user 2")
elif choice1 == 3 and choice2 == 1:
    print("points for user 1")
elif choice1 == 3 and choice2 == 2:
    print("points to user 1")
elif choice1 == 3 and choice2 == 3:
    print("no points")
else:
    print("invaid choices")