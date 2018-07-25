--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ccgs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ccgs (
    code character varying(32) NOT NULL,
    name character varying(255)
);

-- Name: constituencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.constituencies (
    code character varying(32) NOT NULL,
    name character varying(255)
);


--
-- Name: counties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.counties (
    code character varying(32) NOT NULL,
    name character varying(255)
);


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    code character varying(32) NOT NULL,
    name character varying(255)
);


--
-- Name: nuts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nuts (
    nuts_code character varying(32) NOT NULL,
    code character varying(32) NOT NULL,
    name character varying(255)
);


--
-- Name: outcodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.outcodes (
    id integer NOT NULL,
    outcode character varying(5),
    longitude double precision,
    latitude double precision,
    location public.geography(Point,4326),
    northings integer,
    eastings integer,
    admin_district character varying(255)[],
    parish character varying(255)[],
    admin_county character varying(255)[],
    admin_ward character varying(255)[],
    country character varying(255)[]
);


--
-- Name: outcodes_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.outcodes_temp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: outcodes_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.outcodes_temp_id_seq OWNED BY public.outcodes.id;


--
-- Name: parishes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parishes (
    code character varying(32) NOT NULL,
    name character varying(255)
);


--
-- Name: places; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.places (
    id integer NOT NULL,
    code character varying(255),
    longitude double precision,
    latitude double precision,
    location public.geography(Point,4326),
    eastings integer,
    northings integer,
    min_eastings integer,
    min_northings integer,
    max_eastings integer,
    max_northings integer,
    bounding_polygon public.geography(Polygon,4326),
    local_type character varying(128),
    outcode character varying(5),
    name_1 character varying(128),
    name_1_lang character varying(10),
    name_1_search character varying(128),
    name_1_search_ts tsvector,
    name_2 character varying(128),
    name_2_lang character varying(10),
    name_2_search character varying(128),
    name_2_search_ts tsvector,
    county_unitary character varying(128),
    county_unitary_type character varying(128),
    district_borough character varying(128),
    district_borough_type character varying(128),
    region character varying(32),
    country character varying(16)
);


--
-- Name: places_archived; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.places_archived (
    id integer NOT NULL,
    code character varying(255),
    longitude double precision,
    latitude double precision,
    location public.geography(Point,4326),
    eastings integer,
    northings integer,
    min_eastings integer,
    min_northings integer,
    max_eastings integer,
    max_northings integer,
    bounding_polygon public.geography(Polygon,4326),
    local_type character varying(128),
    outcode character varying(5),
    name_1 character varying(128),
    name_1_lang character varying(10),
    name_1_search character varying(128),
    name_1_search_ts tsvector,
    name_2 character varying(128),
    name_2_lang character varying(10),
    name_2_search character varying(128),
    name_2_search_ts tsvector,
    county_unitary character varying(128),
    county_unitary_type character varying(128),
    district_borough character varying(128),
    district_borough_type character varying(128),
    region character varying(32),
    country character varying(16)
);


--
-- Name: places_temp_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.places_temp_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_temp_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.places_temp_id_seq1 OWNED BY public.places_archived.id;


--
-- Name: places_temp_id_seq2; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.places_temp_id_seq2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_temp_id_seq2; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.places_temp_id_seq2 OWNED BY public.places.id;


--
-- Name: postcodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.postcodes (
    id integer NOT NULL,
    postcode character varying(10) COLLATE pg_catalog."C",
    pc_compact character varying(9) COLLATE pg_catalog."C",
    quality integer,
    eastings integer,
    northings integer,
    country character varying(255),
    nhs_ha character varying(255),
    admin_county_id character varying(32),
    admin_district_id character varying(32),
    admin_ward_id character varying(32),
    longitude double precision,
    latitude double precision,
    location public.geography(Point,4326),
    european_electoral_region character varying(255),
    primary_care_trust character varying(255),
    region character varying(255),
    parish_id character varying(32),
    lsoa character varying(255),
    msoa character varying(255),
    nuts_id character varying(32),
    incode character varying(5),
    outcode character varying(5),
    ccg_id character varying(32),
    constituency_id character varying(32)
);


