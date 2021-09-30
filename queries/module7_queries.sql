DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_list;
DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS film_actor;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS rental;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS store;


CREATE TABLE actor (
  actor_id integer NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  last_update timestamp without time zone DEFAULT now() NOT NULL
);

select count(first_name), first_name
from actor
group by first_name
order by first_name desc;

CREATE TABLE address (
  address_id integer NOT NULL,
  address character varying(50) NOT NULL,
  address2 character varying(50),
  district character varying(20) NOT NULL,
  city_id smallint NOT NULL,
  postal_code character varying(10),
  phone character varying(20) NOT NULL,
  last_update timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE city (
  city_id integer NOT NULL,
  city character varying(50) NOT NULL,
  country_id smallint NOT NULL,
  last_update timestamp without time zone DEFAULT now() NOT NULL
);
select * from city;
CREATE TABLE country (
    country_id integer NOT NULL,
    country character varying(50) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE customer (
  customer_id integer NOT NULL,
  store_id smallint NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  email character varying(50),
  address_id smallint NOT NULL,
  activebool boolean DEFAULT true NOT NULL,
  create_date date DEFAULT ('now'::text)::date NOT NULL,
  last_update timestamp without time zone DEFAULT now(),
  active integer
);
select * from customer limit 15;

select distinct on (r.rental_date) r.rental_date, c.email, c.customer_id
from rental as r
inner join customer as c on r.customer_id=c.customer_id;




CREATE TABLE customer_list (
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  address character varying(50) NOT NULL,
  zip_code character varying(10),
  phone character varying(20) NOT NULL,
  city character varying(50) NOT NULL,
  country character varying(50) NOT NULL,
  notes character varying(50) NOT NULL,
  sid integer NOT NULL
);

CREATE TABLE film (
  film_id integer NOT NULL,
  title character varying(255) NOT NULL,
  description text,
  release_year integer,
  language_id smallint NOT NULL,
  original_language_id smallint,
  rental_duration smallint DEFAULT 3 NOT NULL,
  rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
  length smallint,
  replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
  rating TEXT,
  last_update timestamp without time zone DEFAULT now() NOT NULL,
  special_features text[],
  fulltext tsvector NOT NULL
);

select * from film;

select avg(rental_rate),rating
from film
group by rating;

select round(avg(rental_duration),2)as avgduration,rating
from film
group by rating
order by avgduration;

select replacement_cost, length
from film
group



select sum(replacement_cost), rating
from film
group by rating;

select min(length) as min, max(length) as max
from film;



CREATE TABLE film_actor (
  actor_id smallint NOT NULL,
  film_id smallint NOT NULL,
  last_update timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE inventory (
  inventory_id integer NOT NULL,
  film_id smallint NOT NULL,
  store_id smallint NOT NULL,
  last_update timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE payment (
  payment_id integer NOT NULL,
  customer_id smallint NOT NULL,
  staff_id smallint NOT NULL,
  rental_id integer NOT NULL,
  amount numeric(5,2) NOT NULL,
  payment_date timestamp without time zone NOT NULL
);
select * from payment;

CREATE TABLE rental (
  rental_id integer NOT NULL,
  rental_date timestamp without time zone NOT NULL,
  inventory_id integer NOT NULL,
  customer_id smallint NOT NULL,
  return_date timestamp without time zone,
  staff_id smallint NOT NULL,
  last_update timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE staff (
  staff_id integer NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  address_id smallint NOT NULL,
  email character varying(50),
  store_id smallint NOT NULL,
  active boolean DEFAULT true NOT NULL,
  username character varying(16) NOT NULL,
  password character varying(40),
  last_update timestamp without time zone DEFAULT now() NOT NULL,
  picture bytea
);

CREATE TABLE store (
    store_id integer NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);

select * from store;
select avg(amount)
from payment;