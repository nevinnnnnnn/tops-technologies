"""Design a Python class ClinicAppointment that manages patient appointments in a clinic.
The system should have the following features:
➔ Book Appointment:
● Prompt for patient name, age, mobile number, and preferred doctor.
● Show time slots (10am, 11am, 12pm, 2pm, 3pm).
● Check slot availability and confirm booking.
➔ View/Cancel Appointment:
● Allow patient to view or cancel their appointment using mobile number.
➔ Doctor Availability:
● Maintain a maximum of 3 appointments per time slot per doctor.
➔ Data Persistence:
● Store appointments in memory only (no files/dbs required)."""

class ClinicAppointment:
    def __init__(self):
        self.doctors = ["Dr. A", "Dr. B", "Dr. C"]
        self.time_slots = ["10 AM", "11 AM", "12 PM", "2 PM", "3 PM"]

        self.appointments = {}
        for doctor in self.doctors:
            self.appointments[doctor] = {}
            for slot in self.time_slots:
                self.appointments[doctor][slot] = []

        self.patient_lookup = {}

    def book_appointment(self, name, age, mobile, doctor, slot):
        if doctor not in self.doctors:
            return "Doctor is not available at the moment"
        if slot not in self.time_slots:
            return "Invalid time slot"
        
        if mobile in self.patient_lookup:
            return "Appointment already exists with this mobile number"
        
        if len(self.appointments[doctor][slot]) >= 3:
            return f"Slot {slot} with {doctor} is full"
        
        patient = {"name": name, "age": age, "mobile": mobile}
        self.appointments[doctor][slot].append(patient)
        self.patient_lookup[mobile] = (doctor, slot, patient)

        return f"Appointment booked with {doctor} at {slot}"
    
    def view_appointment(self, mobile):
        if mobile not in self.patient_lookup:
            return "No appointment found with this mobile number"
        
        doctor, slot, patient = self.patient_lookup[mobile]
        return f"Appointment: {patient['name']} ({patient['age']} years) with {doctor} at {slot}"

    def cancel_appointment(self, mobile):
        if mobile not in self.patient_lookup:
            return "No appointment found with this mobile number"
        
        doctor, slot, patient = self.patient_lookup[mobile]

        new_list = []
        for p in self.appointments[doctor][slot]:
            if p["mobile"] != mobile:
                new_list.append(p)
        self.appointments[doctor][slot] = new_list

        del self.patient_lookup[mobile]

        return f"Appointment for {patient['name']} cancelled"
    
    def show_doctor_schedule(self, doctor):
        if doctor not in self.doctors:
            return "Doctor not available"
        
        schedule = f"Schedule for {doctor}:\n"
        for slot in self.time_slots:
            count = len(self.appointments[doctor][slot])
            schedule += f"{slot}: {count}/3 booked\n"

        return schedule

if __name__ == "__main__":
    clinic = ClinicAppointment()

    while True:
        print("\n===== Clinic Appointment System =====")
        print("1. Book Appointment")
        print("2. View Appointment")
        print("3. Cancel Appointment")
        print("4. Show Doctor Schedule")
        print("5. Exit")
        
        choice = input("Enter your choice (1-5): ")

        if choice == "1":
            name = input("Enter patient name: ")
            age = input("Enter patient age: ")
            mobile = input("Enter patient mobile number: ")

            print("Available Doctors:", clinic.doctors)
            doctor = input("Enter preferred doctor: ")

            print("Available Slots:", clinic.time_slots)
            slot = input("Enter preferred slot: ")

            print(clinic.book_appointment(name, age, mobile, doctor, slot))

        elif choice == "2":
            mobile = input("Enter mobile number: ")
            print(clinic.view_appointment(mobile))

        elif choice == "3":
            mobile = input("Enter mobile number: ")
            print(clinic.cancel_appointment(mobile))

        elif choice == "4":
            doctor = input("Enter doctor name: ")
            print(clinic.show_doctor_schedule(doctor))

        elif choice == "5":
            print("Exiting system. Goodbye!")
            break

        else:
            print("Invalid choice, try again.")
