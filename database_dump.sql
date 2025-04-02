--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_id_seq OWNER TO postgres;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    purpose character varying(255) NOT NULL,
    duration character varying(255) NOT NULL,
    size integer NOT NULL,
    sizeunit text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    truck_name character varying(255),
    status character varying(50) DEFAULT 'Pending'::character varying,
    payment_status character varying(50) DEFAULT 'Unpaid'::character varying
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    phone character varying(15) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (id, name, email, message, created_at) FROM stdin;
1	Godbless Odhiambo	godblessodhiambo@gmail.com	I would like to meet you guys	2025-03-25 12:32:14.904204
2	Philip Kashu	kashu@gmail.com	I would to order a truck	2025-04-01 11:28:21.867913
4	Sammie	sammie@gmail.com	Get me a truck	2025-04-01 23:57:56.717302
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, purpose, duration, size, sizeunit, created_at, truck_name, status, payment_status) FROM stdin;
2	Wood transport	12	5000	tons	2025-04-01 08:51:59.777434	TERBERG	Pending	Unpaid
3	Gas Transport	2	500	tons	2025-04-01 11:34:28.934468	MITSUBISHI	Pending	Paid
8	Brick Transport	90	7656453	feet	2025-04-02 00:07:53.610506	SCANIA	Done	Paid
9	Brick Transport	9	76565	feet	2025-04-02 00:20:12.697623	Toyota (Tundra)	Done	Paid
12	Metal Transport	12	23413	feet	2025-04-02 00:37:47.423943	MAN	Pending	Unpaid
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, phone, email, password, created_at) FROM stdin;
1	Goddie	0741703321	godblessodhiambo@gmail.com	$2b$10$.gXAwyCW1M9MtSw6FhR8tuTbQ97gH4shcXkfKDE2xddAg9TWi9yde	2025-03-24 15:10:34.385608
4	leah	0712345678	laah@gmail.com	$2b$10$TQss9gg6DQCF5GMi1nhFtOB5UW6SWLImnJ46gbI0e7dnIYqI/FcYy	2025-03-28 15:04:07.973854
5	shadi	0719659637	shadi@gmail.com	$2b$10$ty39eXQ7ddxS2seyYTUcRexHP4kfUnCLMd275B8YRPURf2oYD/Hpq	2025-03-31 21:17:03.999424
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_id_seq', 5, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: users unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

