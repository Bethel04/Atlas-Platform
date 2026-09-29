--
-- PostgreSQL database dump
--

\restrict IOWKdq4aXBSnJYMwca9Uig7RgHNXIcg3s1IBg2htwUaaesg5kUB46G9ZlajCMoM

-- Dumped from database version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: notes; Type: TABLE; Schema: public; Owner: atlas_app_user
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.notes OWNER TO atlas_app_user;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: atlas_app_user
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notes_id_seq OWNER TO atlas_app_user;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: atlas_app_user
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: atlas_app_user
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: atlas_app_user
--

COPY public.notes (id, title, content) FROM stdin;
1	My first Atlas note	Atlas PostgreSQL connection works!
\.


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: atlas_app_user
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, true);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: atlas_app_user
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO atlas_app_user;
GRANT ALL ON SCHEMA public TO atlas_app;


--
-- Name: TABLE notes; Type: ACL; Schema: public; Owner: atlas_app_user
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.notes TO atlas_app;


--
-- Name: SEQUENCE notes_id_seq; Type: ACL; Schema: public; Owner: atlas_app_user
--

GRANT ALL ON SEQUENCE public.notes_id_seq TO atlas_app;


--
-- PostgreSQL database dump complete
--

\unrestrict IOWKdq4aXBSnJYMwca9Uig7RgHNXIcg3s1IBg2htwUaaesg5kUB46G9ZlajCMoM

