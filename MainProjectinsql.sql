-- ONLINE BOOK STORE ANALYSIS.

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'D:\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Books.csv' 
CSV HEADER;

copy Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'D:/ST - SQL ALL PRACTICE FILES/All Excel Practice Files/Customers.csv'
WITH (FORMAT csv, HEADER true);

COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'D:\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Orders.csv'
CSV HEADER;


-- 1) Retrieving all books in the "Fiction" genre:
SELECT * FROM Books
WHERE genre='Fiction';

-- 2) Finding books published after the year 1950:
SELECT *FROM Books
WHERE published_year>1950;

-- 3) Listing all customers from the Canada:
SELECT *FROM Customers
WHERE country='Canada';

-- 4) Showing orders placed in November 2023:
SELECT *FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieving the total stock of books available:
SELECT SUM(stock) AS Total_stock FROM Books;

-- 6) Finding the details of the most expensive book:
SELECT *FROM Books
ORDER BY price DESC
LIMIT 1;

SELECT * FROM Books
WHERE price = (SELECT MAX(price) FROM Books);

-- 7) Showing all customers who ordered more than 1 quantity of a book:
SELECT *FROM Orders
WHERE quantity>1;

-- 8) Retrieving all orders where the total amount exceeds $20:
SELECT *FROM Orders
WHERE total_amount > 20;

-- 9) Listing all genres available in the Books table:
SELECT DISTINCT genre FROM Books;

-- 10) Finding the book with the lowest stock:
SELECT * FROM Books
WHERE stock= (SELECT MIN(stock) FROM Books)
LIMIT 1;

-- 11) Calculating the total revenue generated from all orders:
SELECT SUM(total_amount) AS Revenue FROM Orders;

--SOME Advance Queries: 

-- 1) Retrieving the total number of books sold for each genre:
SELECT b.genre,COUNT(o.quantity) AS total_qty_books_sold
FROM Books b
JOIN Orders o ON b.book_id=o.book_id
GROUP BY b.genre;


-- 2) Finding the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS AVG_book_price
FROM Books
WHERE genre='Fantasy';


-- 3) Listing customers who have placed at least 2 orders:
SELECT o.customer_id,c.name,COUNT(o.order_id) AS list_of_customers
FROM Orders o
JOIN Customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id,c.name
HAVING COUNT(o.order_id) >= 2;

-- 4) Finding the most frequently ordered book:
SELECT book_id,COUNT(order_id) AS most_freq_ordered_book
FROM Orders 
GROUP BY book_id
ORDER BY most_freq_ordered_book DESC LIMIT 1;

-- 5) Showing the top 3 most expensive books of 'Fantasy' Genre :
SELECT book_id,title,genre,price
FROM Books
WHERE genre='Fantasy'
ORDER BY price DESC LIMIT 3;

-- 6) Retrieving the total quantity of books sold by each author:
SELECT b.author,SUM(o.quantity) AS total_qty_of_books
FROM Books b
JOIN Orders o ON b.book_id=o.book_id
GROUP BY b.author

-- 7) Listing the cities where customers who spent over $30 are located:
SELECT c.name,c.city,SUM(o.total_amount) AS total_spent_above_30$
FROM Customers c
JOIN Orders o ON c.customer_id=o.customer_id
GROUP BY c.name,c.city
HAVING SUM(o.total_amount) > 30; 

-- 8) Finding the customer who spent the most on orders:
SELECT c.name,SUM(o.total_amount) AS most_spent_by_customer
FROM Customers c
JOIN Orders o ON c.customer_id=o.customer_id
GROUP BY c.name
ORDER BY most_spent_by_customer DESC LIMIT 1;

--9) Calculating the stock remaining after fulfilling all orders:(tuff as begineer!)
SELECT b.book_id,b.title,b.stock,COALESCE(SUM(o.quantity),0) AS total_qty,
b.stock-COALESCE(SUM(o.quantity),0) AS stock_remaining
FROM Books b
left join Orders o ON b.book_id=o.book_id
Group by b.book_id;

-- PROJECT DONE!





