# 📚 Online Bookstore Sales Analysis SQL Project

This project demonstrates how to manage and analyze a simple bookstore's data using SQL. It includes SQL scripts to create and populate tables, along with a series of basic and advanced queries for insightful data analysis.

## 📁 Project Structure

- **Tables Created**:
  - `Books` – stores details of books including price, genre, and stock.
  - `Customers` – stores customer information like name, email, and location.
  - `Orders` – records orders placed by customers, including quantity and total amount.

- **Data Import**:
  - CSV files are imported into each table using the `COPY` command.
  - Make sure to adjust the file paths in the script to match your local environment.
  - I have included the csv files in the repo.

## 🛠️ Technologies Used

- **PostgreSQL** (or compatible SQL environment)
- SQL scripting for data manipulation and querying

## 📌 Features & Queries

### 🔹 Basic Queries

- List all fiction books
- Find books published after a specific year
- Show customers from Canada
- Orders placed in a specific month
- Total stock available
- Most/Least expensive books
- Customers who ordered more than one item
- Orders exceeding $20
- Unique genres available

### 🔹 Advanced Queries

- Total books sold per genre
- Average book price by genre
- Customers with multiple orders
- Most frequently ordered book
- Top 3 most expensive Fantasy books
- Books sold by each author
- Cities with customers spending more than $30
- Highest-spending customer
- Calculate remaining stock after orders

## 📥 Setup Instructions

1. **Install PostgreSQL** on your machine if not already installed.
2. **Clone this repository**:
   ```bash
   git clone https://github.com/VirajAdake210706/SQL_OnlineBookStore.git
   cd SQL_OnlineBookStore
  ```
