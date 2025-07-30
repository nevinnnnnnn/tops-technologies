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