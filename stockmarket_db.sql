-- Create the Stock Market Database
create database stockmarket_database;
use stockmarket_database;
-- Create the Company Table
CREATE TABLE Company (
    company_id INT auto_increment PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    ticker_symbol VARCHAR(10) NOT NULL UNIQUE,
    sector VARCHAR(100),
    industry VARCHAR(100),
    market_cap BIGINT, -- Market Cap in billions
    stock_price DECIMAL(10, 2),
    pe_ratio DECIMAL(5, 2),
    dividend_yield DECIMAL(5, 2),
    date_of_establishment YEAR,
    country VARCHAR(100)
);

-- Insert 30 Records into the Company Table
INSERT INTO Company (company_id, company_name, ticker_symbol, sector, industry, market_cap, stock_price, pe_ratio, dividend_yield, date_of_establishment, country) VALUES
(1, 'Apple Inc.', 'AAPL', 'Technology', 'Consumer Electronics', 2300000000000, 150.00, 28.00, 0.7, 1976, 'USA'),
(2, 'Microsoft Corp.', 'MSFT', 'Technology', 'Software', 2200000000000, 290.00, 35.00, 1.0, 1975, 'USA'),
(3, 'Tesla Inc.', 'TSLA', 'Consumer Discretionary', 'Automotive', 800000000000, 600.00, 90.00, 0.0, 2003, 'USA'),
(4, 'Amazon.com Inc.', 'AMZN', 'Consumer Discretionary', 'E-commerce', 1700000000000, 3500.00, 75.00, 0.0, 1994, 'USA'),
(5, 'Alphabet Inc.', 'GOOG', 'Communication Services', 'Internet Services', 1800000000000, 2800.00, 30.00, 0.0, 1998, 'USA'),
(6, 'Meta Platforms', 'META', 'Communication Services', 'Social Media', 900000000000, 320.00, 18.00, 0.0, 2004, 'USA'),
(7, 'Nvidia Corp.', 'NVDA', 'Technology', 'Semiconductors', 500000000000, 750.00, 70.00, 0.1, 1993, 'USA'),
(8, 'Berkshire Hathaway', 'BRK.A', 'Financials', 'Conglomerate', 700000000000, 450000.00, 20.00, 0.0, 1939, 'USA'),
(9, 'Johnson & Johnson', 'JNJ', 'Healthcare', 'Pharmaceuticals', 470000000000, 165.00, 25.00, 2.5, 1986, 'USA'),
(10, 'JPMorgan Chase', 'JPM', 'Financials', 'Investment Banking', 500000000000, 150.00, 12.00, 3.2, 1999, 'USA'),
(11, 'Visa Inc.', 'V', 'Financials', 'Credit Services', 500000000000, 220.00, 30.00, 0.6, 1958, 'USA'),
(12, 'Procter & Gamble', 'PG', 'Consumer Staples', 'Household Products', 350000000000, 140.00, 22.00, 2.3, 1937, 'USA'),
(13, 'Coca-Cola Co.', 'KO', 'Consumer Staples', 'Beverages', 250000000000, 60.00, 24.00, 3.1, 1992, 'USA'),
(14, 'Intel Corp.', 'INTC', 'Technology', 'Semiconductors', 250000000000, 50.00, 10.00, 5.0, 1968, 'USA'),
(15, 'Walt Disney Co.', 'DIS', 'Communication Services', 'Media & Entertainment', 250000000000, 180.00, 20.00, 1.1, 1923, 'USA'),
(16, 'Exxon Mobil', 'XOM', 'Energy', 'Oil & Gas', 300000000000, 100.00, 15.00, 6.0, 1970, 'USA'),
(17, 'Chevron Corp.', 'CVX', 'Energy', 'Oil & Gas', 280000000000, 120.00, 14.00, 5.0, 1979, 'USA'),
(18, 'PepsiCo Inc.', 'PEP', 'Consumer Staples', 'Beverages & Snacks', 220000000000, 155.00, 30.00, 2.5, 1998, 'USA'),
(19, 'McDonald’s Corp.', 'MCD', 'Consumer Discretionary', 'Restaurants', 200000000000, 230.00, 35.00, 2.2, 1940, 'USA'),
(20, 'Boeing Co.', 'BA', 'Industrials', 'Aerospace', 150000000000, 200.00, 25.00, 0.0, 1916, 'USA'),
(21, 'Walmart Inc.', 'WMT', 'Consumer Staples', 'Retail', 400000000000, 160.00, 25.00, 1.8, 1962, 'USA'),
(22, 'IBM Corp.', 'IBM', 'Technology', 'IT Services', 150000000000, 140.00, 16.00, 4.5, 1911, 'USA'),
(23, 'General Electric', 'GE', 'Industrials', 'Conglomerate', 120000000000, 100.00, 22.00, 2.9, 1992, 'USA'),
(24, 'Home Depot Inc.', 'HD', 'Consumer Discretionary', 'Retail', 350000000000, 330.00, 24.00, 2.3, 1978, 'USA'),
(25, 'Salesforce Inc.', 'CRM', 'Technology', 'Software', 220000000000, 270.00, 38.00, 0.0, 1999, 'USA'),
(26, 'Netflix Inc.', 'NFLX', 'Communication Services', 'Streaming', 220000000000, 490.00, 70.00, 0.0, 1997, 'USA'),
(27, 'Lockheed Martin', 'LMT', 'Industrials', 'Aerospace', 130000000000, 380.00, 15.00, 2.5, 1912, 'USA'),
(28, 'Unilever PLC', 'UL', 'Consumer Staples', 'Household Products', 150000000000, 60.00, 20.00, 3.5, 1930, 'UK'),
(29, 'Royal Dutch Shell', 'RDS.A', 'Energy', 'Oil & Gas', 220000000000, 55.00, 10.00, 6.1, 1907, 'Netherlands'),
(30, 'Samsung Electronics', 'SSNLF', 'Technology', 'Electronics', 400000000000, 200.00, 12.00, 1.8, 1938, 'South Korea');

