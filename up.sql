--
-- PostgreSQL database dump
--

\restrict allVi0380guWppixG4RVq1gsYFQZGAAcqXOTJ9aKLg0JFSUfzCPhE6A0M3EQjlp

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-22 15:53:26

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
-- TOC entry 220 (class 1259 OID 18864)
-- Name: manufacture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacture (
    id_manufacture integer NOT NULL,
    manufacture character varying(100) NOT NULL
);


ALTER TABLE public.manufacture OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18863)
-- Name: manufacture_id_manufacture_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manufacture_id_manufacture_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.manufacture_id_manufacture_seq OWNER TO postgres;

--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 219
-- Name: manufacture_id_manufacture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manufacture_id_manufacture_seq OWNED BY public.manufacture.id_manufacture;


--
-- TOC entry 222 (class 1259 OID 18873)
-- Name: measure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measure (
    id_measure integer NOT NULL,
    measure character varying(10) NOT NULL
);


ALTER TABLE public.measure OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18872)
-- Name: measure_id_measure_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.measure_id_measure_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.measure_id_measure_seq OWNER TO postgres;

--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 221
-- Name: measure_id_measure_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.measure_id_measure_seq OWNED BY public.measure.id_measure;


--
-- TOC entry 236 (class 1259 OID 18944)
-- Name: nomenclature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nomenclature (
    id_nomenclature integer NOT NULL,
    article_number character varying(6) NOT NULL,
    product_name character varying(300) NOT NULL,
    id_measure integer NOT NULL,
    price numeric(10,2) NOT NULL,
    id_category_product integer NOT NULL,
    current_discount integer NOT NULL,
    quantity_in_stock integer NOT NULL,
    description character varying(500),
    photo character varying(300),
    id_provider integer NOT NULL,
    id_manufacturer integer NOT NULL
);


ALTER TABLE public.nomenclature OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18943)
-- Name: nomenclature_id_nomenclature_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nomenclature_id_nomenclature_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nomenclature_id_nomenclature_seq OWNER TO postgres;

--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 235
-- Name: nomenclature_id_nomenclature_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nomenclature_id_nomenclature_seq OWNED BY public.nomenclature.id_nomenclature;


--
-- TOC entry 238 (class 1259 OID 18983)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    order_number integer NOT NULL,
    order_item_number character varying(23) NOT NULL,
    order_date date NOT NULL,
    delivery_date date NOT NULL,
    id_pickup_point integer NOT NULL,
    id_user integer NOT NULL,
    id_receiving integer NOT NULL,
    id_status integer NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18982)
-- Name: order_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_order_number_seq OWNER TO postgres;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 237
-- Name: order_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_order_number_seq OWNED BY public."order".order_number;


--
-- TOC entry 228 (class 1259 OID 18900)
-- Name: pickup_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_point (
    id_pickup_point integer NOT NULL,
    pickup_point character varying(300) NOT NULL
);


ALTER TABLE public.pickup_point OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18899)
-- Name: pickup_point_id_pickup_point_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pickup_point_id_pickup_point_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pickup_point_id_pickup_point_seq OWNER TO postgres;

--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 227
-- Name: pickup_point_id_pickup_point_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pickup_point_id_pickup_point_seq OWNED BY public.pickup_point.id_pickup_point;


--
-- TOC entry 232 (class 1259 OID 18918)
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    id_product_category integer NOT NULL,
    product_category character varying(150) NOT NULL
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18917)
-- Name: product_category_id_product_category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_id_product_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_category_id_product_category_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_category_id_product_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_category_id_product_category_seq OWNED BY public.product_category.id_product_category;


--
-- TOC entry 226 (class 1259 OID 18891)
-- Name: provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provider (
    id_provider integer NOT NULL,
    provider character varying(300) NOT NULL
);


ALTER TABLE public.provider OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18890)
-- Name: provider_id_provider_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provider_id_provider_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.provider_id_provider_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 225
-- Name: provider_id_provider_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provider_id_provider_seq OWNED BY public.provider.id_provider;


--
-- TOC entry 224 (class 1259 OID 18882)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    employee_role character varying(50) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18881)
-- Name: role_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_role_seq OWNER TO postgres;

--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 223
-- Name: role_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;


--
-- TOC entry 230 (class 1259 OID 18909)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id_status integer NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18908)
-- Name: status_id_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_id_status_seq OWNER TO postgres;

--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 229
-- Name: status_id_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_status_seq OWNED BY public.status.id_status;


