DROP TABLE stock;
DROP TABLE products;
DROP TABLE categories;
DROP TABLE suppliers;


CREATE TABLE suppliers
(
  id SERIAL primary key,
  company_name VARCHAR(255) not null,
  address VARCHAR(255) not null,
  telephone VARCHAR(255),
  email VARCHAR(255),
  web_address VARCHAR(255),
  sales_contact VARCHAR(255),
  notes TEXT
);

CREATE TABLE categories
(
  id SERIAL primary key,
  name VARCHAR(255)
);

CREATE TABLE products
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  product_code VARCHAR(255) not null,
  description TEXT,
  cost_price INT,
  supplier_id INT references suppliers(id) ON DELETE CASCADE,
  category_id INT references categories(id) ON DELETE CASCADE
  -- image_url TEXT  (NO LONGER NEEDED.)
);

CREATE TABLE stock
(
  id SERIAL primary key,
  product_id INT references products(id) ON DELETE CASCADE,
  retail_price INT,
  stock_qty INT
);
