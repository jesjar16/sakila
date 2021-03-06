# 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
# Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

select city.city_id as city_id, city.city, first_name, last_name, email, address
from customer 
join address on
address.address_id = customer.customer_id
join city on
address.city_id = city.city_id
where
city.city_id = 312;

# 2. ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe devolver el título 
# de la película, la descripción, el año de estreno, la calificación, las características especiales 
# y el género (categoría).

select film.film_id, title, description, release_year, rating, special_features, name as genre
from film
join film_category on
film_category. film_id = film.film_id
join category on
category.category_id = film_category.category_id
where
category.category_id = 5;

# 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
# Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, 
# la descripción y el año de lanzamiento.

select actor.actor_id, concat(first_name," ",last_name) as actor_name, film.film_id, title, description,
release_year
from actor
join film_actor on
film_actor.actor_id = actor.actor_id
join film on
film.film_id = film_actor.film_id
where
actor.actor_id = 5;

# 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de 
# estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el nombre, apellido, correo electrónico
# y dirección del cliente.

select store_id, first_name, last_name, email, address
from customer
join address on
address.address_id = customer.address_id
join city on
city.city_id = address.city_id
where 
city.city_id in (1, 42, 312, 459) and
customer.store_id = 1;

# 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y 
# "característica especial = detrás de escena", unidas por actor_id = 15? Su consulta debe devolver 
# el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. 
# Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

select title, description, release_year, rating, special_features 
from film
join film_actor on
film_actor.film_id = film.film_id
where
rating = 'G' and
special_features like '%behind the scenes%' and
film_actor.actor_id = 15;

# 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
# Su consulta debe devolver film_id, title, actor_id y actor_name.

select film.film_id, title, actor.actor_id, concat(first_name," ",last_name) as actor_name
from film
join film_actor on
film_actor.film_id = film.film_id
join actor on
actor.actor_id = film_actor.actor_id
where
film.film_id = 369;

# 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
# Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
# las características especiales y el género (categoría).

select film.film_id, title, description, release_year, rating, special_features, category.name as genre,
amount as rental_rate
from film
join film_category on
film_category.film_id = film.film_id 
join category on
category.category_id = film_category.category_id
join inventory on
inventory.film_id = film.film_id
join rental on
rental.inventory_id = inventory.inventory_id
join payment on
payment.rental_id = rental.rental_id
where
category.category_id = 7 and
amount = 2.99
group by film_id
order by title;

#8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
# Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
# las características especiales, el género (categoría) y el nombre y apellido del actor.

select actor.actor_id, concat(first_name," ",last_name) as actor_name, film.film_id, title, description,
release_year, rating, special_features, category.name as genre
from actor
join film_actor on
film_actor.actor_id = actor.actor_id
join film on
film.film_id = film_actor.film_id
join film_category on
film_category.film_id = film.film_id
join category on
category.category_id = film_category.category_id
where
actor.actor_id = 23;