--
-- TOC entry 234 (class 1259 OID 18927)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id_user integer NOT NULL,
    id_role integer NOT NULL,
    fio character varying(300) NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18926)
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_user_seq OWNER TO postgres;

--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_user_seq OWNED BY public."user".id_user;


--
-- TOC entry 4901 (class 2604 OID 18867)
-- Name: manufacture id_manufacture; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacture ALTER COLUMN id_manufacture SET DEFAULT nextval('public.manufacture_id_manufacture_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 18876)
-- Name: measure id_measure; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measure ALTER COLUMN id_measure SET DEFAULT nextval('public.measure_id_measure_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 18947)
-- Name: nomenclature id_nomenclature; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature ALTER COLUMN id_nomenclature SET DEFAULT nextval('public.nomenclature_id_nomenclature_seq'::regclass);


--
-- TOC entry 4910 (class 2604 OID 18986)
-- Name: order order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN order_number SET DEFAULT nextval('public.order_order_number_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 18903)
-- Name: pickup_point id_pickup_point; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_point ALTER COLUMN id_pickup_point SET DEFAULT nextval('public.pickup_point_id_pickup_point_seq'::regclass);


--
-- TOC entry 4907 (class 2604 OID 18921)
-- Name: product_category id_product_category; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category ALTER COLUMN id_product_category SET DEFAULT nextval('public.product_category_id_product_category_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 18894)
-- Name: provider id_provider; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider ALTER COLUMN id_provider SET DEFAULT nextval('public.provider_id_provider_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 18885)
-- Name: role id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 18912)
-- Name: status id_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id_status SET DEFAULT nextval('public.status_id_status_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 18930)
-- Name: user id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);


--
-- TOC entry 5087 (class 0 OID 18864)
-- Dependencies: 220
-- Data for Name: manufacture; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (1, 'Яуза');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (2, 'Т8 Издательские технологии');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (3, 'Прогресс книга');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (4, 'Время');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (5, '
Лениздат');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (6, 'Неолит');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (7, 'Амрита-Русь');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (8, 'Златоуст');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (9, 'Аспект Пресс');
INSERT INTO public.manufacture (id_manufacture, manufacture) VALUES (10, 'ВКН');


--
-- TOC entry 5089 (class 0 OID 18873)
-- Dependencies: 222
-- Data for Name: measure; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.measure (id_measure, measure) VALUES (1, 'шт.');


--
-- TOC entry 5103 (class 0 OID 18944)
-- Dependencies: 236
-- Data for Name: nomenclature; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (1, 'А112Т4', 'Прокляты и убиты', 1, 585.00, 1, 25, 6, 'Роман-эпопею Прокляты и убиты Виктора Астафьева по праву считают одним из самых сильных и пронзительных произведений отечественной военной прозы.', '1.jpg', 1, 1);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (2, 'G843H5', 'Тайны и загадки отца БраунаТайны и загадки отца Брауна', 1, 193.00, 1, 30, 9, 'Гилберт Кит Честертон — признанный классик английской литературы, один из самых ярких писателей первой половины XX века. Классикой стали его романы и многочисленные эссе, однако любовь массового читателя принесли ему рассказы об отце Брауне, тихом, застенчивом священнике, мастерски раскрывающем наиболее запутанные загадки и преступления. ', '2.jpg', 2, 1);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (3, 'D325D4', 'Девайс', 1, 1599.00, 1, 5, 12, 'Молодой фрилансер Захар Скаро устраивается на очередную подработку. Задача, казалось бы, тривиальная: тестирование нового устройства. Вот только вопрос в том, тестированием какой реальности занимается этот новый Девайс?', '3.jpg', 3, 2);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (4, 'S432T5', 'Необыкновенное обыкновенное чудо. Школьные истории', 1, 549.00, 1, 15, 15, NULL, '4.jpg', 4, 2);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (5, 'F325D4', 'Чук и Гек', 1, 209.00, 1, 18, 3, 'В книгу вошли повести и рассказы Аркадия Петровича Гайдара: Чук и Гек, Горячий камень и Сказка о военной тайне, о Мальчише-Кибальчише и его твердом слове', '5.jpg', 5, 2);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (6, 'G432G6', 'Информационная безопасность. Национальные стандарты Российской Федерации. 3-е издание. Учебное пособие', 1, 3899.00, 2, 22, 3, 'В учебном пособии рассмотрено более 300 действующих открытых документов национальной системы стандартизации Российской Федерации, включая международные и межгосударственные стандарты в области информационной безопасности по состоянию на начало 2023 года.', '6.jpg', 6, 3);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (7, 'H542F5', 'Linux. Командная строка. Лучшие практики', 1, 1799.00, 2, 4, 5, 'Перейдите на новый уровень работы в Linux! Если вы системный администратор, разработчик программного обеспечения, SRE-инженер или пользователь Linux, книга поможет вам работать быстрее, элегантнее и эффективнее. ', '7.jpg', 7, 3);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (8, 'C346F5', 'Квантовые миры и возникновение пространства-времени', 1, 1349.00, 2, 5, 4, 'Шон Кэрролл — физик-теоретик и один из самых известных в мире популяризаторов науки — заставляет нас по-новому взглянуть на физику. Столкновение с главной загадкой квантовой механики полностью поменяет наши представления о пространстве и времени.', '8.jpg', 8, 3);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (9, 'F256G6', 'Вселенная. Происхождение жизни, смысл нашего существования и огромный космос', 1, 1799.00, 2, 6, 2, 'Знаменитый физик Шон Кэрролл в свойственной ему увлекательной манере объясняет принципы, которые лежат в основах научных революций от Дарвина до Эйнштейна, и показывает как невероятные научные открытия последнего столетия изменили наш мир.', NULL, 8, 3);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (10, 'J532V5', 'Пушкин. Бродский. Империя и судьба. В 2-х томах (комплект из 2-х книг)', 1, 529.00, 3, 8, 6, 'Первая книга двухтомника «Пушкин. Бродский. Империя и судьба» пронизана пушкинской темой. Пушкин — «певец империи и свободы» — присутствует даже там, где он впрямую не упоминается, ибо его судьба, как и судьба других героев книги, органично связана с трагедией великой империи.', '10.jpg', 9, 4);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (11, 'G643F4', 'Иосиф Бродский. Избранные эссе (комплект из 6-ти книг)', 1, 4925.00, 3, 2, 24, 'Шесть сборников избранных эссе Иосифа Бродского (1940-1996), великого поэта, драматурга, мыслителя, лауреата Нобелевской премии по литературе (1987): «Будущее или далекое прошлое», «Верь своей боли», «Как читать книгу», «О русской литературе», «О тирании», «Путеводитель по переименованному городу». Все тексты представлены на английском языке и в переводе на русский и открывают автора не только как поэта, но как историка, критика, и глубокого и ироничного мыслителя.', '11.jpg', 10, 5);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (12, 'J326V5', 'Тысячелетие императорской керамикиv', 1, 2599.00, 3, 5, 4, 'Фарфор стал величайшим символом китайской культуры. Это одно из выдающихся изобретений, внесших неоценимый вклад в мировую цивилизацию. ', '12.jpg', 11, 5);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (13, 'J632F6', 'Вечные спутники: Портреты из всемирной литературы', 1, 1599.00, 3, 0, 6, 'Книга Вечные спутники - это цикл критических очерков о культуре и великих литераторах, сопровождавших жизнь и творчество русского писателя, поэта, литературного критика и общественного деятеля Дмитрия Мережковского (1865–1941). ', '13.jpg', 12, 5);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (14, 'G632H6', 'Формирование литературной репутации Н.Г.Чернышевского в ХIX-XXI веках', 1, 1349.00, 3, 2, 8, 'Монография Д. А. Щербакова - новаторская. Поэтапно рассмотрены не только многочисленные суждения известных отечественных и зарубежных критиков, литературоведов, философов и политиков, различным образом характеризовавших Н. Г. Чернышевского в связи и вне связи со знаменитым романом Что делать? ', '14.jpg', 13, 6);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (15, 'G543F5', 'Религиозные верования с древнейших времен до наших дней', 1, 879.00, 3, 4, 6, 'Настоящее издание представляет собой сборник переводов лекций по истории дохристианских и нехристианских религий, прочитанных в Лондоне в период с 1888 по 1891 гг. авторитетными исследователями данного раздела религиоведения. ', '16.jpg', 13, 7);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (16, 'M642E5', 'Теория искусства. Краткий путеводитель', 1, 879.00, 3, 3, 2, NULL, '15.jpg', 14, 6);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (17, 'B653G6', 'Русский язык: Первые шаги. Часть 3. Учебное пособие', 1, 2699.00, 4, 8, 9, 'Пособие является завершающей частью учебного комплекса. Третья часть содержит 10 уроков (21-30, последний-повторительный). Усвоение лексико-грамматического материала рассчитано примерно на 200-240 часов аудиторных занятий. ', '17.jpg', 15, 8);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (18, 'J735J7', 'Синтетический образ индивидуального психического мира', 1, 1099.00, 3, 9, 4, 'Психика подобна определенным объектам, это фиксируют сами люди в языке и искусстве. В данном исследовании рассматриваются в этом плане образы сосуда, воронки, дерева и крепости.', '18.jpg', 16, 8);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (19, 'H436H7', 'Английский язык в спорте: Учебное пособие', 1, 1999.00, 4, 2, 0, 'Учебное пособие подготовлено для слушателей, изу чающих английский язык как язык специальности', '19.jpg', 17, 9);
INSERT INTO public.nomenclature (id_nomenclature, article_number, product_name, id_measure, price, id_category_product, current_discount, quantity_in_stock, description, photo, id_provider, id_manufacturer) VALUES (20, 'H475R5', 'Лексика и грамматика современного китайского языка (к тому II учебника «Новый практический курс китайского языка» под редакцией Лю Сюня): учебное пособие', 1, 608.00, 4, 25, 12, 'Пособие выступает дополнением ко второму тому учебника «Новый практический курс китайского языка» (под редакцией Лю Сюня). ', '20.jpg', 18, 10);


--
-- TOC entry 5105 (class 0 OID 18983)
-- Dependencies: 238
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (1, 'А112Т4, 2, G843H5, 2', '2024-02-27', '2024-04-20', 1, 10, 901, 1);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (5, 'G432G6, 20, H542F5, 20', '2024-03-17', '2024-04-24', 2, 10, 905, 1);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (9, 'J532V5, 5, F256G6, 1', '2024-04-02', '2024-04-28', 5, 10, 909, 2);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (10, 'F256G6, 5, J532V5, 5', '2024-04-03', '2024-04-29', 19, 10, 910, 2);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (2, 'G843H5, 1, А112Т4, 1', '2023-09-28', '2024-04-21', 11, 7, 902, 1);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (6, 'А112Т4, 2, G843H5, 2', '2024-03-01', '2024-04-25', 15, 7, 906, 1);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (3, 'D325D4, 10, S432T5, 10', '2024-03-21', '2024-04-22', 2, 8, 903, 1);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (7, 'C346F5, 3, F256G6, 3', '2024-03-30', '2024-04-26', 3, 8, 907, 1);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (4, 'F325D4, 5, D325D4, 4', '2024-02-20', '2024-04-23', 11, 9, 904, 1);
INSERT INTO public."order" (order_number, order_item_number, order_date, delivery_date, id_pickup_point, id_user, id_receiving, id_status) VALUES (8, 'F325D4, 1, G432G6, 1', '2024-03-31', '2024-04-27', 19, 9, 908, 2);


--
-- TOC entry 5095 (class 0 OID 18900)
-- Dependencies: 228
-- Data for Name: pickup_point; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (1, '420151, г. Лесной, ул. Вишневая, 32');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (2, '125061, г. Лесной, ул. Подгорная, 8');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (3, '630370, г. Лесной, ул. Шоссейная, 24');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (4, '400562, г. Лесной, ул. Зеленая, 32');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (5, '614510, г. Лесной, ул. Маяковского, 47');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (6, '410542, г. Лесной, ул. Светлая, 46');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (7, '620839, г. Лесной, ул. Цветочная, 8');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (8, '443890, г. Лесной, ул. Коммунистическая, 1');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (9, '603379, г. Лесной, ул. Спортивная, 46');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (10, '603721, г. Лесной, ул. Гоголя, 41');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (11, '410172, г. Лесной, ул. Северная, 13');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (12, '614611, г. Лесной, ул. Молодежная, 50');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (13, '454311, г.Лесной, ул. Новая, 19');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (14, '660007, г.Лесной, ул. Октябрьская, 19');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (15, '603036, г. Лесной, ул. Садовая, 4');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (16, '394060, г.Лесной, ул. Фрунзе, 43');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (17, '410661, г. Лесной, ул. Школьная, 50');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (18, '625590, г. Лесной, ул. Коммунистическая, 20');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (19, '625683, г. Лесной, ул. 8 Марта');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (20, '450983, г.Лесной, ул. Комсомольская, 26');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (21, '394782, г. Лесной, ул. Чехова, 3');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (22, '603002, г. Лесной, ул. Дзержинского, 28');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (23, '450558, г. Лесной, ул. Набережная, 30');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (24, '344288, г. Лесной, ул. Чехова, 1');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (25, '614164, г.Лесной,  ул. Степная, 30');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (26, '394242, г. Лесной, ул. Коммунистическая, 43');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (27, '660540, г. Лесной, ул. Солнечная, 25');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (28, '125837, г. Лесной, ул. Шоссейная, 40');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (29, '125703, г. Лесной, ул. Партизанская, 49');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (30, '625283, г. Лесной, ул. Победы, 46');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (31, '614753, г. Лесной, ул. Полевая, 35');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (32, '426030, г. Лесной, ул. Маяковского, 44');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (33, '450375, г. Лесной ул. Клубная, 44');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (34, '625560, г. Лесной, ул. Некрасова, 12');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (35, '630201, г. Лесной, ул. Комсомольская, 17');
INSERT INTO public.pickup_point (id_pickup_point, pickup_point) VALUES (36, '190949, г. Лесной, ул. Мичурина, 26');


--
-- TOC entry 5099 (class 0 OID 18918)
-- Dependencies: 232
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_category (id_product_category, product_category) VALUES (1, 'Художественная литература');
INSERT INTO public.product_category (id_product_category, product_category) VALUES (2, 'Учебник для вузов');
INSERT INTO public.product_category (id_product_category, product_category) VALUES (3, 'Хрестоматия');
INSERT INTO public.product_category (id_product_category, product_category) VALUES (4, 'Учебное пособие');


--
-- TOC entry 5093 (class 0 OID 18891)
-- Dependencies: 226
-- Data for Name: provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provider (id_provider, provider) VALUES (1, 'Виктор Астафьев');
INSERT INTO public.provider (id_provider, provider) VALUES (2, 'Гилберт Кит Честертон');
INSERT INTO public.provider (id_provider, provider) VALUES (3, 'Кирилл Каланджи');
INSERT INTO public.provider (id_provider, provider) VALUES (4, 'Людмила Улицкая');
INSERT INTO public.provider (id_provider, provider) VALUES (5, 'Аркадий Гайдар');
INSERT INTO public.provider (id_provider, provider) VALUES (6, 'Юрий Родичев');
INSERT INTO public.provider (id_provider, provider) VALUES (7, 'Дэниел Джей Барретт');
INSERT INTO public.provider (id_provider, provider) VALUES (8, 'Шон Кэрролл');
INSERT INTO public.provider (id_provider, provider) VALUES (9, 'Яков Гордин');
INSERT INTO public.provider (id_provider, provider) VALUES (10, 'Иосиф Бродский');
INSERT INTO public.provider (id_provider, provider) VALUES (11, 'Янь Чуннянь Янь Чуннянь');
INSERT INTO public.provider (id_provider, provider) VALUES (12, 'Дмитрий Мережковский');
INSERT INTO public.provider (id_provider, provider) VALUES (13, 'Дмитрий Щербаков');
INSERT INTO public.provider (id_provider, provider) VALUES (14, 'Роджер Осборн, Дэн Стерджис');
INSERT INTO public.provider (id_provider, provider) VALUES (15, 'Любовь Беликова, Инна Ерофеева, Татьяна Шутова');
INSERT INTO public.provider (id_provider, provider) VALUES (16, 'Сергей Моргачев');
INSERT INTO public.provider (id_provider, provider) VALUES (17, 'Екатерина Габарта, Ирина Игнатьева');
INSERT INTO public.provider (id_provider, provider) VALUES (18, 'Татьяна Лопаткина, Софья Маннапова');


--
-- TOC entry 5091 (class 0 OID 18882)
-- Dependencies: 224
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (id_role, employee_role) VALUES (1, 'Администратор');
INSERT INTO public.role (id_role, employee_role) VALUES (2, 'Менеджер');
INSERT INTO public.role (id_role, employee_role) VALUES (3, 'Авторизированный клиент');


--
-- TOC entry 5097 (class 0 OID 18909)
-- Dependencies: 230
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.status (id_status, status) VALUES (1, 'Завершен');
INSERT INTO public.status (id_status, status) VALUES (2, 'Новый ');


--
-- TOC entry 5101 (class 0 OID 18927)
-- Dependencies: 234
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (1, 1, 'Никифорова Анна Семеновна', '94d5ous@gmail.com', 'uzWC67');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (2, 1, 'Стелина Евгения Петровна', 'uth4iz@mail.com', '2L6KZG');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (3, 1, 'Михайлюк Анна Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (4, 2, 'Ситдикова Елена Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (5, 2, 'Ворсин Петр Евгеньевич', '1qz4kw@mail.com', 'gynQMT');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (6, 2, 'Старикова Елена Павловна', '4np6se@mail.com', 'AtnDjr');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (7, 3, 'Никифорова Весения Николаевна', 'yzls62@outlook.com', 'JlFRCZ');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (8, 3, 'Сазонов Руслан Германович', '1diph5e@tutanota.com', '8ntwUp');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (9, 3, 'Одинцов Серафим Артёмович', 'tjde7c@yahoo.com', 'YOyhfR');
INSERT INTO public."user" (id_user, id_role, fio, login, password) VALUES (10, 3, 'Степанов Михаил Артёмович', 'wpmrc3do@tutanota.com', 'RSbvHv');


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 219
-- Name: manufacture_id_manufacture_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacture_id_manufacture_seq', 1, false);


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 221
-- Name: measure_id_measure_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.measure_id_measure_seq', 1, false);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 235
-- Name: nomenclature_id_nomenclature_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nomenclature_id_nomenclature_seq', 1, false);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 237
-- Name: order_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_order_number_seq', 1, false);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 227
-- Name: pickup_point_id_pickup_point_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pickup_point_id_pickup_point_seq', 1, false);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_category_id_product_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_id_product_category_seq', 1, false);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 225
-- Name: provider_id_provider_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provider_id_provider_seq', 1, false);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 223
-- Name: role_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_role_seq', 1, false);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 229
-- Name: status_id_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_status_seq', 1, false);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_user_seq', 1, false);


--
-- TOC entry 4912 (class 2606 OID 18871)
-- Name: manufacture manufacture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacture
    ADD CONSTRAINT manufacture_pkey PRIMARY KEY (id_manufacture);


--
-- TOC entry 4914 (class 2606 OID 18880)
-- Name: measure measure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measure
    ADD CONSTRAINT measure_pkey PRIMARY KEY (id_measure);


--
-- TOC entry 4928 (class 2606 OID 18961)
-- Name: nomenclature nomenclature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT nomenclature_pkey PRIMARY KEY (id_nomenclature);


--
-- TOC entry 4930 (class 2606 OID 18996)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_number);


--
-- TOC entry 4920 (class 2606 OID 18907)
-- Name: pickup_point pickup_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_point
    ADD CONSTRAINT pickup_point_pkey PRIMARY KEY (id_pickup_point);


--
-- TOC entry 4924 (class 2606 OID 18925)
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id_product_category);


--
-- TOC entry 4918 (class 2606 OID 18898)
-- Name: provider provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id_provider);


--
-- TOC entry 4916 (class 2606 OID 18889)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);


