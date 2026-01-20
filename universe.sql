--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(255) NOT NULL,
    galaxy_types integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean
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
-- Name: hole_black; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.hole_black (
    hole_black_id integer NOT NULL,
    name character varying(255) NOT NULL,
    hole_black_types integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.hole_black OWNER TO freecodecamp;

--
-- Name: hole_black_hole_black_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.hole_black_hole_black_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hole_black_hole_black_id_seq OWNER TO freecodecamp;

--
-- Name: hole_black_hole_black_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.hole_black_hole_black_id_seq OWNED BY public.hole_black.hole_black_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    moon_types integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean,
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
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_types integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean,
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
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_types integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: hole_black hole_black_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hole_black ALTER COLUMN hole_black_id SET DEFAULT nextval('public.hole_black_hole_black_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 0, 13600.00, 'Home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 2537000, 10000.00, 'Nearest large galaxy', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 3000000, 9000.00, 'Small spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 2, 23000000, 8000.00, 'Interacting galaxy', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 3, 29000000, 12000.00, 'Bright nucleus', false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 3, 53000000, 13000.00, 'Supergiant galaxy', false, true);


--
-- Data for Name: hole_black; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.hole_black VALUES (1, 'Sagittarius A*', 1, 26000, 13000.00, 'Milky Way center', false, true);
INSERT INTO public.hole_black VALUES (2, 'M87*', 1, 53000000, 13000.00, 'Supermassive black hole', false, true);
INSERT INTO public.hole_black VALUES (3, 'Cygnus X-1', 2, 6070, 6000.00, 'Stellar black hole', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 384, 4500.00, 'Earth moon', false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 78, 4500.00, 'Mars moon', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 78, 4500.00, 'Mars moon', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1, 628, 4500.00, 'Volcanic moon', false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1, 628, 4500.00, 'Ice moon', false, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1, 628, 4500.00, 'Largest moon', false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1, 628, 4500.00, 'Cratered moon', false, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1, 1275, 4500.00, 'Thick atmosphere', false, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1, 1275, 4500.00, 'Saturn moon', false, true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1, 1275, 4500.00, 'Two-tone moon', false, true, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 1, 1275, 4500.00, 'Icy moon', false, true, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 1, 1275, 4500.00, 'Bright moon', false, true, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 1, 1275, 4500.00, 'Water geysers', false, true, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 1, 1275, 4500.00, 'Death Star look', false, true, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 1, 2720, 4500.00, 'Broken terrain', false, true, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 1, 2720, 4500.00, 'Bright moon', false, true, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1, 2720, 4500.00, 'Dark moon', false, true, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 1, 2720, 4500.00, 'Largest Uranus moon', false, true, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 1, 2720, 4500.00, 'Outer moon', false, true, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 1, 4350, 4500.00, 'Retrograde orbit', false, true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 77, 4500.00, 'Rocky planet', false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 38, 4500.00, 'Hot atmosphere', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 0, 4500.00, 'Habitable planet', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 78, 4500.00, 'Red planet', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 628, 4500.00, 'Gas giant', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 1275, 4500.00, 'Ringed planet', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 3, 2720, 4500.00, 'Ice giant', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 3, 4350, 4500.00, 'Cold planet', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 1, 4, 5000.00, 'Exoplanet', false, true, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 4, 600, 4000.00, 'Super Earth', false, true, 3);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 2, 159, 3000.00, 'Hot Jupiter', false, true, 3);
INSERT INTO public.planet VALUES (12, 'Rigel I', 2, 900, 2000.00, 'Gas planet', false, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, 4600.00, 'Main sequence star', false, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 4, 4800.00, 'Red dwarf', false, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9, 242.00, 'Brightest star', false, true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 642, 8000.00, 'Red supergiant', false, true, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 3, 860, 8000.00, 'Blue supergiant', false, true, 1);
INSERT INTO public.star VALUES (6, 'Alpha Andromedae', 1, 970000, 600.00, 'Binary star', false, true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: hole_black_hole_black_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.hole_black_hole_black_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: hole_black hole_black_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hole_black
    ADD CONSTRAINT hole_black_name_key UNIQUE (name);


--
-- Name: hole_black hole_black_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hole_black
    ADD CONSTRAINT hole_black_pkey PRIMARY KEY (hole_black_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