-- Create the Stock Table
CREATE TABLE Stock (
    stock_id INT auto_increment PRIMARY KEY,
    company_id INT,
    trade_date DATE NOT NULL,
    open_price DECIMAL(10, 2),
    close_price DECIMAL(10, 2),
    high_price DECIMAL(10, 2),
    low_price DECIMAL(10, 2),
    volume BIGINT,
    adjusted_close DECIMAL(10, 2),
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);
 
-- Insert 30 Sample Records into the Stock Table
INSERT INTO Stock (stock_id, company_id, trade_date, open_price, close_price, high_price, low_price, volume, adjusted_close) VALUES
(1, 1, '2023-04-01', 145.00, 150.00, 151.00, 144.00, 50000000, 150.00),
(2, 2, '2023-04-01', 285.00, 290.00, 295.00, 284.00, 30000000, 290.00),
(3, 3, '2023-04-01', 590.00, 600.00, 610.00, 580.00, 20000000, 600.00),
(4, 4, '2023-04-01', 3400.00, 3500.00, 3550.00, 3350.00, 15000000, 3500.00),
(5, 5, '2023-04-01', 2750.00, 2800.00, 2850.00, 2700.00, 18000000, 2800.00),
(6, 6, '2023-04-01', 310.00, 320.00, 325.00, 305.00, 22000000, 320.00),
(7, 7, '2023-04-01', 720.00, 750.00, 760.00, 710.00, 15000000, 750.00),
(8, 8, '2023-04-01', 450000.00, 455000.00, 460000.00, 445000.00, 50000, 455000.00),
(9, 9, '2023-04-01', 160.00, 165.00, 170.00, 158.00, 30000000, 165.00),
(10, 10, '2023-04-01', 145.00, 150.00, 152.00, 143.00, 28000000, 150.00),
(11, 11, '2023-04-01', 215.00, 220.00, 225.00, 210.00, 35000000, 220.00),
(12, 12, '2023-04-01', 135.00, 140.00, 145.00, 133.00, 40000000, 140.00),
(13, 13, '2023-04-01', 58.00, 60.00, 63.00, 57.00, 45000000, 60.00),
(14, 14, '2023-04-01', 48.00, 50.00, 52.00, 47.00, 20000000, 50.00),
(15, 15, '2023-04-01', 175.00, 180.00, 185.00, 170.00, 32000000, 180.00),
(16, 16, '2023-04-01', 95.00, 100.00, 105.00, 90.00, 37000000, 100.00),
(17, 17, '2023-04-01', 105.00, 110.00, 115.00, 100.00, 25000000, 110.00),
(18, 18, '2023-04-01', 150.00, 155.00, 160.00, 148.00, 20000000, 155.00),
(19, 19, '2023-04-01', 230.00, 235.00, 240.00, 225.00, 18000000, 235.00),
(20, 20, '2023-04-01', 195.00, 200.00, 205.00, 190.00, 15000000, 200.00),
(21, 21, '2023-04-01', 155.00, 160.00, 165.00, 150.00, 28000000, 160.00),
(22, 22, '2023-04-01', 135.00, 140.00, 145.00, 133.00, 30000000, 140.00),
(23, 23, '2023-04-01', 98.00, 100.00, 105.00, 95.00, 32000000, 100.00),
(24, 24, '2023-04-01', 325.00, 330.00, 340.00, 320.00, 19000000, 330.00),
(25, 25, '2023-04-01', 265.00, 270.00, 275.00, 260.00, 21000000, 270.00),
(26, 26, '2023-04-01', 470.00, 480.00, 490.00, 460.00, 30000000, 480.00),
(27, 27, '2023-04-01', 370.00, 380.00, 390.00, 360.00, 15000000, 380.00),
(28, 28, '2023-04-01', 55.00, 58.00, 60.00, 54.00, 40000000, 58.00),
(29, 29, '2023-04-01', 50.00, 52.00, 55.00, 48.00, 20000000, 52.00),
(30, 30, '2023-04-01', 195.00, 200.00, 205.00, 190.00, 25000000, 200.00);

