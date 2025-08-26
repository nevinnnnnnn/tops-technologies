"""Design a Python class SchoolManagement that helps manage student admissions and
records. The system should support:
➔ New Admission:
● Collect student name, age, class (1–12), and guardian's mobile number.
● Assign a unique student ID automatically.
● Validate age: must be between 5 and 18.
● Validate mobile number: must be 10 digits.
➔ View Student Details:
● Allow lookup using student ID.
➔ Update Student Info:
● Update mobile number or class.
➔ Remove Student Record:
● Remove a student using their student ID.
➔ Exit System"""

class SchoolManagement:
    def __init__(self):
        self.students = {}
        self.next_id = 1  

    def new_admission(self, name, age, student_class, guardian_mobile):
        if not (5 <= age <= 18):
            return "Admission failed: Age must be between 5 and 18."
        
        if not (1 <= student_class <= 12):
            return "Admission failed: Class must be between 1 and 12."

        if not (len(guardian_mobile) == 10 and guardian_mobile.isdigit()):
            return "Admission failed: Mobile number must be 10 digits."

        student_id = self.next_id
        self.next_id += 1

        self.students[student_id] = {
            "name": name,
            "age": age,
            "class": student_class,
            "guardian_mobile": guardian_mobile
        }
        return f"Admission successful! Student ID: {student_id}"

    def view_student(self, student_id):
        if student_id in self.students:
            student = self.students[student_id]
            return (f"Student ID: {student_id}\n"
                    f"Name: {student['name']}\n"
                    f"Age: {student['age']}\n"
                    f"Class: {student['class']}\n"
                    f"Guardian Mobile: {student['guardian_mobile']}")
        return "Student record not found."

    def update_student(self, student_id, guardian_mobile=None, student_class=None):
        if student_id not in self.students:
            return "Student record not found."
        
        if guardian_mobile:
            if len(guardian_mobile) == 10 and guardian_mobile.isdigit():
                self.students[student_id]["guardian_mobile"] = guardian_mobile
            else:
                return "Update failed: Mobile number must be 10 digits."

        if student_class:
            if 1 <= student_class <= 12:
                self.students[student_id]["class"] = student_class
            else:
                return "Update failed: Class must be between 1 and 12."

        return f"Student ID {student_id} updated successfully."

    def remove_student(self, student_id):
        if student_id in self.students:
            del self.students[student_id]
            return f"Student ID {student_id} record removed successfully."
        return "Student record not found."

    def run(self):
        while True:
            print("\nSchool Management System")
            print("1. New Admission")
            print("2. View Student Details")
            print("3. Update Student Info")
            print("4. Remove Student Record")
            print("5. Exit")
            
            choice = input("Enter your choice (1-5): ")

            if choice == "1":
                name = input("Enter student name: ")
                age = int(input("Enter age: "))
                student_class = int(input("Enter class (1-12): "))
                guardian_mobile = input("Enter guardian mobile number: ")
                print(self.new_admission(name, age, student_class, guardian_mobile))

            elif choice == "2":
                student_id = int(input("Enter student ID: "))
                print(self.view_student(student_id))

            elif choice == "3":
                student_id = int(input("Enter student ID: "))
                guardian_mobile = input("Enter new guardian mobile (leave blank if no change): ")
                student_class = input("Enter new class (leave blank if no change): ")

                guardian_mobile = guardian_mobile if guardian_mobile.strip() != "" else None
                student_class = int(student_class) if student_class.strip().isdigit() else None

                print(self.update_student(student_id, guardian_mobile, student_class))

            elif choice == "4":
                student_id = int(input("Enter student ID: "))
                print(self.remove_student(student_id))

            elif choice == "5":
                print("Exiting School Management System. Goodbye!")
                break
            else:
                print("Invalid choice. Please try again.")


if __name__ == "__main__":
    sm = SchoolManagement()
    sm.run()