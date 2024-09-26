USE sales;

# Basic exploration
SHOW tables;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM markets;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM transactions;
SELECT * FROM date;
SELECT * FROM transactions;
SELECT * FROM markets;

# Check number of currencies used
SELECT currency, count(*) FROM transactions
GROUP BY currency;
-- 2 different types of INR, and 2 transactions in USD

DESCRIBE transactions;

SELECT COUNT(*) FROM transactions where currency = 'INR'; -- only 279 transactions have currency 'INR'

SELECT COUNT(*) FROM transactions where currency like 'INR%'; -- here we see the total number of INR transactions

# fix INR labels
UPDATE transactions
SET currency = 'INR'
WHERE currency LIKE 'INR%';

# select all columns from transactions and date table joined by date (can export to CSV at manager's request)
SELECT  * FROM transactions t
INNER JOIN date d ON d.date = t.order_date;

# extract total sales for year 2020
SELECT SUM(sales_amount) FROM transactions t
INNER JOIN date d ON d.date = t.order_date
WHERE year = 2020;

# compare to 2019
SELECT SUM(sales_amount) FROM transactions t
INNER JOIN date d ON d.date = t.order_date
WHERE year = 2019;
-- there is a huge drop in overall sales amounts from 2019 to 2020

# check Chennai market in 2019 and 2020
SELECT SUM(sales_amount) FROM transactions t
INNER JOIN date d ON d.date = t.order_date
WHERE year = 2020 AND market_code = 'Mark001';

SELECT SUM(sales_amount) FROM transactions t
INNER JOIN date d ON d.date = t.order_date
WHERE year = 2019 AND market_code = 'Mark001';
-- Chennai market is down around 2.7 million INR in sales

# check what products are sold in Chennai
SELECT DISTINCT product_code from transactions
WHERE market_code = 'Mark001';

# check highest sales markets
SELECT markets_name,market_code, SUM(sales_amount) FROM transactions t
JOIN markets m ON t.market_code = m.markets_code
GROUP BY market_code
ORDER BY 3 DESC;

select * from transactions;

ALTER TABLE transactions
RENAME COLUMN profit_margin to profit;

ALTER TABLE transactions
RENAME COLUMN profit_margin_percentage to profit_margin;

SELECT * from transactions;


