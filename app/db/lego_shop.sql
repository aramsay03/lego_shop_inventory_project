-- DROP TABLE stock;
-- DROP TABLE categories;
-- DROP TABLE suppliers;
DROP TABLE products;

CREATE TABLE products
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  product_code VARCHAR(255) not null,
  description TEXT,
  cost_price INT,
  supplier_id INT references suppliers(id),
  image_url TEXT,
  category_id INT references categories(id)
);

-- CREATE TABLE stock
-- (
--   id SERIAL primary key,
--   product_id INT references products(id),
--   retail_price INT,
--   image_url TEXT,
--   stock_qty INT
-- );

-- CREATE TABLE suppliers
-- (
--   id SERIAL primary key,
--   company_name VARCHAR(255) not null,
--   address VARCHAR(255) not null,
--   telephone VARCHAR(255),
--   email VARCHAR(255),
--   web_address VARCHAR(255),
--   sales_contact VARCHAR(255),
--   notes TEXT
-- );

-- CREATE TABLE categories
-- (
--   id SERIAL primary key,
--   name VARCHAR(255)
-- );
