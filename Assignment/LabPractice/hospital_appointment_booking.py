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