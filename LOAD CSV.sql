COPY categories (category_id, category_name, description)
FROM 'C:\Users\gonti\Desktop\Projeto final - Curso Eng Dados\csv\categories.csv'
DELIMITER ';'
CSV HEADER;

COPY order_details (order_id, product_id, unit_price, quantity, discount)
FROM 'C:\Users\gonti\Desktop\Projeto final - Curso Eng Dados\csv\orderdetails.csv'
DELIMITER ';'
CSV HEADER;

COPY customers (customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone)
FROM 'C:\Users\gonti\Desktop\Projeto final - Curso Eng Dados\csv\customers.csv'
DELIMITER ';'
CSV HEADER;

COPY products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
FROM 'C:\Users\gonti\Desktop\Projeto final - Curso Eng Dados\csv\products.csv'
DELIMITER ';'
CSV HEADER;

COPY suppliers (supplier_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax, homepage)
FROM 'C:\Users\gonti\Desktop\Projeto final - Curso Eng Dados\csv\suppliers.csv'
DELIMITER ';'
CSV HEADER;

COPY orders (order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country)
FROM 'C:\Users\gonti\Desktop\Projeto final - Curso Eng Dados\csv\orders_cleaned.csv'
DELIMITER ';'
CSV HEADER;


COPY employees (employee_id, last_name, first_name, title, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, home_phone, extension, notes, reports_to, photo_path, salary)
FROM 'C:\Users\gonti\Desktop\Projeto final - Curso Eng Dados\csv\employees.csv'
DELIMITER ';'
CSV HEADER;

COPY shippers (shipper_id, company_name, phone)
FROM 'C:\Users\gonti\Desktop\Projeto final - Curso Eng Dados\csv\shippers.csv'
DELIMITER ';'
CSV HEADER;