--
-- Name: postcodes_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.postcodes_temp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postcodes_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.postcodes_temp_id_seq OWNED BY public.postcodes.id;


--
-- Name: terminated_postcodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.terminated_postcodes (
    id integer NOT NULL,
    postcode character varying(10) COLLATE pg_catalog."C" NOT NULL,
    pc_compact character varying(9) COLLATE pg_catalog."C",
    year_terminated integer,
    month_terminated integer,
    eastings integer,
    northings integer,
    longitude double precision,
    latitude double precision,
    location public.geography(Point,4326)
);


--
-- Name: terminated_postcodes_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.terminated_postcodes_temp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: terminated_postcodes_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.terminated_postcodes_temp_id_seq OWNED BY public.terminated_postcodes.id;


--
-- Name: wards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wards (
    code character varying(32) NOT NULL,
    name character varying(255)
);


--
-- Name: outcodes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outcodes ALTER COLUMN id SET DEFAULT nextval('public.outcodes_temp_id_seq'::regclass);


--
-- Name: places id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_temp_id_seq2'::regclass);


--
-- Name: places_archived id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places_archived ALTER COLUMN id SET DEFAULT nextval('public.places_temp_id_seq1'::regclass);


--
-- Name: postcodes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postcodes ALTER COLUMN id SET DEFAULT nextval('public.postcodes_temp_id_seq'::regclass);


--
-- Name: terminated_postcodes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terminated_postcodes ALTER COLUMN id SET DEFAULT nextval('public.terminated_postcodes_temp_id_seq'::regclass);


