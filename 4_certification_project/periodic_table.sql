/* CREATE DATABASE periodic_table;

\c periodic_table

CREATE TABLE elements(
    atomic_number INT NOT NULL UNIQUE,
    symbol VARCHAR(2) UNIQUE NOT NULL,
    name VARCHAR(45) UNIQUE NOT NULL
);

CREATE TABLE types(
    type_id INT PRIMARY KEY,
    type VARCHAR (10) NOT NULL 
);

CREATE TABLE properties(
    atomic_number INT NOT NULL,
    FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number),
    type_id INT NOT NULL,
    FOREIGN KEY(type_id) REFERENCES types(type_id),
    weight NUMERIC NOT NULL,
    melting_point NUMERIC NOT NULL,
    boiling_point NUMERIC NOT NULL
);

ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

INSERT INTO elements(atomic_number, symbol, name) VALUES(1, 'H', 'Hydrogen'),
(2, 'He', 'Helium'),
(3, 'Li', 'Lithium'),
(4, 'Be', 'Beryllium'),
(5, 'B', 'Boron'),
(6, 'C', 'Carbon'),
(7, 'N', 'Nitrogen'),
(8, 'O', 'Oxygen'),
(9, 'F', 'Fluorine'),
(10, 'Ne', 'Neon');

INSERT INTO types(type_id, type) VALUES(1,'nonmetal'),(2,'metal'),(3,'metalloid');

INSERT INTO properties(atomic_number, type_id, atomic_mass, melting_point_celsius, boiling_point_celsius) VALUES(1, 1, 1.008, -259.1, -252.9),
(2, 1, 4.0026, -272.2, -269),
(3, 2, 6.94, 180.54, 1342),
(4, 2, 9.0122, 1287, 2470),
(5, 3, 10.81, 2075, 4000),
(6, 1, 12.011, 3550, 4027),
(7, 1, 14.007, -210.1, -195.8),
(8, 1, 15.999, -218, -183),
(9, 1, 18.998, -220, -188.1),
(10, 1, 20.18, -248.6, -246.1);
 */

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE periodic_table;
--
-- Name: periodic_table; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE periodic_table WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE periodic_table OWNER TO freecodecamp;

\connect periodic_table

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: elements; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.elements (
    atomic_number integer NOT NULL,
    symbol character varying(2) NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.elements OWNER TO freecodecamp;

--
-- Name: properties; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.properties (
    atomic_number integer NOT NULL,
    type_id integer NOT NULL,
    atomic_mass numeric NOT NULL,
    melting_point_celsius numeric NOT NULL,
    boiling_point_celsius numeric NOT NULL
);


ALTER TABLE public.properties OWNER TO freecodecamp;

--
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    type_id integer NOT NULL,
    type character varying(10) NOT NULL
);


ALTER TABLE public.types OWNER TO freecodecamp;

--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.elements VALUES (1, 'H', 'Hydrogen');
INSERT INTO public.elements VALUES (2, 'He', 'Helium');
INSERT INTO public.elements VALUES (3, 'Li', 'Lithium');
INSERT INTO public.elements VALUES (4, 'Be', 'Beryllium');
INSERT INTO public.elements VALUES (5, 'B', 'Boron');
INSERT INTO public.elements VALUES (6, 'C', 'Carbon');
INSERT INTO public.elements VALUES (7, 'N', 'Nitrogen');
INSERT INTO public.elements VALUES (8, 'O', 'Oxygen');
INSERT INTO public.elements VALUES (9, 'F', 'Fluorine');
INSERT INTO public.elements VALUES (10, 'Ne', 'Neon');


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.properties VALUES (1, 1, 1.008, -259.1, -252.9);
INSERT INTO public.properties VALUES (2, 1, 4.0026, -272.2, -269);
INSERT INTO public.properties VALUES (3, 2, 6.94, 180.54, 1342);
INSERT INTO public.properties VALUES (4, 2, 9.0122, 1287, 2470);
INSERT INTO public.properties VALUES (5, 3, 10.81, 2075, 4000);
INSERT INTO public.properties VALUES (6, 1, 12.011, 3550, 4027);
INSERT INTO public.properties VALUES (7, 1, 14.007, -210.1, -195.8);
INSERT INTO public.properties VALUES (8, 1, 15.999, -218, -183);
INSERT INTO public.properties VALUES (9, 1, 18.998, -220, -188.1);
INSERT INTO public.properties VALUES (10, 1, 20.18, -248.6, -246.1);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types VALUES (1, 'nonmetal');
INSERT INTO public.types VALUES (2, 'metal');
INSERT INTO public.types VALUES (3, 'metalloid');


--
-- Name: elements elements_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_atomic_number_key UNIQUE (atomic_number);


--
-- Name: elements elements_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_name_key UNIQUE (name);


--
-- Name: elements elements_symbol_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_symbol_key UNIQUE (symbol);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: properties properties_atomic_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_fkey FOREIGN KEY (atomic_number) REFERENCES public.elements(atomic_number);


--
-- Name: properties properties_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(type_id);


--
-- PostgreSQL database dump complete
--


