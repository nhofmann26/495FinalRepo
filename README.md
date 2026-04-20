# 495FinalRepo

## Overview
UPshop is a simple e-commerce style web application built using MySQL and PHP. The site allows users to browse products, view details, add items to a cart, place orders, and view reports based on stored data.

## Tech Stack
- Frontend: HTML, CSS, JavaScript  
- Backend: PHP  
- Database: MySQL  

## Features
- Product catalog with search and category filter  
- Product detail page  
- Cart (client-side)  
- Mock checkout that saves orders to the database  
- Order confirmation page  

### Reporting
- Top products by revenue  
- Daily sales chart with trend line  
- Low inventory warning  

### Data Tools
- Recompute order totals  
- Refresh sales summary  

## Project Structure
UPshop/
- index.html  
- product.html  
- cart.html  
- confirm.html  
- reports.html  
- css/  
- api/  
- sql/upshop.sql  

## Setup Instructions
1. Create a MySQL database named `upshop`  
2. Import the file `sql/upshop.sql`  
3. Ensure your PHP files are configured with the correct database connection  
4. Open the project in a local or hosted environment  

## API Endpoints
- /api/products.php → get all products (with optional search)  
- /api/product.php?id=ID → get a single product  
- /api/order.php → create a new order  
- /api/get_order.php?id=ID → retrieve order details  
- /api/reports.php → get reporting data  
- /api/tools.php → run maintenance tools  

## Deployment
1. Upload project files to a hosting service  
2. Import `upshop.sql` into the hosted MySQL database  
3. Update database connection settings in the PHP API files  
4. Access the site using the provided URL  

## ER Diagram

## Notes
This project focuses on using a relational database with PHP-based API endpoints to support core e-commerce functionality without authentication or concurrency handling.
