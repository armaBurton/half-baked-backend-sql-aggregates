-- rank of film category by times rented
-- include the name, count, and rank
SELECT 
	category.name,
    COUNT(rental.rental_id),
    RANK() OVER(
      ORDER BY COUNT(rental.rental_id) DESC, SUM(rental.rental_id) DESC) FROM category
LEFT JOIN film_category ON category.category_id = film_category.category_id
LEFT JOIN film ON film.film_id = film_category.film_id
LEFT JOIN inventory ON inventory.film_id = film.film_id
LEFT JOIN rental ON rental.inventory_id = inventory.inventory_id
GROUP BY category.name
