# Vending Machine Management System (VMMS)

A full-stack web application designed to monitor, manage, and refill inventory for a network of vending machines. Built with a focus on data integrity and real-time inventory tracking.

## 🚀 Features
- **Dynamic Dashboard:** Real-time calculation of machine stock percentages and status.
- **Inventory Management:** Detailed view of beverages categorized by type.
- **Smart Refill System:** Logic-based refill processing that validates machine capacity and "Out of Service" status.
- **Relational Database:** A robust MySQL schema using foreign keys and check constraints to ensure data accuracy.

## 🛠 Tech Stack
- **Backend:** PHP (LAMP stack philosophy)
- **Database:** MySQL
- **Frontend:** JavaScript (ES6+), HTML5, CSS3
- **Design:** Custom typography and responsive iframe-based navigation.

## 📋 Database Schema
The system runs on 4 core tables:
1. `Emballage`: Defines container types and volumes.
2. `Boisson`: Stores beverage details and pricing.
3. `VendingMachine`: Tracks physical machine locations and capacities.
4. `BoissonMachine`: Manages the specific stock and pricing for each machine's rows.

## ⚙️ Setup Instructions
1. Clone the repository.
2. Import the `sql/vending_machine.sql` file into your MySQL database (phpMyAdmin).
3. Update the `mysqli_connect` parameters in the `.php` files to match your local database credentials.
4. Run the project using a local server like XAMPP or WAMP.
