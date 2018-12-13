--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-12-13 18:46:50 BRST

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
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 33301)
-- Name: amizade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE amizade (
    cd_amizade integer NOT NULL,
    cd_usuario1 integer,
    cd_usuario2 integer
);


ALTER TABLE amizade OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 33307)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chat (
    cd_chat integer NOT NULL,
    cd_usuario integer,
    nm_name_chat character varying(1000),
    dt_data_hora character varying,
    ds_mensagem character varying(1000)
);


ALTER TABLE chat OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33304)
-- Name: jogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jogo (
    cd_jogo integer NOT NULL,
    nm_nome integer,
    ds_descricao text
);


ALTER TABLE jogo OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 33310)
-- Name: mensagem privada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "mensagem privada" (
    cd_mensagem integer NOT NULL,
    cd_usuario_remetente integer,
    cd_usuario_destinatorio integer,
    dt_data_hora date,
    ds_mensagem character varying(1000)
);


ALTER TABLE "mensagem privada" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 33295)
-- Name: telefone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE telefone (
    cd_telefone integer NOT NULL,
    nr_ddd integer,
    nr_numero integer,
    tipo_tipo character varying,
    cd_usuario integer
);


ALTER TABLE telefone OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 33292)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    nm_nickname integer,
    cd_usuario integer NOT NULL,
    ds_email character varying,
    dt_nascimento date,
    regiao_cd_regiao integer,
    nr_senha numeric,
    nm_nome character varying
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33298)
-- Name: usuario jogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "usuario jogo" (
    cd_jogada integer,
    cd_usuario integer NOT NULL,
    cd_jogo integer,
    vl_pontos numeric
);


ALTER TABLE "usuario jogo" OWNER TO postgres;

--
-- TOC entry 2184 (class 0 OID 33301)
-- Dependencies: 184
-- Data for Name: amizade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY amizade (cd_amizade, cd_usuario1, cd_usuario2) FROM stdin;
\.


--
-- TOC entry 2186 (class 0 OID 33307)
-- Dependencies: 186
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY chat (cd_chat, cd_usuario, nm_name_chat, dt_data_hora, ds_mensagem) FROM stdin;
\.


--
-- TOC entry 2185 (class 0 OID 33304)
-- Dependencies: 185
-- Data for Name: jogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jogo (cd_jogo, nm_nome, ds_descricao) FROM stdin;
\.


--
-- TOC entry 2187 (class 0 OID 33310)
-- Dependencies: 187
-- Data for Name: mensagem privada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "mensagem privada" (cd_mensagem, cd_usuario_remetente, cd_usuario_destinatorio, dt_data_hora, ds_mensagem) FROM stdin;
\.


--
-- TOC entry 2182 (class 0 OID 33295)
-- Dependencies: 182
-- Data for Name: telefone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY telefone (cd_telefone, nr_ddd, nr_numero, tipo_tipo, cd_usuario) FROM stdin;
\.


--
-- TOC entry 2181 (class 0 OID 33292)
-- Dependencies: 181
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (nm_nickname, cd_usuario, ds_email, dt_nascimento, regiao_cd_regiao, nr_senha, nm_nome) FROM stdin;
\.


--
-- TOC entry 2183 (class 0 OID 33298)
-- Dependencies: 183
-- Data for Name: usuario jogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "usuario jogo" (cd_jogada, cd_usuario, cd_jogo, vl_pontos) FROM stdin;
\.


--
-- TOC entry 2054 (class 2606 OID 33346)
-- Name: id_friend; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY amizade
    ADD CONSTRAINT id_friend PRIMARY KEY (cd_amizade);


--
-- TOC entry 2056 (class 2606 OID 33355)
-- Name: id_game; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jogo
    ADD CONSTRAINT id_game PRIMARY KEY (cd_jogo);


--
-- TOC entry 2050 (class 2606 OID 33369)
-- Name: id_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT id_phone PRIMARY KEY (cd_telefone);


--
-- TOC entry 2058 (class 2606 OID 33348)
-- Name: idchat; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chat
    ADD CONSTRAINT idchat PRIMARY KEY (cd_chat);


--
-- TOC entry 2060 (class 2606 OID 33357)
-- Name: idmsg; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "mensagem privada"
    ADD CONSTRAINT idmsg PRIMARY KEY (cd_mensagem);


--
-- TOC entry 2048 (class 2606 OID 33332)
-- Name: iduser; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT iduser PRIMARY KEY (cd_usuario);


--
-- TOC entry 2052 (class 2606 OID 33334)
-- Name: iduser_jogo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "usuario jogo"
    ADD CONSTRAINT iduser_jogo PRIMARY KEY (cd_usuario);


--
-- TOC entry 2064 (class 2606 OID 33349)
-- Name: fk_user1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chat
    ADD CONSTRAINT fk_user1 FOREIGN KEY (cd_usuario) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2061 (class 2606 OID 33370)
-- Name: fk_user_phone; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT fk_user_phone FOREIGN KEY (cd_telefone) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2066 (class 2606 OID 33363)
-- Name: fk_user_remet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "mensagem privada"
    ADD CONSTRAINT fk_user_remet FOREIGN KEY (cd_usuario_remetente) REFERENCES "usuario jogo"(cd_usuario);


--
-- TOC entry 2065 (class 2606 OID 33358)
-- Name: fl_user_dest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "mensagem privada"
    ADD CONSTRAINT fl_user_dest FOREIGN KEY (cd_usuario_destinatorio) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2062 (class 2606 OID 33335)
-- Name: user1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY amizade
    ADD CONSTRAINT user1 FOREIGN KEY (cd_usuario2) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2063 (class 2606 OID 33340)
-- Name: user2game; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY amizade
    ADD CONSTRAINT user2game FOREIGN KEY (cd_usuario2) REFERENCES "usuario jogo"(cd_usuario);


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-12-13 18:46:50 BRST

--
-- PostgreSQL database dump complete
--