-- Create the Transaction Table
CREATE TABLE Transaction (
    transaction_id INT auto_increment PRIMARY KEY,
    company_id INT,
    stock_id INT,
    transaction_type VARCHAR(10) CHECK (transaction_type IN ('BUY', 'SELL')),
    transaction_date DATE NOT NULL,
    quantity INT NOT NULL,
    price_per_share DECIMAL(10, 2) NOT NULL,
    total_amount DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (company_id) REFERENCES Company(company_id),
    FOREIGN KEY (stock_id) REFERENCES Stock(stock_id)
);

-- Insert 30 Sample Transactions
INSERT INTO Transaction (transaction_id, company_id, stock_id, transaction_type, transaction_date, quantity, price_per_share, total_amount) VALUES
(1, 1, 1, 'BUY', '2023-04-01', 1000, 145.00, 145000.00),
(2, 2, 2, 'SELL', '2023-04-01', 500, 290.00, 145000.00),
(3, 3, 3, 'BUY', '2023-04-01', 300, 600.00, 180000.00),
(4, 4, 4, 'SELL', '2023-04-01', 150, 3500.00, 525000.00),
(5, 5, 5, 'BUY', '2023-04-01', 200, 2750.00, 550000.00),
(6, 6, 6, 'SELL', '2023-04-01', 120, 320.00, 38400.00),
(7, 7, 7, 'BUY', '2023-04-01', 250, 720.00, 180000.00),
(8, 8, 8, 'SELL', '2023-04-01', 10, 455000.00, 4550000.00),
(9, 9, 9, 'BUY', '2023-04-01', 1000, 160.00, 160000.00),
(10, 10, 10, 'SELL', '2023-04-01', 400, 150.00, 60000.00),
(11, 11, 11, 'BUY', '2023-04-01', 300, 215.00, 64500.00),
(12, 12, 12, 'SELL', '2023-04-01', 700, 140.00, 98000.00),
(13, 13, 13, 'BUY', '2023-04-01', 1500, 58.00, 87000.00),
(14, 14, 14, 'SELL', '2023-04-01', 250, 50.00, 12500.00),
(15, 15, 15, 'BUY', '2023-04-01', 200, 175.00, 35000.00),
(16, 16, 16, 'SELL', '2023-04-01', 350, 100.00, 35000.00),
(17, 17, 17, 'BUY', '2023-04-01', 300, 105.00, 31500.00),
(18, 18, 18, 'SELL', '2023-04-01', 500, 155.00, 77500.00),
(19, 19, 19, 'BUY', '2023-04-01', 150, 230.00, 34500.00),
(20, 20, 20, 'SELL', '2023-04-01', 100, 195.00, 19500.00),
(21, 21, 21, 'BUY', '2023-04-01', 400, 155.00, 62000.00),
(22, 22, 22, 'SELL', '2023-04-01', 600, 140.00, 84000.00),
(23, 23, 23, 'BUY', '2023-04-01', 200, 98.00, 19600.00),
(24, 24, 24, 'SELL', '2023-04-01', 150, 325.00, 48750.00),
(25, 25, 25, 'BUY', '2023-04-01', 300, 265.00, 79500.00),
(26, 26, 26, 'SELL', '2023-04-01', 400, 470.00, 188000.00),
(27, 27, 27, 'BUY', '2023-04-01', 250, 370.00, 92500.00),
(28, 28, 28, 'SELL', '2023-04-01', 500, 55.00, 27500.00),
(29, 29, 29, 'BUY', '2023-04-01', 1000, 50.00, 50000.00),
(30, 30, 30, 'SELL', '2023-04-01', 300, 200.00, 60000.00);

