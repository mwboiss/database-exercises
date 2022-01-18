#Extra MySQL Exercises

USE sakila;

#Problem 1
#A
SELECT * FROM actor;
#B
DESCRIBE actor;

SELECT last_name FROM actor;

#C
DESCRIBE film;

SELECT film_id, title, release_year FROM film;

#2
#A
SELECT DISTINCT last_name FROM actor;

#B
DESCRIBE address;

SELECT DISTINCT postal_code FROM address;

#C
DESCRIBE film;
SELECT DISTINCT rating FROM film;

#3
#A
DESCRIBE film;
SELECT * FROM film LIMIT 300;

SELECT title, description, rating, length
FROM film
WHERE length >= 180;

#B
DESCRIBE payment;
SELECT payment_date FROM payment LIMIT 3;

SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date >= '2005-05-27%'
ORDER BY payment_date;
#C
DESCRIBE payment;

SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date BETWEEN '2005-05-27 00:00:00' AND '2005-05-27 23:59:59';

#OR

SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date LIKE '2005-05-27%';

#D
SELECT * FROM customer
WHERE last_name LIKE 'S%' AND first_name LIKE '%n';

#E
DESCRIBE customer;
SELECT * FROM customer LIMIT 10;

SELECT * FROM customer
WHERE active = 0 OR last_name LIKE 'm%';

#F
DESCRIBE category;

SELECT * FROM category
WHERE category_id > 4 
AND name LIKE 'c%' 
OR name LIKE 's%' 
OR name LIKE 't%';

#G
DESCRIBE staff;
SELECT * FROM staff;

SELECT staff_id, first_name, last_name, 
address_id, picture, email, store_id, 
active, username, last_update
FROM staff
WHERE password NOT LIKE 'NULL';

#H
SELECT staff_id, first_name, last_name, 
address_id, picture, email, store_id, 
active, username, last_update
FROM staff
WHERE password IS NULL;

#4
#A
DESCRIBE address;
SELECT * FROM address LIMIT 50;

SELECT phone, district
FROM address
WHERE district IN('California', 'England', 'Taipei', 'West Java');

#B
DESCRIBE payment;
SELECT * FROM payment LIMIT 50;

SELECT payment_id, amount, payment_date
FROM payment
WHERE DATE(payment_date) IN('2005-05-25', '2005-05-27', '2005-05-29');

#C
SELECT * FROM film LIMIT 50;

SELECT * FROM film
WHERE rating IN('G','PG-13','NC-17');

#5
#A
SELECT * FROM payment
WHERE payment_date BETWEEN '2005-05-25 00:00:00' AND '2005-05-25 23:59:59'
ORDER BY payment_date;

#B
SELECT film_id, title, description
FROM film
WHERE length BETWEEN 100 AND 120;

#6
#A
DESCRIBE film;
SELECT * FROM film LIMIT 10;

SELECT * FROM film
WHERE description LIKE 'A Thoughtful%';

# Not sure what was meant by following columns so I selected them all.

#B
SELECT * FROM film
WHERE description LIKE '%Boat';

#C
SELECT * FROM film
WHERE description LIKE '%Database%' AND length > 180;

#7
#A
SELECT * FROM payment LIMIT 20;

#B
DESCRIBE payment;
SELECT * FROM payment
ORDER BY payment_id desc;

SELECT payment_id, payment_date, amount 
FROM payment
WHERE amount > 5 
ORDER BY payment_id
LIMIT 1000, 1000;

#C

SELECT *
FROM customer
LIMIT 100, 100;