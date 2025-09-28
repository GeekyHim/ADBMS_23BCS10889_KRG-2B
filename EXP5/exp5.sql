CREATE TABLE customer_data (
    transaction_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    payment_info VARCHAR(50),  -- sensitive
    order_value DECIMAL,
    order_date DATE DEFAULT CURRENT_DATE
);

-- Insert sample data
INSERT INTO customer_data (customer_name, email, phone, payment_info, order_value)
VALUES
('Himanshu Gupta', 'himanshu@example.com', '9876543210', '1234-5678-9012-3456', 1000),
('Jaskirat Singh', 'jaskirat@example.com', '9123456789', '2345-6789-0123-4567', 800),
('Devjot Singh', 'devjot@example.com', '9988776655', '3456-7890-1234-5678', 1200),
('Kashish Mittal', 'kashish@example.com', '9012345678', '4567-8901-2345-6789', 950),
('Dhruv Kumar', 'dhruv@example.com', '9876501234', '5678-9012-3456-7890', 400),
('Hemant Verma', 'hemant@example.com', '9765432109', '6789-0123-4567-8901', 700);

CREATE OR REPLACE VIEW RESTRICTED_SALES_DATA AS
SELECT
CUSTOMER_NAME,
COUNT(*) AS total_orders,
SUM(order_value) as total_sales
from customer_data
group by customer_name;

select * from restricted_sales_data as CLIENT1;

CREATE USER CLIENT1 WITH PASSWORD 'MYREPORT';
GRANT SELECT ON RESTRICTED_SALES_DATA TO CLIENT1;
REVOKE SELECT ON RESTRICTED_SALES_DATA FROM CLIENT1;