-- Create the Trader Table
CREATE TABLE Trader (
    trader_id INT auto_increment PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    account_balance DECIMAL(15, 2) NOT NULL,
    country VARCHAR(50),
    date_of_birth DATE,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

-- Insert 30 Sample Traders
INSERT INTO Trader (trader_id, first_name, last_name, email, phone_number, account_balance, country, date_of_birth, registration_date) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 150000.00, 'USA', '1985-03-15', '2020-01-10'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 250000.00, 'Canada', '1990-07-22', '2019-11-05'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '345-678-9012', 100000.00, 'UK', '1988-12-01', '2021-06-15'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '456-789-0123', 300000.00, 'Australia', '1995-05-18', '2018-04-20'),
(5, 'Daniel', 'Wilson', 'daniel.wilson@example.com', '567-890-1234', 200000.00, 'USA', '1982-09-10', '2022-02-01'),
(6, 'Olivia', 'Taylor', 'olivia.taylor@example.com', '678-901-2345', 180000.00, 'USA', '1993-01-27', '2020-08-13'),
(7, 'James', 'Johnson', 'james.johnson@example.com', '789-012-3456', 350000.00, 'Germany', '1980-04-03', '2017-12-30'),
(8, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '890-123-4567', 120000.00, 'Spain', '1997-11-11', '2021-03-19'),
(9, 'Robert', 'Garcia', 'robert.garcia@example.com', '901-234-5678', 50000.00, 'Mexico', '1992-06-05', '2019-09-14'),
(10, 'Isabella', 'Hernandez', 'isabella.hernandez@example.com', '012-345-6789', 220000.00, 'Argentina', '1996-08-22', '2020-12-01'),
(11, 'William', 'Martinez', 'william.martinez@example.com', '123-555-7890', 80000.00, 'USA', '1989-02-14', '2018-07-03'),
(12, 'Ava', 'Lopez', 'ava.lopez@example.com', '234-666-8901', 170000.00, 'Chile', '1994-04-12', '2022-05-18'),
(13, 'Benjamin', 'Clark', 'benjamin.clark@example.com', '345-777-9012', 90000.00, 'USA', '1984-10-30', '2019-01-25'),
(14, 'Mia', 'Lewis', 'mia.lewis@example.com', '456-888-0123', 110000.00, 'Brazil', '1998-03-03', '2021-07-22'),
(15, 'Elijah', 'Walker', 'elijah.walker@example.com', '567-999-1234', 195000.00, 'USA', '1987-12-17', '2020-11-07'),
(16, 'Charlotte', 'Hall', 'charlotte.hall@example.com', '678-000-2345', 140000.00, 'UK', '1991-09-09', '2021-02-14'),
(17, 'Lucas', 'Allen', 'lucas.allen@example.com', '789-111-3456', 300000.00, 'France', '1983-01-21', '2019-05-30'),
(18, 'Amelia', 'Young', 'amelia.young@example.com', '890-222-4567', 125000.00, 'Italy', '1999-06-18', '2022-09-01'),
(19, 'Henry', 'King', 'henry.king@example.com', '901-333-5678', 270000.00, 'USA', '1986-12-05', '2018-11-12'),
(20, 'Harper', 'Scott', 'harper.scott@example.com', '012-444-6789', 95000.00, 'USA', '1993-05-26', '2021-04-04'),
(21, 'Alexander', 'Green', 'alexander.green@example.com', '123-555-0000', 185000.00, 'USA', '1981-08-17', '2020-03-08'),
(22, 'Evelyn', 'Adams', 'evelyn.adams@example.com', '234-666-1111', 160000.00, 'Canada', '1990-01-12', '2021-10-14'),
(23, 'Sebastian', 'Nelson', 'sebastian.nelson@example.com', '345-777-2222', 310000.00, 'Mexico', '1984-07-25', '2019-06-30'),
(24, 'Abigail', 'Mitchell', 'abigail.mitchell@example.com', '456-888-3333', 145000.00, 'USA', '1995-11-08', '2022-01-20'),
(25, 'Matthew', 'Perez', 'matthew.perez@example.com', '567-999-4444', 230000.00, 'Argentina', '1989-03-16', '2020-08-30'),
(26, 'Scarlett', 'Roberts', 'scarlett.roberts@example.com', '678-000-5555', 175000.00, 'UK', '1997-10-23', '2021-12-09'),
(27, 'Jack', 'Turner', 'jack.turner@example.com', '789-111-6666', 125000.00, 'Germany', '1982-04-01', '2019-07-15'),
(28, 'Lily', 'Phillips', 'lily.phillips@example.com', '890-222-7777', 155000.00, 'Spain', '1994-02-11', '2022-04-27'),
(29, 'David', 'Campbell', 'david.campbell@example.com', '901-333-8888', 310000.00, 'USA', '1980-12-22', '2020-05-14'),
(30, 'Zoe', 'Parker', 'zoe.parker@example.com', '012-444-9999', 85000.00, 'Australia', '1996-09-03', '2021-01-18');


