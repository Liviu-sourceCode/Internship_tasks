
# Pull the latest MySQL Docker image from Docker Hub
docker pull mysql

# Run a MySQL container with the specified name and environment variables
docker run --name mysql_container -e MYSQL_ROOT_PASSWORD=####### -d mysql:latest

# Create a database named "company"
CREATE DATABASE company;

# Show all databases
SHOW DATABASES;

# Switch to the "company" database
USE company;

# Copy the company.sql file from the local machine to the MySQL container
docker cp "path\to\company.sql" mysql_container:/var/lib/mysql-files/company.sql;

# Start an interactive MySQL session in the MySQL container as root
docker exec -it mysql_container mysql -u root -p;

# Execute the SQL commands in the company.sql file to populate the "company" database
SOURCE /var/lib/mysql-files/company.sql;

# Select all records from the "employees" table
SELECT * FROM employees;

# Create a new MySQL user named 'john' with the password 'parola_john'
CREATE USER 'john'@'localhost' IDENTIFIED BY 'parola_john';

# Grant all privileges on the "company" database to the user 'john'
GRANT ALL PRIVILEGES ON company.* TO 'john'@'localhost';

# Flush the privileges to apply the changes
FLUSH PRIVILEGES;

# Exit the MySQL session
exit;

# Start an interactive MySQL session in the MySQL container as the user 'john'
docker exec -it mysql_container mysql -u john -p;

# Select all records from the "employees" table as the user 'john'
SELECT * FROM employees;

# Select the department and calculate the average salary for each department
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;