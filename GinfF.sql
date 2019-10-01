--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-10-01 14:58:53 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 42042)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admin (
    nickname character varying(50) NOT NULL,
    nome character varying(50),
    email character varying(50),
    senha character varying(50)
);


ALTER TABLE admin OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 42055)
-- Name: postagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postagem (
    id_post integer NOT NULL,
    titulo character varying(100),
    texto text,
    data_hora timestamp without time zone,
    autor character varying(50)
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 42045)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    nickname character varying(20) NOT NULL,
    nome character varying(80),
    email character varying(40),
    senha character varying(30)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2148 (class 0 OID 42042)
-- Dependencies: 181
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin (nickname, nome, email, senha) FROM stdin;
\.


--
-- TOC entry 2150 (class 0 OID 42055)
-- Dependencies: 183
-- Data for Name: postagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postagem (id_post, titulo, texto, data_hora, autor) FROM stdin;
\.


--
-- TOC entry 2149 (class 0 OID 42045)
-- Dependencies: 182
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (nickname, nome, email, senha) FROM stdin;
\.


--
-- TOC entry 2029 (class 2606 OID 42049)
-- Name: pk_nickname; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_nickname PRIMARY KEY (nickname);


--
-- TOC entry 2027 (class 2606 OID 42051)
-- Name: pk_nicknameAdmin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT "pk_nicknameAdmin" PRIMARY KEY (nickname);


--
-- TOC entry 2032 (class 2606 OID 42062)
-- Name: pk_post; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_post PRIMARY KEY (id_post);


--
-- TOC entry 2030 (class 1259 OID 42068)
-- Name: fki_pk_admin_post; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pk_admin_post ON postagem USING btree (autor);


--
-- TOC entry 2033 (class 2606 OID 42063)
-- Name: pk_admin_post; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_admin_post FOREIGN KEY (autor) REFERENCES admin(nickname);


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-01 14:58:53 BRT

--
-- PostgreSQL database dump complete
--

