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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    name character varying(60) NOT NULL,
    comet_id integer NOT NULL,
    "orbital_period (yrs)" numeric,
    discovery_year integer,
    discovered_by text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30),
    estimated_number_of_stars bigint,
    diameter_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(60) NOT NULL,
    moon_id integer NOT NULL,
    tidally_locked boolean,
    orbit_earth_days numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    "surface_temperature_approx (K)" numeric,
    "orbit (AU)" numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    solo_star_system boolean,
    "surface_temperature (K)" integer,
    color_class text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('Halley', 1, 74.7, 1758, 'Edmond Halley');
INSERT INTO public.comet VALUES ('NEOWISE', 2, 4500, 2020, 'NEOWISE');
INSERT INTO public.comet VALUES ('Encke', 3, 3.30, 1786, 'Johann Franz Encke');
INSERT INTO public.comet VALUES ('Lovejoy', 4, 622, 2011, 'Terry Lovejoy');
INSERT INTO public.comet VALUES ('63P/Wild', 5, 13.21, 1960, 'Paul Wild');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Spiral', 100000000000, 87400);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 2, 'Irregular', 20000000000, 32200);
INSERT INTO public.galaxy VALUES ('Andromeda', 3, 'Spiral', 1000000000000, 152000);
INSERT INTO public.galaxy VALUES ('Pinwheel Galaxy', 4, 'Spiral', 1000000000000, 152000);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 5, 'Spiral', 100000000000, 94900);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 6, 'Spiral', 100000000000, 76900);
INSERT INTO public.galaxy VALUES ('Virgo A', 7, 'Elliptical', 1000000000000, 132000);
INSERT INTO public.galaxy VALUES ('Spindle Galaxy', 8, 'Lenticular', 100000000000, 76000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, true, 27, 3);
INSERT INTO public.moon VALUES ('Phobos', 2, true, 0.32, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, true, 1.26, 4);
INSERT INTO public.moon VALUES ('Io', 4, true, 1.77, 5);
INSERT INTO public.moon VALUES ('Europa', 5, true, 3.55, 5);
INSERT INTO public.moon VALUES ('Ganymede', 6, true, 7.15, 5);
INSERT INTO public.moon VALUES ('Callisto', 7, true, 16.69, 5);
INSERT INTO public.moon VALUES ('Titan', 8, true, 15.94, 6);
INSERT INTO public.moon VALUES ('Enceladus', 9, true, 1.37, 6);
INSERT INTO public.moon VALUES ('Mimas', 10, true, 0.94, 6);
INSERT INTO public.moon VALUES ('Iapetus', 11, true, 79.32, 6);
INSERT INTO public.moon VALUES ('Rhea', 12, true, 4.52, 6);
INSERT INTO public.moon VALUES ('Dione', 13, true, 2.74, 6);
INSERT INTO public.moon VALUES ('Tethys', 14, true, 1.89, 6);
INSERT INTO public.moon VALUES ('Hyperion', 15, false, 21.28, 6);
INSERT INTO public.moon VALUES ('Phoebe', 16, false, 550.48, 6);
INSERT INTO public.moon VALUES ('Titania', 17, true, 8.71, 7);
INSERT INTO public.moon VALUES ('Umbriel', 18, true, 4.14, 7);
INSERT INTO public.moon VALUES ('Triton', 19, true, 5.88, 8);
INSERT INTO public.moon VALUES ('Proteus', 20, true, 1.12, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 340, 0.39, 1);
INSERT INTO public.planet VALUES ('Venus', 2, 737, 0.72, 1);
INSERT INTO public.planet VALUES ('Earth', 3, 288, 1, 1);
INSERT INTO public.planet VALUES ('Mars', 4, 210, 1.52, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, 125, 5.20, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, 95, 9.58, 1);
INSERT INTO public.planet VALUES ('Uranus', 7, 59, 19.18, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, 59, 30.07, 1);
INSERT INTO public.planet VALUES ('TRAPPIST-1b', 9, 650, 0.011, 9);
INSERT INTO public.planet VALUES ('TRAPPIST-1c', 10, 550, 0.015, 9);
INSERT INTO public.planet VALUES ('TRAPPIST-1d', 11, 450, 0.022, 9);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 12, 350, 0.028, 9);
INSERT INTO public.planet VALUES ('TRAPPIST-1f', 13, 325, 0.037, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, true, 5772, 'G', 1);
INSERT INTO public.star VALUES ('S Doradus', 2, false, 8500, 'O', 2);
INSERT INTO public.star VALUES ('Alpha Centauri A', 3, false, 5790, 'G', 1);
INSERT INTO public.star VALUES ('Sirius A', 4, false, 9940, 'A', 1);
INSERT INTO public.star VALUES ('Vega', 5, true, 9602, 'A', 1);
INSERT INTO public.star VALUES ('Spica A', 6, false, 22400, 'B', 1);
INSERT INTO public.star VALUES ('Alpheratz A', 7, false, 11950, 'B', 1);
INSERT INTO public.star VALUES ('SN 1987A', 8, false, 25000, 'B', 2);
INSERT INTO public.star VALUES ('TRAPPIST-1', 9, true, 2566, 'M', 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: comet comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