--
-- Data for Name: ccgs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ccgs (code, name) FROM stdin;
E38000001	NHS Airedale, Wharfedale and Craven
E38000006	NHS Barnsley
E38000004	NHS Barking and Dagenham
E38000010	NHS Bedfordshire
E38000011	NHS Bexley
E38000002	NHS Ashford
E38000008	NHS Bassetlaw
E38000007	NHS Basildon and Brentwood
E38000014	NHS Blackburn with Darwen
E38000015	NHS Blackpool
E38000016	NHS Bolton
E38000018	NHS Bradford City
E38000009	NHS Bath and North East Somerset
E38000005	NHS Barnet
E38000019	NHS Bradford Districts
E38000020	NHS Brent
E38000021	NHS Brighton and Hove
E38000023	NHS Bromley
E38000024	NHS Bury
E38000026	NHS Cambridgeshire and Peterborough
E38000025	NHS Calderdale
E38000027	NHS Camden
E38000028	NHS Cannock Chase
E38000029	NHS Canterbury and Coastal
E38000030	NHS Castle Point and Rochford
E38000031	NHS Central London (Westminster)
E38000034	NHS Chorley and South Ribble
E38000035	NHS City and Hackney
E38000037	NHS Corby
E38000039	NHS Crawley
E38000038	NHS Coventry and Rugby
E38000040	NHS Croydon
E38000042	NHS Darlington
E38000044	NHS Doncaster
E38000045	NHS Dorset
E38000046	NHS Dudley
E38000043	NHS Dartford, Gravesham and Swanley
E38000047	NHS Durham Dales, Easington and Sedgefield
E38000048	NHS Ealing
E38000049	NHS East and North Hertfordshire
E38000050	NHS East Lancashire
E38000051	NHS East Leicestershire and Rutland
E38000053	NHS East Staffordshire
E38000052	NHS East Riding of Yorkshire
E38000054	NHS East Surrey
E38000055	NHS Eastbourne, Hailsham and Seaford
E38000056	NHS Eastern Cheshire
E38000057	NHS Enfield
E38000058	NHS Erewash
E38000059	NHS Fareham and Gosport
E38000062	NHS Gloucestershire
E38000063	NHS Great Yarmouth and Waveney
E38000064	NHS Greater Huddersfield
E38000068	NHS Halton
E38000070	NHS Hammersmith and Fulham
E38000069	NHS Hambleton, Richmondshire and Whitby
E38000071	NHS Hardwick
E38000066	NHS Greenwich
E38000072	NHS Haringey
E38000073	NHS Harrogate and Rural District
E38000074	NHS Harrow
E38000075	NHS Hartlepool and Stockton-on-Tees
E38000076	NHS Hastings and Rother
E38000077	NHS Havering
E38000078	NHS Herefordshire
E38000079	NHS Herts Valleys
E38000080	NHS Heywood, Middleton and Rochdale
E38000081	NHS High Weald Lewes Havens
E38000082	NHS Hillingdon
E38000083	NHS Horsham and Mid Sussex
E38000084	NHS Hounslow
E38000085	NHS Hull
E38000086	NHS Ipswich and East Suffolk
E38000087	NHS Isle of Wight
E38000089	NHS Kernow
E38000088	NHS Islington
E38000090	NHS Kingston
E38000091	NHS Knowsley
E38000092	NHS Lambeth
E38000097	NHS Leicester City
E38000098	NHS Lewisham
E38000099	NHS Lincolnshire East
E38000100	NHS Lincolnshire West
E38000101	NHS Liverpool
E38000102	NHS Luton
E38000103	NHS Mansfield and Ashfield
E38000105	NHS Merton
E38000104	NHS Medway
E38000106	NHS Mid Essex
E38000108	NHS Nene
E38000107	NHS Milton Keynes
E38000109	NHS Newark and Sherwood
E38000113	NHS Newham
E38000115	NHS North Derbyshire
E38000116	NHS North Durham
E38000117	NHS North East Essex
E38000118	NHS North East Hampshire and Farnham
E38000119	NHS North East Lincolnshire
E38000121	NHS North Kirklees
E38000120	NHS North Hampshire
E38000124	NHS North Norfolk
E38000122	NHS North Lincolnshire
E38000126	NHS North Staffordshire
E38000127	NHS North Tyneside
E38000128	NHS North West Surrey
E38000129	NHS Northern, Eastern and Western Devon
E38000130	NHS Northumberland
E38000132	NHS Nottingham City
E38000133	NHS Nottingham North and East
E38000134	NHS Nottingham West
E38000135	NHS Oldham
E38000138	NHS Redbridge
E38000137	NHS Portsmouth
E38000139	NHS Redditch and Bromsgrove
E38000136	NHS Oxfordshire
E38000140	NHS Richmond
E38000141	NHS Rotherham
E38000142	NHS Rushcliffe
E38000143	NHS Salford
E38000144	NHS Sandwell and West Birmingham
E38000145	NHS Scarborough and Ryedale
E38000146	NHS Sheffield
E38000147	NHS Shropshire
E38000150	NHS Somerset
E38000151	NHS South Cheshire
E38000152	NHS South Devon and Torbay
E38000153	NHS South East Staffordshire and Seisdon Peninsula
E38000156	NHS South Kent Coast
E38000154	NHS South Eastern Hampshire
E38000157	NHS South Lincolnshire
E38000161	NHS South Sefton
E38000162	NHS South Tees
E38000163	NHS South Tyneside
E38000164	NHS South Warwickshire
E38000176	NHS Sunderland
E38000185	NHS Thurrock
E38000196	NHS West Cheshire
E38000208	NHS Wirral
\.


--
-- Name: ccgs ccgs_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ccgs
    ADD CONSTRAINT ccgs_code_key UNIQUE (code);


--
-- Name: constituencies constituencies_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.constituencies
    ADD CONSTRAINT constituencies_code_key UNIQUE (code);


--
-- Name: counties counties_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.counties
    ADD CONSTRAINT counties_code_key UNIQUE (code);


--
-- Name: districts districts_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_code_key UNIQUE (code);


--
-- Name: nuts nuts_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nuts
    ADD CONSTRAINT nuts_code_key UNIQUE (code);


--
-- Name: outcodes outcodes_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outcodes
    ADD CONSTRAINT outcodes_temp_pkey PRIMARY KEY (id);


--
-- Name: parishes parishes_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parishes
    ADD CONSTRAINT parishes_code_key UNIQUE (code);


--
-- Name: places_archived places_temp_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places_archived
    ADD CONSTRAINT places_temp_pkey1 PRIMARY KEY (id);


--
-- Name: places places_temp_pkey2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_temp_pkey2 PRIMARY KEY (id);


