--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: spalatinje
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO spalatinje;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: spalatinje
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying,
    content text,
    user_id integer,
    reference_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE articles OWNER TO spalatinje;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: spalatinje
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_id_seq OWNER TO spalatinje;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spalatinje
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: spalatinje
--

CREATE TABLE categories (
    id integer NOT NULL,
    title character varying,
    description character varying,
    kind character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);


ALTER TABLE categories OWNER TO spalatinje;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: spalatinje
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO spalatinje;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spalatinje
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: spalatinje
--

CREATE TABLE pictures (
    id integer NOT NULL,
    title character varying,
    year integer,
    photo_taken_date date,
    description text,
    user_id integer,
    location point,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disposition_on_landing_page character varying,
    published character varying
);


ALTER TABLE pictures OWNER TO spalatinje;

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: spalatinje
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pictures_id_seq OWNER TO spalatinje;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spalatinje
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


--
-- Name: promoted_categories; Type: TABLE; Schema: public; Owner: spalatinje
--

CREATE TABLE promoted_categories (
    id integer NOT NULL,
    category_id integer,
    "order" integer,
    visible boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE promoted_categories OWNER TO spalatinje;

--
-- Name: promoted_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: spalatinje
--

CREATE SEQUENCE promoted_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promoted_categories_id_seq OWNER TO spalatinje;

--
-- Name: promoted_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spalatinje
--

ALTER SEQUENCE promoted_categories_id_seq OWNED BY promoted_categories.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: spalatinje
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO spalatinje;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: spalatinje
--

CREATE TABLE tags (
    id integer NOT NULL,
    category_id integer,
    taggable_type character varying,
    taggable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tags OWNER TO spalatinje;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: spalatinje
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO spalatinje;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spalatinje
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: spalatinje
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO spalatinje;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: spalatinje
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO spalatinje;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spalatinje
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY promoted_categories ALTER COLUMN id SET DEFAULT nextval('promoted_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2016-11-20 12:42:35.071526	2016-11-20 12:42:35.071526
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY articles (id, title, content, user_id, reference_url, created_at, updated_at) FROM stdin;
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spalatinje
--

SELECT pg_catalog.setval('articles_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY categories (id, title, description, kind, created_at, updated_at, slug) FROM stdin;
1	Santa Maria la Ribera	Una colonia muy antigua de la ciudad	barrio	2016-11-20 15:25:27.44991	2016-11-26 20:52:55.32879	santa-maria-la-ribera
3	Canales		generica	2016-11-20 15:59:38.536524	2016-11-26 20:53:15.48432	canales
5	Sur		generica	2016-11-22 17:28:44.69348	2016-11-26 20:53:22.009895	sur
6	San Rafael	Colonia San Rafael	barrio	2016-11-22 17:34:07.071524	2016-11-26 20:53:41.774938	san-rafael
2	Metro		generica	2016-11-20 15:27:35.658976	2016-11-26 20:53:55.604906	metro
4	San Angel	Barrio de San Angel	barrio	2016-11-22 17:28:25.513635	2016-11-26 20:54:34.076468	san-angel
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spalatinje
--

SELECT pg_catalog.setval('categories_id_seq', 6, true);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY pictures (id, title, year, photo_taken_date, description, user_id, location, url, created_at, updated_at, disposition_on_landing_page, published) FROM stdin;
4	Angel de la Independencia	1989	1989-11-22	Una fotografía de 1981 en la que se aprecia el Paseo de la Reforma poco antes de la instalación de la Fuente del Cutzamala, conocida popularmente como "las sombrillas" o "las regaderas", en el cruce de Río Mississippi y Sevilla; para 1992 fue reemplazada por la Diana Cazadora.	\N	(99.1821000000000055,-19.3230000000000004)	https://scontent-amt2-1.xx.fbcdn.net/v/t1.0-9/15085718_1305237456164938_5673972453327118396_n.jpg?oh=6ff6b28a700030cc95c8ff132287a69a&oe=58B615E6	2016-11-22 17:33:43.785919	2016-11-26 20:14:15.424832	wide	\N
2	Restaurante San Angel-inn	1965	1965-06-22	Los alrededores del restaurante San Ángel Inn en una fotografía de 1975. Este famoso establecimiento ocupa desde 1963 el casco de la antigua Hacienda de Goicoechea, construido a finales del siglo XVII.	\N	(19.3491147000000012,-99.200119799999996)	https://scontent-amt2-1.xx.fbcdn.net/v/t1.0-9/15171065_1307163569305660_8328290202761698577_n.jpg?oh=fb296b22c814dd9923654fc3b2e86e26&oe=58BDACA2	2016-11-22 17:27:58.254979	2016-11-26 20:09:00.625607	\N	\N
3	Estadio Azteca	1965	1987-11-15	El interior del Estadio Azteca en una fotografía de 1979, donde destacan algunos anuncios de la época. Este inmueble es obra de Pedro Ramírez Vázquez y Rafael Mijares, y fue inaugurado el 29 de mayo de 1966.	\N	(99.1821000000000055,-19.3230000000000004)	https://scontent-amt2-1.xx.fbcdn.net/v/t1.0-9/15134673_1305685046120179_5445478560093921692_n.jpg?oh=67078fba8c0a85d342ab064fcc90166c&oe=58CC122B	2016-11-22 17:32:31.323786	2016-11-26 20:09:32.021849	\N	\N
6	Antonio Caso y Lafragua alrededor de 1960	1960	2016-11-15	El Paseo de la Reforma a la altura del cruce con Antonio Caso y Lafragua alrededor de 1960. Al frente se encuentra la estatua del general Jesús García Morales; a la izquierda está el edificio de la Secretaría de Recursos Hidráulicos, que hoy es el hotel Le Méridien, y a la derecha la Torre Anáhuac, ahora rebautizada como Torre Contigo.	\N	(19.4336185999999991,-99.1532978999999983)	https://scontent-ams3-1.xx.fbcdn.net/v/t1.0-9/1621888_862232733798748_309333132468508592_n.jpg?oh=908fd181edaad8399a178eacaa49447d&oe=58CB1739	2016-11-26 20:38:46.157844	2016-11-26 20:39:53.87149	portraits	\N
1	Metro Buenavista hacia finales de los 90's	1997	1997-11-19	Tren antiguo llegando	\N	(99.4819999999999993,-18.3230000000000004)	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Nationales_de_Mexico_1984.jpg/800px-Nationales_de_Mexico_1984.jpg	2016-11-20 15:26:52.366568	2016-11-26 17:32:05.395871	\N	\N
5	Cine Teresa 	0	2016-11-29	El cine Teresa anuncia la cinta "El hijo de la furia" el 8 de junio de 1942, día de su reinauguración. Esta sala abrió sus puertas por primera vez en los años veinte, pero fue demolida parcialmente para ensanchar la avenida San Juan de Letrán, hoy el Eje Central; la reconstrucción estuvo a cargo del arquitecto Francisco Serrano. Actualmente sobrevive la fachada, y el resto está ocupado por una plaza comercial.	\N	(99.1821000000000055,-19.3230000000000004)	https://scontent-ams3-1.xx.fbcdn.net/v/t1.0-9/15094971_1309376129084404_6254489383067173196_n.jpg?oh=5b521739f03f71866e5e3cc0c619952d&oe=58BB8E9F	2016-11-22 22:32:08.768947	2016-11-26 20:13:26.20835	grid-sizer portrait	\N
\.


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spalatinje
--

SELECT pg_catalog.setval('pictures_id_seq', 6, true);


--
-- Data for Name: promoted_categories; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY promoted_categories (id, category_id, "order", visible, created_at, updated_at) FROM stdin;
1	1	1	t	2016-11-22 17:57:08.667998	2016-11-22 17:57:08.667998
2	2	2	t	2016-11-22 17:57:54.404351	2016-11-22 17:57:54.404351
3	6	3	t	2016-11-22 18:33:15.774023	2016-11-22 18:33:15.774023
4	5	4	t	2016-11-22 21:59:54.917384	2016-11-26 20:44:06.680338
\.


--
-- Name: promoted_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spalatinje
--

SELECT pg_catalog.setval('promoted_categories_id_seq', 4, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY schema_migrations (version) FROM stdin;
20161120003446
20161120131129
20161120131534
20161120132309
20161120133111
20161122173727
20161122220400
20161126204851
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY spatial_ref_sys  FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY tags (id, category_id, taggable_type, taggable_id, created_at, updated_at) FROM stdin;
1	1	Picture	1	2016-11-20 15:26:52.370507	2016-11-20 15:26:52.370507
4	2	Picture	1	2016-11-20 15:28:22.055301	2016-11-20 15:28:22.055301
9	4	Picture	2	2016-11-22 17:29:50.2187	2016-11-22 17:29:50.2187
10	5	Picture	2	2016-11-22 17:29:50.222915	2016-11-22 17:29:50.222915
11	5	Picture	3	2016-11-22 17:32:31.326202	2016-11-22 17:32:31.326202
13	6	Picture	4	2016-11-22 21:09:28.707224	2016-11-22 21:09:28.707224
14	2	Picture	5	2016-11-22 22:32:08.774904	2016-11-22 22:32:08.774904
15	6	Picture	6	2016-11-26 20:38:46.165965	2016-11-26 20:38:46.165965
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spalatinje
--

SELECT pg_catalog.setval('tags_id_seq', 15, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: spalatinje
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spalatinje
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: promoted_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY promoted_categories
    ADD CONSTRAINT promoted_categories_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: spalatinje
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_tags_on_category_id; Type: INDEX; Schema: public; Owner: spalatinje
--

CREATE INDEX index_tags_on_category_id ON tags USING btree (category_id);


--
-- Name: index_tags_on_taggable_type_and_taggable_id; Type: INDEX; Schema: public; Owner: spalatinje
--

CREATE INDEX index_tags_on_taggable_type_and_taggable_id ON tags USING btree (taggable_type, taggable_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: spalatinje
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: spalatinje
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