-- Procedures
-- Insert a New Company
DELIMITER //
CREATE PROCEDURE insert_company(c_name VARCHAR(255),t_symbol VARCHAR(10),s VARCHAR(100),i VARCHAR(100),m_cap BIGINT,s_price DECIMAL(10,2),p_ratio DECIMAL(5,2),d_yield DECIMAL(5,2),d_o_establishment YEAR,c VARCHAR(100))
BEGIN
INSERT INTO company(company_name,ticker_symbol,sector,industry,market_cap,stock_price,pe_ratio,dividend_yield,date_of_establishment,country)
VALUES(c_name,t_symbol,s,i,m_cap,s_price,p_ratio,d_yield,d_o_establishment,c);
END //
DELIMITER ;
call insert_company("BlackRock Inc.","BLRK","Financial Services","Asset Management",11752365441982,887.65,22.64,5.21,1988,"USA");

-- Get Top 5 Company by Market cap
DELIMITER //
CREATE PROCEDURE GetTop5CompaniesByMarketCap()
BEGIN
    SELECT company_name, market_cap
    FROM Company
    ORDER BY market_cap DESC
    LIMIT 5;
END //
DELIMITER ;
call GetTop5CompaniesByMarketCap();

-- Get Richest Trader
DELIMITER //
CREATE PROCEDURE GetRichestTrader()
BEGIN
    SELECT first_name, last_name, account_balance
    FROM Trader
    ORDER BY account_balance DESC
    LIMIT 1;
END //
DELIMITER ;
call GetRichestTrader();

-- Get Average Stock Price By Sector
DELIMITER //
CREATE PROCEDURE GetAverageStockPriceBySector()
BEGIN
    SELECT c.sector, AVG(s.close_price) AS avg_price
    FROM Company c
    JOIN Stock s ON c.company_id = s.company_id
    GROUP BY c.sector;
END //
DELIMITER ;
call GetAverageStockPriceBySector();

-- Get Total Transaction Volume
DELIMITER //
CREATE PROCEDURE GetTotalTransactionVolume(IN comp_id INT)
BEGIN
    SELECT SUM(quantity) AS total_volume
    FROM Transaction
    WHERE company_id = comp_id;
END //
DELIMITER ;
call GetTotalTransactionVolume(5);

