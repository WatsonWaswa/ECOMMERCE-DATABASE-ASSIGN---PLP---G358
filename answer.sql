-- ECOMMERCE DATABASE DESIGN ASSIGNMENT  - GROUP 358


-- Create the ecommerce database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Table: brand
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Table: product_category
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Table: color
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Table: size_category
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Table: size_option
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    size_label VARCHAR(50) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES size_category(id)
);

-- Table: product
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10, 2),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Table: product_image
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Table: product_variation
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_id) REFERENCES size_option(id)
);

-- Table: product_item
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT,
    sku VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    stock_quantity INT,
    FOREIGN KEY (variation_id) REFERENCES product_variation(id)
);

-- Table: attribute_category
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Table: attribute_type
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    data_type ENUM('text', 'number', 'boolean') NOT NULL
);

-- Table: product_attribute
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_type_id INT,
    attribute_category_id INT,
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id)
);