--
-- TOC entry 4922 (class 2606 OID 18916)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id_status);


--
-- TOC entry 4926 (class 2606 OID 18937)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4932 (class 2606 OID 18967)
-- Name: nomenclature nomenclature_id_category_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT nomenclature_id_category_product_fkey FOREIGN KEY (id_category_product) REFERENCES public.product_category(id_product_category);


--
-- TOC entry 4933 (class 2606 OID 18977)
-- Name: nomenclature nomenclature_id_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT nomenclature_id_manufacturer_fkey FOREIGN KEY (id_manufacturer) REFERENCES public.manufacture(id_manufacture);


--
-- TOC entry 4934 (class 2606 OID 18962)
-- Name: nomenclature nomenclature_id_measure_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT nomenclature_id_measure_fkey FOREIGN KEY (id_measure) REFERENCES public.measure(id_measure);


--
-- TOC entry 4935 (class 2606 OID 18972)
-- Name: nomenclature nomenclature_id_provider_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT nomenclature_id_provider_fkey FOREIGN KEY (id_provider) REFERENCES public.provider(id_provider);


--
-- TOC entry 4936 (class 2606 OID 18997)
-- Name: order order_id_pickup_point_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_id_pickup_point_fkey FOREIGN KEY (id_pickup_point) REFERENCES public.pickup_point(id_pickup_point);


--
-- TOC entry 4937 (class 2606 OID 19007)
-- Name: order order_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_id_status_fkey FOREIGN KEY (id_status) REFERENCES public.status(id_status);


--
-- TOC entry 4938 (class 2606 OID 19002)
-- Name: order order_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user);


--
-- TOC entry 4931 (class 2606 OID 18938)
-- Name: user user_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.role(id_role);


-- Completed on 2026-11-22 15:53:26

--
-- PostgreSQL database dump complete
--

\unrestrict allVi0380guWppixG4RVq1gsYFQZGAAcqXOTJ9aKLg0JFSUfzCPhE6A0M3EQjlp