-- Get Most Volatile Stock
DELIMITER //
CREATE PROCEDURE GetMostVolatileStock()
BEGIN
    SELECT s.stock_id, c.company_name, 
           MAX(s.high_price) - MIN(s.low_price) AS price_fluctuation
    FROM Stock s
    JOIN Company c ON s.company_id = c.company_id
    GROUP BY s.stock_id
    ORDER BY price_fluctuation DESC
    LIMIT 1;
END //
DELIMITER ;
call GetMostVolatileStock();

-- Get Best Performing Stock
DELIMITER //
CREATE PROCEDURE GetBestPerformingStock()
BEGIN
    SELECT c.company_name, s.stock_id, 
           ((s.close_price - s.open_price) / s.open_price) * 100 AS percent_gain
    FROM Stock s
    JOIN Company c ON s.company_id = c.company_id
    ORDER BY percent_gain DESC
    LIMIT 1;
END //
DELIMITER ;
call GetBestPerformingStock();

-- Get Company with Highest Dividend Yield
DELIMITER //
CREATE PROCEDURE GetCompanyWithHighestDividendYield()
BEGIN
    SELECT company_name, dividend_yield
    FROM Company
    ORDER BY dividend_yield DESC
    LIMIT 1;
END //
DELIMITER ;
call GetCompanyWithHighestDividendYield();

-- Get Transaction Summary Per Trader
DELIMITER //
CREATE PROCEDURE GetTransactionSummaryPerTrader()
BEGIN
    SELECT tr.trader_id, tr.first_name, tr.last_name, 
           COUNT(t.transaction_id) AS total_transactions,
           SUM(t.total_amount) AS total_spent
    FROM Trader tr
    JOIN Transaction t ON tr.trader_id = t.trader_id
    GROUP BY tr.trader_id
    ORDER BY total_spent DESC;
END //
DELIMITER ;
call GetTransactionSummaryPerTrader();


DELIMITER //
CREATE PROCEDURE UpdateStockPrice(IN companyId INT, IN newPrice DECIMAL(10,2))
BEGIN
    UPDATE Company SET stock_price = newPrice WHERE company_id = companyId;
END //
DELIMITER ;
call UpdateStockPrice(22,780.90);


-- Views
-- View: Company Market Summary
CREATE VIEW CompanyMarketSummary AS
SELECT company_name, ticker_symbol, market_cap, stock_price, dividend_yield
FROM Company;
select * from CompanyMarketSummary;

-- View: High-Performing Stocks (Price > 200)
CREATE VIEW HighPerformingStocks AS
SELECT s.stock_id, c.company_name, s.trade_date, s.close_price
FROM Stock s
JOIN Company c ON s.company_id = c.company_id
WHERE s.close_price > 200;
select * from HighPerformingStocks;

-- View: Trader Portfolio Summary
CREATE VIEW TraderPortfolioSummary AS
SELECT t.trader_id, t.first_name, t.last_name, t.account_balance, COUNT(tr.transaction_id) AS total_transactions
FROM Trader t
JOIN Transaction tr ON t.trader_id = tr.trader_id
GROUP BY t.trader_id;
select * from TraderPortfolioSummary;

-- View: Latest Stock Prices
CREATE VIEW LatestStockPrices AS
SELECT s.company_id, c.company_name, s.close_price, s.trade_date
FROM Stock s
JOIN Company c ON s.company_id = c.company_id
WHERE s.trade_date = (SELECT MAX(trade_date) FROM Stock WHERE company_id = s.company_id);
select * from LatestStockPrices;

-- View: Trader Transaction History
CREATE VIEW TraderTransactionHistory AS
SELECT t.trader_id, t.first_name, t.last_name, tr.transaction_type, tr.transaction_date, tr.total_amount
FROM Trader t
JOIN Transaction tr ON t.trader_id = tr.trader_id;
select * from TraderTransactionHistory;


-- View: Stock Performance by Sector
CREATE VIEW StockPerformanceBySector AS
SELECT 
    c.sector,
    AVG(s.close_price) AS average_stock_price,
    COUNT(s.stock_id) AS total_stocks
FROM 
    Company c
JOIN 
    Stock s ON c.company_id = s.company_id
GROUP BY 
    c.sector
ORDER BY 
    average_stock_price DESC;
select * from StockPerformanceBySector;