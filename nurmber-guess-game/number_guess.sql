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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guess integer NOT NULL,
    play_dated date DEFAULT now(),
    user_id integer NOT NULL,
    number_attempt integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: plays_play_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.plays_play_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plays_play_id_seq OWNER TO freecodecamp;

--
-- Name: plays_play_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.plays_play_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.plays_play_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (17, 755, '2026-02-04', 7, 8);
INSERT INTO public.games VALUES (18, 577, '2026-02-04', 8, 577);
INSERT INTO public.games VALUES (19, 926, '2026-02-04', 8, 926);
INSERT INTO public.games VALUES (20, 9, '2026-02-04', 9, 9);
INSERT INTO public.games VALUES (21, 301, '2026-02-04', 9, 301);
INSERT INTO public.games VALUES (22, 128, '2026-02-04', 8, 130);
INSERT INTO public.games VALUES (23, 74, '2026-02-04', 8, 74);
INSERT INTO public.games VALUES (24, 79, '2026-02-04', 10, 79);
INSERT INTO public.games VALUES (25, 366, '2026-02-04', 10, 366);
INSERT INTO public.games VALUES (26, 465, '2026-02-04', 11, 465);
INSERT INTO public.games VALUES (27, 406, '2026-02-04', 11, 406);
INSERT INTO public.games VALUES (28, 309, '2026-02-04', 10, 311);
INSERT INTO public.games VALUES (29, 1, '2026-02-04', 10, 1);
INSERT INTO public.games VALUES (30, 372, '2026-02-04', 12, 372);
INSERT INTO public.games VALUES (31, 770, '2026-02-04', 12, 770);
INSERT INTO public.games VALUES (32, 350, '2026-02-04', 13, 350);
INSERT INTO public.games VALUES (33, 392, '2026-02-04', 13, 392);
INSERT INTO public.games VALUES (34, 74, '2026-02-04', 12, 76);
INSERT INTO public.games VALUES (35, 309, '2026-02-04', 12, 309);
INSERT INTO public.games VALUES (36, 2, '2026-02-04', 7, 3);
INSERT INTO public.games VALUES (37, 6, '2026-02-04', 7, 2);
INSERT INTO public.games VALUES (38, 6, '2026-02-04', 14, 7);
INSERT INTO public.games VALUES (39, 8, '2026-02-04', 14, 9);
INSERT INTO public.games VALUES (40, 8, '2026-02-04', 15, 9);
INSERT INTO public.games VALUES (41, 5, '2026-02-04', 15, 6);
INSERT INTO public.games VALUES (42, 4, '2026-02-04', 14, 7);
INSERT INTO public.games VALUES (43, 10, '2026-02-04', 14, 12);
INSERT INTO public.games VALUES (44, 7, '2026-02-04', 14, 8);
INSERT INTO public.games VALUES (45, 799, '2026-02-04', 16, 800);
INSERT INTO public.games VALUES (46, 790, '2026-02-04', 16, 791);
INSERT INTO public.games VALUES (47, 332, '2026-02-04', 17, 333);
INSERT INTO public.games VALUES (48, 95, '2026-02-04', 17, 96);
INSERT INTO public.games VALUES (49, 903, '2026-02-04', 16, 906);
INSERT INTO public.games VALUES (50, 26, '2026-02-04', 16, 28);
INSERT INTO public.games VALUES (51, 167, '2026-02-04', 16, 168);
INSERT INTO public.games VALUES (52, 655, '2026-02-04', 18, 656);
INSERT INTO public.games VALUES (53, 732, '2026-02-04', 18, 733);
INSERT INTO public.games VALUES (54, 308, '2026-02-04', 19, 309);
INSERT INTO public.games VALUES (55, 687, '2026-02-04', 19, 688);
INSERT INTO public.games VALUES (56, 133, '2026-02-04', 18, 136);
INSERT INTO public.games VALUES (57, 322, '2026-02-04', 18, 324);
INSERT INTO public.games VALUES (58, 483, '2026-02-04', 18, 484);
INSERT INTO public.games VALUES (59, 803, '2026-02-04', 20, 804);
INSERT INTO public.games VALUES (60, 8, '2026-02-04', 20, 9);
INSERT INTO public.games VALUES (61, 725, '2026-02-04', 21, 726);
INSERT INTO public.games VALUES (62, 124, '2026-02-04', 21, 125);
INSERT INTO public.games VALUES (63, 319, '2026-02-04', 20, 322);
INSERT INTO public.games VALUES (64, 45, '2026-02-04', 20, 47);
INSERT INTO public.games VALUES (65, 307, '2026-02-04', 20, 308);
INSERT INTO public.games VALUES (66, 698, '2026-02-04', 22, 699);
INSERT INTO public.games VALUES (67, 561, '2026-02-04', 22, 562);
INSERT INTO public.games VALUES (68, 86, '2026-02-04', 23, 87);
INSERT INTO public.games VALUES (69, 369, '2026-02-04', 23, 370);
INSERT INTO public.games VALUES (70, 775, '2026-02-04', 22, 778);
INSERT INTO public.games VALUES (71, 740, '2026-02-04', 22, 742);
INSERT INTO public.games VALUES (72, 585, '2026-02-04', 22, 586);
INSERT INTO public.games VALUES (73, 908, '2026-02-04', 24, 909);
INSERT INTO public.games VALUES (74, 787, '2026-02-04', 24, 788);
INSERT INTO public.games VALUES (75, 319, '2026-02-04', 25, 320);
INSERT INTO public.games VALUES (76, 446, '2026-02-04', 25, 447);
INSERT INTO public.games VALUES (77, 655, '2026-02-04', 24, 658);
INSERT INTO public.games VALUES (78, 566, '2026-02-04', 24, 568);
INSERT INTO public.games VALUES (79, 389, '2026-02-04', 24, 390);
INSERT INTO public.games VALUES (80, 5, '2026-02-04', 7, 2);
INSERT INTO public.games VALUES (81, 2, '2026-02-04', 7, 6);
INSERT INTO public.games VALUES (82, 2, '2026-02-04', 26, 4);
INSERT INTO public.games VALUES (83, 4, '2026-02-04', 26, 6);
INSERT INTO public.games VALUES (84, 5, '2026-02-04', 27, 7);
INSERT INTO public.games VALUES (85, 1, '2026-02-04', 27, 3);
INSERT INTO public.games VALUES (86, 5, '2026-02-04', 26, 9);
INSERT INTO public.games VALUES (87, 2, '2026-02-04', 26, 5);
INSERT INTO public.games VALUES (88, 1, '2026-02-04', 26, 3);
INSERT INTO public.games VALUES (89, 2, '2026-02-04', 28, 4);
INSERT INTO public.games VALUES (90, 1, '2026-02-04', 28, 3);
INSERT INTO public.games VALUES (91, 3, '2026-02-04', 29, 5);
INSERT INTO public.games VALUES (92, 1, '2026-02-04', 29, 3);
INSERT INTO public.games VALUES (93, 1, '2026-02-04', 28, 2);
INSERT INTO public.games VALUES (94, 2, '2026-02-04', 28, 5);
INSERT INTO public.games VALUES (95, 2, '2026-02-04', 28, 4);
INSERT INTO public.games VALUES (96, 723, '2026-02-04', 30, 725);
INSERT INTO public.games VALUES (97, 568, '2026-02-04', 30, 570);
INSERT INTO public.games VALUES (98, 134, '2026-02-04', 31, 136);
INSERT INTO public.games VALUES (99, 923, '2026-02-04', 31, 925);
INSERT INTO public.games VALUES (100, 181, '2026-02-04', 30, 185);
INSERT INTO public.games VALUES (101, 689, '2026-02-04', 30, 692);
INSERT INTO public.games VALUES (102, 691, '2026-02-04', 30, 693);
INSERT INTO public.games VALUES (103, 460, '2026-02-04', 32, 461);
INSERT INTO public.games VALUES (104, 343, '2026-02-04', 32, 344);
INSERT INTO public.games VALUES (105, 201, '2026-02-04', 33, 202);
INSERT INTO public.games VALUES (106, 521, '2026-02-04', 33, 522);
INSERT INTO public.games VALUES (107, 27, '2026-02-04', 32, 30);
INSERT INTO public.games VALUES (108, 975, '2026-02-04', 32, 976);
INSERT INTO public.games VALUES (109, 235, '2026-02-04', 32, 236);
INSERT INTO public.games VALUES (110, 847, '2026-02-04', 34, 848);
INSERT INTO public.games VALUES (111, 132, '2026-02-04', 34, 133);
INSERT INTO public.games VALUES (112, 848, '2026-02-04', 35, 849);
INSERT INTO public.games VALUES (113, 481, '2026-02-04', 35, 482);
INSERT INTO public.games VALUES (114, 49, '2026-02-04', 34, 52);
INSERT INTO public.games VALUES (115, 981, '2026-02-04', 34, 982);
INSERT INTO public.games VALUES (116, 513, '2026-02-04', 34, 514);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (7, 'Dave');
INSERT INTO public.users VALUES (8, 'user_1770220464660');
INSERT INTO public.users VALUES (9, 'user_1770220464659');
INSERT INTO public.users VALUES (10, 'user_1770220865822');
INSERT INTO public.users VALUES (11, 'user_1770220865821');
INSERT INTO public.users VALUES (12, 'user_1770220949882');
INSERT INTO public.users VALUES (13, 'user_1770220949881');
INSERT INTO public.users VALUES (14, 'user_1770221352533');
INSERT INTO public.users VALUES (15, 'user_1770221352532');
INSERT INTO public.users VALUES (16, 'user_1770221378127');
INSERT INTO public.users VALUES (17, 'user_1770221378126');
INSERT INTO public.users VALUES (18, 'user_1770221471842');
INSERT INTO public.users VALUES (19, 'user_1770221471841');
INSERT INTO public.users VALUES (20, 'user_1770221658228');
INSERT INTO public.users VALUES (21, 'user_1770221658227');
INSERT INTO public.users VALUES (22, 'user_1770221730830');
INSERT INTO public.users VALUES (23, 'user_1770221730829');
INSERT INTO public.users VALUES (24, 'user_1770221844857');
INSERT INTO public.users VALUES (25, 'user_1770221844856');
INSERT INTO public.users VALUES (26, 'user_1770222700307');
INSERT INTO public.users VALUES (27, 'user_1770222700306');
INSERT INTO public.users VALUES (28, 'user_1770222709700');
INSERT INTO public.users VALUES (29, 'user_1770222709699');
INSERT INTO public.users VALUES (30, 'user_1770222883837');
INSERT INTO public.users VALUES (31, 'user_1770222883836');
INSERT INTO public.users VALUES (32, 'user_1770223160895');
INSERT INTO public.users VALUES (33, 'user_1770223160894');
INSERT INTO public.users VALUES (34, 'user_1770223253816');
INSERT INTO public.users VALUES (35, 'user_1770223253815');


--
-- Name: plays_play_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.plays_play_id_seq', 116, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Name: games plays_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT plays_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games fk_user; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

