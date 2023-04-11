-- 1. List all customers who live in Texas

select first_name, last_name
from customer 
full join address
on customer.address_id = address.address_id 
where district = 'Texas';

-- 2. Get all payments above $6.99 with the customer's full name

select first_name, last_name
from customer
full join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175
select first_name,last_name
from customer 
where customer_id in(
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175
);

-- 4. List all customers that live in Nepal
select first_name,last_name
from customer
inner join address 
on customer.address_id = address.address_id 
inner join city 
on address.city_id = city.city_id 
full join country 
on country.country_id = city.country_id 
where country = 'Nepal';

-- 5. Which staff member had the most transactions?
select first_name,last_name, count(payment.staff_id)
from staff 
inner join payment 
on staff.staff_id = payment.staff_id 
group by first_name,last_name 
having count(payment.staff_id)> 7300
order by count(payment.staff_id) desc;

-- 6. How many movies of each rating are there?
select rating, count(rating)
from film 
group by rating 
order by count(rating) asc;

-- 7. Show all customers who have made a single payment above $6.99
select first_name,last_name, amount
from customer 
inner join payment 
on customer.customer_id = payment.customer_id 
where amount in(
	select amount
	from payment 
	where amount > 6.99
	group by amount
);

-- 8. How many free rentals did our stores give away?
select count(payment_id)
from payment 
where amount < 0.01;