select * from Books;
select * from Customers;
select * from Orders;

-- 1) Retrieve all books in the "Fiction" genre 

SELECT * 
FROM Books 
WHERE Genre = "Fiction";

-- (2 Find books published after the year 1950

SELECT * 
FROM Books 
WHERE Published_Year > 1950;

-- (3 List all customers from the Canada

SELECT * FROM Customers
WHERE Country = 'Canada';

-- (4 Show orders placed in November 2023

SELECT * FROM Orders 
WHERE month(Order_Date) = 11;

-- (5 Retrieve the total stock of books available

SELECT Sum(Stock) as Total_Stock FROM Books; 

--  Find the details of the most expensive book

SELECT * FROM Books
order by Price DESC limit 1;

-- Show all customers who ordered more than 1 quantity of a book

SELECT * FROM Orders
WHERE Quantity > 1;

-- Retrieve all orders where the total amount exceeds $20 

SELECT * FROM Orders 
WHERE Total_Amount > 20;

--  List all genres available in the Books table

SELECT distinct Genre FROM Books;

--  Find the book with the lowest stock

SELECT * FROM Books 
order by Stock limit 1;

-- Calculate the total revenue generated from all orders

SELECT sum(Total_Amount) as Total_Revenue from Orders;

select * from Books;
select * from Customers;
select * from Orders;

-- ADVANCE Query
-- 1) Retrieve the total number of books sold for each genre

SELECT b.Genre, sum(o.Quantity) as Total_book_Sold from Books b 
join Orders o 
on b.Book_ID = o.Book_ID group by b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre

SELECT Genre , AVG(Price) as Avg_Price from Books WHERE Genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders
SELECT o.customer_ID, c.name, count(o.Order_ID) 
from Orders o 
join customers c on o.customer_ID = c.customer_ID 
group by o.customer_ID, c.name having count(o.Order_ID)>=2;

-- 4) Find the most frequently ordered book
SELECT o.Book_ID, b.title ,count(o.Order_ID)
from orders o join books b on o.Book_ID=b.Book_ID 
group by o.Book_ID, b.title order by count(o.Order_ID) desc limit 1;

SELECT Book_ID ,count(Order_ID) as order_Count
from orders
group by Book_ID
order by order_Count desc limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 
select * from Books 
where Genre = 'Fantasy' 
order by price desc limit 3;

-- 6) Retrieve the total quantity of books sold by each author
select b.Author, 
sum(o.quantity) as Total_Sold_Book 
from Books b left join orders o on b.Book_ID = o.Book_ID 
group by b.Author order by Total_Sold_Book desc;

-- 7) List the cities where customers who spent over $30 are located
Select distinct c.city, c.name, o.Total_Amount 
from (orders o inner join books b on o.Book_ID = b.Book_ID)
inner join customers c on o.Customer_ID = c.Customer_ID 
where o.Total_Amount> 30;

-- 8) Find the customer who spent the most on orders
select c.Customer_ID, c.name, sum(o.Total_Amount) as Total_Amount   from
customers c inner join orders o 
on c.Customer_ID = o.Customer_ID group by c.name, c.Customer_ID order by Total_Amount  desc limit 1;

-- 9) Calculate the stock remaining after fulfilling all orders
select b.Book_ID, b.title, b.stock, coalesce(sum(o.quantity),0) as order_quantity, b.stock-(coalesce(sum(o.quantity),0)) as Remaining_Stock
from Books b left join orders o on o.Book_ID = b.Book_ID group by b.Book_ID, b.title,b.stock;

select * from Books;
select * from Customers;
select * from Orders;


	
