--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(30) NOT NULL,
    radius_in_ly numeric,
    brightness_0to100 integer,
    classification text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying(30),
    radius_in_km numeric,
    has_atmosphere boolean,
    planet_id integer NOT NULL
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
    planet_id integer NOT NULL,
    planet_name character varying(30),
    distance_from_star_in_km numeric,
    radius_in_km numeric,
    has_water boolean,
    star_id integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    satellite_name character varying(30),
    planet_id integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying(30),
    radius_in_km numeric,
    galaxy_id integer NOT NULL,
    number_of_planets integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 50000, 67, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 60000, 46, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Pegasus_dwarf', 2500, 58, 'dwarf');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 40000, 86, 'globular');
INSERT INTO public.galaxy VALUES (5, 'Aquarius_dwarf', 6000, 39, 'dwarf');
INSERT INTO public.galaxy VALUES (6, 'Leo_dwarf', 4000, 72, 'dwarf');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Moon A', 2400, false, 1);
INSERT INTO public.moon VALUES (4, 'Moon B', 1500, false, 1);
INSERT INTO public.moon VALUES (5, 'Moon C', 2000, true, 2);
INSERT INTO public.moon VALUES (6, 'Moon D', 1800, false, 2);
INSERT INTO public.moon VALUES (7, 'Moon E', 3400, true, 3);
INSERT INTO public.moon VALUES (8, 'Moon F', 2000, false, 3);
INSERT INTO public.moon VALUES (9, 'Moon G', 3400, false, 4);
INSERT INTO public.moon VALUES (10, 'Moon H', 6000, true, 4);
INSERT INTO public.moon VALUES (11, 'Moon I', 2000, true, 5);
INSERT INTO public.moon VALUES (12, 'Moon J', 1400, false, 5);
INSERT INTO public.moon VALUES (13, 'Moon K', 3000, true, 6);
INSERT INTO public.moon VALUES (14, 'Moon L', 1100, true, 6);
INSERT INTO public.moon VALUES (15, 'Moon M', 3000, false, 7);
INSERT INTO public.moon VALUES (16, 'Moon N', 3200, false, 7);
INSERT INTO public.moon VALUES (17, 'Moon O', 2400, false, 8);
INSERT INTO public.moon VALUES (18, 'Moon P', 1500, false, 8);
INSERT INTO public.moon VALUES (19, 'Moon Q', 2000, true, 9);
INSERT INTO public.moon VALUES (20, 'Moon R', 1800, false, 9);
INSERT INTO public.moon VALUES (21, 'Moon S', 3400, true, 10);
INSERT INTO public.moon VALUES (22, 'Moon T', 2000, false, 10);
INSERT INTO public.moon VALUES (23, 'Moon U', 3400, false, 11);
INSERT INTO public.moon VALUES (24, 'Moon V', 6000, true, 11);
INSERT INTO public.moon VALUES (25, 'Moon W', 2000, true, 12);
INSERT INTO public.moon VALUES (26, 'Moon X', 1400, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5000000, 8000, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 7000000, 4500, true, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 45000000, 60000, false, 3);
INSERT INTO public.planet VALUES (4, 'Saturn', 80000000, 78000, false, 4);
INSERT INTO public.planet VALUES (5, 'Neptune', 9000000, 49000, false, 5);
INSERT INTO public.planet VALUES (6, 'Uranus', 11000000, 36000, false, 6);
INSERT INTO public.planet VALUES (7, 'Pluto', 31000000, 4000, false, 7);
INSERT INTO public.planet VALUES (8, 'Mercury', 4200000, 5600, false, 8);
INSERT INTO public.planet VALUES (9, 'Venus', 2800000, 4800, false, 9);
INSERT INTO public.planet VALUES (10, 'Centauri', 45000000, 40000, false, 10);
INSERT INTO public.planet VALUES (11, 'Proxima B alpha', 76000000, 12000, true, 11);
INSERT INTO public.planet VALUES (12, 'Proxima B beta', 89000000, 65000, false, 12);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 's1', 1);
INSERT INTO public.satellite VALUES (2, 's2', 1);
INSERT INTO public.satellite VALUES (3, 's3', 1);
INSERT INTO public.satellite VALUES (4, 's4', 2);
INSERT INTO public.satellite VALUES (5, 's5', 2);
INSERT INTO public.satellite VALUES (6, 's6', 2);
INSERT INTO public.satellite VALUES (7, 's7', 3);
INSERT INTO public.satellite VALUES (8, 's8', 3);
INSERT INTO public.satellite VALUES (9, 's9', 3);
INSERT INTO public.satellite VALUES (10, 's10', 4);
INSERT INTO public.satellite VALUES (11, 's11', 4);
INSERT INTO public.satellite VALUES (12, 's12', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Leo', 5000, 1, 1);
INSERT INTO public.star VALUES (2, 'Aquarius', 70000, 1, 1);
INSERT INTO public.star VALUES (3, 'HD 13931', 45000, 2, 1);
INSERT INTO public.star VALUES (4, 'HD 5583', 14000, 2, 1);
INSERT INTO public.star VALUES (5, 'Alpha Trianguli', 75000, 4, 1);
INSERT INTO public.star VALUES (6, 'Beta Trianguli', 65000, 4, 1);
INSERT INTO public.star VALUES (7, 'Markab', 30000, 3, 1);
INSERT INTO public.star VALUES (8, 'Matar', 42000, 3, 1);
INSERT INTO public.star VALUES (9, 'GI 876', 28000, 5, 1);
INSERT INTO public.star VALUES (10, 'GI 849', 46000, 5, 1);
INSERT INTO public.star VALUES (11, 'Regulus', 80000, 6, 1);
INSERT INTO public.star VALUES (12, 'Denebola', 42000, 6, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_brightness_0to100_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_brightness_0to100_key UNIQUE (brightness_0to100);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (moon_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (planet_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (star_name);


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

