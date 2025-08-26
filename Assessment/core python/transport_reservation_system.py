"""Design a Python class BusReservation that simulates a basic bus ticket booking system.
Features should include:
➔ Show Available Routes:
● Predefined city routes with fixed prices.
● Example: "Mumbai to Pune - ₹500", "Delhi to Jaipur - ₹600", etc.
➔ Book Ticket:
● Enter passenger name, age, mobile, and route.
● Assign seat number (max 40 per bus per route).
● Generate a unique ticket ID.
➔ View Ticket:
● Lookup using ticket ID.
➔ Cancel Ticket:
● Cancel the ticket if it exists.
➔ Exit"""

import random

class BusReservation:
    def __init__(self):
        self.routes = {
            "Mumbai to Pune": 500,
            "Delhi to Jaipur": 600,
            "Bangalore to Chennai": 700,
            "Ahmedabad to Surat": 400,
            "Kolkata to Digha": 350
        }
        self.tickets = {}   
        self.seats = {}     

    def show_routes(self):
        print("\nAvailable Routes:")
        for route, price in self.routes.items():
            print(f"{route} - ₹{price}")

    def book_ticket(self):
        name = input("Enter passenger name: ")
        age = int(input("Enter passenger age: "))
        mobile = input("Enter mobile number: ")
        
        self.show_routes()
        route = input("Enter your chosen route exactly as shown: ")

        if route not in self.routes:
            print("Invalid route selection!")
            return

        if self.seats.get(route, 0) >= 40:
            print("No seats available on this route!")
            return

        ticket_id = "T" + str(random.randint(10000, 99999))

        seat_number = self.seats.get(route, 0) + 1
        self.seats[route] = seat_number

        self.tickets[ticket_id] = {
            "Name": name,
            "Age": age,
            "Mobile": mobile,
            "Route": route,
            "Seat No": seat_number,
            "Price": self.routes[route]
        }

        print(f"\nTicket booked successfully!")
        print(f"Ticket ID: {ticket_id}")
        print(f"Seat Number: {seat_number}")
        print(f"Route: {route}")
        print(f"Price: ₹{self.routes[route]}")

    def view_ticket(self):
        ticket_id = input("Enter your Ticket ID: ")
        if ticket_id in self.tickets:
            print("\nTicket Details:")
            for key, value in self.tickets[ticket_id].items():
                print(f"{key}: {value}")
        else:
            print("Ticket not found!")

    def cancel_ticket(self):
        ticket_id = input("Enter your Ticket ID to cancel: ")
        if ticket_id in self.tickets:
            route = self.tickets[ticket_id]["Route"]
            seat_no = self.tickets[ticket_id]["Seat No"]

            del self.tickets[ticket_id]

            self.seats[route] -= 1
            print(f"Ticket {ticket_id} cancelled successfully!")
        else:
            print("Ticket not found!")

    def run(self):
        while True:
            print("\n--- Bus Reservation System ---")
            print("1. Show Available Routes")
            print("2. Book Ticket")
            print("3. View Ticket")
            print("4. Cancel Ticket")
            print("5. Exit")

            choice = input("Enter your choice: ")

            if choice == "1":
                self.show_routes()
            elif choice == "2":
                self.book_ticket()
            elif choice == "3":
                self.view_ticket()
            elif choice == "4":
                self.cancel_ticket()
            elif choice == "5":
                print("Thank you for using Bus Reservation System!")
                break
            else:
                print("Invalid choice! Please try again.")

if __name__ == "__main__":
    brs = BusReservation()
    brs.run()