--
-- Name: postcodes postcodes_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postcodes
    ADD CONSTRAINT postcodes_temp_pkey PRIMARY KEY (id);


--
-- Name: terminated_postcodes terminated_postcodes_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terminated_postcodes
    ADD CONSTRAINT terminated_postcodes_temp_pkey PRIMARY KEY (id);


--
-- Name: wards wards_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_code_key UNIQUE (code);


--
-- Name: ccgs_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ccgs_code_idx ON public.ccgs USING btree (code);


--
-- Name: constituencies_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX constituencies_code_idx ON public.constituencies USING btree (code);


--
-- Name: counties_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX counties_code_idx ON public.counties USING btree (code);


--
-- Name: districts_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX districts_code_idx ON public.districts USING btree (code);


--
-- Name: nuts_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX nuts_code_idx ON public.nuts USING btree (code);


--
-- Name: outcodes_temp_location_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX outcodes_temp_location_idx ON public.outcodes USING gist (location);


--
-- Name: outcodes_temp_outcode_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX outcodes_temp_outcode_idx ON public.outcodes USING btree (outcode);


--
-- Name: parishes_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX parishes_code_idx ON public.parishes USING btree (code);


--
-- Name: places_temp_bounding_polygon_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_bounding_polygon_idx1 ON public.places_archived USING gist (bounding_polygon);


--
-- Name: places_temp_bounding_polygon_idx2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_bounding_polygon_idx2 ON public.places USING gist (bounding_polygon);


--
-- Name: places_temp_code_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX places_temp_code_idx1 ON public.places_archived USING btree (code);


--
-- Name: places_temp_code_idx2; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX places_temp_code_idx2 ON public.places USING btree (code);


--
-- Name: places_temp_location_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_location_idx1 ON public.places_archived USING gist (location);


--
-- Name: places_temp_location_idx2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_location_idx2 ON public.places USING gist (location);


--
-- Name: places_temp_name_1_search_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_name_1_search_idx1 ON public.places_archived USING btree (name_1_search varchar_pattern_ops);


--
-- Name: places_temp_name_1_search_idx2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_name_1_search_idx2 ON public.places USING btree (name_1_search varchar_pattern_ops);


--
-- Name: places_temp_name_1_search_ts_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_name_1_search_ts_idx1 ON public.places_archived USING gin (name_1_search_ts);


--
-- Name: places_temp_name_1_search_ts_idx2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_name_1_search_ts_idx2 ON public.places USING gin (name_1_search_ts);


--
-- Name: places_temp_name_2_search_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_name_2_search_idx1 ON public.places_archived USING btree (name_2_search varchar_pattern_ops);


--
-- Name: places_temp_name_2_search_idx2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_name_2_search_idx2 ON public.places USING btree (name_2_search varchar_pattern_ops);


--
-- Name: places_temp_name_2_search_ts_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_name_2_search_ts_idx1 ON public.places_archived USING gin (name_2_search_ts);


--
-- Name: places_temp_name_2_search_ts_idx2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX places_temp_name_2_search_ts_idx2 ON public.places USING gin (name_2_search_ts);


--
-- Name: postcodes_temp_location_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX postcodes_temp_location_idx ON public.postcodes USING gist (location);


--
-- Name: postcodes_temp_outcode_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX postcodes_temp_outcode_idx ON public.postcodes USING btree (outcode);


--
-- Name: postcodes_temp_pc_compact_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX postcodes_temp_pc_compact_idx ON public.postcodes USING btree (pc_compact);


--
-- Name: postcodes_temp_pc_compact_idx1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX postcodes_temp_pc_compact_idx1 ON public.postcodes USING btree (pc_compact varchar_pattern_ops);


--
-- Name: postcodes_temp_postcode_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX postcodes_temp_postcode_idx ON public.postcodes USING btree (postcode);


--
-- Name: terminated_postcodes_temp_pc_compact_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX terminated_postcodes_temp_pc_compact_idx ON public.terminated_postcodes USING btree (pc_compact);


--
-- Name: wards_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX wards_code_idx ON public.wards USING btree (code);


--
-- PostgreSQL database dump complete
--

