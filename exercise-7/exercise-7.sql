-- customer ranking by total film time watched
-- similar to exercise 6
SELECT 
	customer.email, 
    RANK() OVER(
  		ORDER BY SUM(film.length) DESC) FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
LEFT JOIN inventory ON rental.inventory_id = inventory.inventory_id
LEFT JOIN film ON inventory.film_id = film.film_id
GROUP BY customer.email;
