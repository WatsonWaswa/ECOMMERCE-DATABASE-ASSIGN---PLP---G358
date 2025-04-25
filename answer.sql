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