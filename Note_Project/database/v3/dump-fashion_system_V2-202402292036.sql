--
-- PostgreSQL database cluster dump
--

-- Started on 2024-02-29 20:36:05

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-29 20:36:05

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

-- Completed on 2024-02-29 20:36:05

--
-- PostgreSQL database dump complete
--

--
-- Database "fashion_system_V2" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-29 20:36:05

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

--
-- TOC entry 4215 (class 1262 OID 17458)
-- Name: fashion_system_V2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "fashion_system_V2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "fashion_system_V2" OWNER TO postgres;

\connect "fashion_system_V2"

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

--
-- TOC entry 323 (class 1255 OID 17459)
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 17460)
-- Name: account_admin_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_admin_action (
    id integer NOT NULL,
    administration_id smallint NOT NULL,
    action_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.account_admin_action OWNER TO postgres;

--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE account_admin_action; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.account_admin_action IS 'bảng trung gian tài khoản được gắn cho các quyền';


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN account_admin_action.administration_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_admin_action.administration_id IS 'mã quyền';


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN account_admin_action.action_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_admin_action.action_id IS 'mã thao tác';


--
-- TOC entry 215 (class 1259 OID 17466)
-- Name: account_admin_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_admin_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_admin_action_id_seq OWNER TO postgres;

--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 215
-- Name: account_admin_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_admin_action_id_seq OWNED BY public.account_admin_action.id;


--
-- TOC entry 216 (class 1259 OID 17474)
-- Name: action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.action OWNER TO postgres;

--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE action; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.action IS 'tên các quyền như thêm , sửa , xóa các trường';


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN action.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.action.name IS 'tên quyền';


--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN action.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.action.content IS 'nội dung';


--
-- TOC entry 217 (class 1259 OID 17482)
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_id_seq OWNER TO postgres;

--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 217
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- TOC entry 218 (class 1259 OID 17483)
-- Name: administration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administration (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    code character varying(20)
);


ALTER TABLE public.administration OWNER TO postgres;

--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE administration; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.administration IS 'tên cấp độ tài khoản';


--
-- TOC entry 4225 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN administration.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.administration.name IS 'tên';


--
-- TOC entry 219 (class 1259 OID 17489)
-- Name: administration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administration_id_seq OWNER TO postgres;

--
-- TOC entry 4226 (class 0 OID 0)
-- Dependencies: 219
-- Name: administration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administration_id_seq OWNED BY public.administration.id;


--
-- TOC entry 220 (class 1259 OID 17490)
-- Name: admins_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins_notification (
    id integer NOT NULL,
    type_notification smallint NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(5000) NOT NULL,
    watched boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.admins_notification OWNER TO postgres;

--
-- TOC entry 4227 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE admins_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.admins_notification IS 'thông báo cho nhân viên';


--
-- TOC entry 4228 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN admins_notification.type_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.admins_notification.type_notification IS 'loại thông báo';


--
-- TOC entry 4229 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN admins_notification.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.admins_notification.content IS 'nội dung thông báo';


--
-- TOC entry 221 (class 1259 OID 17499)
-- Name: admins_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4230 (class 0 OID 0)
-- Dependencies: 221
-- Name: admins_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_notification_id_seq OWNED BY public.admins_notification.id;


--
-- TOC entry 222 (class 1259 OID 17500)
-- Name: ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ads (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_ads_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    sub_menu_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    content character varying(500),
    priority integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.ads OWNER TO postgres;

--
-- TOC entry 4231 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE ads; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.ads IS 'quảng cáo';


--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN ads.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.name IS 'tên quảng cáo';


--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN ads.event_ads_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.event_ads_id IS 'id sự kiện đang chạy';


--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN ads.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.staff_id IS 'mã nhân viên';


--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN ads.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.sub_menu_id IS 'thuộc sub menu nào';


--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN ads.priority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.priority IS 'vị trí ưu tiên';


--
-- TOC entry 223 (class 1259 OID 17508)
-- Name: ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ads_id_seq OWNER TO postgres;

--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 223
-- Name: ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;


--
-- TOC entry 224 (class 1259 OID 17509)
-- Name: api_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_weather (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    longitude character varying(50) NOT NULL,
    latityde character varying(50) NOT NULL,
    content json NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.api_weather OWNER TO postgres;

--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE api_weather; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.api_weather IS 'table api thời tiết';


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN api_weather.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.api_weather.name IS 'tên api';


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN api_weather.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.api_weather.content IS 'thông tin ';


--
-- TOC entry 225 (class 1259 OID 17517)
-- Name: api_weather_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_weather_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_weather_id_seq OWNER TO postgres;

--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 225
-- Name: api_weather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_weather_id_seq OWNED BY public.api_weather.id;


--
-- TOC entry 226 (class 1259 OID 17518)
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill (
    id integer NOT NULL,
    code_bill character varying(50) NOT NULL,
    staff_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    branch_id smallint NOT NULL,
    payment_methods_id smallint NOT NULL,
    shipping_method_id smallint NOT NULL,
    transfer_providers_id smallint NOT NULL,
    total_products smallint NOT NULL,
    initial_amount integer NOT NULL,
    actual_amount integer NOT NULL,
    giftcode_id smallint,
    successful_payment boolean DEFAULT false,
    note character varying(500),
    impact_number smallint DEFAULT '0'::smallint,
    report_ship boolean DEFAULT false,
    queue_bill boolean DEFAULT true,
    note_report character varying(500),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bill IS 'hóa đơn';


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.code_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.code_bill IS 'mã hóa đơn hiển thị';


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.staff_id IS 'mã nhân viên tạo phiếu';


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.customers_id IS 'phiếu của kh';


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.branch_id IS 'phiệu được tạo ở chi  nhánh';


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.payment_methods_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.payment_methods_id IS 'mã phương thức thanh toán';


--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.shipping_method_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.shipping_method_id IS 'mã phương thức nhận hàng';


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.transfer_providers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.transfer_providers_id IS 'nếu chọn hình thức nhận hàng online
đây là cột mã nhà cung cấp dịch vụ vận chuyển';


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.total_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.total_products IS 'tổng số sp';


--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.initial_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.initial_amount IS 'số tiền ban đầu';


--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.actual_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.actual_amount IS 'số tiền thực tế';


--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.giftcode_id IS 'id mã giảm giá';


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.successful_payment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.successful_payment IS 'đã thanh toán ?';


--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.impact_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.impact_number IS 'số lần chỉnh sửa';


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.report_ship; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.report_ship IS 'đơn bị tố cáo , cảnh báo';


--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN bill.queue_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.queue_bill IS 'đơn đang ở hàng đợi chưa đc duyệt';


--
-- TOC entry 227 (class 1259 OID 17530)
-- Name: bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bill_id_seq OWNER TO postgres;

--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 227
-- Name: bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_id_seq OWNED BY public.bill.id;


--
-- TOC entry 228 (class 1259 OID 17531)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    hotline character varying(50) NOT NULL,
    manage character varying(50) NOT NULL,
    working_time character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE branch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.branch IS 'tên các chi nhánh';


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN branch.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.name IS 'tên chi nhánh';


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN branch.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.address IS 'địa chỉ';


--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN branch.manage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.manage IS 'tên quản lý';


--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN branch.working_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.working_time IS 'thời gian làm việc';


--
-- TOC entry 229 (class 1259 OID 17539)
-- Name: branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branch_id_seq OWNER TO postgres;

--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 229
-- Name: branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_id_seq OWNED BY public.branch.id;


--
-- TOC entry 230 (class 1259 OID 17540)
-- Name: comments_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments_news (
    id integer NOT NULL,
    news_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    comment_id smallint NOT NULL,
    comment character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments_news OWNER TO postgres;

--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE comments_news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.comments_news IS 'bình luận tin tức';


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN comments_news.news_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.news_id IS 'thuộc tin tức nào  lấy theo id tin tức';


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN comments_news.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.customers_id IS 'id kh bình luận';


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN comments_news.comment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.comment_id IS 'thuộc id của bình luận nào
nếu = id chính nó thì là comment_main
nếu !=id chính nó thì nó là sub_comment (đang trả lời 1 comment khác)';


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN comments_news.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.comment IS 'nội dung bình luận';


--
-- TOC entry 231 (class 1259 OID 17548)
-- Name: comments_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_news_id_seq OWNER TO postgres;

--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 231
-- Name: comments_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_news_id_seq OWNED BY public.comments_news.id;


--
-- TOC entry 232 (class 1259 OID 17549)
-- Name: comments_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments_product (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    comments_product_id smallint NOT NULL,
    vote smallint DEFAULT 5,
    comment character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments_product OWNER TO postgres;

--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE comments_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.comments_product IS 'bình luận về sản phẩm';


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_product.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.product_id IS 'id sản phẩm';


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_product.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.customers_id IS 'id kh bình luận';


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_product.comments_product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.comments_product_id IS 'thuộc id của bình luận nào';


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_product.vote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.vote IS 'điểm vote cho sp';


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_product.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.comment IS 'nội dung bl';


--
-- TOC entry 233 (class 1259 OID 17558)
-- Name: comments_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_product_id_seq OWNER TO postgres;

--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 233
-- Name: comments_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_product_id_seq OWNED BY public.comments_product.id;


--
-- TOC entry 234 (class 1259 OID 17559)
-- Name: contact_support; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_support (
    id integer NOT NULL,
    logo character varying(200) NOT NULL,
    link character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contact_support OWNER TO postgres;

--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE contact_support; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.contact_support IS 'các tiện ích tích hợp ở góc phải màn hình : zalo , fb . chatonline';


--
-- TOC entry 235 (class 1259 OID 17565)
-- Name: contact_support_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_support_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_support_id_seq OWNER TO postgres;

--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 235
-- Name: contact_support_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_support_id_seq OWNED BY public.contact_support.id;


--
-- TOC entry 236 (class 1259 OID 17566)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    rank_id smallint DEFAULT 0 NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    address character varying(200) DEFAULT NULL::character varying,
    phone_number character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    birthday date,
    sex boolean,
    accumulated_points smallint DEFAULT '1'::smallint,
    number_ban smallint DEFAULT '0'::smallint,
    potential boolean DEFAULT true,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    password character varying(20) NOT NULL,
    remember_token boolean DEFAULT false,
    refresh_token character varying(500),
    issued_at timestamp without time zone,
    expired_time timestamp without time zone
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE customers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.customers IS 'ds kh';


--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.rank_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.rank_id IS 'cấp độ kh';


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.first_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.first_name IS 'tên';


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.last_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.last_name IS 'họ';


--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.address IS 'địa chỉ';


--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.phone_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.phone_number IS 'số điện thoại';


--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.email IS 'email';


--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.birthday; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.birthday IS 'sinh ngày';


--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.sex IS 'giới tính 0 : nữ 1: nam';


--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.accumulated_points; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.accumulated_points IS 'số điểm tích để lên rank';


--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.number_ban; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.number_ban IS 'số lần bị band';


--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.potential; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.potential IS 'là kh tiềm năng hay ko , nếu là kh tiềm năng thì đồng nghĩa chưa mua hàng mà chỉ mới tạo tk';


--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.password IS 'mât khẩu';


--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.remember_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.remember_token IS 'ghi nhớ mât  khẩu';


--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.refresh_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.refresh_token IS 'khóa';


--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.issued_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.issued_at IS 'thời gian phát hành khóa';


--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN customers.expired_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.expired_time IS 'thời gian hết han khóa';


--
-- TOC entry 237 (class 1259 OID 17579)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 237
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 238 (class 1259 OID 17580)
-- Name: customers_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_notification (
    id integer NOT NULL,
    type_notification smallint NOT NULL,
    customer_id smallint NOT NULL,
    content character varying(5000) NOT NULL,
    watched boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers_notification OWNER TO postgres;

--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers_notification.type_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers_notification.type_notification IS 'loại thông báo';


--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers_notification.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers_notification.customer_id IS 'mã khách hàng';


--
-- TOC entry 239 (class 1259 OID 17589)
-- Name: customers_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 239
-- Name: customers_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_notification_id_seq OWNED BY public.customers_notification.id;


--
-- TOC entry 240 (class 1259 OID 17590)
-- Name: depot_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depot_ticket (
    id integer NOT NULL,
    code_ticket character varying(200) NOT NULL,
    ticket_id smallint NOT NULL,
    staff_id_export smallint NOT NULL,
    staff_id_receive smallint NOT NULL,
    product_id smallint NOT NULL,
    product_number integer NOT NULL,
    total_money integer NOT NULL,
    note character varying(500),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.depot_ticket OWNER TO postgres;

--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN depot_ticket.code_ticket; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.code_ticket IS 'mã phiếu';


--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN depot_ticket.ticket_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.ticket_id IS 'mã loại phiếu';


--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN depot_ticket.staff_id_export; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.staff_id_export IS 'nv xuất';


--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN depot_ticket.staff_id_receive; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.staff_id_receive IS 'nv nhập';


--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN depot_ticket.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.product_id IS 'id sản phẩm';


--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN depot_ticket.product_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.product_number IS 'số lượng sp / nhập hoặc xuất';


--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN depot_ticket.total_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.total_money IS 'số tiền';


--
-- TOC entry 241 (class 1259 OID 17598)
-- Name: depot_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.depot_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.depot_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 241
-- Name: depot_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.depot_ticket_id_seq OWNED BY public.depot_ticket.id;


--
-- TOC entry 242 (class 1259 OID 17599)
-- Name: event_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_ads (
    id integer NOT NULL,
    name_event character varying(50) NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(500),
    note character varying(500),
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.event_ads OWNER TO postgres;

--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE event_ads; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.event_ads IS 'tên sự kiện chạy quảng cáo';


--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN event_ads.name_event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.name_event IS 'tên sk';


--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN event_ads.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.staff_id IS 'nv tạo sk';


--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN event_ads.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.content IS 'nội dung sk';


--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN event_ads.start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.start_time IS 'time bắt đầu sk';


--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN event_ads.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.end_time IS 'time kết thúc sk';


--
-- TOC entry 243 (class 1259 OID 17607)
-- Name: event_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_ads_id_seq OWNER TO postgres;

--
-- TOC entry 4315 (class 0 OID 0)
-- Dependencies: 243
-- Name: event_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_ads_id_seq OWNED BY public.event_ads.id;


--
-- TOC entry 244 (class 1259 OID 17608)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17614)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 4316 (class 0 OID 0)
-- Dependencies: 245
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 246 (class 1259 OID 17615)
-- Name: giftcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.giftcode (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_ads_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(500),
    img character varying(200),
    discount character varying(50) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    number_of_participants smallint NOT NULL,
    used smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.giftcode OWNER TO postgres;

--
-- TOC entry 4317 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE giftcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.giftcode IS 'tên các sự kiện chạy mã code';


--
-- TOC entry 4318 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.name IS 'tên sk chạy code';


--
-- TOC entry 4319 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.event_ads_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.event_ads_id IS 'chạy theo sự sk ads nào';


--
-- TOC entry 4320 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.staff_id IS 'nv tạo';


--
-- TOC entry 4321 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.content IS 'nội dung';


--
-- TOC entry 4322 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.discount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.discount IS 'số giảm giá (% hoặc trực tiêp tiền)';


--
-- TOC entry 4323 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.start_time IS 'thời gian bắt đầu';


--
-- TOC entry 4324 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.end_time IS 'thời gian kết thúc';


--
-- TOC entry 4325 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.number_of_participants; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.number_of_participants IS 'số lượt dùng';


--
-- TOC entry 4326 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN giftcode.used; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.used IS 'số lượt đã đc sử dụng';


--
-- TOC entry 247 (class 1259 OID 17623)
-- Name: giftcode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.giftcode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.giftcode_id_seq OWNER TO postgres;

--
-- TOC entry 4327 (class 0 OID 0)
-- Dependencies: 247
-- Name: giftcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.giftcode_id_seq OWNED BY public.giftcode.id;


--
-- TOC entry 248 (class 1259 OID 17624)
-- Name: history_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_payment (
    id integer NOT NULL,
    payment_method_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    transfer_amount integer DEFAULT 0 NOT NULL,
    cash_amount integer DEFAULT 0 NOT NULL,
    note character varying(200),
    bill_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.history_payment OWNER TO postgres;

--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE history_payment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.history_payment IS 'lịch sử thanh toán';


--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN history_payment.payment_method_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.payment_method_id IS 'phương thức thanh toán';


--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN history_payment.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.customers_id IS 'mã kh';


--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN history_payment.transfer_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.transfer_amount IS 'tiền chuyển khoản';


--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN history_payment.cash_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.cash_amount IS 'tiền mặt';


--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN history_payment.bill_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.bill_id IS 'theo hoa đơn id';


--
-- TOC entry 249 (class 1259 OID 17632)
-- Name: history_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_payment_id_seq OWNER TO postgres;

--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 249
-- Name: history_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_payment_id_seq OWNED BY public.history_payment.id;


--
-- TOC entry 250 (class 1259 OID 17633)
-- Name: img_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.img_news (
    id integer NOT NULL,
    name_img character varying(50) NOT NULL,
    news_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    location smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.img_news OWNER TO postgres;

--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN img_news.name_img; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.name_img IS 'tên ảnh';


--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN img_news.news_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.news_id IS 'thuộc tin tức';


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN img_news.location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.location IS 'vị trí';


--
-- TOC entry 251 (class 1259 OID 17639)
-- Name: img_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.img_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.img_news_id_seq OWNER TO postgres;

--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 251
-- Name: img_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.img_news_id_seq OWNED BY public.img_news.id;


--
-- TOC entry 252 (class 1259 OID 17640)
-- Name: img_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.img_products (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    display_order smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.img_products OWNER TO postgres;

--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE img_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.img_products IS 'ảnh sản phảm';


--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN img_products.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.product_id IS 'thuộc sản phẩm nào';


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN img_products.img; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.img IS 'ảnh';


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN img_products.display_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.display_order IS 'ưu tiên hiển thị';


--
-- TOC entry 253 (class 1259 OID 17646)
-- Name: img_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.img_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.img_products_id_seq OWNER TO postgres;

--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 253
-- Name: img_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.img_products_id_seq OWNED BY public.img_products.id;


--
-- TOC entry 254 (class 1259 OID 17647)
-- Name: intermediary_account_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intermediary_account_service (
    id integer NOT NULL,
    servive_name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.intermediary_account_service OWNER TO postgres;

--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE intermediary_account_service; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.intermediary_account_service IS 'tên các bên dịch vụ tài khoản thứ 3 : gg, git , zalo ,..';


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN intermediary_account_service.servive_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.intermediary_account_service.servive_name IS 'tên dv';


--
-- TOC entry 255 (class 1259 OID 17653)
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intermediary_account_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intermediary_account_service_id_seq OWNER TO postgres;

--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 255
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intermediary_account_service_id_seq OWNED BY public.intermediary_account_service.id;


--
-- TOC entry 256 (class 1259 OID 17654)
-- Name: list_codes_received; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_codes_received (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    giftcode_id smallint NOT NULL,
    is_expired boolean DEFAULT true,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.list_codes_received OWNER TO postgres;

--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE list_codes_received; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.list_codes_received IS 'ds kh nhận dc những code';


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN list_codes_received.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.customers_id IS 'mã kh';


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN list_codes_received.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.giftcode_id IS 'mã code';


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN list_codes_received.is_expired; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.is_expired IS 'đã dc sử dung';


--
-- TOC entry 257 (class 1259 OID 17661)
-- Name: list_codes_received_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_codes_received_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_codes_received_id_seq OWNER TO postgres;

--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 257
-- Name: list_codes_received_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_codes_received_id_seq OWNED BY public.list_codes_received.id;


--
-- TOC entry 258 (class 1259 OID 17662)
-- Name: list_giftcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_giftcodes (
    id integer NOT NULL,
    giftcode_id smallint NOT NULL,
    code character varying(20) NOT NULL,
    already_received boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.list_giftcodes OWNER TO postgres;

--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN list_giftcodes.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.giftcode_id IS 'thuộc sk code nào';


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN list_giftcodes.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.code IS 'mã code';


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN list_giftcodes.already_received; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.already_received IS 'đã có người nhận hay chưa';


--
-- TOC entry 259 (class 1259 OID 17669)
-- Name: list_giftcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_giftcodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_giftcodes_id_seq OWNER TO postgres;

--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 259
-- Name: list_giftcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_giftcodes_id_seq OWNED BY public.list_giftcodes.id;


--
-- TOC entry 260 (class 1259 OID 17670)
-- Name: list_products_by_bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_products_by_bill (
    id integer NOT NULL,
    bill_id smallint NOT NULL,
    products_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    quantity smallint,
    amount_of_money integer
);


ALTER TABLE public.list_products_by_bill OWNER TO postgres;

--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE list_products_by_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.list_products_by_bill IS 'ds sản phẩm  được mua theo hóa đơn';


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN list_products_by_bill.bill_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.bill_id IS 'mã hóa đơn';


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN list_products_by_bill.products_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.products_id IS 'mã sp';


--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN list_products_by_bill.quantity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.quantity IS 'số lượng sản phẩm';


--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN list_products_by_bill.amount_of_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.amount_of_money IS 'số tiền của sản phẩm';


--
-- TOC entry 261 (class 1259 OID 17676)
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_products_by_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_products_by_bill_id_seq OWNER TO postgres;

--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 261
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_products_by_bill_id_seq OWNED BY public.list_products_by_bill.id;


--
-- TOC entry 262 (class 1259 OID 17677)
-- Name: log_deletes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_deletes (
    id integer NOT NULL,
    type_delete_id smallint NOT NULL,
    content character varying(200) NOT NULL,
    internal boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_deletes OWNER TO postgres;

--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE log_deletes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.log_deletes IS 'lịch sử xóa';


--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN log_deletes.type_delete_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.log_deletes.type_delete_id IS 'loại xóa';


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN log_deletes.internal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.log_deletes.internal IS 'thuộc nội bộ hay ko';


--
-- TOC entry 263 (class 1259 OID 17684)
-- Name: log_deletes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_deletes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_deletes_id_seq OWNER TO postgres;

--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 263
-- Name: log_deletes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_deletes_id_seq OWNED BY public.log_deletes.id;


--
-- TOC entry 264 (class 1259 OID 17685)
-- Name: log_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_login (
    id integer NOT NULL,
    user_login character varying(50) NOT NULL,
    type smallint NOT NULL,
    content character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_login OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 17691)
-- Name: log_login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_login_id_seq OWNER TO postgres;

--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 265
-- Name: log_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_login_id_seq OWNED BY public.log_login.id;


--
-- TOC entry 266 (class 1259 OID 17692)
-- Name: log_updates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_updates (
    id integer NOT NULL,
    type_update_id smallint NOT NULL,
    content character varying(200) NOT NULL,
    internal boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_updates OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 17699)
-- Name: log_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_updates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_updates_id_seq OWNER TO postgres;

--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 267
-- Name: log_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_updates_id_seq OWNED BY public.log_updates.id;


--
-- TOC entry 268 (class 1259 OID 17700)
-- Name: menu_main; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_main (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(50),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "order" integer
);


ALTER TABLE public.menu_main OWNER TO postgres;

--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE menu_main; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.menu_main IS 'menu chính';


--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN menu_main."order"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.menu_main."order" IS 'thứ tư';


--
-- TOC entry 269 (class 1259 OID 17707)
-- Name: menu_main_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_main_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_main_id_seq OWNER TO postgres;

--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 269
-- Name: menu_main_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_main_id_seq OWNED BY public.menu_main.id;


--
-- TOC entry 270 (class 1259 OID 17708)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 17711)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 271
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 272 (class 1259 OID 17712)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    name_news character varying(50) NOT NULL,
    sub_menu_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    img_main character varying(200) NOT NULL,
    content text NOT NULL,
    tag character varying(100) NOT NULL,
    views smallint DEFAULT 0,
    likes smallint DEFAULT 0,
    comments smallint DEFAULT 0,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.news IS 'tin tức';


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN news.name_news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.name_news IS 'tên tin';


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN news.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.sub_menu_id IS 'thuộc tin tức nào';


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN news.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.staff_id IS 'nhân viên đnăg';


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN news.views; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.views IS 'lượt xem';


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN news.likes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.likes IS 'số like';


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN news.comments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.comments IS 'lượt comment';


--
-- TOC entry 273 (class 1259 OID 17723)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 273
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 274 (class 1259 OID 17724)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 17729)
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE payment_methods; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.payment_methods IS 'tên các phương thức thanh toán';


--
-- TOC entry 276 (class 1259 OID 17735)
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_id_seq OWNER TO postgres;

--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 276
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;


--
-- TOC entry 277 (class 1259 OID 17736)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 17741)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 278
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 279 (class 1259 OID 17742)
-- Name: policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    img character varying(200) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.policy OWNER TO postgres;

--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE policy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.policy IS 'tên các dịch vụ , đặc quyền  cho sản phẩm';


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN policy.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.staff_id IS 'nv tạo dịch vụ';


--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN policy.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.name IS 'tên dv';


--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN policy.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.content IS 'nội dung quyền';


--
-- TOC entry 280 (class 1259 OID 17750)
-- Name: policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.policy_id_seq OWNER TO postgres;

--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 280
-- Name: policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.policy_id_seq OWNED BY public.policy.id;


--
-- TOC entry 281 (class 1259 OID 17751)
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE "position"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."position" IS 'chức vụ nhân viên';


--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "position".name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."position".name IS 'tên';


--
-- TOC entry 282 (class 1259 OID 17759)
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.position_id_seq OWNER TO postgres;

--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 282
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;


--
-- TOC entry 283 (class 1259 OID 17760)
-- Name: price_difference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_difference (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    product_id smallint NOT NULL,
    import_price integer NOT NULL,
    export_price integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.price_difference OWNER TO postgres;

--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE price_difference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.price_difference IS 'bảng lưu sự chênh lệnh giá';


--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN price_difference.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.staff_id IS 'nhân viên tác động';


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN price_difference.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.product_id IS 'sảm phẩm';


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN price_difference.import_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.import_price IS 'số tiền nhập';


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN price_difference.export_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.export_price IS 'bán ra';


--
-- TOC entry 284 (class 1259 OID 17766)
-- Name: price_difference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_difference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_difference_id_seq OWNER TO postgres;

--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 284
-- Name: price_difference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_difference_id_seq OWNED BY public.price_difference.id;


--
-- TOC entry 285 (class 1259 OID 17767)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    sub_menu_id smallint NOT NULL,
    code_products character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    img_main character varying(50) NOT NULL,
    origin character varying(50) NOT NULL,
    color character varying[] NOT NULL,
    size character varying[] NOT NULL,
    into_money integer NOT NULL,
    vote double precision DEFAULT '0'::double precision,
    intro character varying(500) NOT NULL,
    number_of_products_sold integer NOT NULL,
    remaining_products integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_promotion boolean
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.products IS 'ds sp';


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.sub_menu_id IS 'thuộc submenu nào';


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.code_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.code_products IS 'mã sp';


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.name IS 'tên sp';


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.origin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.origin IS 'nguồn gôc sp';


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.color; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.color IS 'màu sắc sp';


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.size IS 'các cỡ sp';


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.into_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.into_money IS 'tiền cho sp';


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.vote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.vote IS 'lượt vote';


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.number_of_products_sold; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.number_of_products_sold IS 'số lượng sản phẩm bán dc';


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.remaining_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.remaining_products IS 'sản phẩm còn lại';


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN products.is_promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.is_promotion IS 'đang trong chương trình giảm giá ko';


--
-- TOC entry 286 (class 1259 OID 17776)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 286
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 287 (class 1259 OID 17777)
-- Name: products_in_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_in_stock (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    warehouse_id smallint NOT NULL,
    remaining smallint NOT NULL,
    import_price integer NOT NULL,
    export_price integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products_in_stock OWNER TO postgres;

--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE products_in_stock; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.products_in_stock IS 'sản phẩmtrong kho';


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products_in_stock.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.product_id IS 'tên sp';


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products_in_stock.warehouse_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.warehouse_id IS 'thuộc kho';


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products_in_stock.remaining; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.remaining IS 'số sản phẩm còn';


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products_in_stock.import_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.import_price IS 'giá nhập';


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products_in_stock.export_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.export_price IS 'giá bán';


--
-- TOC entry 288 (class 1259 OID 17783)
-- Name: products_in_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_in_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_in_stock_id_seq OWNER TO postgres;

--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 288
-- Name: products_in_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_in_stock_id_seq OWNED BY public.products_in_stock.id;


--
-- TOC entry 289 (class 1259 OID 17784)
-- Name: promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    type_promotion_id smallint NOT NULL,
    endtime date NOT NULL,
    starttime date NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.promotion OWNER TO postgres;

--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN promotion.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.product_id IS 'sản phẩm dc dùng';


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN promotion.type_promotion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.type_promotion_id IS 'loại km';


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN promotion.endtime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.endtime IS 'thời gian kết thúc';


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN promotion.starttime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.starttime IS 'thời gian bắt đầu';


--
-- TOC entry 290 (class 1259 OID 17790)
-- Name: promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_id_seq OWNER TO postgres;

--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 290
-- Name: promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_id_seq OWNED BY public.promotion.id;


--
-- TOC entry 291 (class 1259 OID 17791)
-- Name: rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rank (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    detail character varying(200) NOT NULL,
    icon character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    score smallint
);


ALTER TABLE public.rank OWNER TO postgres;

--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE rank; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.rank IS 'tên các cấp rank';


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN rank.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.name IS 'tên';


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN rank.detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.detail IS 'chi tiết';


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN rank.score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.score IS 'số điểm để lên cấp rank';


--
-- TOC entry 292 (class 1259 OID 17797)
-- Name: rank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rank_id_seq OWNER TO postgres;

--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 292
-- Name: rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rank_id_seq OWNED BY public.rank.id;


--
-- TOC entry 293 (class 1259 OID 17798)
-- Name: report_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_source (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.report_source OWNER TO postgres;

--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE report_source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.report_source IS 'tên nguồn tố cáo';


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN report_source.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_source.name IS 'tên';


--
-- TOC entry 294 (class 1259 OID 17806)
-- Name: report_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_source_id_seq OWNER TO postgres;

--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 294
-- Name: report_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_source_id_seq OWNED BY public.report_source.id;


--
-- TOC entry 295 (class 1259 OID 17807)
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    sub_report smallint NOT NULL,
    type_report_id smallint NOT NULL,
    is_processed boolean DEFAULT false,
    report_source_id smallint NOT NULL,
    content character varying(1000) NOT NULL,
    feed_back_content character varying(1000),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    sub boolean DEFAULT false
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE reports; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.reports IS 'các phiếu tố cáo';


--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.customers_id IS 'kh tố';


--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.staff_id IS 'nhân viên nhận vào phản hồi';


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.sub_report; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.sub_report IS 'là sub reporrt ko';


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.type_report_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.type_report_id IS 'loại tố cáo';


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.is_processed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.is_processed IS 'đã dc giải quyêt xong chưa';


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.report_source_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.report_source_id IS 'mã nguồn tố cáo';


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.content IS 'nội dung kh';


--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.feed_back_content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.feed_back_content IS 'nội dung nv';


--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN reports.sub; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.sub IS 'có phải là fback con ko';


--
-- TOC entry 296 (class 1259 OID 17817)
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO postgres;

--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 296
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- TOC entry 297 (class 1259 OID 17818)
-- Name: service_by_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_by_product (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    policy_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.service_by_product OWNER TO postgres;

--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 297
-- Name: TABLE service_by_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.service_by_product IS 'các sản phảm được hưởng các dịch vụ';


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN service_by_product.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_by_product.product_id IS 'tên sp';


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN service_by_product.policy_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_by_product.policy_id IS 'tên dv';


--
-- TOC entry 298 (class 1259 OID 17824)
-- Name: service_by_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_by_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_by_product_id_seq OWNER TO postgres;

--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 298
-- Name: service_by_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_by_product_id_seq OWNED BY public.service_by_product.id;


--
-- TOC entry 299 (class 1259 OID 17825)
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.shipping_method OWNER TO postgres;

--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 299
-- Name: TABLE shipping_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.shipping_method IS 'tên các phương thức nhận hàng : ở cửa hàng , ở chi nhánh khác ,  giao hàng';


--
-- TOC entry 300 (class 1259 OID 17831)
-- Name: shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_method_id_seq OWNER TO postgres;

--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 300
-- Name: shipping_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_method_id_seq OWNED BY public.shipping_method.id;


--
-- TOC entry 301 (class 1259 OID 17832)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    code_staff character varying(50) NOT NULL,
    position_id smallint NOT NULL,
    branch_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    phone_number character varying(50) NOT NULL,
    email character varying(50),
    birthday date,
    sex boolean,
    img character varying(200),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    background character varying(200),
    active boolean DEFAULT false NOT NULL,
    img_drive_google character varying(500),
    background_drive_google character varying(500)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE staff; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.staff IS 'ds nhân viên';


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN staff.code_staff; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.code_staff IS 'mã đinh danh nhân viên';


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN staff.position_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.position_id IS 'id chức vụ';


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN staff.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.branch_id IS 'id chi nhánh';


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN staff.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.name IS 'tên nhân viên';


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN staff.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.address IS 'địa chỉ nhân viên';


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN staff.phone_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.phone_number IS 'sdt';


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN staff.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.sex IS 'giới tính 0 : nữ 1: nam';


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN staff.active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.active IS 'nhân viên đã được kích hoạt';


--
-- TOC entry 302 (class 1259 OID 17840)
-- Name: staff_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_account (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    administration_id smallint NOT NULL,
    user_name character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token boolean,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    refresh_token character varying(500),
    issued_at timestamp without time zone,
    expired_time timestamp without time zone,
    active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.staff_account OWNER TO postgres;

--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE staff_account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.staff_account IS 'tk nhân viên';


--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN staff_account.refresh_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.refresh_token IS 'mã refresh tonken';


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN staff_account.issued_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.issued_at IS 'thời gian phát hành';


--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN staff_account.expired_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.expired_time IS 'thời gian hết hạn';


--
-- TOC entry 303 (class 1259 OID 17848)
-- Name: staff_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_account_id_seq OWNER TO postgres;

--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 303
-- Name: staff_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_account_id_seq OWNED BY public.staff_account.id;


--
-- TOC entry 304 (class 1259 OID 17849)
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO postgres;

--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 304
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- TOC entry 305 (class 1259 OID 17850)
-- Name: sub_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_menu (
    id integer NOT NULL,
    menu_main_id smallint NOT NULL,
    name character varying(20) NOT NULL,
    color character varying(20) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "order" integer
);


ALTER TABLE public.sub_menu OWNER TO postgres;

--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE sub_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sub_menu IS 'ds submenu';


--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN sub_menu.menu_main_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sub_menu.menu_main_id IS 'thuộc menu nào';


--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN sub_menu."order"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sub_menu."order" IS 'thứ tự';


--
-- TOC entry 306 (class 1259 OID 17857)
-- Name: sub_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_menu_id_seq OWNER TO postgres;

--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 306
-- Name: sub_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_menu_id_seq OWNED BY public.sub_menu.id;


--
-- TOC entry 307 (class 1259 OID 17858)
-- Name: transfer_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfer_providers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    code character varying(20) NOT NULL
);


ALTER TABLE public.transfer_providers OWNER TO postgres;

--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 307
-- Name: TABLE transfer_providers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.transfer_providers IS 'các nhà cung cấp dịch vụ thanh toán online';


--
-- TOC entry 308 (class 1259 OID 17864)
-- Name: transfer_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transfer_providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfer_providers_id_seq OWNER TO postgres;

--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 308
-- Name: transfer_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transfer_providers_id_seq OWNED BY public.transfer_providers.id;


--
-- TOC entry 309 (class 1259 OID 17865)
-- Name: type_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_notification (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    color character varying(20) DEFAULT '000000'::character varying,
    code character varying(20)
);


ALTER TABLE public.type_notification OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 17874)
-- Name: type_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 310
-- Name: type_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_notification_id_seq OWNED BY public.type_notification.id;


--
-- TOC entry 311 (class 1259 OID 17875)
-- Name: type_promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_promotion (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(200) NOT NULL,
    code_hide character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    code character varying(20) NOT NULL
);


ALTER TABLE public.type_promotion OWNER TO postgres;

--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 311
-- Name: TABLE type_promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN type_promotion.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.name IS 'tên kh';


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN type_promotion.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.content IS 'nội dung km';


--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN type_promotion.code_hide; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.code_hide IS 'đây là code ẩn khi gắn mà chương trình sẽ tính ra luôn kq km';


--
-- TOC entry 312 (class 1259 OID 17881)
-- Name: type_promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_promotion_id_seq OWNER TO postgres;

--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 312
-- Name: type_promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_promotion_id_seq OWNED BY public.type_promotion.id;


--
-- TOC entry 313 (class 1259 OID 17882)
-- Name: type_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_report (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    code character varying(20)
);


ALTER TABLE public.type_report OWNER TO postgres;

--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE type_report; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_report IS 'loại tố cáo';


--
-- TOC entry 314 (class 1259 OID 17890)
-- Name: type_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_report_id_seq OWNER TO postgres;

--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 314
-- Name: type_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_report_id_seq OWNED BY public.type_report.id;


--
-- TOC entry 315 (class 1259 OID 17891)
-- Name: type_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_ticket (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(200),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    code character varying(20) NOT NULL
);


ALTER TABLE public.type_ticket OWNER TO postgres;

--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE type_ticket; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_ticket IS 'loại phiếu';


--
-- TOC entry 316 (class 1259 OID 17897)
-- Name: type_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 316
-- Name: type_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_ticket_id_seq OWNED BY public.type_ticket.id;


--
-- TOC entry 317 (class 1259 OID 17898)
-- Name: type_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_update (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    code character varying(20) NOT NULL
);


ALTER TABLE public.type_update OWNER TO postgres;

--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE type_update; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_update IS 'các loại update / xóa / ẩn';


--
-- TOC entry 318 (class 1259 OID 17906)
-- Name: type_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_update_id_seq OWNER TO postgres;

--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 318
-- Name: type_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_update_id_seq OWNED BY public.type_update.id;


--
-- TOC entry 319 (class 1259 OID 17907)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    hotline character varying(50) NOT NULL,
    manage character varying(50) NOT NULL,
    branch_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE warehouse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.warehouse IS 'tên các kho';


--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 319
-- Name: COLUMN warehouse.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.warehouse.branch_id IS 'thuộc chi nhánh nào';


--
-- TOC entry 320 (class 1259 OID 17913)
-- Name: warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warehouse_id_seq OWNER TO postgres;

--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 320
-- Name: warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;


--
-- TOC entry 321 (class 1259 OID 17914)
-- Name: websockets_statistics_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.websockets_statistics_entries (
    id integer NOT NULL,
    app_id character varying(255) NOT NULL,
    peak_connection_count integer NOT NULL,
    websocket_message_count integer NOT NULL,
    api_message_count integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.websockets_statistics_entries OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 17917)
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.websockets_statistics_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.websockets_statistics_entries_id_seq OWNER TO postgres;

--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 322
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;


--
-- TOC entry 3443 (class 2604 OID 17918)
-- Name: account_admin_action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action ALTER COLUMN id SET DEFAULT nextval('public.account_admin_action_id_seq'::regclass);


--
-- TOC entry 3447 (class 2604 OID 17920)
-- Name: action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- TOC entry 3451 (class 2604 OID 17921)
-- Name: administration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration ALTER COLUMN id SET DEFAULT nextval('public.administration_id_seq'::regclass);


--
-- TOC entry 3455 (class 2604 OID 17922)
-- Name: admins_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification ALTER COLUMN id SET DEFAULT nextval('public.admins_notification_id_seq'::regclass);


--
-- TOC entry 3460 (class 2604 OID 17923)
-- Name: ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads ALTER COLUMN id SET DEFAULT nextval('public.ads_id_seq'::regclass);


--
-- TOC entry 3464 (class 2604 OID 17924)
-- Name: api_weather id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather ALTER COLUMN id SET DEFAULT nextval('public.api_weather_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 17925)
-- Name: bill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill ALTER COLUMN id SET DEFAULT nextval('public.bill_id_seq'::regclass);


--
-- TOC entry 3476 (class 2604 OID 17926)
-- Name: branch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch ALTER COLUMN id SET DEFAULT nextval('public.branch_id_seq'::regclass);


--
-- TOC entry 3480 (class 2604 OID 17927)
-- Name: comments_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news ALTER COLUMN id SET DEFAULT nextval('public.comments_news_id_seq'::regclass);


--
-- TOC entry 3484 (class 2604 OID 17928)
-- Name: comments_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product ALTER COLUMN id SET DEFAULT nextval('public.comments_product_id_seq'::regclass);


--
-- TOC entry 3489 (class 2604 OID 17929)
-- Name: contact_support id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_support ALTER COLUMN id SET DEFAULT nextval('public.contact_support_id_seq'::regclass);


--
-- TOC entry 3493 (class 2604 OID 17930)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 3503 (class 2604 OID 17931)
-- Name: customers_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification ALTER COLUMN id SET DEFAULT nextval('public.customers_notification_id_seq'::regclass);


--
-- TOC entry 3508 (class 2604 OID 17932)
-- Name: depot_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket ALTER COLUMN id SET DEFAULT nextval('public.depot_ticket_id_seq'::regclass);


--
-- TOC entry 3512 (class 2604 OID 17933)
-- Name: event_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads ALTER COLUMN id SET DEFAULT nextval('public.event_ads_id_seq'::regclass);


--
-- TOC entry 3516 (class 2604 OID 17934)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3518 (class 2604 OID 17935)
-- Name: giftcode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode ALTER COLUMN id SET DEFAULT nextval('public.giftcode_id_seq'::regclass);


--
-- TOC entry 3522 (class 2604 OID 17936)
-- Name: history_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment ALTER COLUMN id SET DEFAULT nextval('public.history_payment_id_seq'::regclass);


--
-- TOC entry 3528 (class 2604 OID 17937)
-- Name: img_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news ALTER COLUMN id SET DEFAULT nextval('public.img_news_id_seq'::regclass);


--
-- TOC entry 3532 (class 2604 OID 17938)
-- Name: img_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products ALTER COLUMN id SET DEFAULT nextval('public.img_products_id_seq'::regclass);


--
-- TOC entry 3536 (class 2604 OID 17939)
-- Name: intermediary_account_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service ALTER COLUMN id SET DEFAULT nextval('public.intermediary_account_service_id_seq'::regclass);


--
-- TOC entry 3540 (class 2604 OID 17940)
-- Name: list_codes_received id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received ALTER COLUMN id SET DEFAULT nextval('public.list_codes_received_id_seq'::regclass);


--
-- TOC entry 3545 (class 2604 OID 17941)
-- Name: list_giftcodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes ALTER COLUMN id SET DEFAULT nextval('public.list_giftcodes_id_seq'::regclass);


--
-- TOC entry 3550 (class 2604 OID 17942)
-- Name: list_products_by_bill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill ALTER COLUMN id SET DEFAULT nextval('public.list_products_by_bill_id_seq'::regclass);


--
-- TOC entry 3554 (class 2604 OID 17943)
-- Name: log_deletes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes ALTER COLUMN id SET DEFAULT nextval('public.log_deletes_id_seq'::regclass);


--
-- TOC entry 3559 (class 2604 OID 17944)
-- Name: log_login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_login ALTER COLUMN id SET DEFAULT nextval('public.log_login_id_seq'::regclass);


--
-- TOC entry 3563 (class 2604 OID 17945)
-- Name: log_updates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates ALTER COLUMN id SET DEFAULT nextval('public.log_updates_id_seq'::regclass);


--
-- TOC entry 3568 (class 2604 OID 17946)
-- Name: menu_main id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main ALTER COLUMN id SET DEFAULT nextval('public.menu_main_id_seq'::regclass);


--
-- TOC entry 3572 (class 2604 OID 17947)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3573 (class 2604 OID 17948)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 3580 (class 2604 OID 17949)
-- Name: payment_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);


--
-- TOC entry 3584 (class 2604 OID 17950)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3585 (class 2604 OID 17951)
-- Name: policy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy ALTER COLUMN id SET DEFAULT nextval('public.policy_id_seq'::regclass);


--
-- TOC entry 3589 (class 2604 OID 17952)
-- Name: position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);


--
-- TOC entry 3593 (class 2604 OID 17953)
-- Name: price_difference id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference ALTER COLUMN id SET DEFAULT nextval('public.price_difference_id_seq'::regclass);


--
-- TOC entry 3597 (class 2604 OID 17954)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3602 (class 2604 OID 17955)
-- Name: products_in_stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock ALTER COLUMN id SET DEFAULT nextval('public.products_in_stock_id_seq'::regclass);


--
-- TOC entry 3606 (class 2604 OID 17956)
-- Name: promotion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_id_seq'::regclass);


--
-- TOC entry 3610 (class 2604 OID 17957)
-- Name: rank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rank ALTER COLUMN id SET DEFAULT nextval('public.rank_id_seq'::regclass);


--
-- TOC entry 3614 (class 2604 OID 17958)
-- Name: report_source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source ALTER COLUMN id SET DEFAULT nextval('public.report_source_id_seq'::regclass);


--
-- TOC entry 3618 (class 2604 OID 17959)
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- TOC entry 3624 (class 2604 OID 17960)
-- Name: service_by_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product ALTER COLUMN id SET DEFAULT nextval('public.service_by_product_id_seq'::regclass);


--
-- TOC entry 3628 (class 2604 OID 17961)
-- Name: shipping_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_id_seq'::regclass);


--
-- TOC entry 3632 (class 2604 OID 17962)
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- TOC entry 3637 (class 2604 OID 17963)
-- Name: staff_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account ALTER COLUMN id SET DEFAULT nextval('public.staff_account_id_seq'::regclass);


--
-- TOC entry 3642 (class 2604 OID 17964)
-- Name: sub_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu ALTER COLUMN id SET DEFAULT nextval('public.sub_menu_id_seq'::regclass);


--
-- TOC entry 3646 (class 2604 OID 17965)
-- Name: transfer_providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers ALTER COLUMN id SET DEFAULT nextval('public.transfer_providers_id_seq'::regclass);


--
-- TOC entry 3650 (class 2604 OID 17966)
-- Name: type_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification ALTER COLUMN id SET DEFAULT nextval('public.type_notification_id_seq'::regclass);


--
-- TOC entry 3655 (class 2604 OID 17967)
-- Name: type_promotion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion ALTER COLUMN id SET DEFAULT nextval('public.type_promotion_id_seq'::regclass);


--
-- TOC entry 3659 (class 2604 OID 17968)
-- Name: type_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report ALTER COLUMN id SET DEFAULT nextval('public.type_report_id_seq'::regclass);


--
-- TOC entry 3663 (class 2604 OID 17969)
-- Name: type_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket ALTER COLUMN id SET DEFAULT nextval('public.type_ticket_id_seq'::regclass);


--
-- TOC entry 3667 (class 2604 OID 17970)
-- Name: type_update id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update ALTER COLUMN id SET DEFAULT nextval('public.type_update_id_seq'::regclass);


--
-- TOC entry 3671 (class 2604 OID 17971)
-- Name: warehouse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);


--
-- TOC entry 3675 (class 2604 OID 17972)
-- Name: websockets_statistics_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);


--
-- TOC entry 4101 (class 0 OID 17460)
-- Dependencies: 214
-- Data for Name: account_admin_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_admin_action (id, administration_id, action_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4103 (class 0 OID 17474)
-- Dependencies: 216
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action (id, name, content, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4105 (class 0 OID 17483)
-- Dependencies: 218
-- Data for Name: administration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administration (id, name, status, created_at, updated_at, code) FROM stdin;
1	SUPERADMIN	t	2023-07-18 13:53:42.333383	2024-01-11 21:17:10.063413	\N
\.


--
-- TOC entry 4107 (class 0 OID 17490)
-- Dependencies: 220
-- Data for Name: admins_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins_notification (id, type_notification, staff_id, content, watched, status, created_at, updated_at) FROM stdin;
104	9	29	Tài khoản của bạn đã bị khóa bởi <strong style="color:red">Nguyễn Khoa</strong> (giám đốc)	f	t	2023-10-23 23:08:57	2023-10-23 23:08:57
\.


--
-- TOC entry 4109 (class 0 OID 17500)
-- Dependencies: 222
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ads (id, name, event_ads_id, staff_id, sub_menu_id, img, content, priority, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4111 (class 0 OID 17509)
-- Dependencies: 224
-- Data for Name: api_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_weather (id, name, city, longitude, latityde, content, status, created_at, updated_at) FROM stdin;
7	get weatherHà Nội	Hà Nội	105.7864	21.0303	{"weather":{"id":502,"main":"Rain","description":"mưa cường độ nặng","icon":"10d"},"main":{"temp":31.05,"feels_like":33.99,"temp_min":31.05,"temp_max":31.05,"pressure":1000,"humidity":56,"sea_level":1000,"grnd_level":999}}	t	2023-07-31 14:07:17.104696	2023-07-31 15:16:05.150639
\.


--
-- TOC entry 4113 (class 0 OID 17518)
-- Dependencies: 226
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill (id, code_bill, staff_id, customers_id, branch_id, payment_methods_id, shipping_method_id, transfer_providers_id, total_products, initial_amount, actual_amount, giftcode_id, successful_payment, note, impact_number, report_ship, queue_bill, note_report, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4115 (class 0 OID 17531)
-- Dependencies: 228
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (id, name, address, hotline, manage, working_time, status, created_at, updated_at) FROM stdin;
1	nhà 1	viet nam	0849328210	KHoa	11-12	t	2023-07-18 13:44:09.440164	2023-07-18 13:44:09.440164
2	Nguyen Branch	123 Nguyen Street, Hanoi	0123456789	Nguyen Van A	08:00 - 17:00	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
3	Tran Branch	456 Tran Street, Ho Chi Minh City	0987654321	Tran Thi B	09:00 - 18:00	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
4	Le Branch	789 Le Street, Da Nang	0765432198	Le Van C	07:30 - 16:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
5	Pham Branch	321 Pham Street, Hue	0321654987	Pham Thi D	08:30 - 17:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
6	Vo Branch	654 Vo Street, Can Tho	0549873216	Vo Van E	09:30 - 18:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
7	Ho Branch	987 Ho Street, Nha Trang	0987321654	Ho Thi F	08:00 - 17:00	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
8	Truong Branch	456 Truong Street, Hai Phong	0543219876	Truong Van G	09:00 - 18:00	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
9	Ngo Branch	321 Ngo Street, Quang Ninh	0987654321	Ngo Van I	08:30 - 17:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
10	Do Branch 4	789 Do Street, Vung Tau	0321987654	Do Thi H	07:30 - 16:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
11	Dinh Branch	654 Dinh Street, Dak Lak	0123456789	Dinh Thi Jd	09:30 - 18:30	t	2023-06-17 19:00:12.583995	2023-07-15 23:05:14.699774
\.


--
-- TOC entry 4117 (class 0 OID 17540)
-- Dependencies: 230
-- Data for Name: comments_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments_news (id, news_id, customers_id, comment_id, comment, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4119 (class 0 OID 17549)
-- Dependencies: 232
-- Data for Name: comments_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments_product (id, product_id, customers_id, comments_product_id, vote, comment, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4121 (class 0 OID 17559)
-- Dependencies: 234
-- Data for Name: contact_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_support (id, logo, link, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4123 (class 0 OID 17566)
-- Dependencies: 236
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, rank_id, first_name, last_name, address, phone_number, email, birthday, sex, accumulated_points, number_ban, potential, status, created_at, updated_at, password, remember_token, refresh_token, issued_at, expired_time) FROM stdin;
\.


--
-- TOC entry 4125 (class 0 OID 17580)
-- Dependencies: 238
-- Data for Name: customers_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_notification (id, type_notification, customer_id, content, watched, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4127 (class 0 OID 17590)
-- Dependencies: 240
-- Data for Name: depot_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depot_ticket (id, code_ticket, ticket_id, staff_id_export, staff_id_receive, product_id, product_number, total_money, note, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4129 (class 0 OID 17599)
-- Dependencies: 242
-- Data for Name: event_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_ads (id, name_event, staff_id, content, note, start_time, end_time, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4131 (class 0 OID 17608)
-- Dependencies: 244
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 4133 (class 0 OID 17615)
-- Dependencies: 246
-- Data for Name: giftcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.giftcode (id, name, event_ads_id, staff_id, content, img, discount, start_time, end_time, number_of_participants, used, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4135 (class 0 OID 17624)
-- Dependencies: 248
-- Data for Name: history_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history_payment (id, payment_method_id, customers_id, transfer_amount, cash_amount, note, bill_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4137 (class 0 OID 17633)
-- Dependencies: 250
-- Data for Name: img_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.img_news (id, name_img, news_id, img, location, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4139 (class 0 OID 17640)
-- Dependencies: 252
-- Data for Name: img_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.img_products (id, product_id, img, display_order, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4141 (class 0 OID 17647)
-- Dependencies: 254
-- Data for Name: intermediary_account_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intermediary_account_service (id, servive_name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4143 (class 0 OID 17654)
-- Dependencies: 256
-- Data for Name: list_codes_received; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_codes_received (id, customers_id, giftcode_id, is_expired, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4145 (class 0 OID 17662)
-- Dependencies: 258
-- Data for Name: list_giftcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_giftcodes (id, giftcode_id, code, already_received, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4147 (class 0 OID 17670)
-- Dependencies: 260
-- Data for Name: list_products_by_bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_products_by_bill (id, bill_id, products_id, status, created_at, updated_at, quantity, amount_of_money) FROM stdin;
\.


--
-- TOC entry 4149 (class 0 OID 17677)
-- Dependencies: 262
-- Data for Name: log_deletes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_deletes (id, type_delete_id, content, internal, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4151 (class 0 OID 17685)
-- Dependencies: 264
-- Data for Name: log_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_login (id, user_login, type, content, ip, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4153 (class 0 OID 17692)
-- Dependencies: 266
-- Data for Name: log_updates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_updates (id, type_update_id, content, internal, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4155 (class 0 OID 17700)
-- Dependencies: 268
-- Data for Name: menu_main; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_main (id, name, color, status, created_at, updated_at, "order") FROM stdin;
1	menu_1	red	t	2024-01-17 22:09:52.337586	2024-01-17 22:12:53.282939	1
\.


--
-- TOC entry 4157 (class 0 OID 17708)
-- Dependencies: 270
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
4	0000_00_00_000000_create_websockets_statistics_entries_table	1
5	2014_10_12_100000_create_password_reset_tokens_table	1
6	2019_08_19_000000_create_failed_jobs_table	1
7	2019_12_14_000001_create_personal_access_tokens_table	1
8	2016_06_01_000001_create_oauth_auth_codes_table	2
9	2016_06_01_000002_create_oauth_access_tokens_table	2
10	2016_06_01_000003_create_oauth_refresh_tokens_table	2
11	2016_06_01_000004_create_oauth_clients_table	2
12	2016_06_01_000005_create_oauth_personal_access_clients_table	2
\.


--
-- TOC entry 4159 (class 0 OID 17712)
-- Dependencies: 272
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, name_news, sub_menu_id, staff_id, img_main, content, tag, views, likes, comments, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4161 (class 0 OID 17724)
-- Dependencies: 274
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 4162 (class 0 OID 17729)
-- Dependencies: 275
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4164 (class 0 OID 17736)
-- Dependencies: 277
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4166 (class 0 OID 17742)
-- Dependencies: 279
-- Data for Name: policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy (id, staff_id, name, img, content, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4168 (class 0 OID 17751)
-- Dependencies: 281
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (id, name, content, status, created_at, updated_at) FROM stdin;
3	nhân viên	mô ra	t	2023-07-18 13:45:30.159174	2023-07-18 13:45:30.159174
4	giám đốc	giám đốc	t	2023-07-18 13:48:08.159012	2023-07-18 13:48:08.159012
5	Quản lý tổng	điều hàng chung cho cả hệ thống	t	2023-06-17 21:46:20.133627	2023-06-17 21:46:20.133627
6	Quant lý chi nhánh	quản lý chung cho các chi nhánh	t	2023-06-17 21:46:57.019189	2023-06-17 21:46:57.019189
7	Quản lý nhân viên	Điều hành nhân viên	t	2023-06-17 21:48:45.775187	2023-06-17 21:48:45.775187
8	Nhân viên bán hàng	Nhân viên kho	t	2023-06-17 21:49:06.094128	2023-06-17 21:49:06.094128
9	Nhân viên kho	nv kho	t	2023-06-17 21:49:30.67476	2023-06-17 21:49:30.67476
\.


--
-- TOC entry 4170 (class 0 OID 17760)
-- Dependencies: 283
-- Data for Name: price_difference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_difference (id, staff_id, product_id, import_price, export_price, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4172 (class 0 OID 17767)
-- Dependencies: 285
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, sub_menu_id, code_products, name, img_main, origin, color, size, into_money, vote, intro, number_of_products_sold, remaining_products, status, created_at, updated_at, is_promotion) FROM stdin;
\.


--
-- TOC entry 4174 (class 0 OID 17777)
-- Dependencies: 287
-- Data for Name: products_in_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_in_stock (id, product_id, warehouse_id, remaining, import_price, export_price, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4176 (class 0 OID 17784)
-- Dependencies: 289
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion (id, product_id, type_promotion_id, endtime, starttime, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 17791)
-- Dependencies: 291
-- Data for Name: rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rank (id, name, detail, icon, status, created_at, updated_at, score) FROM stdin;
1	Đồng	cấp độ sơ khai	q	t	2023-08-28 22:34:16.686788	2023-08-28 22:34:16.686788	100
\.


--
-- TOC entry 4180 (class 0 OID 17798)
-- Dependencies: 293
-- Data for Name: report_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_source (id, name, note, status, created_at, updated_at) FROM stdin;
4	người dùng hệ thống admin	Trống	t	2023-09-09 14:31:16.973351	2023-09-09 14:31:16.973351
6	hệ thống zalo	Trống	f	2023-09-09 14:33:40.089917	2023-09-09 14:33:40.089917
7	Qua hệ thống cửa hàng	Trống	f	2023-09-09 14:34:44.380985	2023-09-09 14:34:44.380985
5	người dùng hệ thống custommer	Trống	f	2023-09-09 14:31:16.973351	2024-02-01 20:46:45.384123
\.


--
-- TOC entry 4182 (class 0 OID 17807)
-- Dependencies: 295
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, customers_id, staff_id, sub_report, type_report_id, is_processed, report_source_id, content, feed_back_content, status, created_at, updated_at, sub) FROM stdin;
\.


--
-- TOC entry 4184 (class 0 OID 17818)
-- Dependencies: 297
-- Data for Name: service_by_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_by_product (id, product_id, policy_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4186 (class 0 OID 17825)
-- Dependencies: 299
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_method (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4188 (class 0 OID 17832)
-- Dependencies: 301
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, code_staff, position_id, branch_id, name, address, phone_number, email, birthday, sex, img, status, created_at, updated_at, background, active, img_drive_google, background_drive_google) FROM stdin;
29	0234234	4	11	Nguyễn Khoa	Hà Nộidsffgdfg	0849322810	khoazzz334455@gmai.com	2001-01-01	t	system/images/avatar/29_1706791087.jpg	t	2023-10-04 22:28:05.871347	2024-02-01 19:38:36.040346	system/images/background_user/29_1706791109.jpg	t	https://lh3.googleusercontent.com/d/1JneUGAMB6AjieJMJi_7L5j-n4N3uS28K	https://lh3.googleusercontent.com/d/17bsIOWyRxFgjKSInh0jDW3atXF9fOULl
\.


--
-- TOC entry 4189 (class 0 OID 17840)
-- Dependencies: 302
-- Data for Name: staff_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_account (id, staff_id, administration_id, user_name, password, remember_token, status, created_at, updated_at, refresh_token, issued_at, expired_time, active) FROM stdin;
11	29	1	0849322810	$2y$10$1UwQPxCV99PNLmSgGVoiI.Ye/9vA4kVApAtaGOV6XFtw0Q0MrYbM2	\N	t	2023-10-04 22:28:44	2024-02-01 20:38:36.9892	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0IiwiaWF0IjoxNzA2Nzk0NzE2LCJleHAiOjE3MDg1MjI3MTYsIm5iZiI6MTcwNjc5NDcxNiwidXNlcl9uYW1lIjoiMDg0OTMyMjgxMCIsInJhbmsiOiJwZW5kaW5nIiwiaWQiOjExLCJzdGFmZl9pZCI6MjksInJlbWVtYmVyIjoiZmFsc2UifQ.RTBOe5agGcEGD0sNQ5SdY6Ga5WyxLSvQsT-lGU0ZNc8	2024-02-01 20:38:36	2024-02-21 20:38:36	t
\.


--
-- TOC entry 4192 (class 0 OID 17850)
-- Dependencies: 305
-- Data for Name: sub_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_menu (id, menu_main_id, name, color, status, created_at, updated_at, "order") FROM stdin;
4	1	qưe	#fff	t	2024-01-17 22:18:15.341629	2024-02-01 19:52:57.407443	\N
\.


--
-- TOC entry 4194 (class 0 OID 17858)
-- Dependencies: 307
-- Data for Name: transfer_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfer_providers (id, name, status, created_at, updated_at, code) FROM stdin;
\.


--
-- TOC entry 4196 (class 0 OID 17865)
-- Dependencies: 309
-- Data for Name: type_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_notification (id, name, note, status, created_at, updated_at, color, code) FROM stdin;
8	Hệ thống báo lỗi	hệ thống gửi thông báo lỗi dành cho người dùng	t	2023-09-23 22:18:15.891562	2023-10-04 22:49:45.843923	ff0000	SYSTEM
9	Thông báo	Hệ thống gửi thông báo lỗi dành cho người dùng	t	2023-09-23 22:16:33.68393	2023-10-04 22:49:45.860041	F4E869	EVENT
10	Người dùng	Thông báo từ người dùng , người dùng gửi thông báo đến người dùng	t	2023-09-23 22:19:06.398984	2023-10-04 22:49:45.860989	3085C3	CUSTOMER
11	Phản hồi 	Phản hồi từ những ý kiễn phản hồi cho khách hàng	t	2023-09-23 22:19:57.710001	2023-10-04 22:49:45.861501	6c757d	RESPONSE
12	Gửi	gửi tin nhắn , phản hồi cho khách hàng thành công	t	2023-09-23 22:20:34.3712	2023-10-04 22:49:45.861972	28a745	SEND
13	Cảnh báo 	gửi cảnh báo cho người dùng	t	2023-09-23 22:21:07.651394	2023-10-04 22:49:45.86269	E9B824	WARNING
\.


--
-- TOC entry 4198 (class 0 OID 17875)
-- Dependencies: 311
-- Data for Name: type_promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_promotion (id, name, content, code_hide, status, created_at, updated_at, code) FROM stdin;
\.


--
-- TOC entry 4200 (class 0 OID 17882)
-- Dependencies: 313
-- Data for Name: type_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_report (id, name, note, status, created_at, updated_at, code) FROM stdin;
84	Yêu cầu hỗ trợ từ người dùng (admin))	các yêu cầu hỗ trợ từ phía người dùng từ hệ thống quản lý	t	2023-08-28 20:59:04.371602	2023-08-28 20:59:04.371602	\N
86	Đóng góp ý kiến cho sản phẩm	Trống	f	2023-08-28 21:06:19.720643	2023-09-08 23:41:38.860708	\N
87	Tố cáo nhân viên	Trống	f	2023-08-28 21:10:10.994355	2023-09-09 14:16:24.822346	\N
88	Đóng góp ý kiến cho ứng dụng	Trống	f	2023-08-28 21:04:42.076702	2023-09-09 14:16:26.081107	\N
89	Phản hồi về sản phẩm	Trống	f	2023-08-28 21:06:19.720643	2023-09-09 14:58:29.313634	\N
90	phản hồi về ứng dụng customer	Trống	f	2023-09-09 18:14:46.258185	2023-09-09 18:14:46.258185	\N
91	Phản hồi về ứng dụng admin	phản hồi chung của người dùng  & người test về phần mềm	t	2023-08-28 20:56:41.455928	2023-09-09 18:14:53.15048	\N
85	Phản hồi về nhân viên	phản  hồi thái độ nhân viên	f	2023-08-28 21:09:24.518622	2023-10-04 22:29:17.363573	\N
\.


--
-- TOC entry 4202 (class 0 OID 17891)
-- Dependencies: 315
-- Data for Name: type_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_ticket (id, name, note, status, created_at, updated_at, code) FROM stdin;
3	Phiếu thu	\N	t	2023-10-04 22:44:53.452815	2023-10-04 22:44:53.452815	IMPORT
4	Phiếu xuất	\N	t	2023-10-04 22:44:53.464115	2023-10-04 22:44:53.464115	EXPORT
\.


--
-- TOC entry 4204 (class 0 OID 17898)
-- Dependencies: 317
-- Data for Name: type_update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_update (id, name, note, status, created_at, updated_at, code) FROM stdin;
\.


--
-- TOC entry 4206 (class 0 OID 17907)
-- Dependencies: 319
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (id, name, address, hotline, manage, branch_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4208 (class 0 OID 17914)
-- Dependencies: 321
-- Data for Name: websockets_statistics_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 215
-- Name: account_admin_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_admin_action_id_seq', 1, false);


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 217
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_id_seq', 1, false);


--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 219
-- Name: administration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administration_id_seq', 1, true);


--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 221
-- Name: admins_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_notification_id_seq', 104, true);


--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 223
-- Name: ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ads_id_seq', 1, false);


--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 225
-- Name: api_weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_weather_id_seq', 11, true);


--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 227
-- Name: bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_id_seq', 1, false);


--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 229
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_id_seq', 11, true);


--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 231
-- Name: comments_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_news_id_seq', 1, false);


--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 233
-- Name: comments_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_product_id_seq', 1, false);


--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 235
-- Name: contact_support_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_support_id_seq', 1, false);


--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 237
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 239
-- Name: customers_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_notification_id_seq', 1, false);


--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 241
-- Name: depot_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.depot_ticket_id_seq', 1, false);


--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 243
-- Name: event_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_ads_id_seq', 1, false);


--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 245
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 247
-- Name: giftcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.giftcode_id_seq', 1, false);


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 249
-- Name: history_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_payment_id_seq', 1, false);


--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 251
-- Name: img_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.img_news_id_seq', 1, false);


--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 253
-- Name: img_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.img_products_id_seq', 1, false);


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 255
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intermediary_account_service_id_seq', 1, false);


--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 257
-- Name: list_codes_received_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_codes_received_id_seq', 1, false);


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 259
-- Name: list_giftcodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_giftcodes_id_seq', 1, false);


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 261
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_products_by_bill_id_seq', 1, false);


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 263
-- Name: log_deletes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_deletes_id_seq', 1, false);


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 265
-- Name: log_login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_login_id_seq', 1, false);


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 267
-- Name: log_updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_updates_id_seq', 1, false);


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 269
-- Name: menu_main_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_main_id_seq', 1, true);


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 271
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 273
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 276
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_id_seq', 1, false);


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 278
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 280
-- Name: policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.policy_id_seq', 1, false);


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 282
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 9, true);


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 284
-- Name: price_difference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_difference_id_seq', 1, false);


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 286
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 288
-- Name: products_in_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_in_stock_id_seq', 1, false);


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 290
-- Name: promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_id_seq', 1, false);


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 292
-- Name: rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rank_id_seq', 1, true);


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 294
-- Name: report_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_source_id_seq', 7, true);


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 296
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, false);


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 298
-- Name: service_by_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_by_product_id_seq', 1, false);


--
-- TOC entry 4527 (class 0 OID 0)
-- Dependencies: 300
-- Name: shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_method_id_seq', 1, false);


--
-- TOC entry 4528 (class 0 OID 0)
-- Dependencies: 303
-- Name: staff_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_account_id_seq', 11, true);


--
-- TOC entry 4529 (class 0 OID 0)
-- Dependencies: 304
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 30, true);


--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 306
-- Name: sub_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_menu_id_seq', 4, true);


--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 308
-- Name: transfer_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transfer_providers_id_seq', 1, false);


--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 310
-- Name: type_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_notification_id_seq', 13, true);


--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 312
-- Name: type_promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_promotion_id_seq', 1, false);


--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 314
-- Name: type_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_report_id_seq', 91, true);


--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 316
-- Name: type_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_ticket_id_seq', 4, true);


--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 318
-- Name: type_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_update_id_seq', 1, false);


--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 320
-- Name: warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouse_id_seq', 1, false);


--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 322
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- TOC entry 3677 (class 2606 OID 17974)
-- Name: account_admin_action account_admin_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT account_admin_action_pkey PRIMARY KEY (id);


--
-- TOC entry 3679 (class 2606 OID 17980)
-- Name: action action_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_name_key UNIQUE (name);


--
-- TOC entry 3681 (class 2606 OID 17982)
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- TOC entry 3683 (class 2606 OID 17984)
-- Name: administration administration_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration
    ADD CONSTRAINT administration_name_key UNIQUE (name);


--
-- TOC entry 3685 (class 2606 OID 17986)
-- Name: administration administration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration
    ADD CONSTRAINT administration_pkey PRIMARY KEY (id);


--
-- TOC entry 3688 (class 2606 OID 17988)
-- Name: admins_notification admins_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3690 (class 2606 OID 17990)
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);


--
-- TOC entry 3692 (class 2606 OID 17992)
-- Name: api_weather api_weather_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather
    ADD CONSTRAINT api_weather_key UNIQUE (city);


--
-- TOC entry 3694 (class 2606 OID 17994)
-- Name: api_weather api_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather
    ADD CONSTRAINT api_weather_pkey PRIMARY KEY (id);


--
-- TOC entry 3696 (class 2606 OID 17996)
-- Name: bill bill_code_bill_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_code_bill_key UNIQUE (code_bill);


--
-- TOC entry 3698 (class 2606 OID 17998)
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 18000)
-- Name: branch branch_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_name_key UNIQUE (name);


--
-- TOC entry 3702 (class 2606 OID 18002)
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- TOC entry 3704 (class 2606 OID 18004)
-- Name: comments_news comments_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT comments_news_pkey PRIMARY KEY (id);


--
-- TOC entry 3706 (class 2606 OID 18006)
-- Name: comments_product comments_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT comments_product_pkey PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 18008)
-- Name: contact_support contact_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_support
    ADD CONSTRAINT contact_support_pkey PRIMARY KEY (id);


--
-- TOC entry 3710 (class 2606 OID 19596)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 3716 (class 2606 OID 18012)
-- Name: customers_notification customers_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3712 (class 2606 OID 19586)
-- Name: customers customers_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_number_key UNIQUE (phone_number);


--
-- TOC entry 3714 (class 2606 OID 18016)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3718 (class 2606 OID 18018)
-- Name: depot_ticket depot_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT depot_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3720 (class 2606 OID 18020)
-- Name: event_ads event_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads
    ADD CONSTRAINT event_ads_pkey PRIMARY KEY (id);


--
-- TOC entry 3722 (class 2606 OID 18022)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3724 (class 2606 OID 18024)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3726 (class 2606 OID 18026)
-- Name: giftcode giftcode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT giftcode_pkey PRIMARY KEY (id);


--
-- TOC entry 3728 (class 2606 OID 18028)
-- Name: history_payment history_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT history_payment_pkey PRIMARY KEY (id);


--
-- TOC entry 3730 (class 2606 OID 18030)
-- Name: img_news img_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news
    ADD CONSTRAINT img_news_pkey PRIMARY KEY (id);


--
-- TOC entry 3732 (class 2606 OID 18032)
-- Name: img_products img_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products
    ADD CONSTRAINT img_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3734 (class 2606 OID 18034)
-- Name: intermediary_account_service intermediary_account_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service
    ADD CONSTRAINT intermediary_account_service_pkey PRIMARY KEY (id);


--
-- TOC entry 3736 (class 2606 OID 18036)
-- Name: intermediary_account_service intermediary_account_service_servive_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service
    ADD CONSTRAINT intermediary_account_service_servive_name_key UNIQUE (servive_name);


--
-- TOC entry 3738 (class 2606 OID 18038)
-- Name: list_giftcodes list_giftcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes
    ADD CONSTRAINT list_giftcodes_pkey PRIMARY KEY (id);


--
-- TOC entry 3740 (class 2606 OID 18040)
-- Name: list_products_by_bill list_products_by_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT list_products_by_bill_pkey PRIMARY KEY (id);


--
-- TOC entry 3742 (class 2606 OID 18042)
-- Name: log_deletes log_deletes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes
    ADD CONSTRAINT log_deletes_pkey PRIMARY KEY (id);


--
-- TOC entry 3744 (class 2606 OID 18044)
-- Name: log_login log_login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_login
    ADD CONSTRAINT log_login_pkey PRIMARY KEY (id);


--
-- TOC entry 3746 (class 2606 OID 18046)
-- Name: log_updates log_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates
    ADD CONSTRAINT log_updates_pkey PRIMARY KEY (id);


--
-- TOC entry 3748 (class 2606 OID 18048)
-- Name: menu_main menu_main_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main
    ADD CONSTRAINT menu_main_name_key UNIQUE (name);


--
-- TOC entry 3750 (class 2606 OID 18050)
-- Name: menu_main menu_main_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main
    ADD CONSTRAINT menu_main_pkey PRIMARY KEY (id);


--
-- TOC entry 3752 (class 2606 OID 18052)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3754 (class 2606 OID 18054)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 3756 (class 2606 OID 18056)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3758 (class 2606 OID 18058)
-- Name: payment_methods payment_methods_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_name_key UNIQUE (name);


--
-- TOC entry 3760 (class 2606 OID 18060)
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 3762 (class 2606 OID 18062)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3764 (class 2606 OID 18064)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3767 (class 2606 OID 18066)
-- Name: policy policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy
    ADD CONSTRAINT policy_pkey PRIMARY KEY (id);


--
-- TOC entry 3769 (class 2606 OID 18068)
-- Name: position position_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_name_key UNIQUE (name);


--
-- TOC entry 3771 (class 2606 OID 18070)
-- Name: position position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);


--
-- TOC entry 3773 (class 2606 OID 18072)
-- Name: price_difference price_difference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT price_difference_pkey PRIMARY KEY (id);


--
-- TOC entry 3775 (class 2606 OID 18074)
-- Name: products products_code_products_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_code_products_key UNIQUE (code_products);


--
-- TOC entry 3781 (class 2606 OID 18076)
-- Name: products_in_stock products_in_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT products_in_stock_pkey PRIMARY KEY (id);


--
-- TOC entry 3777 (class 2606 OID 18078)
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- TOC entry 3779 (class 2606 OID 18080)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3783 (class 2606 OID 18082)
-- Name: promotion promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_pkey PRIMARY KEY (id);


--
-- TOC entry 3785 (class 2606 OID 18084)
-- Name: rank rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rank
    ADD CONSTRAINT rank_pkey PRIMARY KEY (id);


--
-- TOC entry 3787 (class 2606 OID 18086)
-- Name: report_source report_source_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source
    ADD CONSTRAINT report_source_name_key UNIQUE (name);


--
-- TOC entry 3789 (class 2606 OID 18088)
-- Name: report_source report_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source
    ADD CONSTRAINT report_source_pkey PRIMARY KEY (id);


--
-- TOC entry 3791 (class 2606 OID 18090)
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3793 (class 2606 OID 18092)
-- Name: service_by_product service_by_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT service_by_product_pkey PRIMARY KEY (id);


--
-- TOC entry 3795 (class 2606 OID 18094)
-- Name: shipping_method shipping_method_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_name_key UNIQUE (name);


--
-- TOC entry 3797 (class 2606 OID 18096)
-- Name: shipping_method shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_pkey PRIMARY KEY (id);


--
-- TOC entry 3805 (class 2606 OID 18098)
-- Name: staff_account staff_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT staff_account_pkey PRIMARY KEY (id);


--
-- TOC entry 3807 (class 2606 OID 18100)
-- Name: staff_account staff_account_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT staff_account_user_name_key UNIQUE (user_name);


--
-- TOC entry 3799 (class 2606 OID 18102)
-- Name: staff staff_code_staff_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_code_staff_key UNIQUE (code_staff);


--
-- TOC entry 3801 (class 2606 OID 18104)
-- Name: staff staff_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_phone_number_key UNIQUE (phone_number);


--
-- TOC entry 3803 (class 2606 OID 18106)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- TOC entry 3811 (class 2606 OID 18108)
-- Name: sub_menu sub_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT sub_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 3813 (class 2606 OID 18110)
-- Name: transfer_providers transfer_providers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers
    ADD CONSTRAINT transfer_providers_name_key UNIQUE (name);


--
-- TOC entry 3815 (class 2606 OID 18112)
-- Name: transfer_providers transfer_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers
    ADD CONSTRAINT transfer_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3817 (class 2606 OID 18114)
-- Name: type_notification type_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification
    ADD CONSTRAINT type_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3819 (class 2606 OID 18116)
-- Name: type_notification type_notification_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification
    ADD CONSTRAINT type_notification_un UNIQUE (name);


--
-- TOC entry 3821 (class 2606 OID 18118)
-- Name: type_promotion type_promotion_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion
    ADD CONSTRAINT type_promotion_name_key UNIQUE (name);


--
-- TOC entry 3823 (class 2606 OID 18120)
-- Name: type_promotion type_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion
    ADD CONSTRAINT type_promotion_pkey PRIMARY KEY (id);


--
-- TOC entry 3825 (class 2606 OID 18122)
-- Name: type_report type_report_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report
    ADD CONSTRAINT type_report_name_key UNIQUE (name);


--
-- TOC entry 3827 (class 2606 OID 18124)
-- Name: type_report type_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report
    ADD CONSTRAINT type_report_pkey PRIMARY KEY (id);


--
-- TOC entry 3829 (class 2606 OID 18126)
-- Name: type_ticket type_ticket_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket
    ADD CONSTRAINT type_ticket_name_key UNIQUE (name);


--
-- TOC entry 3831 (class 2606 OID 18128)
-- Name: type_ticket type_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket
    ADD CONSTRAINT type_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3833 (class 2606 OID 18130)
-- Name: type_update type_update_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update
    ADD CONSTRAINT type_update_name_key UNIQUE (name);


--
-- TOC entry 3835 (class 2606 OID 18132)
-- Name: type_update type_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update
    ADD CONSTRAINT type_update_pkey PRIMARY KEY (id);


--
-- TOC entry 3809 (class 2606 OID 18134)
-- Name: staff_account unique_column_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT unique_column_constraint UNIQUE (staff_id);


--
-- TOC entry 3837 (class 2606 OID 18136)
-- Name: warehouse warehouse_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_name_key UNIQUE (name);


--
-- TOC entry 3839 (class 2606 OID 18138)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);


--
-- TOC entry 3841 (class 2606 OID 18140)
-- Name: websockets_statistics_entries websockets_statistics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3686 (class 1259 OID 18141)
-- Name: admins_notification_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admins_notification_id_idx ON public.admins_notification USING btree (id);


--
-- TOC entry 3765 (class 1259 OID 18142)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3905 (class 2620 OID 18143)
-- Name: account_admin_action update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.account_admin_action FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3906 (class 2620 OID 18145)
-- Name: action update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.action FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3907 (class 2620 OID 18146)
-- Name: administration update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.administration FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3908 (class 2620 OID 18147)
-- Name: admins_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.admins_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3909 (class 2620 OID 18148)
-- Name: ads update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.ads FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3910 (class 2620 OID 18149)
-- Name: api_weather update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.api_weather FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3911 (class 2620 OID 18150)
-- Name: bill update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.bill FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3912 (class 2620 OID 18151)
-- Name: branch update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.branch FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3913 (class 2620 OID 18152)
-- Name: comments_news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.comments_news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3914 (class 2620 OID 18153)
-- Name: comments_product update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.comments_product FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3915 (class 2620 OID 18154)
-- Name: contact_support update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.contact_support FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3916 (class 2620 OID 18155)
-- Name: customers update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.customers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3917 (class 2620 OID 18156)
-- Name: customers_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.customers_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3918 (class 2620 OID 18157)
-- Name: depot_ticket update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.depot_ticket FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3919 (class 2620 OID 18158)
-- Name: event_ads update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.event_ads FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3920 (class 2620 OID 18159)
-- Name: failed_jobs update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.failed_jobs FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3921 (class 2620 OID 18160)
-- Name: giftcode update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.giftcode FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3922 (class 2620 OID 18161)
-- Name: history_payment update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.history_payment FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3923 (class 2620 OID 18162)
-- Name: img_news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.img_news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3924 (class 2620 OID 18163)
-- Name: img_products update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.img_products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3925 (class 2620 OID 18164)
-- Name: intermediary_account_service update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.intermediary_account_service FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3926 (class 2620 OID 18165)
-- Name: list_codes_received update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_codes_received FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3927 (class 2620 OID 18166)
-- Name: list_giftcodes update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_giftcodes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3928 (class 2620 OID 18167)
-- Name: list_products_by_bill update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_products_by_bill FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3929 (class 2620 OID 18168)
-- Name: log_deletes update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_deletes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3930 (class 2620 OID 18169)
-- Name: log_login update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_login FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3931 (class 2620 OID 18170)
-- Name: log_updates update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_updates FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3932 (class 2620 OID 18171)
-- Name: menu_main update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.menu_main FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3933 (class 2620 OID 18172)
-- Name: migrations update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.migrations FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3934 (class 2620 OID 18173)
-- Name: news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3935 (class 2620 OID 18174)
-- Name: password_reset_tokens update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.password_reset_tokens FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3936 (class 2620 OID 18175)
-- Name: payment_methods update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.payment_methods FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3937 (class 2620 OID 18176)
-- Name: personal_access_tokens update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.personal_access_tokens FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3938 (class 2620 OID 18177)
-- Name: policy update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.policy FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3939 (class 2620 OID 18178)
-- Name: position update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3940 (class 2620 OID 18179)
-- Name: price_difference update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.price_difference FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3941 (class 2620 OID 18180)
-- Name: products update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3942 (class 2620 OID 18181)
-- Name: products_in_stock update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.products_in_stock FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3943 (class 2620 OID 18182)
-- Name: promotion update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.promotion FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3944 (class 2620 OID 18183)
-- Name: rank update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.rank FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3945 (class 2620 OID 18184)
-- Name: report_source update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.report_source FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3946 (class 2620 OID 18185)
-- Name: reports update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.reports FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3947 (class 2620 OID 18186)
-- Name: service_by_product update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.service_by_product FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3948 (class 2620 OID 18187)
-- Name: shipping_method update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.shipping_method FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3949 (class 2620 OID 18188)
-- Name: staff update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.staff FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3950 (class 2620 OID 18189)
-- Name: staff_account update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.staff_account FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3951 (class 2620 OID 18190)
-- Name: sub_menu update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.sub_menu FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3952 (class 2620 OID 18191)
-- Name: transfer_providers update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.transfer_providers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3953 (class 2620 OID 18192)
-- Name: type_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3954 (class 2620 OID 18193)
-- Name: type_promotion update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_promotion FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3955 (class 2620 OID 18194)
-- Name: type_report update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_report FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3956 (class 2620 OID 18195)
-- Name: type_ticket update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_ticket FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3957 (class 2620 OID 18196)
-- Name: type_update update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_update FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3958 (class 2620 OID 18197)
-- Name: warehouse update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.warehouse FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3842 (class 2606 OID 18203)
-- Name: account_admin_action FK1_action_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT "FK1_action_admin" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE;


--
-- TOC entry 3846 (class 2606 OID 18208)
-- Name: ads FK1_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "FK1_ads" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE;


--
-- TOC entry 3848 (class 2606 OID 18213)
-- Name: bill FK1_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK1_bill" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3857 (class 2606 OID 18218)
-- Name: comments_product FK1_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK1_comment_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3854 (class 2606 OID 18223)
-- Name: comments_news FK1_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK1_comments_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE;


--
-- TOC entry 3860 (class 2606 OID 18228)
-- Name: customers FK1_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT "FK1_customers" FOREIGN KEY (rank_id) REFERENCES public.rank(id) ON UPDATE CASCADE;


--
-- TOC entry 3863 (class 2606 OID 18233)
-- Name: depot_ticket FK1_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK1_depot_ticket" FOREIGN KEY (ticket_id) REFERENCES public.type_ticket(id) ON UPDATE CASCADE;


--
-- TOC entry 3867 (class 2606 OID 18238)
-- Name: event_ads FK1_event_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads
    ADD CONSTRAINT "FK1_event_ads" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3868 (class 2606 OID 18243)
-- Name: giftcode FK1_giftcode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT "FK1_giftcode" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE;


--
-- TOC entry 3870 (class 2606 OID 18248)
-- Name: history_payment FK1_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK1_history_payment" FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE;


--
-- TOC entry 3873 (class 2606 OID 18253)
-- Name: img_news FK1_img_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news
    ADD CONSTRAINT "FK1_img_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE;


--
-- TOC entry 3874 (class 2606 OID 18258)
-- Name: img_products FK1_img_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products
    ADD CONSTRAINT "FK1_img_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3875 (class 2606 OID 18263)
-- Name: list_codes_received FK1_list_codes_received; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received
    ADD CONSTRAINT "FK1_list_codes_received" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3877 (class 2606 OID 18268)
-- Name: list_giftcodes FK1_list_giftcodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes
    ADD CONSTRAINT "FK1_list_giftcodes" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE;


--
-- TOC entry 3878 (class 2606 OID 18273)
-- Name: list_products_by_bill FK1_list_products_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT "FK1_list_products_by" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE;


--
-- TOC entry 3880 (class 2606 OID 18278)
-- Name: log_deletes FK1_log_delete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes
    ADD CONSTRAINT "FK1_log_delete" FOREIGN KEY (type_delete_id) REFERENCES public.type_update(id) ON UPDATE CASCADE;


--
-- TOC entry 3881 (class 2606 OID 18283)
-- Name: log_updates FK1_log_update; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates
    ADD CONSTRAINT "FK1_log_update" FOREIGN KEY (type_update_id) REFERENCES public.type_update(id) ON UPDATE CASCADE;


--
-- TOC entry 3882 (class 2606 OID 18288)
-- Name: news FK1_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK1_news" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3884 (class 2606 OID 18293)
-- Name: policy FK1_policy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy
    ADD CONSTRAINT "FK1_policy" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3885 (class 2606 OID 18298)
-- Name: price_difference FK1_price_difference; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT "FK1_price_difference" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3887 (class 2606 OID 18303)
-- Name: products FK1_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK1_products" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3888 (class 2606 OID 18308)
-- Name: products_in_stock FK1_products_in_stock; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT "FK1_products_in_stock" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3890 (class 2606 OID 18313)
-- Name: promotion FK1_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK1_promotion" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3892 (class 2606 OID 18318)
-- Name: reports FK1_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK1_reports" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3897 (class 2606 OID 18323)
-- Name: service_by_product FK1_service_by_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT "FK1_service_by_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3899 (class 2606 OID 18328)
-- Name: staff FK1_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT "FK1_staff" FOREIGN KEY (position_id) REFERENCES public."position"(id) ON UPDATE CASCADE;


--
-- TOC entry 3901 (class 2606 OID 18333)
-- Name: staff_account FK1_staff_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT "FK1_staff_account" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3903 (class 2606 OID 18338)
-- Name: sub_menu FK1_sub_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT "FK1_sub_menu" FOREIGN KEY (menu_main_id) REFERENCES public.menu_main(id) ON UPDATE CASCADE;


--
-- TOC entry 3904 (class 2606 OID 18343)
-- Name: warehouse FK1_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK1_warehouse" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3843 (class 2606 OID 18348)
-- Name: account_admin_action FK2_action_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT "FK2_action_admin" FOREIGN KEY (action_id) REFERENCES public.action(id) ON UPDATE CASCADE;


--
-- TOC entry 3847 (class 2606 OID 18353)
-- Name: ads FK2_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "FK2_ads" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3849 (class 2606 OID 18358)
-- Name: bill FK2_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK2_bill" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3858 (class 2606 OID 18363)
-- Name: comments_product FK2_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK2_comment_product" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3855 (class 2606 OID 18368)
-- Name: comments_news FK2_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK2_comments_news" FOREIGN KEY (comment_id) REFERENCES public.comments_news(id) ON UPDATE CASCADE;


--
-- TOC entry 3864 (class 2606 OID 18373)
-- Name: depot_ticket FK2_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK2_depot_ticket" FOREIGN KEY (staff_id_export) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3869 (class 2606 OID 18378)
-- Name: giftcode FK2_giftcode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT "FK2_giftcode" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3871 (class 2606 OID 18383)
-- Name: history_payment FK2_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK2_history_payment" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3876 (class 2606 OID 18388)
-- Name: list_codes_received FK2_list_codes_received; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received
    ADD CONSTRAINT "FK2_list_codes_received" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE;


--
-- TOC entry 3879 (class 2606 OID 18393)
-- Name: list_products_by_bill FK2_list_products_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT "FK2_list_products_by" FOREIGN KEY (products_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3883 (class 2606 OID 18398)
-- Name: news FK2_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK2_news" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3886 (class 2606 OID 18403)
-- Name: price_difference FK2_price_difference; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT "FK2_price_difference" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3889 (class 2606 OID 18408)
-- Name: products_in_stock FK2_products_in_stock; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT "FK2_products_in_stock" FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id) ON UPDATE CASCADE;


--
-- TOC entry 3891 (class 2606 OID 18413)
-- Name: promotion FK2_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK2_promotion" FOREIGN KEY (type_promotion_id) REFERENCES public.type_promotion(id);


--
-- TOC entry 3893 (class 2606 OID 18418)
-- Name: reports FK2_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK2_reports" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3898 (class 2606 OID 18423)
-- Name: service_by_product FK2_service_by_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT "FK2_service_by_product" FOREIGN KEY (policy_id) REFERENCES public.policy(id) ON UPDATE CASCADE;


--
-- TOC entry 3902 (class 2606 OID 18428)
-- Name: staff_account FK2_staff_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT "FK2_staff_account" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE;


--
-- TOC entry 3850 (class 2606 OID 18433)
-- Name: bill FK3_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK3_bill" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3859 (class 2606 OID 18438)
-- Name: comments_product FK3_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK3_comment_product" FOREIGN KEY (comments_product_id) REFERENCES public.comments_product(id) ON UPDATE CASCADE;


--
-- TOC entry 3856 (class 2606 OID 18443)
-- Name: comments_news FK3_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK3_comments_news" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3865 (class 2606 OID 18448)
-- Name: depot_ticket FK3_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK3_depot_ticket" FOREIGN KEY (staff_id_receive) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3872 (class 2606 OID 18453)
-- Name: history_payment FK3_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK3_history_payment" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE;


--
-- TOC entry 3894 (class 2606 OID 18458)
-- Name: reports FK3_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK3_reports" FOREIGN KEY (sub_report) REFERENCES public.reports(id) ON UPDATE CASCADE;


--
-- TOC entry 3900 (class 2606 OID 18463)
-- Name: staff FK3_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT "FK3_staff" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3851 (class 2606 OID 18468)
-- Name: bill FK4_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK4_bill" FOREIGN KEY (payment_methods_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE;


--
-- TOC entry 3866 (class 2606 OID 18473)
-- Name: depot_ticket FK4_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK4_depot_ticket" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3895 (class 2606 OID 18478)
-- Name: reports FK4_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK4_reports" FOREIGN KEY (type_report_id) REFERENCES public.type_report(id) ON UPDATE CASCADE;


--
-- TOC entry 3852 (class 2606 OID 18483)
-- Name: bill FK5_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK5_bill" FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_method(id) ON UPDATE CASCADE;


--
-- TOC entry 3896 (class 2606 OID 18488)
-- Name: reports FK5_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK5_reports" FOREIGN KEY (report_source_id) REFERENCES public.report_source(id) ON UPDATE CASCADE;


--
-- TOC entry 3853 (class 2606 OID 18493)
-- Name: bill FK6_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK6_bill" FOREIGN KEY (transfer_providers_id) REFERENCES public.transfer_providers(id) ON UPDATE CASCADE;


--
-- TOC entry 3844 (class 2606 OID 18498)
-- Name: admins_notification admins_notification_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_fk FOREIGN KEY (type_notification) REFERENCES public.type_notification(id) ON UPDATE CASCADE;


--
-- TOC entry 3845 (class 2606 OID 18503)
-- Name: admins_notification admins_notification_staff_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_staff_fk FOREIGN KEY (staff_id) REFERENCES public.staff(id);


--
-- TOC entry 3861 (class 2606 OID 18508)
-- Name: customers_notification customers_notification_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_fk FOREIGN KEY (type_notification) REFERENCES public.type_notification(id) ON UPDATE CASCADE;


--
-- TOC entry 3862 (class 2606 OID 18513)
-- Name: customers_notification customers_notification_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_fk_1 FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


-- Completed on 2024-02-29 20:36:05

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-29 20:36:05

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

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 326 (class 1255 OID 16398)
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: account_admin_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_admin_action (
    id integer NOT NULL,
    administration_id smallint NOT NULL,
    action_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.account_admin_action OWNER TO postgres;

--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE account_admin_action; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.account_admin_action IS 'bảng trung gian tài khoản được gắn cho các quyền';


--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN account_admin_action.administration_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_admin_action.administration_id IS 'mã quyền';


--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN account_admin_action.action_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_admin_action.action_id IS 'mã thao tác';


--
-- TOC entry 216 (class 1259 OID 16405)
-- Name: account_admin_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_admin_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_admin_action_id_seq OWNER TO postgres;

--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 216
-- Name: account_admin_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_admin_action_id_seq OWNED BY public.account_admin_action.id;


--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: account_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_customers (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    remember_token character varying(100) NOT NULL,
    user_name character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.account_customers OWNER TO postgres;

--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE account_customers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.account_customers IS 'tài khoản khách hàng';


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN account_customers.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_customers.customers_id IS 'id khách hàng';


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN account_customers.user_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_customers.user_name IS 'tên đăng nhập';


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN account_customers.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_customers.password IS 'mật khẩu';


--
-- TOC entry 218 (class 1259 OID 16412)
-- Name: account_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_customers_id_seq OWNER TO postgres;

--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_customers_id_seq OWNED BY public.account_customers.id;


--
-- TOC entry 219 (class 1259 OID 16413)
-- Name: action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.action OWNER TO postgres;

--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE action; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.action IS 'tên các quyền như thêm , sửa , xóa các trường';


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN action.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.action.name IS 'tên quyền';


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN action.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.action.content IS 'nội dung';


--
-- TOC entry 220 (class 1259 OID 16421)
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_id_seq OWNER TO postgres;

--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 220
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- TOC entry 221 (class 1259 OID 16422)
-- Name: administration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administration (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.administration OWNER TO postgres;

--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE administration; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.administration IS 'tên cấp độ tài khoản';


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN administration.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.administration.name IS 'tên';


--
-- TOC entry 222 (class 1259 OID 16428)
-- Name: administration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administration_id_seq OWNER TO postgres;

--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 222
-- Name: administration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administration_id_seq OWNED BY public.administration.id;


--
-- TOC entry 223 (class 1259 OID 16429)
-- Name: admins_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins_notification (
    id integer NOT NULL,
    type_notification smallint NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(5000) NOT NULL,
    watched boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.admins_notification OWNER TO postgres;

--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE admins_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.admins_notification IS 'thông báo cho nhân viên';


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN admins_notification.type_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.admins_notification.type_notification IS 'loại thông báo';


--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN admins_notification.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.admins_notification.content IS 'nội dung thông báo';


--
-- TOC entry 224 (class 1259 OID 16438)
-- Name: admins_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 224
-- Name: admins_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_notification_id_seq OWNED BY public.admins_notification.id;


--
-- TOC entry 225 (class 1259 OID 16439)
-- Name: ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ads (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_ads_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    sub_menu_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    content character varying(500),
    priority integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.ads OWNER TO postgres;

--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE ads; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.ads IS 'quảng cáo';


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN ads.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.name IS 'tên quảng cáo';


--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN ads.event_ads_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.event_ads_id IS 'id sự kiện đang chạy';


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN ads.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.staff_id IS 'mã nhân viên';


--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN ads.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.sub_menu_id IS 'thuộc sub menu nào';


--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN ads.priority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.priority IS 'vị trí ưu tiên';


--
-- TOC entry 226 (class 1259 OID 16447)
-- Name: ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ads_id_seq OWNER TO postgres;

--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 226
-- Name: ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;


--
-- TOC entry 227 (class 1259 OID 16448)
-- Name: api_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_weather (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    longitude character varying(50) NOT NULL,
    latityde character varying(50) NOT NULL,
    content json NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.api_weather OWNER TO postgres;

--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE api_weather; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.api_weather IS 'table api thời tiết';


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN api_weather.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.api_weather.name IS 'tên api';


--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN api_weather.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.api_weather.content IS 'thông tin ';


--
-- TOC entry 228 (class 1259 OID 16456)
-- Name: api_weather_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_weather_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_weather_id_seq OWNER TO postgres;

--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 228
-- Name: api_weather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_weather_id_seq OWNED BY public.api_weather.id;


--
-- TOC entry 229 (class 1259 OID 16457)
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill (
    id integer NOT NULL,
    code_bill character varying(50) NOT NULL,
    staff_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    branch_id smallint NOT NULL,
    payment_methods_id smallint NOT NULL,
    shipping_method_id smallint NOT NULL,
    transfer_providers_id smallint NOT NULL,
    total_products smallint NOT NULL,
    initial_amount integer NOT NULL,
    actual_amount integer NOT NULL,
    giftcode_id smallint,
    successful_payment boolean DEFAULT false,
    note character varying(500),
    impact_number smallint DEFAULT '0'::smallint,
    report_ship boolean DEFAULT false,
    queue_bill boolean DEFAULT true,
    note_report character varying(500),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bill IS 'hóa đơn';


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.code_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.code_bill IS 'mã hóa đơn hiển thị';


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.staff_id IS 'mã nhân viên tạo phiếu';


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.customers_id IS 'phiếu của kh';


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.branch_id IS 'phiệu được tạo ở chi  nhánh';


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.payment_methods_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.payment_methods_id IS 'mã phương thức thanh toán';


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.shipping_method_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.shipping_method_id IS 'mã phương thức nhận hàng';


--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.transfer_providers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.transfer_providers_id IS 'nếu chọn hình thức nhận hàng online
đây là cột mã nhà cung cấp dịch vụ vận chuyển';


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.total_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.total_products IS 'tổng số sp';


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.initial_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.initial_amount IS 'số tiền ban đầu';


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.actual_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.actual_amount IS 'số tiền thực tế';


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.giftcode_id IS 'id mã giảm giá';


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.successful_payment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.successful_payment IS 'đã thanh toán ?';


--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.impact_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.impact_number IS 'số lần chỉnh sửa';


--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.report_ship; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.report_ship IS 'đơn bị tố cáo , cảnh báo';


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN bill.queue_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.queue_bill IS 'đơn đang ở hàng đợi chưa đc duyệt';


--
-- TOC entry 230 (class 1259 OID 16469)
-- Name: bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bill_id_seq OWNER TO postgres;

--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 230
-- Name: bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_id_seq OWNED BY public.bill.id;


--
-- TOC entry 231 (class 1259 OID 16470)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    hotline character varying(50) NOT NULL,
    manage character varying(50) NOT NULL,
    working_time character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE branch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.branch IS 'tên các chi nhánh';


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN branch.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.name IS 'tên chi nhánh';


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN branch.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.address IS 'địa chỉ';


--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN branch.manage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.manage IS 'tên quản lý';


--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN branch.working_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.working_time IS 'thời gian làm việc';


--
-- TOC entry 232 (class 1259 OID 16478)
-- Name: branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branch_id_seq OWNER TO postgres;

--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 232
-- Name: branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_id_seq OWNED BY public.branch.id;


--
-- TOC entry 233 (class 1259 OID 16479)
-- Name: comments_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments_news (
    id integer NOT NULL,
    news_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    comment_id smallint NOT NULL,
    comment character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments_news OWNER TO postgres;

--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE comments_news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.comments_news IS 'bình luận tin tức';


--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN comments_news.news_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.news_id IS 'thuộc tin tức nào  lấy theo id tin tức';


--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN comments_news.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.customers_id IS 'id kh bình luận';


--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN comments_news.comment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.comment_id IS 'thuộc id của bình luận nào
nếu = id chính nó thì là comment_main
nếu !=id chính nó thì nó là sub_comment (đang trả lời 1 comment khác)';


--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN comments_news.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.comment IS 'nội dung bình luận';


--
-- TOC entry 234 (class 1259 OID 16487)
-- Name: comments_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_news_id_seq OWNER TO postgres;

--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 234
-- Name: comments_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_news_id_seq OWNED BY public.comments_news.id;


--
-- TOC entry 235 (class 1259 OID 16488)
-- Name: comments_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments_product (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    comments_product_id smallint NOT NULL,
    vote smallint DEFAULT 5,
    comment character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments_product OWNER TO postgres;

--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE comments_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.comments_product IS 'bình luận về sản phẩm';


--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN comments_product.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.product_id IS 'id sản phẩm';


--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN comments_product.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.customers_id IS 'id kh bình luận';


--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN comments_product.comments_product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.comments_product_id IS 'thuộc id của bình luận nào';


--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN comments_product.vote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.vote IS 'điểm vote cho sp';


--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN comments_product.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.comment IS 'nội dung bl';


--
-- TOC entry 236 (class 1259 OID 16497)
-- Name: comments_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_product_id_seq OWNER TO postgres;

--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 236
-- Name: comments_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_product_id_seq OWNED BY public.comments_product.id;


--
-- TOC entry 237 (class 1259 OID 16498)
-- Name: contact_support; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_support (
    id integer NOT NULL,
    logo character varying(200) NOT NULL,
    link character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contact_support OWNER TO postgres;

--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE contact_support; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.contact_support IS 'các tiện ích tích hợp ở góc phải màn hình : zalo , fb . chatonline';


--
-- TOC entry 238 (class 1259 OID 16504)
-- Name: contact_support_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_support_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_support_id_seq OWNER TO postgres;

--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 238
-- Name: contact_support_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_support_id_seq OWNED BY public.contact_support.id;


--
-- TOC entry 239 (class 1259 OID 16505)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    rank_id smallint DEFAULT 0 NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    address character varying(200) DEFAULT NULL::character varying,
    phone_number character varying[] NOT NULL,
    email character varying[] NOT NULL,
    birthday date,
    sex boolean,
    accumulated_points smallint DEFAULT '1'::smallint,
    number_ban smallint DEFAULT '0'::smallint,
    potential boolean DEFAULT true,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE customers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.customers IS 'ds kh';


--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.rank_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.rank_id IS 'cấp độ kh';


--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.first_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.first_name IS 'tên';


--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.last_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.last_name IS 'họ';


--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.address IS 'địa chỉ';


--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.phone_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.phone_number IS 'số điện thoại';


--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.email IS 'email';


--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.birthday; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.birthday IS 'sinh ngày';


--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.sex IS 'giới tính 0 : nữ 1: nam';


--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.accumulated_points; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.accumulated_points IS 'số điểm tích để lên rank';


--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.number_ban; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.number_ban IS 'số lần bị band';


--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN customers.potential; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.potential IS 'là kh tiềm năng hay ko , nếu là kh tiềm năng thì đồng nghĩa chưa mua hàng mà chỉ mới tạo tk';


--
-- TOC entry 240 (class 1259 OID 16518)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 240
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 241 (class 1259 OID 16519)
-- Name: customers_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_notification (
    id integer NOT NULL,
    type_notification smallint NOT NULL,
    customer_id smallint NOT NULL,
    content character varying(5000) NOT NULL,
    watched boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers_notification OWNER TO postgres;

--
-- TOC entry 4315 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN customers_notification.type_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers_notification.type_notification IS 'loại thông báo';


--
-- TOC entry 4316 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN customers_notification.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers_notification.customer_id IS 'mã khách hàng';


--
-- TOC entry 242 (class 1259 OID 16528)
-- Name: customers_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4317 (class 0 OID 0)
-- Dependencies: 242
-- Name: customers_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_notification_id_seq OWNED BY public.customers_notification.id;


--
-- TOC entry 243 (class 1259 OID 16529)
-- Name: depot_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depot_ticket (
    id integer NOT NULL,
    code_ticket character varying(200) NOT NULL,
    ticket_id smallint NOT NULL,
    staff_id_export smallint NOT NULL,
    staff_id_receive smallint NOT NULL,
    product_id smallint NOT NULL,
    product_number integer NOT NULL,
    total_money integer NOT NULL,
    note character varying(500),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.depot_ticket OWNER TO postgres;

--
-- TOC entry 4318 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN depot_ticket.code_ticket; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.code_ticket IS 'mã phiếu';


--
-- TOC entry 4319 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN depot_ticket.ticket_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.ticket_id IS 'mã loại phiếu';


--
-- TOC entry 4320 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN depot_ticket.staff_id_export; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.staff_id_export IS 'nv xuất';


--
-- TOC entry 4321 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN depot_ticket.staff_id_receive; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.staff_id_receive IS 'nv nhập';


--
-- TOC entry 4322 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN depot_ticket.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.product_id IS 'id sản phẩm';


--
-- TOC entry 4323 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN depot_ticket.product_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.product_number IS 'số lượng sp / nhập hoặc xuất';


--
-- TOC entry 4324 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN depot_ticket.total_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.total_money IS 'số tiền';


--
-- TOC entry 244 (class 1259 OID 16537)
-- Name: depot_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.depot_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.depot_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 4325 (class 0 OID 0)
-- Dependencies: 244
-- Name: depot_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.depot_ticket_id_seq OWNED BY public.depot_ticket.id;


--
-- TOC entry 245 (class 1259 OID 16538)
-- Name: event_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_ads (
    id integer NOT NULL,
    name_event character varying(50) NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(500),
    note character varying(500),
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.event_ads OWNER TO postgres;

--
-- TOC entry 4326 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE event_ads; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.event_ads IS 'tên sự kiện chạy quảng cáo';


--
-- TOC entry 4327 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN event_ads.name_event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.name_event IS 'tên sk';


--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN event_ads.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.staff_id IS 'nv tạo sk';


--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN event_ads.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.content IS 'nội dung sk';


--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN event_ads.start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.start_time IS 'time bắt đầu sk';


--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN event_ads.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.end_time IS 'time kết thúc sk';


--
-- TOC entry 246 (class 1259 OID 16546)
-- Name: event_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_ads_id_seq OWNER TO postgres;

--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 246
-- Name: event_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_ads_id_seq OWNED BY public.event_ads.id;


--
-- TOC entry 247 (class 1259 OID 16547)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16553)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 248
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 249 (class 1259 OID 16554)
-- Name: giftcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.giftcode (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_ads_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(500),
    img character varying(200),
    discount character varying(50) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    number_of_participants smallint NOT NULL,
    used smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.giftcode OWNER TO postgres;

--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE giftcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.giftcode IS 'tên các sự kiện chạy mã code';


--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.name IS 'tên sk chạy code';


--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.event_ads_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.event_ads_id IS 'chạy theo sự sk ads nào';


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.staff_id IS 'nv tạo';


--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.content IS 'nội dung';


--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.discount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.discount IS 'số giảm giá (% hoặc trực tiêp tiền)';


--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.start_time IS 'thời gian bắt đầu';


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.end_time IS 'thời gian kết thúc';


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.number_of_participants; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.number_of_participants IS 'số lượt dùng';


--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN giftcode.used; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.used IS 'số lượt đã đc sử dụng';


--
-- TOC entry 250 (class 1259 OID 16562)
-- Name: giftcode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.giftcode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.giftcode_id_seq OWNER TO postgres;

--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 250
-- Name: giftcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.giftcode_id_seq OWNED BY public.giftcode.id;


--
-- TOC entry 251 (class 1259 OID 16563)
-- Name: history_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_payment (
    id integer NOT NULL,
    payment_method_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    transfer_amount integer DEFAULT 0 NOT NULL,
    cash_amount integer DEFAULT 0 NOT NULL,
    note character varying(200),
    bill_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.history_payment OWNER TO postgres;

--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE history_payment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.history_payment IS 'lịch sử thanh toán';


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN history_payment.payment_method_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.payment_method_id IS 'phương thức thanh toán';


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN history_payment.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.customers_id IS 'mã kh';


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN history_payment.transfer_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.transfer_amount IS 'tiền chuyển khoản';


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN history_payment.cash_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.cash_amount IS 'tiền mặt';


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN history_payment.bill_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.bill_id IS 'theo hoa đơn id';


--
-- TOC entry 252 (class 1259 OID 16571)
-- Name: history_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_payment_id_seq OWNER TO postgres;

--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 252
-- Name: history_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_payment_id_seq OWNED BY public.history_payment.id;


--
-- TOC entry 253 (class 1259 OID 16572)
-- Name: img_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.img_news (
    id integer NOT NULL,
    name_img character varying(50) NOT NULL,
    news_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    location smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.img_news OWNER TO postgres;

--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN img_news.name_img; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.name_img IS 'tên ảnh';


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN img_news.news_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.news_id IS 'thuộc tin tức';


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN img_news.location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.location IS 'vị trí';


--
-- TOC entry 254 (class 1259 OID 16578)
-- Name: img_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.img_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.img_news_id_seq OWNER TO postgres;

--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 254
-- Name: img_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.img_news_id_seq OWNED BY public.img_news.id;


--
-- TOC entry 255 (class 1259 OID 16579)
-- Name: img_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.img_products (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    display_order smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.img_products OWNER TO postgres;

--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE img_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.img_products IS 'ảnh sản phảm';


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN img_products.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.product_id IS 'thuộc sản phẩm nào';


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN img_products.img; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.img IS 'ảnh';


--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN img_products.display_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.display_order IS 'ưu tiên hiển thị';


--
-- TOC entry 256 (class 1259 OID 16585)
-- Name: img_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.img_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.img_products_id_seq OWNER TO postgres;

--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 256
-- Name: img_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.img_products_id_seq OWNED BY public.img_products.id;


--
-- TOC entry 257 (class 1259 OID 16586)
-- Name: intermediary_account_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intermediary_account_service (
    id integer NOT NULL,
    servive_name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.intermediary_account_service OWNER TO postgres;

--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE intermediary_account_service; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.intermediary_account_service IS 'tên các bên dịch vụ tài khoản thứ 3 : gg, git , zalo ,..';


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN intermediary_account_service.servive_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.intermediary_account_service.servive_name IS 'tên dv';


--
-- TOC entry 258 (class 1259 OID 16592)
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intermediary_account_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intermediary_account_service_id_seq OWNER TO postgres;

--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 258
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intermediary_account_service_id_seq OWNED BY public.intermediary_account_service.id;


--
-- TOC entry 259 (class 1259 OID 16593)
-- Name: list_codes_received; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_codes_received (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    giftcode_id smallint NOT NULL,
    is_expired boolean DEFAULT true,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.list_codes_received OWNER TO postgres;

--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE list_codes_received; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.list_codes_received IS 'ds kh nhận dc những code';


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN list_codes_received.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.customers_id IS 'mã kh';


--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN list_codes_received.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.giftcode_id IS 'mã code';


--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN list_codes_received.is_expired; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.is_expired IS 'đã dc sử dung';


--
-- TOC entry 260 (class 1259 OID 16600)
-- Name: list_codes_received_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_codes_received_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_codes_received_id_seq OWNER TO postgres;

--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 260
-- Name: list_codes_received_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_codes_received_id_seq OWNED BY public.list_codes_received.id;


--
-- TOC entry 261 (class 1259 OID 16601)
-- Name: list_giftcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_giftcodes (
    id integer NOT NULL,
    giftcode_id smallint NOT NULL,
    code character varying(20) NOT NULL,
    already_received boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.list_giftcodes OWNER TO postgres;

--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN list_giftcodes.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.giftcode_id IS 'thuộc sk code nào';


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN list_giftcodes.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.code IS 'mã code';


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN list_giftcodes.already_received; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.already_received IS 'đã có người nhận hay chưa';


--
-- TOC entry 262 (class 1259 OID 16608)
-- Name: list_giftcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_giftcodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_giftcodes_id_seq OWNER TO postgres;

--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 262
-- Name: list_giftcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_giftcodes_id_seq OWNED BY public.list_giftcodes.id;


--
-- TOC entry 263 (class 1259 OID 16609)
-- Name: list_products_by_bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_products_by_bill (
    id integer NOT NULL,
    bill_id smallint NOT NULL,
    products_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    quantity smallint,
    amount_of_money integer
);


ALTER TABLE public.list_products_by_bill OWNER TO postgres;

--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE list_products_by_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.list_products_by_bill IS 'ds sản phẩm  được mua theo hóa đơn';


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN list_products_by_bill.bill_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.bill_id IS 'mã hóa đơn';


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN list_products_by_bill.products_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.products_id IS 'mã sp';


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN list_products_by_bill.quantity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.quantity IS 'số lượng sản phẩm';


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN list_products_by_bill.amount_of_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.amount_of_money IS 'số tiền của sản phẩm';


--
-- TOC entry 264 (class 1259 OID 16615)
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_products_by_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_products_by_bill_id_seq OWNER TO postgres;

--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 264
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_products_by_bill_id_seq OWNED BY public.list_products_by_bill.id;


--
-- TOC entry 265 (class 1259 OID 16616)
-- Name: log_deletes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_deletes (
    id integer NOT NULL,
    type_delete_id smallint NOT NULL,
    content character varying(200) NOT NULL,
    internal boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_deletes OWNER TO postgres;

--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE log_deletes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.log_deletes IS 'lịch sử xóa';


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN log_deletes.type_delete_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.log_deletes.type_delete_id IS 'loại xóa';


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN log_deletes.internal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.log_deletes.internal IS 'thuộc nội bộ hay ko';


--
-- TOC entry 266 (class 1259 OID 16623)
-- Name: log_deletes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_deletes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_deletes_id_seq OWNER TO postgres;

--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 266
-- Name: log_deletes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_deletes_id_seq OWNED BY public.log_deletes.id;


--
-- TOC entry 267 (class 1259 OID 16624)
-- Name: log_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_login (
    id integer NOT NULL,
    user_login character varying(50) NOT NULL,
    type smallint NOT NULL,
    content character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_login OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 16630)
-- Name: log_login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_login_id_seq OWNER TO postgres;

--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 268
-- Name: log_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_login_id_seq OWNED BY public.log_login.id;


--
-- TOC entry 269 (class 1259 OID 16631)
-- Name: log_updates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_updates (
    id integer NOT NULL,
    type_update_id smallint NOT NULL,
    content character varying(200) NOT NULL,
    internal boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_updates OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 16638)
-- Name: log_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_updates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_updates_id_seq OWNER TO postgres;

--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 270
-- Name: log_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_updates_id_seq OWNED BY public.log_updates.id;


--
-- TOC entry 271 (class 1259 OID 16639)
-- Name: menu_main; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_main (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(50),
    is_sub_menu boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.menu_main OWNER TO postgres;

--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE menu_main; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.menu_main IS 'menu chính';


--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN menu_main.is_sub_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.menu_main.is_sub_menu IS 'có sub menu ko';


--
-- TOC entry 272 (class 1259 OID 16646)
-- Name: menu_main_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_main_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_main_id_seq OWNER TO postgres;

--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 272
-- Name: menu_main_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_main_id_seq OWNED BY public.menu_main.id;


--
-- TOC entry 273 (class 1259 OID 16647)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 16650)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 274
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 275 (class 1259 OID 16651)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    name_news character varying(50) NOT NULL,
    sub_menu_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    img_main character varying(200) NOT NULL,
    content text NOT NULL,
    tag character varying(100) NOT NULL,
    views smallint DEFAULT 0,
    likes smallint DEFAULT 0,
    comments smallint DEFAULT 0,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.news IS 'tin tức';


--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN news.name_news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.name_news IS 'tên tin';


--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN news.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.sub_menu_id IS 'thuộc tin tức nào';


--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN news.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.staff_id IS 'nhân viên đnăg';


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN news.views; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.views IS 'lượt xem';


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN news.likes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.likes IS 'số like';


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN news.comments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.comments IS 'lượt comment';


--
-- TOC entry 276 (class 1259 OID 16662)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 276
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 277 (class 1259 OID 16663)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 16668)
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE payment_methods; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.payment_methods IS 'tên các phương thức thanh toán';


--
-- TOC entry 279 (class 1259 OID 16674)
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_id_seq OWNER TO postgres;

--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 279
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;


--
-- TOC entry 280 (class 1259 OID 16675)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 16680)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 281
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 282 (class 1259 OID 16681)
-- Name: policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    img character varying(200) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.policy OWNER TO postgres;

--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE policy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.policy IS 'tên các dịch vụ , đặc quyền  cho sản phẩm';


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN policy.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.staff_id IS 'nv tạo dịch vụ';


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN policy.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.name IS 'tên dv';


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN policy.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.content IS 'nội dung quyền';


--
-- TOC entry 283 (class 1259 OID 16689)
-- Name: policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.policy_id_seq OWNER TO postgres;

--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 283
-- Name: policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.policy_id_seq OWNED BY public.policy.id;


--
-- TOC entry 284 (class 1259 OID 16690)
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE "position"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."position" IS 'chức vụ nhân viên';


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "position".name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."position".name IS 'tên';


--
-- TOC entry 285 (class 1259 OID 16698)
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.position_id_seq OWNER TO postgres;

--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 285
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;


--
-- TOC entry 286 (class 1259 OID 16699)
-- Name: price_difference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_difference (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    product_id smallint NOT NULL,
    import_price integer NOT NULL,
    export_price integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.price_difference OWNER TO postgres;

--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE price_difference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.price_difference IS 'bảng lưu sự chênh lệnh giá';


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN price_difference.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.staff_id IS 'nhân viên tác động';


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN price_difference.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.product_id IS 'sảm phẩm';


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN price_difference.import_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.import_price IS 'số tiền nhập';


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN price_difference.export_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.export_price IS 'bán ra';


--
-- TOC entry 287 (class 1259 OID 16705)
-- Name: price_difference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_difference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_difference_id_seq OWNER TO postgres;

--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 287
-- Name: price_difference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_difference_id_seq OWNED BY public.price_difference.id;


--
-- TOC entry 288 (class 1259 OID 16706)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    sub_menu_id smallint NOT NULL,
    code_products character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    img_main character varying(50) NOT NULL,
    origin character varying(50) NOT NULL,
    color character varying[] NOT NULL,
    size character varying[] NOT NULL,
    into_money integer NOT NULL,
    vote double precision DEFAULT '0'::double precision,
    intro character varying(500) NOT NULL,
    number_of_products_sold integer NOT NULL,
    remaining_products integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_promotion boolean
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.products IS 'ds sp';


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.sub_menu_id IS 'thuộc submenu nào';


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.code_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.code_products IS 'mã sp';


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.name IS 'tên sp';


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.origin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.origin IS 'nguồn gôc sp';


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.color; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.color IS 'màu sắc sp';


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.size IS 'các cỡ sp';


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.into_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.into_money IS 'tiền cho sp';


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.vote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.vote IS 'lượt vote';


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.number_of_products_sold; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.number_of_products_sold IS 'số lượng sản phẩm bán dc';


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.remaining_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.remaining_products IS 'sản phẩm còn lại';


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN products.is_promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.is_promotion IS 'đang trong chương trình giảm giá ko';


--
-- TOC entry 289 (class 1259 OID 16715)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 289
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 290 (class 1259 OID 16716)
-- Name: products_in_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_in_stock (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    warehouse_id smallint NOT NULL,
    remaining smallint NOT NULL,
    import_price integer NOT NULL,
    export_price integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products_in_stock OWNER TO postgres;

--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE products_in_stock; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.products_in_stock IS 'sản phẩmtrong kho';


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN products_in_stock.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.product_id IS 'tên sp';


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN products_in_stock.warehouse_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.warehouse_id IS 'thuộc kho';


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN products_in_stock.remaining; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.remaining IS 'số sản phẩm còn';


--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN products_in_stock.import_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.import_price IS 'giá nhập';


--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN products_in_stock.export_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.export_price IS 'giá bán';


--
-- TOC entry 291 (class 1259 OID 16722)
-- Name: products_in_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_in_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_in_stock_id_seq OWNER TO postgres;

--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 291
-- Name: products_in_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_in_stock_id_seq OWNED BY public.products_in_stock.id;


--
-- TOC entry 292 (class 1259 OID 16723)
-- Name: promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    type_promotion_id smallint NOT NULL,
    endtime date NOT NULL,
    starttime date NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.promotion OWNER TO postgres;

--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 292
-- Name: TABLE promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN promotion.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.product_id IS 'sản phẩm dc dùng';


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN promotion.type_promotion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.type_promotion_id IS 'loại km';


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN promotion.endtime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.endtime IS 'thời gian kết thúc';


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN promotion.starttime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.starttime IS 'thời gian bắt đầu';


--
-- TOC entry 293 (class 1259 OID 16729)
-- Name: promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_id_seq OWNER TO postgres;

--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 293
-- Name: promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_id_seq OWNED BY public.promotion.id;


--
-- TOC entry 294 (class 1259 OID 16730)
-- Name: rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rank (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    detail character varying(200) NOT NULL,
    icon character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    score smallint
);


ALTER TABLE public.rank OWNER TO postgres;

--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE rank; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.rank IS 'tên các cấp rank';


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN rank.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.name IS 'tên';


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN rank.detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.detail IS 'chi tiết';


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN rank.score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.score IS 'số điểm để lên cấp rank';


--
-- TOC entry 295 (class 1259 OID 16736)
-- Name: rank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rank_id_seq OWNER TO postgres;

--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 295
-- Name: rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rank_id_seq OWNED BY public.rank.id;


--
-- TOC entry 296 (class 1259 OID 16737)
-- Name: report_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_source (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.report_source OWNER TO postgres;

--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE report_source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.report_source IS 'tên nguồn tố cáo';


--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN report_source.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_source.name IS 'tên';


--
-- TOC entry 297 (class 1259 OID 16745)
-- Name: report_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_source_id_seq OWNER TO postgres;

--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 297
-- Name: report_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_source_id_seq OWNED BY public.report_source.id;


--
-- TOC entry 298 (class 1259 OID 16746)
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    sub_report smallint NOT NULL,
    type_report_id smallint NOT NULL,
    is_processed boolean DEFAULT false,
    report_source_id smallint NOT NULL,
    content character varying(1000) NOT NULL,
    feed_back_content character varying(1000),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    sub boolean DEFAULT false
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE reports; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.reports IS 'các phiếu tố cáo';


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.customers_id IS 'kh tố';


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.staff_id IS 'nhân viên nhận vào phản hồi';


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.sub_report; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.sub_report IS 'là sub reporrt ko';


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.type_report_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.type_report_id IS 'loại tố cáo';


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.is_processed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.is_processed IS 'đã dc giải quyêt xong chưa';


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.report_source_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.report_source_id IS 'mã nguồn tố cáo';


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.content IS 'nội dung kh';


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.feed_back_content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.feed_back_content IS 'nội dung nv';


--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN reports.sub; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.sub IS 'có phải là fback con ko';


--
-- TOC entry 299 (class 1259 OID 16756)
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO postgres;

--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 299
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- TOC entry 300 (class 1259 OID 16757)
-- Name: service_by_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_by_product (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    policy_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.service_by_product OWNER TO postgres;

--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 300
-- Name: TABLE service_by_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.service_by_product IS 'các sản phảm được hưởng các dịch vụ';


--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN service_by_product.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_by_product.product_id IS 'tên sp';


--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN service_by_product.policy_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_by_product.policy_id IS 'tên dv';


--
-- TOC entry 301 (class 1259 OID 16763)
-- Name: service_by_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_by_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_by_product_id_seq OWNER TO postgres;

--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 301
-- Name: service_by_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_by_product_id_seq OWNED BY public.service_by_product.id;


--
-- TOC entry 302 (class 1259 OID 16764)
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.shipping_method OWNER TO postgres;

--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE shipping_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.shipping_method IS 'tên các phương thức nhận hàng : ở cửa hàng , ở chi nhánh khác ,  giao hàng';


--
-- TOC entry 303 (class 1259 OID 16770)
-- Name: shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_method_id_seq OWNER TO postgres;

--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 303
-- Name: shipping_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_method_id_seq OWNED BY public.shipping_method.id;


--
-- TOC entry 304 (class 1259 OID 16771)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    code_staff character varying(50) NOT NULL,
    position_id smallint NOT NULL,
    branch_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    phone_number character varying(50) NOT NULL,
    email character varying(50),
    birthday date,
    sex boolean,
    img character varying(200),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    background character varying(200)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 304
-- Name: TABLE staff; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.staff IS 'ds nhân viên';


--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff.code_staff; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.code_staff IS 'mã đinh danh nhân viên';


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff.position_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.position_id IS 'id chức vụ';


--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.branch_id IS 'id chi nhánh';


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.name IS 'tên nhân viên';


--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.address IS 'địa chỉ nhân viên';


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff.phone_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.phone_number IS 'sdt';


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.sex IS 'giới tính 0 : nữ 1: nam';


--
-- TOC entry 305 (class 1259 OID 16779)
-- Name: staff_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_account (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    administration_id smallint NOT NULL,
    user_name character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token boolean,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    refresh_token character varying(500),
    issued_at timestamp without time zone,
    expired_time timestamp without time zone
);


ALTER TABLE public.staff_account OWNER TO postgres;

--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE staff_account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.staff_account IS 'tk nhân viên';


--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN staff_account.refresh_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.refresh_token IS 'mã refresh tonken';


--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN staff_account.issued_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.issued_at IS 'thời gian phát hành';


--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN staff_account.expired_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.expired_time IS 'thời gian hết hạn';


--
-- TOC entry 306 (class 1259 OID 16787)
-- Name: staff_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_account_id_seq OWNER TO postgres;

--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 306
-- Name: staff_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_account_id_seq OWNED BY public.staff_account.id;


--
-- TOC entry 307 (class 1259 OID 16788)
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO postgres;

--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 307
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- TOC entry 308 (class 1259 OID 16789)
-- Name: sub_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_menu (
    id integer NOT NULL,
    menu_main_id smallint NOT NULL,
    name character varying(20) NOT NULL,
    color character varying(20) NOT NULL,
    sub boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sub_menu OWNER TO postgres;

--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 308
-- Name: TABLE sub_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sub_menu IS 'ds submenu';


--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 308
-- Name: COLUMN sub_menu.menu_main_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sub_menu.menu_main_id IS 'thuộc menu nào';


--
-- TOC entry 309 (class 1259 OID 16796)
-- Name: sub_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_menu_id_seq OWNER TO postgres;

--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 309
-- Name: sub_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_menu_id_seq OWNED BY public.sub_menu.id;


--
-- TOC entry 310 (class 1259 OID 16797)
-- Name: transfer_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfer_providers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.transfer_providers OWNER TO postgres;

--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 310
-- Name: TABLE transfer_providers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.transfer_providers IS 'các nhà cung cấp dịch vụ thanh toán online';


--
-- TOC entry 311 (class 1259 OID 16803)
-- Name: transfer_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transfer_providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfer_providers_id_seq OWNER TO postgres;

--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 311
-- Name: transfer_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transfer_providers_id_seq OWNED BY public.transfer_providers.id;


--
-- TOC entry 312 (class 1259 OID 16804)
-- Name: type_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_notification (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    color character varying(20) DEFAULT '000000'::character varying
);


ALTER TABLE public.type_notification OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 16813)
-- Name: type_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 313
-- Name: type_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_notification_id_seq OWNED BY public.type_notification.id;


--
-- TOC entry 314 (class 1259 OID 16814)
-- Name: type_promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_promotion (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(200) NOT NULL,
    code_hide character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.type_promotion OWNER TO postgres;

--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 314
-- Name: TABLE type_promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 314
-- Name: COLUMN type_promotion.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.name IS 'tên kh';


--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 314
-- Name: COLUMN type_promotion.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.content IS 'nội dung km';


--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 314
-- Name: COLUMN type_promotion.code_hide; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.code_hide IS 'đây là code ẩn khi gắn mà chương trình sẽ tính ra luôn kq km';


--
-- TOC entry 315 (class 1259 OID 16820)
-- Name: type_promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_promotion_id_seq OWNER TO postgres;

--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 315
-- Name: type_promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_promotion_id_seq OWNED BY public.type_promotion.id;


--
-- TOC entry 316 (class 1259 OID 16821)
-- Name: type_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_report (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.type_report OWNER TO postgres;

--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 316
-- Name: TABLE type_report; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_report IS 'loại tố cáo';


--
-- TOC entry 317 (class 1259 OID 16829)
-- Name: type_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_report_id_seq OWNER TO postgres;

--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 317
-- Name: type_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_report_id_seq OWNED BY public.type_report.id;


--
-- TOC entry 318 (class 1259 OID 16830)
-- Name: type_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_ticket (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(200),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.type_ticket OWNER TO postgres;

--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 318
-- Name: TABLE type_ticket; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_ticket IS 'loại phiếu';


--
-- TOC entry 319 (class 1259 OID 16836)
-- Name: type_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 319
-- Name: type_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_ticket_id_seq OWNED BY public.type_ticket.id;


--
-- TOC entry 320 (class 1259 OID 16837)
-- Name: type_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_update (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.type_update OWNER TO postgres;

--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 320
-- Name: TABLE type_update; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_update IS 'các loại update / xóa / ẩn';


--
-- TOC entry 321 (class 1259 OID 16845)
-- Name: type_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_update_id_seq OWNER TO postgres;

--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 321
-- Name: type_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_update_id_seq OWNED BY public.type_update.id;


--
-- TOC entry 322 (class 1259 OID 16846)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    hotline character varying(50) NOT NULL,
    manage character varying(50) NOT NULL,
    branch_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 322
-- Name: TABLE warehouse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.warehouse IS 'tên các kho';


--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 322
-- Name: COLUMN warehouse.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.warehouse.branch_id IS 'thuộc chi nhánh nào';


--
-- TOC entry 323 (class 1259 OID 16852)
-- Name: warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warehouse_id_seq OWNER TO postgres;

--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 323
-- Name: warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;


--
-- TOC entry 324 (class 1259 OID 16853)
-- Name: websockets_statistics_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.websockets_statistics_entries (
    id integer NOT NULL,
    app_id character varying(255) NOT NULL,
    peak_connection_count integer NOT NULL,
    websocket_message_count integer NOT NULL,
    api_message_count integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.websockets_statistics_entries OWNER TO postgres;

--
-- TOC entry 325 (class 1259 OID 16856)
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.websockets_statistics_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.websockets_statistics_entries_id_seq OWNER TO postgres;

--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 325
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;


--
-- TOC entry 3449 (class 2604 OID 16857)
-- Name: account_admin_action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action ALTER COLUMN id SET DEFAULT nextval('public.account_admin_action_id_seq'::regclass);


--
-- TOC entry 3453 (class 2604 OID 16858)
-- Name: account_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_customers ALTER COLUMN id SET DEFAULT nextval('public.account_customers_id_seq'::regclass);


--
-- TOC entry 3457 (class 2604 OID 16859)
-- Name: action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- TOC entry 3461 (class 2604 OID 16860)
-- Name: administration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration ALTER COLUMN id SET DEFAULT nextval('public.administration_id_seq'::regclass);


--
-- TOC entry 3465 (class 2604 OID 16861)
-- Name: admins_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification ALTER COLUMN id SET DEFAULT nextval('public.admins_notification_id_seq'::regclass);


--
-- TOC entry 3470 (class 2604 OID 16862)
-- Name: ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads ALTER COLUMN id SET DEFAULT nextval('public.ads_id_seq'::regclass);


--
-- TOC entry 3474 (class 2604 OID 16863)
-- Name: api_weather id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather ALTER COLUMN id SET DEFAULT nextval('public.api_weather_id_seq'::regclass);


--
-- TOC entry 3478 (class 2604 OID 16864)
-- Name: bill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill ALTER COLUMN id SET DEFAULT nextval('public.bill_id_seq'::regclass);


--
-- TOC entry 3486 (class 2604 OID 16865)
-- Name: branch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch ALTER COLUMN id SET DEFAULT nextval('public.branch_id_seq'::regclass);


--
-- TOC entry 3490 (class 2604 OID 16866)
-- Name: comments_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news ALTER COLUMN id SET DEFAULT nextval('public.comments_news_id_seq'::regclass);


--
-- TOC entry 3494 (class 2604 OID 16867)
-- Name: comments_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product ALTER COLUMN id SET DEFAULT nextval('public.comments_product_id_seq'::regclass);


--
-- TOC entry 3499 (class 2604 OID 16868)
-- Name: contact_support id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_support ALTER COLUMN id SET DEFAULT nextval('public.contact_support_id_seq'::regclass);


--
-- TOC entry 3503 (class 2604 OID 16869)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 3512 (class 2604 OID 16870)
-- Name: customers_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification ALTER COLUMN id SET DEFAULT nextval('public.customers_notification_id_seq'::regclass);


--
-- TOC entry 3517 (class 2604 OID 16871)
-- Name: depot_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket ALTER COLUMN id SET DEFAULT nextval('public.depot_ticket_id_seq'::regclass);


--
-- TOC entry 3521 (class 2604 OID 16872)
-- Name: event_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads ALTER COLUMN id SET DEFAULT nextval('public.event_ads_id_seq'::regclass);


--
-- TOC entry 3525 (class 2604 OID 16873)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3527 (class 2604 OID 16874)
-- Name: giftcode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode ALTER COLUMN id SET DEFAULT nextval('public.giftcode_id_seq'::regclass);


--
-- TOC entry 3531 (class 2604 OID 16875)
-- Name: history_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment ALTER COLUMN id SET DEFAULT nextval('public.history_payment_id_seq'::regclass);


--
-- TOC entry 3537 (class 2604 OID 16876)
-- Name: img_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news ALTER COLUMN id SET DEFAULT nextval('public.img_news_id_seq'::regclass);


--
-- TOC entry 3541 (class 2604 OID 16877)
-- Name: img_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products ALTER COLUMN id SET DEFAULT nextval('public.img_products_id_seq'::regclass);


--
-- TOC entry 3545 (class 2604 OID 16878)
-- Name: intermediary_account_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service ALTER COLUMN id SET DEFAULT nextval('public.intermediary_account_service_id_seq'::regclass);


--
-- TOC entry 3549 (class 2604 OID 16879)
-- Name: list_codes_received id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received ALTER COLUMN id SET DEFAULT nextval('public.list_codes_received_id_seq'::regclass);


--
-- TOC entry 3554 (class 2604 OID 16880)
-- Name: list_giftcodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes ALTER COLUMN id SET DEFAULT nextval('public.list_giftcodes_id_seq'::regclass);


--
-- TOC entry 3559 (class 2604 OID 16881)
-- Name: list_products_by_bill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill ALTER COLUMN id SET DEFAULT nextval('public.list_products_by_bill_id_seq'::regclass);


--
-- TOC entry 3563 (class 2604 OID 16882)
-- Name: log_deletes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes ALTER COLUMN id SET DEFAULT nextval('public.log_deletes_id_seq'::regclass);


--
-- TOC entry 3568 (class 2604 OID 16883)
-- Name: log_login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_login ALTER COLUMN id SET DEFAULT nextval('public.log_login_id_seq'::regclass);


--
-- TOC entry 3572 (class 2604 OID 16884)
-- Name: log_updates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates ALTER COLUMN id SET DEFAULT nextval('public.log_updates_id_seq'::regclass);


--
-- TOC entry 3577 (class 2604 OID 16885)
-- Name: menu_main id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main ALTER COLUMN id SET DEFAULT nextval('public.menu_main_id_seq'::regclass);


--
-- TOC entry 3582 (class 2604 OID 16886)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3583 (class 2604 OID 16887)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 3590 (class 2604 OID 16888)
-- Name: payment_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);


--
-- TOC entry 3594 (class 2604 OID 16889)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3595 (class 2604 OID 16890)
-- Name: policy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy ALTER COLUMN id SET DEFAULT nextval('public.policy_id_seq'::regclass);


--
-- TOC entry 3599 (class 2604 OID 16891)
-- Name: position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);


--
-- TOC entry 3603 (class 2604 OID 16892)
-- Name: price_difference id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference ALTER COLUMN id SET DEFAULT nextval('public.price_difference_id_seq'::regclass);


--
-- TOC entry 3607 (class 2604 OID 16893)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3612 (class 2604 OID 16894)
-- Name: products_in_stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock ALTER COLUMN id SET DEFAULT nextval('public.products_in_stock_id_seq'::regclass);


--
-- TOC entry 3616 (class 2604 OID 16895)
-- Name: promotion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_id_seq'::regclass);


--
-- TOC entry 3620 (class 2604 OID 16896)
-- Name: rank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rank ALTER COLUMN id SET DEFAULT nextval('public.rank_id_seq'::regclass);


--
-- TOC entry 3624 (class 2604 OID 16897)
-- Name: report_source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source ALTER COLUMN id SET DEFAULT nextval('public.report_source_id_seq'::regclass);


--
-- TOC entry 3628 (class 2604 OID 16898)
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- TOC entry 3634 (class 2604 OID 16899)
-- Name: service_by_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product ALTER COLUMN id SET DEFAULT nextval('public.service_by_product_id_seq'::regclass);


--
-- TOC entry 3638 (class 2604 OID 16900)
-- Name: shipping_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_id_seq'::regclass);


--
-- TOC entry 3642 (class 2604 OID 16901)
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- TOC entry 3646 (class 2604 OID 16902)
-- Name: staff_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account ALTER COLUMN id SET DEFAULT nextval('public.staff_account_id_seq'::regclass);


--
-- TOC entry 3650 (class 2604 OID 16903)
-- Name: sub_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu ALTER COLUMN id SET DEFAULT nextval('public.sub_menu_id_seq'::regclass);


--
-- TOC entry 3655 (class 2604 OID 16904)
-- Name: transfer_providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers ALTER COLUMN id SET DEFAULT nextval('public.transfer_providers_id_seq'::regclass);


--
-- TOC entry 3659 (class 2604 OID 16905)
-- Name: type_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification ALTER COLUMN id SET DEFAULT nextval('public.type_notification_id_seq'::regclass);


--
-- TOC entry 3664 (class 2604 OID 16906)
-- Name: type_promotion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion ALTER COLUMN id SET DEFAULT nextval('public.type_promotion_id_seq'::regclass);


--
-- TOC entry 3668 (class 2604 OID 16907)
-- Name: type_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report ALTER COLUMN id SET DEFAULT nextval('public.type_report_id_seq'::regclass);


--
-- TOC entry 3672 (class 2604 OID 16908)
-- Name: type_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket ALTER COLUMN id SET DEFAULT nextval('public.type_ticket_id_seq'::regclass);


--
-- TOC entry 3676 (class 2604 OID 16909)
-- Name: type_update id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update ALTER COLUMN id SET DEFAULT nextval('public.type_update_id_seq'::regclass);


--
-- TOC entry 3680 (class 2604 OID 16910)
-- Name: warehouse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);


--
-- TOC entry 3684 (class 2604 OID 16911)
-- Name: websockets_statistics_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);


--
-- TOC entry 4116 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: account_admin_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_admin_action (id, administration_id, action_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4118 (class 0 OID 16406)
-- Dependencies: 217
-- Data for Name: account_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_customers (id, customers_id, remember_token, user_name, password, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4120 (class 0 OID 16413)
-- Dependencies: 219
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action (id, name, content, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4122 (class 0 OID 16422)
-- Dependencies: 221
-- Data for Name: administration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administration (id, name, status, created_at, updated_at) FROM stdin;
1	khoa	t	2023-07-18 13:53:42.333383	2023-07-18 13:53:42.333383
\.


--
-- TOC entry 4124 (class 0 OID 16429)
-- Dependencies: 223
-- Data for Name: admins_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins_notification (id, type_notification, staff_id, content, watched, status, created_at, updated_at) FROM stdin;
5	1	2	test post men	f	t	2023-09-21 10:59:21	2023-09-21 10:59:21
6	1	2	test post men	f	t	2023-09-21 11:02:35	2023-09-21 11:02:35
7	2	2	3	f	t	2023-09-21 11:40:57	2023-09-21 11:40:57
9	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:43:37	2023-09-21 11:43:37
10	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:43:59	2023-09-21 11:43:59
12	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:47:31	2023-09-21 11:47:31
13	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:47:46	2023-09-21 11:47:46
15	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:48:05	2023-09-21 11:48:05
16	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:48:07	2023-09-21 11:48:07
17	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:48:10	2023-09-21 11:48:10
18	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:48:12	2023-09-21 11:48:12
19	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:48:13	2023-09-21 11:48:13
4	3	2	test post men	f	t	2023-09-21 10:57:26	2023-09-21 15:48:45.329657
8	3	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:42:00	2023-09-21 15:49:14.533106
11	6	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:45:38	2023-09-21 15:49:14.533766
14	7	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:48:02	2023-09-21 15:49:14.534238
36	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:22	2023-09-28 11:21:07.665547
20	7	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:48:14	2023-09-21 15:51:12.550098
37	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:22	2023-09-28 11:21:07.665547
22	5	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:51:03	2023-09-21 15:51:12.552316
23	3	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	f	t	2023-09-21 11:53:49	2023-09-21 15:51:12.553252
25	1	2	1	f	t	2023-09-21 13:10:11	2023-09-21 15:51:12.553572
38	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:23	2023-09-28 11:21:07.665547
39	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:23	2023-09-28 11:21:07.665547
40	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:24	2023-09-28 11:21:07.665547
41	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:24	2023-09-28 11:21:07.665547
42	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:24	2023-09-28 11:21:07.665547
43	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:25	2023-09-28 11:21:07.665547
44	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:25	2023-09-28 11:21:07.665547
3	1	2	test post men	t	t	2023-09-21 10:54:55	2023-09-21 16:35:35.400863
21	6	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-21 11:48:17	2023-09-21 16:35:35.401341
24	2	2	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-21 13:09:44	2023-09-21 16:35:35.401767
45	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:25	2023-09-28 11:21:07.665547
1	1	5	test	t	t	2023-09-21 09:41:14.158167	2023-09-28 11:21:07.665547
2	1	5	test post men	t	t	2023-09-21 10:54:36	2023-09-28 11:21:07.665547
26	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:08	2023-09-28 11:21:07.665547
27	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:10	2023-09-28 11:21:07.665547
28	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:14	2023-09-28 11:21:07.665547
29	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:15	2023-09-28 11:21:07.665547
30	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:16	2023-09-28 11:21:07.665547
31	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:17	2023-09-28 11:21:07.665547
32	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:18	2023-09-28 11:21:07.665547
46	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:26	2023-09-28 11:21:07.665547
33	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:18	2023-09-28 11:21:07.665547
34	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:18	2023-09-28 11:21:07.665547
35	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:48:19	2023-09-28 11:21:07.665547
47	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:50:41	2023-09-28 11:21:07.665547
48	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:50:45	2023-09-28 11:21:07.665547
49	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:55:49	2023-09-28 11:21:07.665547
50	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:57:58	2023-09-28 11:21:07.665547
51	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-26 09:58:00	2023-09-28 11:21:07.665547
52	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-28 09:37:01	2023-09-28 11:21:10.077518
53	2	5	{"name":["T\\u00ean \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng"]}	t	t	2023-09-28 11:22:28	2023-09-28 11:52:43.657536
\.


--
-- TOC entry 4126 (class 0 OID 16439)
-- Dependencies: 225
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ads (id, name, event_ads_id, staff_id, sub_menu_id, img, content, priority, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4128 (class 0 OID 16448)
-- Dependencies: 227
-- Data for Name: api_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_weather (id, name, city, longitude, latityde, content, status, created_at, updated_at) FROM stdin;
7	get weatherHà Nội	Hà Nội	105.7864	21.0303	{"weather":{"id":502,"main":"Rain","description":"mưa cường độ nặng","icon":"10d"},"main":{"temp":31.05,"feels_like":33.99,"temp_min":31.05,"temp_max":31.05,"pressure":1000,"humidity":56,"sea_level":1000,"grnd_level":999}}	t	2023-07-31 14:07:17.104696	2023-07-31 15:16:05.150639
\.


--
-- TOC entry 4130 (class 0 OID 16457)
-- Dependencies: 229
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill (id, code_bill, staff_id, customers_id, branch_id, payment_methods_id, shipping_method_id, transfer_providers_id, total_products, initial_amount, actual_amount, giftcode_id, successful_payment, note, impact_number, report_ship, queue_bill, note_report, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4132 (class 0 OID 16470)
-- Dependencies: 231
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (id, name, address, hotline, manage, working_time, status, created_at, updated_at) FROM stdin;
1	nhà 1	viet nam	0849328210	KHoa	11-12	t	2023-07-18 13:44:09.440164	2023-07-18 13:44:09.440164
\.


--
-- TOC entry 4134 (class 0 OID 16479)
-- Dependencies: 233
-- Data for Name: comments_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments_news (id, news_id, customers_id, comment_id, comment, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4136 (class 0 OID 16488)
-- Dependencies: 235
-- Data for Name: comments_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments_product (id, product_id, customers_id, comments_product_id, vote, comment, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4138 (class 0 OID 16498)
-- Dependencies: 237
-- Data for Name: contact_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_support (id, logo, link, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4140 (class 0 OID 16505)
-- Dependencies: 239
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, rank_id, first_name, last_name, address, phone_number, email, birthday, sex, accumulated_points, number_ban, potential, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4142 (class 0 OID 16519)
-- Dependencies: 241
-- Data for Name: customers_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_notification (id, type_notification, customer_id, content, watched, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4144 (class 0 OID 16529)
-- Dependencies: 243
-- Data for Name: depot_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depot_ticket (id, code_ticket, ticket_id, staff_id_export, staff_id_receive, product_id, product_number, total_money, note, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4146 (class 0 OID 16538)
-- Dependencies: 245
-- Data for Name: event_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_ads (id, name_event, staff_id, content, note, start_time, end_time, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4148 (class 0 OID 16547)
-- Dependencies: 247
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 4150 (class 0 OID 16554)
-- Dependencies: 249
-- Data for Name: giftcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.giftcode (id, name, event_ads_id, staff_id, content, img, discount, start_time, end_time, number_of_participants, used, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4152 (class 0 OID 16563)
-- Dependencies: 251
-- Data for Name: history_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history_payment (id, payment_method_id, customers_id, transfer_amount, cash_amount, note, bill_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4154 (class 0 OID 16572)
-- Dependencies: 253
-- Data for Name: img_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.img_news (id, name_img, news_id, img, location, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4156 (class 0 OID 16579)
-- Dependencies: 255
-- Data for Name: img_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.img_products (id, product_id, img, display_order, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4158 (class 0 OID 16586)
-- Dependencies: 257
-- Data for Name: intermediary_account_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intermediary_account_service (id, servive_name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4160 (class 0 OID 16593)
-- Dependencies: 259
-- Data for Name: list_codes_received; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_codes_received (id, customers_id, giftcode_id, is_expired, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4162 (class 0 OID 16601)
-- Dependencies: 261
-- Data for Name: list_giftcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_giftcodes (id, giftcode_id, code, already_received, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4164 (class 0 OID 16609)
-- Dependencies: 263
-- Data for Name: list_products_by_bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_products_by_bill (id, bill_id, products_id, status, created_at, updated_at, quantity, amount_of_money) FROM stdin;
\.


--
-- TOC entry 4166 (class 0 OID 16616)
-- Dependencies: 265
-- Data for Name: log_deletes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_deletes (id, type_delete_id, content, internal, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4168 (class 0 OID 16624)
-- Dependencies: 267
-- Data for Name: log_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_login (id, user_login, type, content, ip, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4170 (class 0 OID 16631)
-- Dependencies: 269
-- Data for Name: log_updates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_updates (id, type_update_id, content, internal, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4172 (class 0 OID 16639)
-- Dependencies: 271
-- Data for Name: menu_main; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_main (id, name, color, is_sub_menu, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4174 (class 0 OID 16647)
-- Dependencies: 273
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
4	0000_00_00_000000_create_websockets_statistics_entries_table	1
\.


--
-- TOC entry 4176 (class 0 OID 16651)
-- Dependencies: 275
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, name_news, sub_menu_id, staff_id, img_main, content, tag, views, likes, comments, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 16663)
-- Dependencies: 277
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 4179 (class 0 OID 16668)
-- Dependencies: 278
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4181 (class 0 OID 16675)
-- Dependencies: 280
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4183 (class 0 OID 16681)
-- Dependencies: 282
-- Data for Name: policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy (id, staff_id, name, img, content, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4185 (class 0 OID 16690)
-- Dependencies: 284
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (id, name, content, status, created_at, updated_at) FROM stdin;
3	nhân viên	mô ra	t	2023-07-18 13:45:30.159174	2023-07-18 13:45:30.159174
4	giám đốc	giám đốc	t	2023-07-18 13:48:08.159012	2023-07-18 13:48:08.159012
\.


--
-- TOC entry 4187 (class 0 OID 16699)
-- Dependencies: 286
-- Data for Name: price_difference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_difference (id, staff_id, product_id, import_price, export_price, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4189 (class 0 OID 16706)
-- Dependencies: 288
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, sub_menu_id, code_products, name, img_main, origin, color, size, into_money, vote, intro, number_of_products_sold, remaining_products, status, created_at, updated_at, is_promotion) FROM stdin;
\.


--
-- TOC entry 4191 (class 0 OID 16716)
-- Dependencies: 290
-- Data for Name: products_in_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_in_stock (id, product_id, warehouse_id, remaining, import_price, export_price, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4193 (class 0 OID 16723)
-- Dependencies: 292
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion (id, product_id, type_promotion_id, endtime, starttime, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4195 (class 0 OID 16730)
-- Dependencies: 294
-- Data for Name: rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rank (id, name, detail, icon, status, created_at, updated_at, score) FROM stdin;
\.


--
-- TOC entry 4197 (class 0 OID 16737)
-- Dependencies: 296
-- Data for Name: report_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_source (id, name, note, status, created_at, updated_at) FROM stdin;
1	32434	Trống	f	2023-09-21 11:40:35.245936	2023-09-21 11:40:35.245936
2	markAllNotification	Trống	f	2023-09-26 09:55:46.366795	2023-09-26 09:55:46.366795
3	this.numberOfUnreadNotifications(this.staff.id);	Trống	f	2023-09-26 09:57:53.59848	2023-09-26 09:57:53.59848
\.


--
-- TOC entry 4199 (class 0 OID 16746)
-- Dependencies: 298
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, customers_id, staff_id, sub_report, type_report_id, is_processed, report_source_id, content, feed_back_content, status, created_at, updated_at, sub) FROM stdin;
\.


--
-- TOC entry 4201 (class 0 OID 16757)
-- Dependencies: 300
-- Data for Name: service_by_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_by_product (id, product_id, policy_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4203 (class 0 OID 16764)
-- Dependencies: 302
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_method (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4205 (class 0 OID 16771)
-- Dependencies: 304
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, code_staff, position_id, branch_id, name, address, phone_number, email, birthday, sex, img, status, created_at, updated_at, background) FROM stdin;
2	123123	3	1	Nguyễn Văn C	Hà Nọi	123	khoa	2001-01-01	\N	\N	t	2023-07-18 14:52:09.45208	2023-07-18 14:52:09.45208	\N
1	093322	3	1	Nguyễn Văn A	Hà Nội	1	Khoa@gmail.com	2001-01-01	t	\N	t	2023-07-18 13:48:50.045633	2023-07-18 14:52:09.456447	\N
4	213123	3	1	Nguyễn Văn K	Ha	0234213	lád	\N	\N	\N	t	2023-07-19 14:15:06.922045	2023-07-19 14:15:06.922045	\N
5	0849322810	4	1	Nguyễn Văn Khoa	Phúc Thọ - Hà Nội	0849322810	khoazzz334455@gmail.com	2001-03-01	t	images/staff/5_1692154853.jpeg	t	2023-07-25 11:35:40.24346	2023-08-16 16:56:53.773129	images/background_staff/5_1692179813.jpeg
\.


--
-- TOC entry 4206 (class 0 OID 16779)
-- Dependencies: 305
-- Data for Name: staff_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_account (id, staff_id, administration_id, user_name, password, remember_token, status, created_at, updated_at, refresh_token, issued_at, expired_time) FROM stdin;
8	2	1	0849322811	$2y$10$ieL5frtotZBbNyBhTvHmNe0HYiejXLptrwmB8EZdRScyEhxQWV3/y	\N	t	2023-07-18 07:52:21	2023-09-22 14:20:19.097355	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0IiwiaWF0IjoxNjk1MzY3MjE5LCJleHAiOjE2OTcwOTUyMTksIm5iZiI6MTY5NTM2NzIxOSwidXNlcl9uYW1lIjoiMDg0OTMyMjgxMSIsInJhbmsiOiJwZW5kaW5nIiwiaWQiOjgsInN0YWZmX2lkIjoyLCJyZW1lbWJlciI6ImZhbHNlIn0._CjIWH7KWSVouBYH3hHMDgytU5_VkgAlv4z1bn1YcpQ	2023-09-22 14:20:19	2023-10-12 14:20:19
2	1	1	0849322812	$2y$10$ieL5frtotZBbNyBhTvHmNe0HYiejXLptrwmB8EZdRScyEhxQWV3/y	\N	t	2023-07-18 06:53:46	2023-09-19 13:47:07.753035	\N	\N	\N
9	4	1	0849322813	$2y$10$ieL5frtotZBbNyBhTvHmNe0HYiejXLptrwmB8EZdRScyEhxQWV3/y	\N	t	2023-07-19 07:15:17	2023-09-19 13:47:12.801195	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0IiwiaWF0IjoxNjk1MTA2MDMyLCJleHAiOjE2OTY4MzQwMzIsIm5iZiI6MTY5NTEwNjAzMiwidXNlcl9uYW1lIjoiMDg0OTMyMjgxMyIsInJhbmsiOiJwZW5kaW5nIiwiaWQiOjksInN0YWZmX2lkIjo0LCJyZW1lbWJlciI6ImZhbHNlIn0.I9JUThg9ARbuvzj6awSD34l9oAD5yul1Z-zs9IPuAXw	2023-09-19 13:47:12	2023-10-09 13:47:12
10	5	1	0849322810	$2y$10$ieL5frtotZBbNyBhTvHmNe0HYiejXLptrwmB8EZdRScyEhxQWV3/y	\N	t	2023-07-25 04:39:03	2023-09-29 08:43:48.739018	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0IiwiaWF0IjoxNjk1OTUxODI4LCJleHAiOjE2OTc2Nzk4MjgsIm5iZiI6MTY5NTk1MTgyOCwidXNlcl9uYW1lIjoiMDg0OTMyMjgxMCIsInJhbmsiOiJwZW5kaW5nIiwiaWQiOjEwLCJzdGFmZl9pZCI6NSwicmVtZW1iZXIiOiJmYWxzZSJ9.UZ-OgXS_6eAd23kW2EwhG_yW0Zd55twfYLw8JK2d-BM	2023-09-29 08:43:48	2023-10-19 08:43:48
\.


--
-- TOC entry 4209 (class 0 OID 16789)
-- Dependencies: 308
-- Data for Name: sub_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_menu (id, menu_main_id, name, color, sub, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4211 (class 0 OID 16797)
-- Dependencies: 310
-- Data for Name: transfer_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfer_providers (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4213 (class 0 OID 16804)
-- Dependencies: 312
-- Data for Name: type_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_notification (id, name, note, status, created_at, updated_at, color) FROM stdin;
2	Hệ thống báo lỗi	hệ thống gửi thông báo lỗi dành cho người dùng	t	2023-09-21 08:54:34.217364	2023-09-21 08:58:18.452764	ff0000
1	Thông báo	thống gửi từ hệ thống cho người dùng về các sự kiện mà người quản lý chủ động gửi	t	2023-09-21 08:50:13.394184	2023-09-21 15:47:52.696078	F4E869
3	Người dùng	Thông báo từ người dùng , người dùng gửi thông báo đến người dùng	t	2023-09-21 08:58:18.450214	2023-09-21 15:52:34.318338	3085C3
7	Cảnh báo	gửi cảnh báo cho người dùng	t	2023-09-21 09:03:58.756933	2023-09-21 15:55:23.962544	E9B824
6	Gửi	gửi tin nhắn , phản hồi cho khách hàng thành công	t	2023-09-21 09:01:00.125091	2023-09-21 15:56:25.969323	28a745
5	Phản hồi	Phản hồi từ những ý kiễn phản hồi cho khách hàng	t	2023-09-21 08:59:42.626695	2023-09-21 15:56:59.791113	6c757d
\.


--
-- TOC entry 4215 (class 0 OID 16814)
-- Dependencies: 314
-- Data for Name: type_promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_promotion (id, name, content, code_hide, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4217 (class 0 OID 16821)
-- Dependencies: 316
-- Data for Name: type_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_report (id, name, note, status, created_at, updated_at) FROM stdin;
14	234234	Trống	f	2023-08-23 10:51:52.270023	2023-08-23 10:51:52.270023
18	3434	Trống	f	2023-08-23 11:25:31.781015	2023-08-23 11:25:31.781015
19	34ff	Trống	t	2023-08-23 11:25:31.781015	2023-08-23 11:25:31.781015
20	fa23	Trống	f	2023-08-23 11:25:31.781015	2023-08-23 11:25:31.781015
21	344	Trống	f	2023-08-23 11:35:19.061777	2023-08-23 11:35:19.061777
22	2323	Trống	f	2023-08-23 11:35:19.061777	2023-08-23 11:35:19.061777
23	vss3	Trống	f	2023-08-23 11:35:19.061777	2023-08-23 11:35:19.061777
24	sf33	Trống	f	2023-08-23 11:35:19.061777	2023-08-23 11:35:19.061777
25	23ca	đá	f	2023-08-23 11:36:40.433343	2023-08-23 11:36:40.433343
26	eq2	23	f	2023-08-23 11:36:40.433343	2023-08-23 11:36:40.433343
27	edasd	Trống	f	2023-08-23 11:36:40.433343	2023-08-23 11:36:40.433343
28	2e2e	Trống	f	2023-08-23 11:36:40.433343	2023-08-23 11:36:40.433343
29	Name 1	Note 1	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
30	Name 2	Note 2	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
31	Name 3	Note 3	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
32	Name 4	Note 4	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
33	Name 5	Note 5	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
34	Name 6	Note 6	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
35	Name 7	Note 7	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
36	Name 8	Note 8	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
37	Name 9	Note 9	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
38	Name 10	Note 10	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
39	Name 11	Note 11	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
40	Name 12	Note 12	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
41	Name 13	Note 13	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
42	Name 14	Note 14	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
43	Name 15	Note 15	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
44	Name 16	Note 16	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
45	Name 17	Note 17	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
46	Name 18	Note 18	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
47	Name 19	Note 19	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
48	Name 20	Note 20	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
49	Name 21	Note 21	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
50	Name 22	Note 22	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
51	Name 23	Note 23	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
52	Name 24	Note 24	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
53	Name 25	Note 25	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
54	Name 26	Note 26	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
55	Name 27	Note 27	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
56	Name 28	Note 28	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
57	Name 29	Note 29	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
58	Name 30	Note 30	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
59	Name 31	Note 31	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
60	Name 32	Note 32	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
61	Name 33	Note 33	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
62	Name 34	Note 34	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
63	Name 35	Note 35	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
64	Name 36	Note 36	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
65	Name 37	Note 37	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
66	Name 38	Note 38	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
67	Name 39	Note 39	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
68	Name 40	Note 40	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
70	Name 42	Note 42	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
72	Name 44	Note 44	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
74	Name 46	Note 46	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
76	Name 48	Note 48	t	2023-08-23 14:12:54.893497	2023-08-23 14:12:54.893497
78	Name 50	Note 50	f	2023-08-23 14:12:54.893497	2023-09-21 09:29:45.760463
77	Name 49	Note 49	f	2023-08-23 14:12:54.893497	2023-09-21 09:29:49.581071
75	Name 47	Note 47	f	2023-08-23 14:12:54.893497	2023-09-21 09:29:51.050747
73	Name 45	Note 45	f	2023-08-23 14:12:54.893497	2023-09-21 09:29:52.39653
71	Name 43	Note 43	f	2023-08-23 14:12:54.893497	2023-09-21 09:29:53.720831
69	Name 41	Note 41	f	2023-08-23 14:12:54.893497	2023-09-21 09:29:54.948192
80	tes12	ádasd	t	2023-09-21 09:31:39.34327	2023-09-21 09:31:39.34327
81	32434	ê	f	2023-09-21 09:34:18.033527	2023-09-21 09:34:18.033527
\.


--
-- TOC entry 4219 (class 0 OID 16830)
-- Dependencies: 318
-- Data for Name: type_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_ticket (id, name, note, status, created_at, updated_at) FROM stdin;
1	phiếu thu	1	t	2023-07-18 13:39:38.732972	2023-07-18 13:39:38.732972
2	phiếu xuất	2	t	2023-07-18 13:39:38.737669	2023-07-18 13:39:38.737669
\.


--
-- TOC entry 4221 (class 0 OID 16837)
-- Dependencies: 320
-- Data for Name: type_update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_update (id, name, note, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4223 (class 0 OID 16846)
-- Dependencies: 322
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (id, name, address, hotline, manage, branch_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4225 (class 0 OID 16853)
-- Dependencies: 324
-- Data for Name: websockets_statistics_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 216
-- Name: account_admin_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_admin_action_id_seq', 1, false);


--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_customers_id_seq', 1, false);


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 220
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_id_seq', 1, false);


--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 222
-- Name: administration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administration_id_seq', 1, true);


--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 224
-- Name: admins_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_notification_id_seq', 53, true);


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 226
-- Name: ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ads_id_seq', 1, false);


--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 228
-- Name: api_weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_weather_id_seq', 11, true);


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 230
-- Name: bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_id_seq', 1, false);


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 232
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_id_seq', 1, true);


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 234
-- Name: comments_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_news_id_seq', 1, false);


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 236
-- Name: comments_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_product_id_seq', 1, false);


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 238
-- Name: contact_support_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_support_id_seq', 1, false);


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 240
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 242
-- Name: customers_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_notification_id_seq', 1, false);


--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 244
-- Name: depot_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.depot_ticket_id_seq', 1, false);


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 246
-- Name: event_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_ads_id_seq', 1, false);


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 248
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 250
-- Name: giftcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.giftcode_id_seq', 1, false);


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 252
-- Name: history_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_payment_id_seq', 1, false);


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 254
-- Name: img_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.img_news_id_seq', 1, false);


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 256
-- Name: img_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.img_products_id_seq', 1, false);


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 258
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intermediary_account_service_id_seq', 1, false);


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 260
-- Name: list_codes_received_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_codes_received_id_seq', 1, false);


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 262
-- Name: list_giftcodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_giftcodes_id_seq', 1, false);


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 264
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_products_by_bill_id_seq', 1, false);


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 266
-- Name: log_deletes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_deletes_id_seq', 1, false);


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 268
-- Name: log_login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_login_id_seq', 1, false);


--
-- TOC entry 4527 (class 0 OID 0)
-- Dependencies: 270
-- Name: log_updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_updates_id_seq', 1, false);


--
-- TOC entry 4528 (class 0 OID 0)
-- Dependencies: 272
-- Name: menu_main_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_main_id_seq', 1, false);


--
-- TOC entry 4529 (class 0 OID 0)
-- Dependencies: 274
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 4, true);


--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 276
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 279
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_id_seq', 1, false);


--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 281
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 283
-- Name: policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.policy_id_seq', 1, false);


--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 285
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 4, true);


--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 287
-- Name: price_difference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_difference_id_seq', 1, false);


--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 289
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 291
-- Name: products_in_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_in_stock_id_seq', 1, false);


--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 293
-- Name: promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_id_seq', 1, false);


--
-- TOC entry 4539 (class 0 OID 0)
-- Dependencies: 295
-- Name: rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rank_id_seq', 1, false);


--
-- TOC entry 4540 (class 0 OID 0)
-- Dependencies: 297
-- Name: report_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_source_id_seq', 3, true);


--
-- TOC entry 4541 (class 0 OID 0)
-- Dependencies: 299
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, false);


--
-- TOC entry 4542 (class 0 OID 0)
-- Dependencies: 301
-- Name: service_by_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_by_product_id_seq', 1, false);


--
-- TOC entry 4543 (class 0 OID 0)
-- Dependencies: 303
-- Name: shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_method_id_seq', 1, false);


--
-- TOC entry 4544 (class 0 OID 0)
-- Dependencies: 306
-- Name: staff_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_account_id_seq', 10, true);


--
-- TOC entry 4545 (class 0 OID 0)
-- Dependencies: 307
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 5, true);


--
-- TOC entry 4546 (class 0 OID 0)
-- Dependencies: 309
-- Name: sub_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_menu_id_seq', 1, false);


--
-- TOC entry 4547 (class 0 OID 0)
-- Dependencies: 311
-- Name: transfer_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transfer_providers_id_seq', 1, false);


--
-- TOC entry 4548 (class 0 OID 0)
-- Dependencies: 313
-- Name: type_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_notification_id_seq', 7, true);


--
-- TOC entry 4549 (class 0 OID 0)
-- Dependencies: 315
-- Name: type_promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_promotion_id_seq', 1, false);


--
-- TOC entry 4550 (class 0 OID 0)
-- Dependencies: 317
-- Name: type_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_report_id_seq', 83, true);


--
-- TOC entry 4551 (class 0 OID 0)
-- Dependencies: 319
-- Name: type_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_ticket_id_seq', 2, true);


--
-- TOC entry 4552 (class 0 OID 0)
-- Dependencies: 321
-- Name: type_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_update_id_seq', 1, false);


--
-- TOC entry 4553 (class 0 OID 0)
-- Dependencies: 323
-- Name: warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouse_id_seq', 1, false);


--
-- TOC entry 4554 (class 0 OID 0)
-- Dependencies: 325
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- TOC entry 3686 (class 2606 OID 16913)
-- Name: account_admin_action account_admin_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT account_admin_action_pkey PRIMARY KEY (id);


--
-- TOC entry 3688 (class 2606 OID 16915)
-- Name: account_customers account_customers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT account_customers_pk PRIMARY KEY (id);


--
-- TOC entry 3690 (class 2606 OID 16917)
-- Name: account_customers account_customers_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT account_customers_un UNIQUE (user_name);


--
-- TOC entry 3692 (class 2606 OID 16919)
-- Name: action action_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_name_key UNIQUE (name);


--
-- TOC entry 3694 (class 2606 OID 16921)
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- TOC entry 3696 (class 2606 OID 16923)
-- Name: administration administration_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration
    ADD CONSTRAINT administration_name_key UNIQUE (name);


--
-- TOC entry 3698 (class 2606 OID 16925)
-- Name: administration administration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration
    ADD CONSTRAINT administration_pkey PRIMARY KEY (id);


--
-- TOC entry 3701 (class 2606 OID 16927)
-- Name: admins_notification admins_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3703 (class 2606 OID 16929)
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);


--
-- TOC entry 3705 (class 2606 OID 16931)
-- Name: api_weather api_weather_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather
    ADD CONSTRAINT api_weather_key UNIQUE (city);


--
-- TOC entry 3707 (class 2606 OID 16933)
-- Name: api_weather api_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather
    ADD CONSTRAINT api_weather_pkey PRIMARY KEY (id);


--
-- TOC entry 3709 (class 2606 OID 16935)
-- Name: bill bill_code_bill_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_code_bill_key UNIQUE (code_bill);


--
-- TOC entry 3711 (class 2606 OID 16937)
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);


--
-- TOC entry 3713 (class 2606 OID 16939)
-- Name: branch branch_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_name_key UNIQUE (name);


--
-- TOC entry 3715 (class 2606 OID 16941)
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- TOC entry 3717 (class 2606 OID 16943)
-- Name: comments_news comments_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT comments_news_pkey PRIMARY KEY (id);


--
-- TOC entry 3719 (class 2606 OID 16945)
-- Name: comments_product comments_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT comments_product_pkey PRIMARY KEY (id);


--
-- TOC entry 3721 (class 2606 OID 16947)
-- Name: contact_support contact_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_support
    ADD CONSTRAINT contact_support_pkey PRIMARY KEY (id);


--
-- TOC entry 3723 (class 2606 OID 16949)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 3729 (class 2606 OID 16951)
-- Name: customers_notification customers_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3725 (class 2606 OID 16953)
-- Name: customers customers_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_number_key UNIQUE (phone_number);


--
-- TOC entry 3727 (class 2606 OID 16955)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3731 (class 2606 OID 16957)
-- Name: depot_ticket depot_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT depot_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3733 (class 2606 OID 16959)
-- Name: event_ads event_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads
    ADD CONSTRAINT event_ads_pkey PRIMARY KEY (id);


--
-- TOC entry 3735 (class 2606 OID 16961)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3737 (class 2606 OID 16963)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3739 (class 2606 OID 16965)
-- Name: giftcode giftcode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT giftcode_pkey PRIMARY KEY (id);


--
-- TOC entry 3741 (class 2606 OID 16967)
-- Name: history_payment history_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT history_payment_pkey PRIMARY KEY (id);


--
-- TOC entry 3743 (class 2606 OID 16969)
-- Name: img_news img_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news
    ADD CONSTRAINT img_news_pkey PRIMARY KEY (id);


--
-- TOC entry 3745 (class 2606 OID 16971)
-- Name: img_products img_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products
    ADD CONSTRAINT img_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3747 (class 2606 OID 16973)
-- Name: intermediary_account_service intermediary_account_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service
    ADD CONSTRAINT intermediary_account_service_pkey PRIMARY KEY (id);


--
-- TOC entry 3749 (class 2606 OID 16975)
-- Name: intermediary_account_service intermediary_account_service_servive_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service
    ADD CONSTRAINT intermediary_account_service_servive_name_key UNIQUE (servive_name);


--
-- TOC entry 3751 (class 2606 OID 16977)
-- Name: list_giftcodes list_giftcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes
    ADD CONSTRAINT list_giftcodes_pkey PRIMARY KEY (id);


--
-- TOC entry 3753 (class 2606 OID 16979)
-- Name: list_products_by_bill list_products_by_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT list_products_by_bill_pkey PRIMARY KEY (id);


--
-- TOC entry 3755 (class 2606 OID 16981)
-- Name: log_deletes log_deletes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes
    ADD CONSTRAINT log_deletes_pkey PRIMARY KEY (id);


--
-- TOC entry 3757 (class 2606 OID 16983)
-- Name: log_login log_login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_login
    ADD CONSTRAINT log_login_pkey PRIMARY KEY (id);


--
-- TOC entry 3759 (class 2606 OID 16985)
-- Name: log_updates log_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates
    ADD CONSTRAINT log_updates_pkey PRIMARY KEY (id);


--
-- TOC entry 3761 (class 2606 OID 16987)
-- Name: menu_main menu_main_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main
    ADD CONSTRAINT menu_main_name_key UNIQUE (name);


--
-- TOC entry 3763 (class 2606 OID 16989)
-- Name: menu_main menu_main_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main
    ADD CONSTRAINT menu_main_pkey PRIMARY KEY (id);


--
-- TOC entry 3765 (class 2606 OID 16991)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3767 (class 2606 OID 16993)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 3769 (class 2606 OID 16995)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3771 (class 2606 OID 16997)
-- Name: payment_methods payment_methods_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_name_key UNIQUE (name);


--
-- TOC entry 3773 (class 2606 OID 16999)
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 3775 (class 2606 OID 17001)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3777 (class 2606 OID 17003)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3780 (class 2606 OID 17005)
-- Name: policy policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy
    ADD CONSTRAINT policy_pkey PRIMARY KEY (id);


--
-- TOC entry 3782 (class 2606 OID 17007)
-- Name: position position_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_name_key UNIQUE (name);


--
-- TOC entry 3784 (class 2606 OID 17009)
-- Name: position position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 17011)
-- Name: price_difference price_difference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT price_difference_pkey PRIMARY KEY (id);


--
-- TOC entry 3788 (class 2606 OID 17013)
-- Name: products products_code_products_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_code_products_key UNIQUE (code_products);


--
-- TOC entry 3794 (class 2606 OID 17015)
-- Name: products_in_stock products_in_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT products_in_stock_pkey PRIMARY KEY (id);


--
-- TOC entry 3790 (class 2606 OID 17017)
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- TOC entry 3792 (class 2606 OID 17019)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 17021)
-- Name: promotion promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_pkey PRIMARY KEY (id);


--
-- TOC entry 3798 (class 2606 OID 17023)
-- Name: rank rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rank
    ADD CONSTRAINT rank_pkey PRIMARY KEY (id);


--
-- TOC entry 3800 (class 2606 OID 17025)
-- Name: report_source report_source_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source
    ADD CONSTRAINT report_source_name_key UNIQUE (name);


--
-- TOC entry 3802 (class 2606 OID 17027)
-- Name: report_source report_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source
    ADD CONSTRAINT report_source_pkey PRIMARY KEY (id);


--
-- TOC entry 3804 (class 2606 OID 17029)
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 17031)
-- Name: service_by_product service_by_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT service_by_product_pkey PRIMARY KEY (id);


--
-- TOC entry 3808 (class 2606 OID 17033)
-- Name: shipping_method shipping_method_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_name_key UNIQUE (name);


--
-- TOC entry 3810 (class 2606 OID 17035)
-- Name: shipping_method shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_pkey PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 17037)
-- Name: staff_account staff_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT staff_account_pkey PRIMARY KEY (id);


--
-- TOC entry 3820 (class 2606 OID 17039)
-- Name: staff_account staff_account_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT staff_account_user_name_key UNIQUE (user_name);


--
-- TOC entry 3812 (class 2606 OID 17041)
-- Name: staff staff_code_staff_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_code_staff_key UNIQUE (code_staff);


--
-- TOC entry 3814 (class 2606 OID 17043)
-- Name: staff staff_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_phone_number_key UNIQUE (phone_number);


--
-- TOC entry 3816 (class 2606 OID 17045)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- TOC entry 3824 (class 2606 OID 17047)
-- Name: sub_menu sub_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT sub_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 3826 (class 2606 OID 17049)
-- Name: transfer_providers transfer_providers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers
    ADD CONSTRAINT transfer_providers_name_key UNIQUE (name);


--
-- TOC entry 3828 (class 2606 OID 17051)
-- Name: transfer_providers transfer_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers
    ADD CONSTRAINT transfer_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 17053)
-- Name: type_notification type_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification
    ADD CONSTRAINT type_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3832 (class 2606 OID 17055)
-- Name: type_notification type_notification_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification
    ADD CONSTRAINT type_notification_un UNIQUE (name);


--
-- TOC entry 3834 (class 2606 OID 17057)
-- Name: type_promotion type_promotion_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion
    ADD CONSTRAINT type_promotion_name_key UNIQUE (name);


--
-- TOC entry 3836 (class 2606 OID 17059)
-- Name: type_promotion type_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion
    ADD CONSTRAINT type_promotion_pkey PRIMARY KEY (id);


--
-- TOC entry 3838 (class 2606 OID 17061)
-- Name: type_report type_report_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report
    ADD CONSTRAINT type_report_name_key UNIQUE (name);


--
-- TOC entry 3840 (class 2606 OID 17063)
-- Name: type_report type_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report
    ADD CONSTRAINT type_report_pkey PRIMARY KEY (id);


--
-- TOC entry 3842 (class 2606 OID 17065)
-- Name: type_ticket type_ticket_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket
    ADD CONSTRAINT type_ticket_name_key UNIQUE (name);


--
-- TOC entry 3844 (class 2606 OID 17067)
-- Name: type_ticket type_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket
    ADD CONSTRAINT type_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3846 (class 2606 OID 17069)
-- Name: type_update type_update_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update
    ADD CONSTRAINT type_update_name_key UNIQUE (name);


--
-- TOC entry 3848 (class 2606 OID 17071)
-- Name: type_update type_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update
    ADD CONSTRAINT type_update_pkey PRIMARY KEY (id);


--
-- TOC entry 3822 (class 2606 OID 17073)
-- Name: staff_account unique_column_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT unique_column_constraint UNIQUE (staff_id);


--
-- TOC entry 3850 (class 2606 OID 17075)
-- Name: warehouse warehouse_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_name_key UNIQUE (name);


--
-- TOC entry 3852 (class 2606 OID 17077)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);


--
-- TOC entry 3854 (class 2606 OID 17079)
-- Name: websockets_statistics_entries websockets_statistics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3699 (class 1259 OID 17080)
-- Name: admins_notification_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admins_notification_id_idx ON public.admins_notification USING btree (id);


--
-- TOC entry 3778 (class 1259 OID 17081)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3919 (class 2620 OID 17082)
-- Name: account_admin_action update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.account_admin_action FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3920 (class 2620 OID 17083)
-- Name: account_customers update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.account_customers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3921 (class 2620 OID 17084)
-- Name: action update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.action FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3922 (class 2620 OID 17085)
-- Name: administration update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.administration FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3923 (class 2620 OID 17086)
-- Name: admins_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.admins_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3924 (class 2620 OID 17087)
-- Name: ads update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.ads FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3925 (class 2620 OID 17088)
-- Name: api_weather update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.api_weather FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3926 (class 2620 OID 17089)
-- Name: bill update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.bill FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3927 (class 2620 OID 17090)
-- Name: branch update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.branch FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3928 (class 2620 OID 17091)
-- Name: comments_news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.comments_news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3929 (class 2620 OID 17092)
-- Name: comments_product update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.comments_product FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3930 (class 2620 OID 17093)
-- Name: contact_support update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.contact_support FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3931 (class 2620 OID 17094)
-- Name: customers update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.customers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3932 (class 2620 OID 17095)
-- Name: customers_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.customers_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3933 (class 2620 OID 17096)
-- Name: depot_ticket update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.depot_ticket FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3934 (class 2620 OID 17097)
-- Name: event_ads update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.event_ads FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3935 (class 2620 OID 17098)
-- Name: failed_jobs update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.failed_jobs FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3936 (class 2620 OID 17099)
-- Name: giftcode update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.giftcode FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3937 (class 2620 OID 17100)
-- Name: history_payment update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.history_payment FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3938 (class 2620 OID 17101)
-- Name: img_news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.img_news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3939 (class 2620 OID 17102)
-- Name: img_products update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.img_products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3940 (class 2620 OID 17103)
-- Name: intermediary_account_service update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.intermediary_account_service FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3941 (class 2620 OID 17104)
-- Name: list_codes_received update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_codes_received FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3942 (class 2620 OID 17105)
-- Name: list_giftcodes update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_giftcodes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3943 (class 2620 OID 17106)
-- Name: list_products_by_bill update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_products_by_bill FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3944 (class 2620 OID 17107)
-- Name: log_deletes update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_deletes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3945 (class 2620 OID 17108)
-- Name: log_login update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_login FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3946 (class 2620 OID 17109)
-- Name: log_updates update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_updates FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3947 (class 2620 OID 17110)
-- Name: menu_main update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.menu_main FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3948 (class 2620 OID 17111)
-- Name: migrations update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.migrations FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3949 (class 2620 OID 17112)
-- Name: news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3950 (class 2620 OID 17113)
-- Name: password_reset_tokens update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.password_reset_tokens FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3951 (class 2620 OID 17114)
-- Name: payment_methods update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.payment_methods FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3952 (class 2620 OID 17115)
-- Name: personal_access_tokens update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.personal_access_tokens FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3953 (class 2620 OID 17116)
-- Name: policy update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.policy FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3954 (class 2620 OID 17117)
-- Name: position update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3955 (class 2620 OID 17118)
-- Name: price_difference update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.price_difference FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3956 (class 2620 OID 17119)
-- Name: products update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3957 (class 2620 OID 17120)
-- Name: products_in_stock update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.products_in_stock FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3958 (class 2620 OID 17121)
-- Name: promotion update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.promotion FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3959 (class 2620 OID 17122)
-- Name: rank update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.rank FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3960 (class 2620 OID 17123)
-- Name: report_source update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.report_source FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3961 (class 2620 OID 17124)
-- Name: reports update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.reports FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3962 (class 2620 OID 17125)
-- Name: service_by_product update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.service_by_product FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3963 (class 2620 OID 17126)
-- Name: shipping_method update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.shipping_method FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3964 (class 2620 OID 17127)
-- Name: staff update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.staff FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3965 (class 2620 OID 17128)
-- Name: staff_account update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.staff_account FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3966 (class 2620 OID 17129)
-- Name: sub_menu update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.sub_menu FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3967 (class 2620 OID 17130)
-- Name: transfer_providers update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.transfer_providers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3968 (class 2620 OID 17131)
-- Name: type_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3969 (class 2620 OID 17132)
-- Name: type_promotion update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_promotion FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3970 (class 2620 OID 17133)
-- Name: type_report update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_report FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3971 (class 2620 OID 17134)
-- Name: type_ticket update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_ticket FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3972 (class 2620 OID 17135)
-- Name: type_update update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_update FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3973 (class 2620 OID 17136)
-- Name: warehouse update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.warehouse FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3857 (class 2606 OID 17137)
-- Name: account_customers FK1_account_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT "FK1_account_customers" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3855 (class 2606 OID 17142)
-- Name: account_admin_action FK1_action_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT "FK1_action_admin" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE;


--
-- TOC entry 3860 (class 2606 OID 17147)
-- Name: ads FK1_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "FK1_ads" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE;


--
-- TOC entry 3862 (class 2606 OID 17152)
-- Name: bill FK1_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK1_bill" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3871 (class 2606 OID 17157)
-- Name: comments_product FK1_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK1_comment_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3868 (class 2606 OID 17162)
-- Name: comments_news FK1_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK1_comments_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE;


--
-- TOC entry 3874 (class 2606 OID 17167)
-- Name: customers FK1_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT "FK1_customers" FOREIGN KEY (rank_id) REFERENCES public.rank(id) ON UPDATE CASCADE;


--
-- TOC entry 3877 (class 2606 OID 17172)
-- Name: depot_ticket FK1_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK1_depot_ticket" FOREIGN KEY (ticket_id) REFERENCES public.type_ticket(id) ON UPDATE CASCADE;


--
-- TOC entry 3881 (class 2606 OID 17177)
-- Name: event_ads FK1_event_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads
    ADD CONSTRAINT "FK1_event_ads" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3882 (class 2606 OID 17182)
-- Name: giftcode FK1_giftcode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT "FK1_giftcode" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE;


--
-- TOC entry 3884 (class 2606 OID 17187)
-- Name: history_payment FK1_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK1_history_payment" FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE;


--
-- TOC entry 3887 (class 2606 OID 17192)
-- Name: img_news FK1_img_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news
    ADD CONSTRAINT "FK1_img_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE;


--
-- TOC entry 3888 (class 2606 OID 17197)
-- Name: img_products FK1_img_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products
    ADD CONSTRAINT "FK1_img_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3889 (class 2606 OID 17202)
-- Name: list_codes_received FK1_list_codes_received; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received
    ADD CONSTRAINT "FK1_list_codes_received" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3891 (class 2606 OID 17207)
-- Name: list_giftcodes FK1_list_giftcodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes
    ADD CONSTRAINT "FK1_list_giftcodes" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE;


--
-- TOC entry 3892 (class 2606 OID 17212)
-- Name: list_products_by_bill FK1_list_products_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT "FK1_list_products_by" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE;


--
-- TOC entry 3894 (class 2606 OID 17217)
-- Name: log_deletes FK1_log_delete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes
    ADD CONSTRAINT "FK1_log_delete" FOREIGN KEY (type_delete_id) REFERENCES public.type_update(id) ON UPDATE CASCADE;


--
-- TOC entry 3895 (class 2606 OID 17222)
-- Name: log_updates FK1_log_update; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates
    ADD CONSTRAINT "FK1_log_update" FOREIGN KEY (type_update_id) REFERENCES public.type_update(id) ON UPDATE CASCADE;


--
-- TOC entry 3896 (class 2606 OID 17227)
-- Name: news FK1_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK1_news" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3898 (class 2606 OID 17232)
-- Name: policy FK1_policy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy
    ADD CONSTRAINT "FK1_policy" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3899 (class 2606 OID 17237)
-- Name: price_difference FK1_price_difference; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT "FK1_price_difference" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3901 (class 2606 OID 17242)
-- Name: products FK1_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK1_products" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3902 (class 2606 OID 17247)
-- Name: products_in_stock FK1_products_in_stock; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT "FK1_products_in_stock" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3904 (class 2606 OID 17252)
-- Name: promotion FK1_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK1_promotion" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3906 (class 2606 OID 17257)
-- Name: reports FK1_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK1_reports" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3911 (class 2606 OID 17262)
-- Name: service_by_product FK1_service_by_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT "FK1_service_by_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3913 (class 2606 OID 17267)
-- Name: staff FK1_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT "FK1_staff" FOREIGN KEY (position_id) REFERENCES public."position"(id) ON UPDATE CASCADE;


--
-- TOC entry 3915 (class 2606 OID 17272)
-- Name: staff_account FK1_staff_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT "FK1_staff_account" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3917 (class 2606 OID 17277)
-- Name: sub_menu FK1_sub_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT "FK1_sub_menu" FOREIGN KEY (menu_main_id) REFERENCES public.menu_main(id) ON UPDATE CASCADE;


--
-- TOC entry 3918 (class 2606 OID 17282)
-- Name: warehouse FK1_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK1_warehouse" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3856 (class 2606 OID 17287)
-- Name: account_admin_action FK2_action_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT "FK2_action_admin" FOREIGN KEY (action_id) REFERENCES public.action(id) ON UPDATE CASCADE;


--
-- TOC entry 3861 (class 2606 OID 17292)
-- Name: ads FK2_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "FK2_ads" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3863 (class 2606 OID 17297)
-- Name: bill FK2_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK2_bill" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3872 (class 2606 OID 17302)
-- Name: comments_product FK2_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK2_comment_product" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3869 (class 2606 OID 17307)
-- Name: comments_news FK2_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK2_comments_news" FOREIGN KEY (comment_id) REFERENCES public.comments_news(id) ON UPDATE CASCADE;


--
-- TOC entry 3878 (class 2606 OID 17312)
-- Name: depot_ticket FK2_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK2_depot_ticket" FOREIGN KEY (staff_id_export) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3883 (class 2606 OID 17317)
-- Name: giftcode FK2_giftcode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT "FK2_giftcode" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3885 (class 2606 OID 17322)
-- Name: history_payment FK2_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK2_history_payment" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3890 (class 2606 OID 17327)
-- Name: list_codes_received FK2_list_codes_received; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received
    ADD CONSTRAINT "FK2_list_codes_received" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE;


--
-- TOC entry 3893 (class 2606 OID 17332)
-- Name: list_products_by_bill FK2_list_products_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT "FK2_list_products_by" FOREIGN KEY (products_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3897 (class 2606 OID 17337)
-- Name: news FK2_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK2_news" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3900 (class 2606 OID 17342)
-- Name: price_difference FK2_price_difference; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT "FK2_price_difference" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3903 (class 2606 OID 17347)
-- Name: products_in_stock FK2_products_in_stock; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT "FK2_products_in_stock" FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id) ON UPDATE CASCADE;


--
-- TOC entry 3905 (class 2606 OID 17352)
-- Name: promotion FK2_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK2_promotion" FOREIGN KEY (type_promotion_id) REFERENCES public.type_promotion(id);


--
-- TOC entry 3907 (class 2606 OID 17357)
-- Name: reports FK2_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK2_reports" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3912 (class 2606 OID 17362)
-- Name: service_by_product FK2_service_by_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT "FK2_service_by_product" FOREIGN KEY (policy_id) REFERENCES public.policy(id) ON UPDATE CASCADE;


--
-- TOC entry 3916 (class 2606 OID 17367)
-- Name: staff_account FK2_staff_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT "FK2_staff_account" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE;


--
-- TOC entry 3864 (class 2606 OID 17372)
-- Name: bill FK3_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK3_bill" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3873 (class 2606 OID 17377)
-- Name: comments_product FK3_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK3_comment_product" FOREIGN KEY (comments_product_id) REFERENCES public.comments_product(id) ON UPDATE CASCADE;


--
-- TOC entry 3870 (class 2606 OID 17382)
-- Name: comments_news FK3_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK3_comments_news" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3879 (class 2606 OID 17387)
-- Name: depot_ticket FK3_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK3_depot_ticket" FOREIGN KEY (staff_id_receive) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3886 (class 2606 OID 17392)
-- Name: history_payment FK3_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK3_history_payment" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE;


--
-- TOC entry 3908 (class 2606 OID 17397)
-- Name: reports FK3_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK3_reports" FOREIGN KEY (sub_report) REFERENCES public.reports(id) ON UPDATE CASCADE;


--
-- TOC entry 3914 (class 2606 OID 17402)
-- Name: staff FK3_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT "FK3_staff" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3865 (class 2606 OID 17407)
-- Name: bill FK4_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK4_bill" FOREIGN KEY (payment_methods_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE;


--
-- TOC entry 3880 (class 2606 OID 17412)
-- Name: depot_ticket FK4_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK4_depot_ticket" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3909 (class 2606 OID 17417)
-- Name: reports FK4_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK4_reports" FOREIGN KEY (type_report_id) REFERENCES public.type_report(id) ON UPDATE CASCADE;


--
-- TOC entry 3866 (class 2606 OID 17422)
-- Name: bill FK5_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK5_bill" FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_method(id) ON UPDATE CASCADE;


--
-- TOC entry 3910 (class 2606 OID 17427)
-- Name: reports FK5_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK5_reports" FOREIGN KEY (report_source_id) REFERENCES public.report_source(id) ON UPDATE CASCADE;


--
-- TOC entry 3867 (class 2606 OID 17432)
-- Name: bill FK6_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK6_bill" FOREIGN KEY (transfer_providers_id) REFERENCES public.transfer_providers(id) ON UPDATE CASCADE;


--
-- TOC entry 3858 (class 2606 OID 17437)
-- Name: admins_notification admins_notification_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_fk FOREIGN KEY (type_notification) REFERENCES public.type_notification(id) ON UPDATE CASCADE;


--
-- TOC entry 3859 (class 2606 OID 17442)
-- Name: admins_notification admins_notification_staff_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_staff_fk FOREIGN KEY (staff_id) REFERENCES public.staff(id);


--
-- TOC entry 3875 (class 2606 OID 17447)
-- Name: customers_notification customers_notification_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_fk FOREIGN KEY (type_notification) REFERENCES public.type_notification(id) ON UPDATE CASCADE;


--
-- TOC entry 3876 (class 2606 OID 17452)
-- Name: customers_notification customers_notification_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_fk_1 FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


-- Completed on 2024-02-29 20:36:06

--
-- PostgreSQL database dump complete
--

--
-- Database "test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-29 20:36:06

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

--
-- TOC entry 4231 (class 1262 OID 18523)
-- Name: test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE test OWNER TO postgres;

\connect test

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

--
-- TOC entry 325 (class 1255 OID 18524)
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 18525)
-- Name: account_admin_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_admin_action (
    id integer NOT NULL,
    administration_id smallint NOT NULL,
    action_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.account_admin_action OWNER TO postgres;

--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE account_admin_action; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.account_admin_action IS 'bảng trung gian tài khoản được gắn cho các quyền';


--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN account_admin_action.administration_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_admin_action.administration_id IS 'mã quyền';


--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN account_admin_action.action_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_admin_action.action_id IS 'mã thao tác';


--
-- TOC entry 215 (class 1259 OID 18531)
-- Name: account_admin_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_admin_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_admin_action_id_seq OWNER TO postgres;

--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 215
-- Name: account_admin_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_admin_action_id_seq OWNED BY public.account_admin_action.id;


--
-- TOC entry 216 (class 1259 OID 18532)
-- Name: account_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_customers (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    remember_token character varying(100) NOT NULL,
    user_name character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.account_customers OWNER TO postgres;

--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE account_customers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.account_customers IS 'tài khoản khách hàng';


--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN account_customers.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_customers.customers_id IS 'id khách hàng';


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN account_customers.user_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_customers.user_name IS 'tên đăng nhập';


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN account_customers.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.account_customers.password IS 'mật khẩu';


--
-- TOC entry 217 (class 1259 OID 18538)
-- Name: account_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_customers_id_seq OWNER TO postgres;

--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 217
-- Name: account_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_customers_id_seq OWNED BY public.account_customers.id;


--
-- TOC entry 218 (class 1259 OID 18539)
-- Name: action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.action OWNER TO postgres;

--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE action; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.action IS 'tên các quyền như thêm , sửa , xóa các trường';


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN action.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.action.name IS 'tên quyền';


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN action.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.action.content IS 'nội dung';


--
-- TOC entry 219 (class 1259 OID 18547)
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_id_seq OWNER TO postgres;

--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 219
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- TOC entry 220 (class 1259 OID 18548)
-- Name: administration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administration (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.administration OWNER TO postgres;

--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE administration; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.administration IS 'tên cấp độ tài khoản';


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN administration.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.administration.name IS 'tên';


--
-- TOC entry 221 (class 1259 OID 18554)
-- Name: administration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administration_id_seq OWNER TO postgres;

--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 221
-- Name: administration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administration_id_seq OWNED BY public.administration.id;


--
-- TOC entry 222 (class 1259 OID 18555)
-- Name: admins_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins_notification (
    id integer NOT NULL,
    type_notification smallint NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(5000) NOT NULL,
    watched boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.admins_notification OWNER TO postgres;

--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE admins_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.admins_notification IS 'thông báo cho nhân viên';


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN admins_notification.type_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.admins_notification.type_notification IS 'loại thông báo';


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN admins_notification.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.admins_notification.content IS 'nội dung thông báo';


--
-- TOC entry 223 (class 1259 OID 18564)
-- Name: admins_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 223
-- Name: admins_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_notification_id_seq OWNED BY public.admins_notification.id;


--
-- TOC entry 224 (class 1259 OID 18565)
-- Name: ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ads (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_ads_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    sub_menu_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    content character varying(500),
    priority integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.ads OWNER TO postgres;

--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE ads; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.ads IS 'quảng cáo';


--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN ads.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.name IS 'tên quảng cáo';


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN ads.event_ads_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.event_ads_id IS 'id sự kiện đang chạy';


--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN ads.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.staff_id IS 'mã nhân viên';


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN ads.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.sub_menu_id IS 'thuộc sub menu nào';


--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN ads.priority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ads.priority IS 'vị trí ưu tiên';


--
-- TOC entry 225 (class 1259 OID 18573)
-- Name: ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ads_id_seq OWNER TO postgres;

--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 225
-- Name: ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;


--
-- TOC entry 226 (class 1259 OID 18574)
-- Name: api_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_weather (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    longitude character varying(50) NOT NULL,
    latityde character varying(50) NOT NULL,
    content json NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.api_weather OWNER TO postgres;

--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE api_weather; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.api_weather IS 'table api thời tiết';


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN api_weather.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.api_weather.name IS 'tên api';


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN api_weather.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.api_weather.content IS 'thông tin ';


--
-- TOC entry 227 (class 1259 OID 18582)
-- Name: api_weather_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_weather_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_weather_id_seq OWNER TO postgres;

--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 227
-- Name: api_weather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_weather_id_seq OWNED BY public.api_weather.id;


--
-- TOC entry 228 (class 1259 OID 18583)
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill (
    id integer NOT NULL,
    code_bill character varying(50) NOT NULL,
    staff_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    branch_id smallint NOT NULL,
    payment_methods_id smallint NOT NULL,
    shipping_method_id smallint NOT NULL,
    transfer_providers_id smallint NOT NULL,
    total_products smallint NOT NULL,
    initial_amount integer NOT NULL,
    actual_amount integer NOT NULL,
    giftcode_id smallint,
    successful_payment boolean DEFAULT false,
    note character varying(500),
    impact_number smallint DEFAULT '0'::smallint,
    report_ship boolean DEFAULT false,
    queue_bill boolean DEFAULT true,
    note_report character varying(500),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bill IS 'hóa đơn';


--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.code_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.code_bill IS 'mã hóa đơn hiển thị';


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.staff_id IS 'mã nhân viên tạo phiếu';


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.customers_id IS 'phiếu của kh';


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.branch_id IS 'phiệu được tạo ở chi  nhánh';


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.payment_methods_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.payment_methods_id IS 'mã phương thức thanh toán';


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.shipping_method_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.shipping_method_id IS 'mã phương thức nhận hàng';


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.transfer_providers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.transfer_providers_id IS 'nếu chọn hình thức nhận hàng online
đây là cột mã nhà cung cấp dịch vụ vận chuyển';


--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.total_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.total_products IS 'tổng số sp';


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.initial_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.initial_amount IS 'số tiền ban đầu';


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.actual_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.actual_amount IS 'số tiền thực tế';


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.giftcode_id IS 'id mã giảm giá';


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.successful_payment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.successful_payment IS 'đã thanh toán ?';


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.impact_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.impact_number IS 'số lần chỉnh sửa';


--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.report_ship; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.report_ship IS 'đơn bị tố cáo , cảnh báo';


--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN bill.queue_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bill.queue_bill IS 'đơn đang ở hàng đợi chưa đc duyệt';


--
-- TOC entry 229 (class 1259 OID 18595)
-- Name: bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bill_id_seq OWNER TO postgres;

--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 229
-- Name: bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_id_seq OWNED BY public.bill.id;


--
-- TOC entry 230 (class 1259 OID 18596)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    hotline character varying(50) NOT NULL,
    manage character varying(50) NOT NULL,
    working_time character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE branch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.branch IS 'tên các chi nhánh';


--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN branch.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.name IS 'tên chi nhánh';


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN branch.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.address IS 'địa chỉ';


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN branch.manage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.manage IS 'tên quản lý';


--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN branch.working_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.branch.working_time IS 'thời gian làm việc';


--
-- TOC entry 231 (class 1259 OID 18604)
-- Name: branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branch_id_seq OWNER TO postgres;

--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 231
-- Name: branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_id_seq OWNED BY public.branch.id;


--
-- TOC entry 232 (class 1259 OID 18605)
-- Name: comments_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments_news (
    id integer NOT NULL,
    news_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    comment_id smallint NOT NULL,
    comment character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments_news OWNER TO postgres;

--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE comments_news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.comments_news IS 'bình luận tin tức';


--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_news.news_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.news_id IS 'thuộc tin tức nào  lấy theo id tin tức';


--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_news.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.customers_id IS 'id kh bình luận';


--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_news.comment_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.comment_id IS 'thuộc id của bình luận nào
nếu = id chính nó thì là comment_main
nếu !=id chính nó thì nó là sub_comment (đang trả lời 1 comment khác)';


--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN comments_news.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_news.comment IS 'nội dung bình luận';


--
-- TOC entry 233 (class 1259 OID 18613)
-- Name: comments_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_news_id_seq OWNER TO postgres;

--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 233
-- Name: comments_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_news_id_seq OWNED BY public.comments_news.id;


--
-- TOC entry 234 (class 1259 OID 18614)
-- Name: comments_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments_product (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    comments_product_id smallint NOT NULL,
    vote smallint DEFAULT 5,
    comment character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments_product OWNER TO postgres;

--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE comments_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.comments_product IS 'bình luận về sản phẩm';


--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN comments_product.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.product_id IS 'id sản phẩm';


--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN comments_product.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.customers_id IS 'id kh bình luận';


--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN comments_product.comments_product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.comments_product_id IS 'thuộc id của bình luận nào';


--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN comments_product.vote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.vote IS 'điểm vote cho sp';


--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN comments_product.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comments_product.comment IS 'nội dung bl';


--
-- TOC entry 235 (class 1259 OID 18623)
-- Name: comments_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_product_id_seq OWNER TO postgres;

--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 235
-- Name: comments_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_product_id_seq OWNED BY public.comments_product.id;


--
-- TOC entry 236 (class 1259 OID 18624)
-- Name: contact_support; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_support (
    id integer NOT NULL,
    logo character varying(200) NOT NULL,
    link character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contact_support OWNER TO postgres;

--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE contact_support; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.contact_support IS 'các tiện ích tích hợp ở góc phải màn hình : zalo , fb . chatonline';


--
-- TOC entry 237 (class 1259 OID 18630)
-- Name: contact_support_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_support_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_support_id_seq OWNER TO postgres;

--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 237
-- Name: contact_support_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_support_id_seq OWNED BY public.contact_support.id;


--
-- TOC entry 238 (class 1259 OID 18631)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    rank_id smallint DEFAULT 0 NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    address character varying(200) DEFAULT NULL::character varying,
    phone_number character varying[] NOT NULL,
    email character varying[] NOT NULL,
    birthday date,
    sex boolean,
    accumulated_points smallint DEFAULT '1'::smallint,
    number_ban smallint DEFAULT '0'::smallint,
    potential boolean DEFAULT true,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE customers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.customers IS 'ds kh';


--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.rank_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.rank_id IS 'cấp độ kh';


--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.first_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.first_name IS 'tên';


--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.last_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.last_name IS 'họ';


--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.address IS 'địa chỉ';


--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.phone_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.phone_number IS 'số điện thoại';


--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.email IS 'email';


--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.birthday; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.birthday IS 'sinh ngày';


--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.sex IS 'giới tính 0 : nữ 1: nam';


--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.accumulated_points; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.accumulated_points IS 'số điểm tích để lên rank';


--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.number_ban; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.number_ban IS 'số lần bị band';


--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN customers.potential; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers.potential IS 'là kh tiềm năng hay ko , nếu là kh tiềm năng thì đồng nghĩa chưa mua hàng mà chỉ mới tạo tk';


--
-- TOC entry 239 (class 1259 OID 18644)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 239
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 240 (class 1259 OID 18645)
-- Name: customers_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_notification (
    id integer NOT NULL,
    type_notification smallint NOT NULL,
    customer_id smallint NOT NULL,
    content character varying(5000) NOT NULL,
    watched boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers_notification OWNER TO postgres;

--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN customers_notification.type_notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers_notification.type_notification IS 'loại thông báo';


--
-- TOC entry 4315 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN customers_notification.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.customers_notification.customer_id IS 'mã khách hàng';


--
-- TOC entry 241 (class 1259 OID 18654)
-- Name: customers_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4316 (class 0 OID 0)
-- Dependencies: 241
-- Name: customers_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_notification_id_seq OWNED BY public.customers_notification.id;


--
-- TOC entry 242 (class 1259 OID 18655)
-- Name: depot_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depot_ticket (
    id integer NOT NULL,
    code_ticket character varying(200) NOT NULL,
    ticket_id smallint NOT NULL,
    staff_id_export smallint NOT NULL,
    staff_id_receive smallint NOT NULL,
    product_id smallint NOT NULL,
    product_number integer NOT NULL,
    total_money integer NOT NULL,
    note character varying(500),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.depot_ticket OWNER TO postgres;

--
-- TOC entry 4317 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN depot_ticket.code_ticket; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.code_ticket IS 'mã phiếu';


--
-- TOC entry 4318 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN depot_ticket.ticket_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.ticket_id IS 'mã loại phiếu';


--
-- TOC entry 4319 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN depot_ticket.staff_id_export; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.staff_id_export IS 'nv xuất';


--
-- TOC entry 4320 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN depot_ticket.staff_id_receive; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.staff_id_receive IS 'nv nhập';


--
-- TOC entry 4321 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN depot_ticket.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.product_id IS 'id sản phẩm';


--
-- TOC entry 4322 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN depot_ticket.product_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.product_number IS 'số lượng sp / nhập hoặc xuất';


--
-- TOC entry 4323 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN depot_ticket.total_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.depot_ticket.total_money IS 'số tiền';


--
-- TOC entry 243 (class 1259 OID 18663)
-- Name: depot_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.depot_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.depot_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 4324 (class 0 OID 0)
-- Dependencies: 243
-- Name: depot_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.depot_ticket_id_seq OWNED BY public.depot_ticket.id;


--
-- TOC entry 244 (class 1259 OID 18664)
-- Name: event_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_ads (
    id integer NOT NULL,
    name_event character varying(50) NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(500),
    note character varying(500),
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.event_ads OWNER TO postgres;

--
-- TOC entry 4325 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE event_ads; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.event_ads IS 'tên sự kiện chạy quảng cáo';


--
-- TOC entry 4326 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN event_ads.name_event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.name_event IS 'tên sk';


--
-- TOC entry 4327 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN event_ads.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.staff_id IS 'nv tạo sk';


--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN event_ads.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.content IS 'nội dung sk';


--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN event_ads.start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.start_time IS 'time bắt đầu sk';


--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN event_ads.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event_ads.end_time IS 'time kết thúc sk';


--
-- TOC entry 245 (class 1259 OID 18672)
-- Name: event_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_ads_id_seq OWNER TO postgres;

--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 245
-- Name: event_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_ads_id_seq OWNED BY public.event_ads.id;


--
-- TOC entry 246 (class 1259 OID 18673)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18679)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 247
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 248 (class 1259 OID 18680)
-- Name: giftcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.giftcode (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_ads_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(500),
    img character varying(200),
    discount character varying(50) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    number_of_participants smallint NOT NULL,
    used smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.giftcode OWNER TO postgres;

--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE giftcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.giftcode IS 'tên các sự kiện chạy mã code';


--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.name IS 'tên sk chạy code';


--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.event_ads_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.event_ads_id IS 'chạy theo sự sk ads nào';


--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.staff_id IS 'nv tạo';


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.content IS 'nội dung';


--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.discount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.discount IS 'số giảm giá (% hoặc trực tiêp tiền)';


--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.start_time IS 'thời gian bắt đầu';


--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.end_time IS 'thời gian kết thúc';


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.number_of_participants; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.number_of_participants IS 'số lượt dùng';


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN giftcode.used; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.giftcode.used IS 'số lượt đã đc sử dụng';


--
-- TOC entry 249 (class 1259 OID 18688)
-- Name: giftcode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.giftcode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.giftcode_id_seq OWNER TO postgres;

--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 249
-- Name: giftcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.giftcode_id_seq OWNED BY public.giftcode.id;


--
-- TOC entry 250 (class 1259 OID 18689)
-- Name: history_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_payment (
    id integer NOT NULL,
    payment_method_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    transfer_amount integer DEFAULT 0 NOT NULL,
    cash_amount integer DEFAULT 0 NOT NULL,
    note character varying(200),
    bill_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.history_payment OWNER TO postgres;

--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE history_payment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.history_payment IS 'lịch sử thanh toán';


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN history_payment.payment_method_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.payment_method_id IS 'phương thức thanh toán';


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN history_payment.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.customers_id IS 'mã kh';


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN history_payment.transfer_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.transfer_amount IS 'tiền chuyển khoản';


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN history_payment.cash_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.cash_amount IS 'tiền mặt';


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN history_payment.bill_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.history_payment.bill_id IS 'theo hoa đơn id';


--
-- TOC entry 251 (class 1259 OID 18697)
-- Name: history_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_payment_id_seq OWNER TO postgres;

--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 251
-- Name: history_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_payment_id_seq OWNED BY public.history_payment.id;


--
-- TOC entry 252 (class 1259 OID 18698)
-- Name: img_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.img_news (
    id integer NOT NULL,
    name_img character varying(50) NOT NULL,
    news_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    location smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.img_news OWNER TO postgres;

--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN img_news.name_img; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.name_img IS 'tên ảnh';


--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN img_news.news_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.news_id IS 'thuộc tin tức';


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN img_news.location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_news.location IS 'vị trí';


--
-- TOC entry 253 (class 1259 OID 18704)
-- Name: img_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.img_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.img_news_id_seq OWNER TO postgres;

--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 253
-- Name: img_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.img_news_id_seq OWNED BY public.img_news.id;


--
-- TOC entry 254 (class 1259 OID 18705)
-- Name: img_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.img_products (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    display_order smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.img_products OWNER TO postgres;

--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE img_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.img_products IS 'ảnh sản phảm';


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN img_products.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.product_id IS 'thuộc sản phẩm nào';


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN img_products.img; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.img IS 'ảnh';


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN img_products.display_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.img_products.display_order IS 'ưu tiên hiển thị';


--
-- TOC entry 255 (class 1259 OID 18711)
-- Name: img_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.img_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.img_products_id_seq OWNER TO postgres;

--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 255
-- Name: img_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.img_products_id_seq OWNED BY public.img_products.id;


--
-- TOC entry 256 (class 1259 OID 18712)
-- Name: intermediary_account_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intermediary_account_service (
    id integer NOT NULL,
    servive_name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.intermediary_account_service OWNER TO postgres;

--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE intermediary_account_service; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.intermediary_account_service IS 'tên các bên dịch vụ tài khoản thứ 3 : gg, git , zalo ,..';


--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN intermediary_account_service.servive_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.intermediary_account_service.servive_name IS 'tên dv';


--
-- TOC entry 257 (class 1259 OID 18718)
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intermediary_account_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intermediary_account_service_id_seq OWNER TO postgres;

--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 257
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intermediary_account_service_id_seq OWNED BY public.intermediary_account_service.id;


--
-- TOC entry 258 (class 1259 OID 18719)
-- Name: list_codes_received; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_codes_received (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    giftcode_id smallint NOT NULL,
    is_expired boolean DEFAULT true,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.list_codes_received OWNER TO postgres;

--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE list_codes_received; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.list_codes_received IS 'ds kh nhận dc những code';


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN list_codes_received.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.customers_id IS 'mã kh';


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN list_codes_received.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.giftcode_id IS 'mã code';


--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN list_codes_received.is_expired; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_codes_received.is_expired IS 'đã dc sử dung';


--
-- TOC entry 259 (class 1259 OID 18726)
-- Name: list_codes_received_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_codes_received_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_codes_received_id_seq OWNER TO postgres;

--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 259
-- Name: list_codes_received_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_codes_received_id_seq OWNED BY public.list_codes_received.id;


--
-- TOC entry 260 (class 1259 OID 18727)
-- Name: list_giftcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_giftcodes (
    id integer NOT NULL,
    giftcode_id smallint NOT NULL,
    code character varying(20) NOT NULL,
    already_received boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.list_giftcodes OWNER TO postgres;

--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN list_giftcodes.giftcode_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.giftcode_id IS 'thuộc sk code nào';


--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN list_giftcodes.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.code IS 'mã code';


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN list_giftcodes.already_received; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_giftcodes.already_received IS 'đã có người nhận hay chưa';


--
-- TOC entry 261 (class 1259 OID 18734)
-- Name: list_giftcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_giftcodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_giftcodes_id_seq OWNER TO postgres;

--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 261
-- Name: list_giftcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_giftcodes_id_seq OWNED BY public.list_giftcodes.id;


--
-- TOC entry 262 (class 1259 OID 18735)
-- Name: list_products_by_bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_products_by_bill (
    id integer NOT NULL,
    bill_id smallint NOT NULL,
    products_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    quantity smallint,
    amount_of_money integer
);


ALTER TABLE public.list_products_by_bill OWNER TO postgres;

--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE list_products_by_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.list_products_by_bill IS 'ds sản phẩm  được mua theo hóa đơn';


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN list_products_by_bill.bill_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.bill_id IS 'mã hóa đơn';


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN list_products_by_bill.products_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.products_id IS 'mã sp';


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN list_products_by_bill.quantity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.quantity IS 'số lượng sản phẩm';


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN list_products_by_bill.amount_of_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.list_products_by_bill.amount_of_money IS 'số tiền của sản phẩm';


--
-- TOC entry 263 (class 1259 OID 18741)
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_products_by_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_products_by_bill_id_seq OWNER TO postgres;

--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 263
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_products_by_bill_id_seq OWNED BY public.list_products_by_bill.id;


--
-- TOC entry 264 (class 1259 OID 18742)
-- Name: log_deletes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_deletes (
    id integer NOT NULL,
    type_delete_id smallint NOT NULL,
    content character varying(200) NOT NULL,
    internal boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_deletes OWNER TO postgres;

--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE log_deletes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.log_deletes IS 'lịch sử xóa';


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN log_deletes.type_delete_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.log_deletes.type_delete_id IS 'loại xóa';


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN log_deletes.internal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.log_deletes.internal IS 'thuộc nội bộ hay ko';


--
-- TOC entry 265 (class 1259 OID 18749)
-- Name: log_deletes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_deletes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_deletes_id_seq OWNER TO postgres;

--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 265
-- Name: log_deletes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_deletes_id_seq OWNED BY public.log_deletes.id;


--
-- TOC entry 266 (class 1259 OID 18750)
-- Name: log_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_login (
    id integer NOT NULL,
    user_login character varying(50) NOT NULL,
    type smallint NOT NULL,
    content character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_login OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 18756)
-- Name: log_login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_login_id_seq OWNER TO postgres;

--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 267
-- Name: log_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_login_id_seq OWNED BY public.log_login.id;


--
-- TOC entry 268 (class 1259 OID 18757)
-- Name: log_updates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_updates (
    id integer NOT NULL,
    type_update_id smallint NOT NULL,
    content character varying(200) NOT NULL,
    internal boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_updates OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 18764)
-- Name: log_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_updates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_updates_id_seq OWNER TO postgres;

--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 269
-- Name: log_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_updates_id_seq OWNED BY public.log_updates.id;


--
-- TOC entry 270 (class 1259 OID 18765)
-- Name: menu_main; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_main (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(50),
    is_sub_menu boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.menu_main OWNER TO postgres;

--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE menu_main; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.menu_main IS 'menu chính';


--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 270
-- Name: COLUMN menu_main.is_sub_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.menu_main.is_sub_menu IS 'có sub menu ko';


--
-- TOC entry 271 (class 1259 OID 18772)
-- Name: menu_main_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_main_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_main_id_seq OWNER TO postgres;

--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 271
-- Name: menu_main_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_main_id_seq OWNED BY public.menu_main.id;


--
-- TOC entry 272 (class 1259 OID 18773)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 18776)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 273
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 274 (class 1259 OID 18777)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    name_news character varying(50) NOT NULL,
    sub_menu_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    img_main character varying(200) NOT NULL,
    content text NOT NULL,
    tag character varying(100) NOT NULL,
    views smallint DEFAULT 0,
    likes smallint DEFAULT 0,
    comments smallint DEFAULT 0,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.news IS 'tin tức';


--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN news.name_news; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.name_news IS 'tên tin';


--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN news.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.sub_menu_id IS 'thuộc tin tức nào';


--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN news.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.staff_id IS 'nhân viên đnăg';


--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN news.views; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.views IS 'lượt xem';


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN news.likes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.likes IS 'số like';


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN news.comments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.news.comments IS 'lượt comment';


--
-- TOC entry 275 (class 1259 OID 18788)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 275
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 276 (class 1259 OID 18789)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 18794)
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE payment_methods; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.payment_methods IS 'tên các phương thức thanh toán';


--
-- TOC entry 278 (class 1259 OID 18800)
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_id_seq OWNER TO postgres;

--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 278
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;


--
-- TOC entry 279 (class 1259 OID 18801)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 18806)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 280
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 281 (class 1259 OID 18807)
-- Name: policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    img character varying(200) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.policy OWNER TO postgres;

--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE policy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.policy IS 'tên các dịch vụ , đặc quyền  cho sản phẩm';


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN policy.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.staff_id IS 'nv tạo dịch vụ';


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN policy.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.name IS 'tên dv';


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN policy.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.policy.content IS 'nội dung quyền';


--
-- TOC entry 282 (class 1259 OID 18815)
-- Name: policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.policy_id_seq OWNER TO postgres;

--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 282
-- Name: policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.policy_id_seq OWNED BY public.policy.id;


--
-- TOC entry 283 (class 1259 OID 18816)
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE "position"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."position" IS 'chức vụ nhân viên';


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN "position".name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."position".name IS 'tên';


--
-- TOC entry 284 (class 1259 OID 18824)
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.position_id_seq OWNER TO postgres;

--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 284
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;


--
-- TOC entry 285 (class 1259 OID 18825)
-- Name: price_difference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_difference (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    product_id smallint NOT NULL,
    import_price integer NOT NULL,
    export_price integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.price_difference OWNER TO postgres;

--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE price_difference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.price_difference IS 'bảng lưu sự chênh lệnh giá';


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN price_difference.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.staff_id IS 'nhân viên tác động';


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN price_difference.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.product_id IS 'sảm phẩm';


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN price_difference.import_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.import_price IS 'số tiền nhập';


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN price_difference.export_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.price_difference.export_price IS 'bán ra';


--
-- TOC entry 286 (class 1259 OID 18831)
-- Name: price_difference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_difference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_difference_id_seq OWNER TO postgres;

--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 286
-- Name: price_difference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_difference_id_seq OWNED BY public.price_difference.id;


--
-- TOC entry 287 (class 1259 OID 18832)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    sub_menu_id smallint NOT NULL,
    code_products character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    img_main character varying(50) NOT NULL,
    origin character varying(50) NOT NULL,
    color character varying[] NOT NULL,
    size character varying[] NOT NULL,
    into_money integer NOT NULL,
    vote double precision DEFAULT '0'::double precision,
    intro character varying(500) NOT NULL,
    number_of_products_sold integer NOT NULL,
    remaining_products integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_promotion boolean
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.products IS 'ds sp';


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.sub_menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.sub_menu_id IS 'thuộc submenu nào';


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.code_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.code_products IS 'mã sp';


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.name IS 'tên sp';


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.origin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.origin IS 'nguồn gôc sp';


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.color; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.color IS 'màu sắc sp';


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.size IS 'các cỡ sp';


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.into_money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.into_money IS 'tiền cho sp';


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.vote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.vote IS 'lượt vote';


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.number_of_products_sold; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.number_of_products_sold IS 'số lượng sản phẩm bán dc';


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.remaining_products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.remaining_products IS 'sản phẩm còn lại';


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN products.is_promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.is_promotion IS 'đang trong chương trình giảm giá ko';


--
-- TOC entry 288 (class 1259 OID 18841)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 288
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 289 (class 1259 OID 18842)
-- Name: products_in_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_in_stock (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    warehouse_id smallint NOT NULL,
    remaining smallint NOT NULL,
    import_price integer NOT NULL,
    export_price integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products_in_stock OWNER TO postgres;

--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE products_in_stock; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.products_in_stock IS 'sản phẩmtrong kho';


--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN products_in_stock.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.product_id IS 'tên sp';


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN products_in_stock.warehouse_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.warehouse_id IS 'thuộc kho';


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN products_in_stock.remaining; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.remaining IS 'số sản phẩm còn';


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN products_in_stock.import_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.import_price IS 'giá nhập';


--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN products_in_stock.export_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products_in_stock.export_price IS 'giá bán';


--
-- TOC entry 290 (class 1259 OID 18848)
-- Name: products_in_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_in_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_in_stock_id_seq OWNER TO postgres;

--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 290
-- Name: products_in_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_in_stock_id_seq OWNED BY public.products_in_stock.id;


--
-- TOC entry 291 (class 1259 OID 18849)
-- Name: promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    type_promotion_id smallint NOT NULL,
    endtime date NOT NULL,
    starttime date NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.promotion OWNER TO postgres;

--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN promotion.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.product_id IS 'sản phẩm dc dùng';


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN promotion.type_promotion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.type_promotion_id IS 'loại km';


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN promotion.endtime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.endtime IS 'thời gian kết thúc';


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN promotion.starttime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.promotion.starttime IS 'thời gian bắt đầu';


--
-- TOC entry 292 (class 1259 OID 18855)
-- Name: promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_id_seq OWNER TO postgres;

--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 292
-- Name: promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_id_seq OWNED BY public.promotion.id;


--
-- TOC entry 293 (class 1259 OID 18856)
-- Name: rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rank (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    detail character varying(200) NOT NULL,
    icon character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    score smallint
);


ALTER TABLE public.rank OWNER TO postgres;

--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE rank; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.rank IS 'tên các cấp rank';


--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN rank.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.name IS 'tên';


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN rank.detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.detail IS 'chi tiết';


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 293
-- Name: COLUMN rank.score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rank.score IS 'số điểm để lên cấp rank';


--
-- TOC entry 294 (class 1259 OID 18862)
-- Name: rank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rank_id_seq OWNER TO postgres;

--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 294
-- Name: rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rank_id_seq OWNED BY public.rank.id;


--
-- TOC entry 295 (class 1259 OID 18863)
-- Name: report_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_source (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.report_source OWNER TO postgres;

--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE report_source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.report_source IS 'tên nguồn tố cáo';


--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 295
-- Name: COLUMN report_source.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_source.name IS 'tên';


--
-- TOC entry 296 (class 1259 OID 18871)
-- Name: report_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_source_id_seq OWNER TO postgres;

--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 296
-- Name: report_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_source_id_seq OWNED BY public.report_source.id;


--
-- TOC entry 297 (class 1259 OID 18872)
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    sub_report smallint NOT NULL,
    type_report_id smallint NOT NULL,
    is_processed boolean DEFAULT false,
    report_source_id smallint NOT NULL,
    content character varying(1000) NOT NULL,
    feed_back_content character varying(1000),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    sub boolean DEFAULT false
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 297
-- Name: TABLE reports; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.reports IS 'các phiếu tố cáo';


--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.customers_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.customers_id IS 'kh tố';


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.staff_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.staff_id IS 'nhân viên nhận vào phản hồi';


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.sub_report; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.sub_report IS 'là sub reporrt ko';


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.type_report_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.type_report_id IS 'loại tố cáo';


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.is_processed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.is_processed IS 'đã dc giải quyêt xong chưa';


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.report_source_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.report_source_id IS 'mã nguồn tố cáo';


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.content IS 'nội dung kh';


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.feed_back_content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.feed_back_content IS 'nội dung nv';


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 297
-- Name: COLUMN reports.sub; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reports.sub IS 'có phải là fback con ko';


--
-- TOC entry 298 (class 1259 OID 18882)
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO postgres;

--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 298
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- TOC entry 299 (class 1259 OID 18883)
-- Name: service_by_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_by_product (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    policy_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.service_by_product OWNER TO postgres;

--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 299
-- Name: TABLE service_by_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.service_by_product IS 'các sản phảm được hưởng các dịch vụ';


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN service_by_product.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_by_product.product_id IS 'tên sp';


--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN service_by_product.policy_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service_by_product.policy_id IS 'tên dv';


--
-- TOC entry 300 (class 1259 OID 18889)
-- Name: service_by_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_by_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_by_product_id_seq OWNER TO postgres;

--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 300
-- Name: service_by_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_by_product_id_seq OWNED BY public.service_by_product.id;


--
-- TOC entry 301 (class 1259 OID 18890)
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.shipping_method OWNER TO postgres;

--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE shipping_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.shipping_method IS 'tên các phương thức nhận hàng : ở cửa hàng , ở chi nhánh khác ,  giao hàng';


--
-- TOC entry 302 (class 1259 OID 18896)
-- Name: shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_method_id_seq OWNER TO postgres;

--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 302
-- Name: shipping_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_method_id_seq OWNED BY public.shipping_method.id;


--
-- TOC entry 303 (class 1259 OID 18897)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    code_staff character varying(50) NOT NULL,
    position_id smallint NOT NULL,
    branch_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    phone_number character varying(50) NOT NULL,
    email character varying(50),
    birthday date,
    sex boolean,
    img character varying(200),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    background character varying(200)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 303
-- Name: TABLE staff; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.staff IS 'ds nhân viên';


--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN staff.code_staff; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.code_staff IS 'mã đinh danh nhân viên';


--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN staff.position_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.position_id IS 'id chức vụ';


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN staff.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.branch_id IS 'id chi nhánh';


--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN staff.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.name IS 'tên nhân viên';


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN staff.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.address IS 'địa chỉ nhân viên';


--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN staff.phone_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.phone_number IS 'sdt';


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN staff.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff.sex IS 'giới tính 0 : nữ 1: nam';


--
-- TOC entry 304 (class 1259 OID 18905)
-- Name: staff_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_account (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    administration_id smallint NOT NULL,
    user_name character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token boolean,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    refresh_token character varying(500),
    issued_at timestamp without time zone,
    expired_time timestamp without time zone
);


ALTER TABLE public.staff_account OWNER TO postgres;

--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 304
-- Name: TABLE staff_account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.staff_account IS 'tk nhân viên';


--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff_account.refresh_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.refresh_token IS 'mã refresh tonken';


--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff_account.issued_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.issued_at IS 'thời gian phát hành';


--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN staff_account.expired_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.staff_account.expired_time IS 'thời gian hết hạn';


--
-- TOC entry 305 (class 1259 OID 18913)
-- Name: staff_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_account_id_seq OWNER TO postgres;

--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 305
-- Name: staff_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_account_id_seq OWNED BY public.staff_account.id;


--
-- TOC entry 306 (class 1259 OID 18914)
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO postgres;

--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 306
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- TOC entry 307 (class 1259 OID 18915)
-- Name: sub_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_menu (
    id integer NOT NULL,
    menu_main_id smallint NOT NULL,
    name character varying(20) NOT NULL,
    color character varying(20) NOT NULL,
    sub boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sub_menu OWNER TO postgres;

--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 307
-- Name: TABLE sub_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sub_menu IS 'ds submenu';


--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN sub_menu.menu_main_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sub_menu.menu_main_id IS 'thuộc menu nào';


--
-- TOC entry 308 (class 1259 OID 18922)
-- Name: sub_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_menu_id_seq OWNER TO postgres;

--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 308
-- Name: sub_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_menu_id_seq OWNED BY public.sub_menu.id;


--
-- TOC entry 309 (class 1259 OID 18923)
-- Name: transfer_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfer_providers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.transfer_providers OWNER TO postgres;

--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 309
-- Name: TABLE transfer_providers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.transfer_providers IS 'các nhà cung cấp dịch vụ thanh toán online';


--
-- TOC entry 310 (class 1259 OID 18929)
-- Name: transfer_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transfer_providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfer_providers_id_seq OWNER TO postgres;

--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 310
-- Name: transfer_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transfer_providers_id_seq OWNED BY public.transfer_providers.id;


--
-- TOC entry 311 (class 1259 OID 18930)
-- Name: type_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_notification (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    color character varying(20) DEFAULT '000000'::character varying
);


ALTER TABLE public.type_notification OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 18939)
-- Name: type_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_notification_id_seq OWNER TO postgres;

--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 312
-- Name: type_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_notification_id_seq OWNED BY public.type_notification.id;


--
-- TOC entry 313 (class 1259 OID 18940)
-- Name: type_promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_promotion (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(200) NOT NULL,
    code_hide character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.type_promotion OWNER TO postgres;

--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE type_promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';


--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN type_promotion.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.name IS 'tên kh';


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN type_promotion.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.content IS 'nội dung km';


--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN type_promotion.code_hide; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_promotion.code_hide IS 'đây là code ẩn khi gắn mà chương trình sẽ tính ra luôn kq km';


--
-- TOC entry 314 (class 1259 OID 18946)
-- Name: type_promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_promotion_id_seq OWNER TO postgres;

--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 314
-- Name: type_promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_promotion_id_seq OWNED BY public.type_promotion.id;


--
-- TOC entry 315 (class 1259 OID 18947)
-- Name: type_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_report (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.type_report OWNER TO postgres;

--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE type_report; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_report IS 'loại tố cáo';


--
-- TOC entry 316 (class 1259 OID 18955)
-- Name: type_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_report_id_seq OWNER TO postgres;

--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 316
-- Name: type_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_report_id_seq OWNED BY public.type_report.id;


--
-- TOC entry 317 (class 1259 OID 18956)
-- Name: type_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_ticket (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(200),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.type_ticket OWNER TO postgres;

--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE type_ticket; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_ticket IS 'loại phiếu';


--
-- TOC entry 318 (class 1259 OID 18962)
-- Name: type_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 318
-- Name: type_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_ticket_id_seq OWNED BY public.type_ticket.id;


--
-- TOC entry 319 (class 1259 OID 18963)
-- Name: type_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_update (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.type_update OWNER TO postgres;

--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE type_update; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_update IS 'các loại update / xóa / ẩn';


--
-- TOC entry 320 (class 1259 OID 18971)
-- Name: type_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_update_id_seq OWNER TO postgres;

--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 320
-- Name: type_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_update_id_seq OWNED BY public.type_update.id;


--
-- TOC entry 321 (class 1259 OID 18972)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    hotline character varying(50) NOT NULL,
    manage character varying(50) NOT NULL,
    branch_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE warehouse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.warehouse IS 'tên các kho';


--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN warehouse.branch_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.warehouse.branch_id IS 'thuộc chi nhánh nào';


--
-- TOC entry 322 (class 1259 OID 18978)
-- Name: warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warehouse_id_seq OWNER TO postgres;

--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 322
-- Name: warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;


--
-- TOC entry 323 (class 1259 OID 18979)
-- Name: websockets_statistics_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.websockets_statistics_entries (
    id integer NOT NULL,
    app_id character varying(255) NOT NULL,
    peak_connection_count integer NOT NULL,
    websocket_message_count integer NOT NULL,
    api_message_count integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.websockets_statistics_entries OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 18982)
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.websockets_statistics_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.websockets_statistics_entries_id_seq OWNER TO postgres;

--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 324
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;


--
-- TOC entry 3448 (class 2604 OID 18983)
-- Name: account_admin_action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action ALTER COLUMN id SET DEFAULT nextval('public.account_admin_action_id_seq'::regclass);


--
-- TOC entry 3452 (class 2604 OID 18984)
-- Name: account_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_customers ALTER COLUMN id SET DEFAULT nextval('public.account_customers_id_seq'::regclass);


--
-- TOC entry 3456 (class 2604 OID 18985)
-- Name: action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- TOC entry 3460 (class 2604 OID 18986)
-- Name: administration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration ALTER COLUMN id SET DEFAULT nextval('public.administration_id_seq'::regclass);


--
-- TOC entry 3464 (class 2604 OID 18987)
-- Name: admins_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification ALTER COLUMN id SET DEFAULT nextval('public.admins_notification_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 18988)
-- Name: ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads ALTER COLUMN id SET DEFAULT nextval('public.ads_id_seq'::regclass);


--
-- TOC entry 3473 (class 2604 OID 18989)
-- Name: api_weather id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather ALTER COLUMN id SET DEFAULT nextval('public.api_weather_id_seq'::regclass);


--
-- TOC entry 3477 (class 2604 OID 18990)
-- Name: bill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill ALTER COLUMN id SET DEFAULT nextval('public.bill_id_seq'::regclass);


--
-- TOC entry 3485 (class 2604 OID 18991)
-- Name: branch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch ALTER COLUMN id SET DEFAULT nextval('public.branch_id_seq'::regclass);


--
-- TOC entry 3489 (class 2604 OID 18992)
-- Name: comments_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news ALTER COLUMN id SET DEFAULT nextval('public.comments_news_id_seq'::regclass);


--
-- TOC entry 3493 (class 2604 OID 18993)
-- Name: comments_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product ALTER COLUMN id SET DEFAULT nextval('public.comments_product_id_seq'::regclass);


--
-- TOC entry 3498 (class 2604 OID 18994)
-- Name: contact_support id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_support ALTER COLUMN id SET DEFAULT nextval('public.contact_support_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 18995)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 3511 (class 2604 OID 18996)
-- Name: customers_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification ALTER COLUMN id SET DEFAULT nextval('public.customers_notification_id_seq'::regclass);


--
-- TOC entry 3516 (class 2604 OID 18997)
-- Name: depot_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket ALTER COLUMN id SET DEFAULT nextval('public.depot_ticket_id_seq'::regclass);


--
-- TOC entry 3520 (class 2604 OID 18998)
-- Name: event_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads ALTER COLUMN id SET DEFAULT nextval('public.event_ads_id_seq'::regclass);


--
-- TOC entry 3524 (class 2604 OID 18999)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3526 (class 2604 OID 19000)
-- Name: giftcode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode ALTER COLUMN id SET DEFAULT nextval('public.giftcode_id_seq'::regclass);


--
-- TOC entry 3530 (class 2604 OID 19001)
-- Name: history_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment ALTER COLUMN id SET DEFAULT nextval('public.history_payment_id_seq'::regclass);


--
-- TOC entry 3536 (class 2604 OID 19002)
-- Name: img_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news ALTER COLUMN id SET DEFAULT nextval('public.img_news_id_seq'::regclass);


--
-- TOC entry 3540 (class 2604 OID 19003)
-- Name: img_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products ALTER COLUMN id SET DEFAULT nextval('public.img_products_id_seq'::regclass);


--
-- TOC entry 3544 (class 2604 OID 19004)
-- Name: intermediary_account_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service ALTER COLUMN id SET DEFAULT nextval('public.intermediary_account_service_id_seq'::regclass);


--
-- TOC entry 3548 (class 2604 OID 19005)
-- Name: list_codes_received id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received ALTER COLUMN id SET DEFAULT nextval('public.list_codes_received_id_seq'::regclass);


--
-- TOC entry 3553 (class 2604 OID 19006)
-- Name: list_giftcodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes ALTER COLUMN id SET DEFAULT nextval('public.list_giftcodes_id_seq'::regclass);


--
-- TOC entry 3558 (class 2604 OID 19007)
-- Name: list_products_by_bill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill ALTER COLUMN id SET DEFAULT nextval('public.list_products_by_bill_id_seq'::regclass);


--
-- TOC entry 3562 (class 2604 OID 19008)
-- Name: log_deletes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes ALTER COLUMN id SET DEFAULT nextval('public.log_deletes_id_seq'::regclass);


--
-- TOC entry 3567 (class 2604 OID 19009)
-- Name: log_login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_login ALTER COLUMN id SET DEFAULT nextval('public.log_login_id_seq'::regclass);


--
-- TOC entry 3571 (class 2604 OID 19010)
-- Name: log_updates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates ALTER COLUMN id SET DEFAULT nextval('public.log_updates_id_seq'::regclass);


--
-- TOC entry 3576 (class 2604 OID 19011)
-- Name: menu_main id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main ALTER COLUMN id SET DEFAULT nextval('public.menu_main_id_seq'::regclass);


--
-- TOC entry 3581 (class 2604 OID 19012)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3582 (class 2604 OID 19013)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 3589 (class 2604 OID 19014)
-- Name: payment_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);


--
-- TOC entry 3593 (class 2604 OID 19015)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3594 (class 2604 OID 19016)
-- Name: policy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy ALTER COLUMN id SET DEFAULT nextval('public.policy_id_seq'::regclass);


--
-- TOC entry 3598 (class 2604 OID 19017)
-- Name: position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);


--
-- TOC entry 3602 (class 2604 OID 19018)
-- Name: price_difference id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference ALTER COLUMN id SET DEFAULT nextval('public.price_difference_id_seq'::regclass);


--
-- TOC entry 3606 (class 2604 OID 19019)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3611 (class 2604 OID 19020)
-- Name: products_in_stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock ALTER COLUMN id SET DEFAULT nextval('public.products_in_stock_id_seq'::regclass);


--
-- TOC entry 3615 (class 2604 OID 19021)
-- Name: promotion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_id_seq'::regclass);


--
-- TOC entry 3619 (class 2604 OID 19022)
-- Name: rank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rank ALTER COLUMN id SET DEFAULT nextval('public.rank_id_seq'::regclass);


--
-- TOC entry 3623 (class 2604 OID 19023)
-- Name: report_source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source ALTER COLUMN id SET DEFAULT nextval('public.report_source_id_seq'::regclass);


--
-- TOC entry 3627 (class 2604 OID 19024)
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- TOC entry 3633 (class 2604 OID 19025)
-- Name: service_by_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product ALTER COLUMN id SET DEFAULT nextval('public.service_by_product_id_seq'::regclass);


--
-- TOC entry 3637 (class 2604 OID 19026)
-- Name: shipping_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_id_seq'::regclass);


--
-- TOC entry 3641 (class 2604 OID 19027)
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- TOC entry 3645 (class 2604 OID 19028)
-- Name: staff_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account ALTER COLUMN id SET DEFAULT nextval('public.staff_account_id_seq'::regclass);


--
-- TOC entry 3649 (class 2604 OID 19029)
-- Name: sub_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu ALTER COLUMN id SET DEFAULT nextval('public.sub_menu_id_seq'::regclass);


--
-- TOC entry 3654 (class 2604 OID 19030)
-- Name: transfer_providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers ALTER COLUMN id SET DEFAULT nextval('public.transfer_providers_id_seq'::regclass);


--
-- TOC entry 3658 (class 2604 OID 19031)
-- Name: type_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification ALTER COLUMN id SET DEFAULT nextval('public.type_notification_id_seq'::regclass);


--
-- TOC entry 3663 (class 2604 OID 19032)
-- Name: type_promotion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion ALTER COLUMN id SET DEFAULT nextval('public.type_promotion_id_seq'::regclass);


--
-- TOC entry 3667 (class 2604 OID 19033)
-- Name: type_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report ALTER COLUMN id SET DEFAULT nextval('public.type_report_id_seq'::regclass);


--
-- TOC entry 3671 (class 2604 OID 19034)
-- Name: type_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket ALTER COLUMN id SET DEFAULT nextval('public.type_ticket_id_seq'::regclass);


--
-- TOC entry 3675 (class 2604 OID 19035)
-- Name: type_update id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update ALTER COLUMN id SET DEFAULT nextval('public.type_update_id_seq'::regclass);


--
-- TOC entry 3679 (class 2604 OID 19036)
-- Name: warehouse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);


--
-- TOC entry 3683 (class 2604 OID 19037)
-- Name: websockets_statistics_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);


--
-- TOC entry 4115 (class 0 OID 18525)
-- Dependencies: 214
-- Data for Name: account_admin_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_admin_action (id, administration_id, action_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4117 (class 0 OID 18532)
-- Dependencies: 216
-- Data for Name: account_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_customers (id, customers_id, remember_token, user_name, password, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4119 (class 0 OID 18539)
-- Dependencies: 218
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action (id, name, content, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4121 (class 0 OID 18548)
-- Dependencies: 220
-- Data for Name: administration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administration (id, name, status, created_at, updated_at) FROM stdin;
1	khoa	t	2023-07-18 13:53:42.333383	2023-07-18 13:53:42.333383
\.


--
-- TOC entry 4123 (class 0 OID 18555)
-- Dependencies: 222
-- Data for Name: admins_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins_notification (id, type_notification, staff_id, content, watched, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4125 (class 0 OID 18565)
-- Dependencies: 224
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ads (id, name, event_ads_id, staff_id, sub_menu_id, img, content, priority, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4127 (class 0 OID 18574)
-- Dependencies: 226
-- Data for Name: api_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_weather (id, name, city, longitude, latityde, content, status, created_at, updated_at) FROM stdin;
7	get weatherHà Nội	Hà Nội	105.7864	21.0303	{"weather":{"id":502,"main":"Rain","description":"mưa cường độ nặng","icon":"10d"},"main":{"temp":31.05,"feels_like":33.99,"temp_min":31.05,"temp_max":31.05,"pressure":1000,"humidity":56,"sea_level":1000,"grnd_level":999}}	t	2023-07-31 14:07:17.104696	2023-07-31 15:16:05.150639
\.


--
-- TOC entry 4129 (class 0 OID 18583)
-- Dependencies: 228
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill (id, code_bill, staff_id, customers_id, branch_id, payment_methods_id, shipping_method_id, transfer_providers_id, total_products, initial_amount, actual_amount, giftcode_id, successful_payment, note, impact_number, report_ship, queue_bill, note_report, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4131 (class 0 OID 18596)
-- Dependencies: 230
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (id, name, address, hotline, manage, working_time, status, created_at, updated_at) FROM stdin;
1	nhà 1	viet nam	0849328210	KHoa	11-12	t	2023-07-18 13:44:09.440164	2023-07-18 13:44:09.440164
2	Nguyen Branch	123 Nguyen Street, Hanoi	0123456789	Nguyen Van A	08:00 - 17:00	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
3	Tran Branch	456 Tran Street, Ho Chi Minh City	0987654321	Tran Thi B	09:00 - 18:00	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
4	Le Branch	789 Le Street, Da Nang	0765432198	Le Van C	07:30 - 16:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
5	Pham Branch	321 Pham Street, Hue	0321654987	Pham Thi D	08:30 - 17:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
6	Vo Branch	654 Vo Street, Can Tho	0549873216	Vo Van E	09:30 - 18:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
7	Ho Branch	987 Ho Street, Nha Trang	0987321654	Ho Thi F	08:00 - 17:00	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
8	Truong Branch	456 Truong Street, Hai Phong	0543219876	Truong Van G	09:00 - 18:00	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
9	Ngo Branch	321 Ngo Street, Quang Ninh	0987654321	Ngo Van I	08:30 - 17:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
10	Do Branch 4	789 Do Street, Vung Tau	0321987654	Do Thi H	07:30 - 16:30	t	2023-06-17 19:00:12.583995	2023-06-17 19:00:12.583995
11	Dinh Branch	654 Dinh Street, Dak Lak	0123456789	Dinh Thi Jd	09:30 - 18:30	t	2023-06-17 19:00:12.583995	2023-07-15 23:05:14.699774
\.


--
-- TOC entry 4133 (class 0 OID 18605)
-- Dependencies: 232
-- Data for Name: comments_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments_news (id, news_id, customers_id, comment_id, comment, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4135 (class 0 OID 18614)
-- Dependencies: 234
-- Data for Name: comments_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments_product (id, product_id, customers_id, comments_product_id, vote, comment, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4137 (class 0 OID 18624)
-- Dependencies: 236
-- Data for Name: contact_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_support (id, logo, link, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4139 (class 0 OID 18631)
-- Dependencies: 238
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, rank_id, first_name, last_name, address, phone_number, email, birthday, sex, accumulated_points, number_ban, potential, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4141 (class 0 OID 18645)
-- Dependencies: 240
-- Data for Name: customers_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_notification (id, type_notification, customer_id, content, watched, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4143 (class 0 OID 18655)
-- Dependencies: 242
-- Data for Name: depot_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depot_ticket (id, code_ticket, ticket_id, staff_id_export, staff_id_receive, product_id, product_number, total_money, note, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4145 (class 0 OID 18664)
-- Dependencies: 244
-- Data for Name: event_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_ads (id, name_event, staff_id, content, note, start_time, end_time, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4147 (class 0 OID 18673)
-- Dependencies: 246
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 4149 (class 0 OID 18680)
-- Dependencies: 248
-- Data for Name: giftcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.giftcode (id, name, event_ads_id, staff_id, content, img, discount, start_time, end_time, number_of_participants, used, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4151 (class 0 OID 18689)
-- Dependencies: 250
-- Data for Name: history_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history_payment (id, payment_method_id, customers_id, transfer_amount, cash_amount, note, bill_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4153 (class 0 OID 18698)
-- Dependencies: 252
-- Data for Name: img_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.img_news (id, name_img, news_id, img, location, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4155 (class 0 OID 18705)
-- Dependencies: 254
-- Data for Name: img_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.img_products (id, product_id, img, display_order, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4157 (class 0 OID 18712)
-- Dependencies: 256
-- Data for Name: intermediary_account_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intermediary_account_service (id, servive_name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4159 (class 0 OID 18719)
-- Dependencies: 258
-- Data for Name: list_codes_received; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_codes_received (id, customers_id, giftcode_id, is_expired, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4161 (class 0 OID 18727)
-- Dependencies: 260
-- Data for Name: list_giftcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_giftcodes (id, giftcode_id, code, already_received, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4163 (class 0 OID 18735)
-- Dependencies: 262
-- Data for Name: list_products_by_bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_products_by_bill (id, bill_id, products_id, status, created_at, updated_at, quantity, amount_of_money) FROM stdin;
\.


--
-- TOC entry 4165 (class 0 OID 18742)
-- Dependencies: 264
-- Data for Name: log_deletes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_deletes (id, type_delete_id, content, internal, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4167 (class 0 OID 18750)
-- Dependencies: 266
-- Data for Name: log_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_login (id, user_login, type, content, ip, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4169 (class 0 OID 18757)
-- Dependencies: 268
-- Data for Name: log_updates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_updates (id, type_update_id, content, internal, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4171 (class 0 OID 18765)
-- Dependencies: 270
-- Data for Name: menu_main; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_main (id, name, color, is_sub_menu, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4173 (class 0 OID 18773)
-- Dependencies: 272
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
4	0000_00_00_000000_create_websockets_statistics_entries_table	1
5	2014_10_12_100000_create_password_reset_tokens_table	1
6	2019_08_19_000000_create_failed_jobs_table	1
7	2019_12_14_000001_create_personal_access_tokens_table	1
8	2016_06_01_000001_create_oauth_auth_codes_table	2
9	2016_06_01_000002_create_oauth_access_tokens_table	2
10	2016_06_01_000003_create_oauth_refresh_tokens_table	2
11	2016_06_01_000004_create_oauth_clients_table	2
12	2016_06_01_000005_create_oauth_personal_access_clients_table	2
\.


--
-- TOC entry 4175 (class 0 OID 18777)
-- Dependencies: 274
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, name_news, sub_menu_id, staff_id, img_main, content, tag, views, likes, comments, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4177 (class 0 OID 18789)
-- Dependencies: 276
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 18794)
-- Dependencies: 277
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4180 (class 0 OID 18801)
-- Dependencies: 279
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4182 (class 0 OID 18807)
-- Dependencies: 281
-- Data for Name: policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy (id, staff_id, name, img, content, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4184 (class 0 OID 18816)
-- Dependencies: 283
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (id, name, content, status, created_at, updated_at) FROM stdin;
3	nhân viên	mô ra	t	2023-07-18 13:45:30.159174	2023-07-18 13:45:30.159174
4	giám đốc	giám đốc	t	2023-07-18 13:48:08.159012	2023-07-18 13:48:08.159012
5	Quản lý tổng	điều hàng chung cho cả hệ thống	t	2023-06-17 21:46:20.133627	2023-06-17 21:46:20.133627
6	Quant lý chi nhánh	quản lý chung cho các chi nhánh	t	2023-06-17 21:46:57.019189	2023-06-17 21:46:57.019189
7	Quản lý nhân viên	Điều hành nhân viên	t	2023-06-17 21:48:45.775187	2023-06-17 21:48:45.775187
8	Nhân viên bán hàng	Nhân viên kho	t	2023-06-17 21:49:06.094128	2023-06-17 21:49:06.094128
9	Nhân viên kho	nv kho	t	2023-06-17 21:49:30.67476	2023-06-17 21:49:30.67476
\.


--
-- TOC entry 4186 (class 0 OID 18825)
-- Dependencies: 285
-- Data for Name: price_difference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_difference (id, staff_id, product_id, import_price, export_price, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4188 (class 0 OID 18832)
-- Dependencies: 287
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, sub_menu_id, code_products, name, img_main, origin, color, size, into_money, vote, intro, number_of_products_sold, remaining_products, status, created_at, updated_at, is_promotion) FROM stdin;
\.


--
-- TOC entry 4190 (class 0 OID 18842)
-- Dependencies: 289
-- Data for Name: products_in_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_in_stock (id, product_id, warehouse_id, remaining, import_price, export_price, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4192 (class 0 OID 18849)
-- Dependencies: 291
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion (id, product_id, type_promotion_id, endtime, starttime, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4194 (class 0 OID 18856)
-- Dependencies: 293
-- Data for Name: rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rank (id, name, detail, icon, status, created_at, updated_at, score) FROM stdin;
1	Đồng	cấp độ sơ khai	q	t	2023-08-28 22:34:16.686788	2023-08-28 22:34:16.686788	100
\.


--
-- TOC entry 4196 (class 0 OID 18863)
-- Dependencies: 295
-- Data for Name: report_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_source (id, name, note, status, created_at, updated_at) FROM stdin;
4	người dùng hệ thống admin	Trống	t	2023-09-09 14:31:16.973351	2023-09-09 14:31:16.973351
5	người dùng hệ thống custommer	Trống	t	2023-09-09 14:31:16.973351	2023-09-09 14:31:16.973351
6	hệ thống zalo	Trống	f	2023-09-09 14:33:40.089917	2023-09-09 14:33:40.089917
7	Qua hệ thống cửa hàng	Trống	f	2023-09-09 14:34:44.380985	2023-09-09 14:34:44.380985
\.


--
-- TOC entry 4198 (class 0 OID 18872)
-- Dependencies: 297
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, customers_id, staff_id, sub_report, type_report_id, is_processed, report_source_id, content, feed_back_content, status, created_at, updated_at, sub) FROM stdin;
\.


--
-- TOC entry 4200 (class 0 OID 18883)
-- Dependencies: 299
-- Data for Name: service_by_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_by_product (id, product_id, policy_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4202 (class 0 OID 18890)
-- Dependencies: 301
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_method (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4204 (class 0 OID 18897)
-- Dependencies: 303
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, code_staff, position_id, branch_id, name, address, phone_number, email, birthday, sex, img, status, created_at, updated_at, background) FROM stdin;
\.


--
-- TOC entry 4205 (class 0 OID 18905)
-- Dependencies: 304
-- Data for Name: staff_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_account (id, staff_id, administration_id, user_name, password, remember_token, status, created_at, updated_at, refresh_token, issued_at, expired_time) FROM stdin;
\.


--
-- TOC entry 4208 (class 0 OID 18915)
-- Dependencies: 307
-- Data for Name: sub_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_menu (id, menu_main_id, name, color, sub, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4210 (class 0 OID 18923)
-- Dependencies: 309
-- Data for Name: transfer_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfer_providers (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4212 (class 0 OID 18930)
-- Dependencies: 311
-- Data for Name: type_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_notification (id, name, note, status, created_at, updated_at, color) FROM stdin;
8	Hệ thống báo lỗi	hệ thống gửi thông báo lỗi dành cho người dùng	t	2023-09-23 22:18:15.891562	2023-09-23 22:18:15.891562	ff0000
9	Thông báo	Hệ thống gửi thông báo lỗi dành cho người dùng	t	2023-09-23 22:16:33.68393	2023-09-23 22:18:15.893795	F4E869
10	Người dùng	Thông báo từ người dùng , người dùng gửi thông báo đến người dùng	t	2023-09-23 22:19:06.398984	2023-09-23 22:19:06.398984	3085C3
11	Phản hồi 	Phản hồi từ những ý kiễn phản hồi cho khách hàng	t	2023-09-23 22:19:57.710001	2023-09-23 22:20:01.125483	6c757d
12	Gửi	gửi tin nhắn , phản hồi cho khách hàng thành công	t	2023-09-23 22:20:34.3712	2023-09-23 22:20:34.3712	28a745
13	Cảnh báo 	gửi cảnh báo cho người dùng	t	2023-09-23 22:21:07.651394	2023-09-23 22:21:07.651394	E9B824
\.


--
-- TOC entry 4214 (class 0 OID 18940)
-- Dependencies: 313
-- Data for Name: type_promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_promotion (id, name, content, code_hide, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4216 (class 0 OID 18947)
-- Dependencies: 315
-- Data for Name: type_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_report (id, name, note, status, created_at, updated_at) FROM stdin;
84	Yêu cầu hỗ trợ từ người dùng (admin))	các yêu cầu hỗ trợ từ phía người dùng từ hệ thống quản lý	t	2023-08-28 20:59:04.371602	2023-08-28 20:59:04.371602
85	Phản hồi về nhân viên	phản  hồi thái độ nhân viên	t	2023-08-28 21:09:24.518622	2023-08-28 21:09:24.518622
86	Đóng góp ý kiến cho sản phẩm	Trống	f	2023-08-28 21:06:19.720643	2023-09-08 23:41:38.860708
87	Tố cáo nhân viên	Trống	f	2023-08-28 21:10:10.994355	2023-09-09 14:16:24.822346
88	Đóng góp ý kiến cho ứng dụng	Trống	f	2023-08-28 21:04:42.076702	2023-09-09 14:16:26.081107
89	Phản hồi về sản phẩm	Trống	f	2023-08-28 21:06:19.720643	2023-09-09 14:58:29.313634
90	phản hồi về ứng dụng customer	Trống	f	2023-09-09 18:14:46.258185	2023-09-09 18:14:46.258185
91	Phản hồi về ứng dụng admin	phản hồi chung của người dùng  & người test về phần mềm	t	2023-08-28 20:56:41.455928	2023-09-09 18:14:53.15048
\.


--
-- TOC entry 4218 (class 0 OID 18956)
-- Dependencies: 317
-- Data for Name: type_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_ticket (id, name, note, status, created_at, updated_at) FROM stdin;
1	phiếu thu	1	t	2023-07-18 13:39:38.732972	2023-07-18 13:39:38.732972
2	phiếu xuất	2	t	2023-07-18 13:39:38.737669	2023-07-18 13:39:38.737669
\.


--
-- TOC entry 4220 (class 0 OID 18963)
-- Dependencies: 319
-- Data for Name: type_update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_update (id, name, note, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4222 (class 0 OID 18972)
-- Dependencies: 321
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (id, name, address, hotline, manage, branch_id, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4224 (class 0 OID 18979)
-- Dependencies: 323
-- Data for Name: websockets_statistics_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 215
-- Name: account_admin_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_admin_action_id_seq', 1, false);


--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 217
-- Name: account_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_customers_id_seq', 1, false);


--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 219
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_id_seq', 1, false);


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 221
-- Name: administration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administration_id_seq', 1, true);


--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 223
-- Name: admins_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_notification_id_seq', 103, true);


--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 225
-- Name: ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ads_id_seq', 1, false);


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 227
-- Name: api_weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_weather_id_seq', 11, true);


--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 229
-- Name: bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_id_seq', 1, false);


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 231
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_id_seq', 11, true);


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 233
-- Name: comments_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_news_id_seq', 1, false);


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 235
-- Name: comments_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_product_id_seq', 1, false);


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 237
-- Name: contact_support_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_support_id_seq', 1, false);


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 239
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 241
-- Name: customers_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_notification_id_seq', 1, false);


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 243
-- Name: depot_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.depot_ticket_id_seq', 1, false);


--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 245
-- Name: event_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_ads_id_seq', 1, false);


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 247
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 249
-- Name: giftcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.giftcode_id_seq', 1, false);


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 251
-- Name: history_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_payment_id_seq', 1, false);


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 253
-- Name: img_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.img_news_id_seq', 1, false);


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 255
-- Name: img_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.img_products_id_seq', 1, false);


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 257
-- Name: intermediary_account_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intermediary_account_service_id_seq', 1, false);


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 259
-- Name: list_codes_received_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_codes_received_id_seq', 1, false);


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 261
-- Name: list_giftcodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_giftcodes_id_seq', 1, false);


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 263
-- Name: list_products_by_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_products_by_bill_id_seq', 1, false);


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 265
-- Name: log_deletes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_deletes_id_seq', 1, false);


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 267
-- Name: log_login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_login_id_seq', 1, false);


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 269
-- Name: log_updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_updates_id_seq', 1, false);


--
-- TOC entry 4527 (class 0 OID 0)
-- Dependencies: 271
-- Name: menu_main_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_main_id_seq', 1, false);


--
-- TOC entry 4528 (class 0 OID 0)
-- Dependencies: 273
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- TOC entry 4529 (class 0 OID 0)
-- Dependencies: 275
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 278
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_id_seq', 1, false);


--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 280
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 282
-- Name: policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.policy_id_seq', 1, false);


--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 284
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 9, true);


--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 286
-- Name: price_difference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_difference_id_seq', 1, false);


--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 288
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 290
-- Name: products_in_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_in_stock_id_seq', 1, false);


--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 292
-- Name: promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_id_seq', 1, false);


--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 294
-- Name: rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rank_id_seq', 1, true);


--
-- TOC entry 4539 (class 0 OID 0)
-- Dependencies: 296
-- Name: report_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_source_id_seq', 7, true);


--
-- TOC entry 4540 (class 0 OID 0)
-- Dependencies: 298
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, false);


--
-- TOC entry 4541 (class 0 OID 0)
-- Dependencies: 300
-- Name: service_by_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_by_product_id_seq', 1, false);


--
-- TOC entry 4542 (class 0 OID 0)
-- Dependencies: 302
-- Name: shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_method_id_seq', 1, false);


--
-- TOC entry 4543 (class 0 OID 0)
-- Dependencies: 305
-- Name: staff_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_account_id_seq', 10, true);


--
-- TOC entry 4544 (class 0 OID 0)
-- Dependencies: 306
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 25, true);


--
-- TOC entry 4545 (class 0 OID 0)
-- Dependencies: 308
-- Name: sub_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_menu_id_seq', 1, false);


--
-- TOC entry 4546 (class 0 OID 0)
-- Dependencies: 310
-- Name: transfer_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transfer_providers_id_seq', 1, false);


--
-- TOC entry 4547 (class 0 OID 0)
-- Dependencies: 312
-- Name: type_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_notification_id_seq', 13, true);


--
-- TOC entry 4548 (class 0 OID 0)
-- Dependencies: 314
-- Name: type_promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_promotion_id_seq', 1, false);


--
-- TOC entry 4549 (class 0 OID 0)
-- Dependencies: 316
-- Name: type_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_report_id_seq', 91, true);


--
-- TOC entry 4550 (class 0 OID 0)
-- Dependencies: 318
-- Name: type_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_ticket_id_seq', 2, true);


--
-- TOC entry 4551 (class 0 OID 0)
-- Dependencies: 320
-- Name: type_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_update_id_seq', 1, false);


--
-- TOC entry 4552 (class 0 OID 0)
-- Dependencies: 322
-- Name: warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouse_id_seq', 1, false);


--
-- TOC entry 4553 (class 0 OID 0)
-- Dependencies: 324
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- TOC entry 3685 (class 2606 OID 19039)
-- Name: account_admin_action account_admin_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT account_admin_action_pkey PRIMARY KEY (id);


--
-- TOC entry 3687 (class 2606 OID 19041)
-- Name: account_customers account_customers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT account_customers_pk PRIMARY KEY (id);


--
-- TOC entry 3689 (class 2606 OID 19043)
-- Name: account_customers account_customers_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT account_customers_un UNIQUE (user_name);


--
-- TOC entry 3691 (class 2606 OID 19045)
-- Name: action action_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_name_key UNIQUE (name);


--
-- TOC entry 3693 (class 2606 OID 19047)
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- TOC entry 3695 (class 2606 OID 19049)
-- Name: administration administration_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration
    ADD CONSTRAINT administration_name_key UNIQUE (name);


--
-- TOC entry 3697 (class 2606 OID 19051)
-- Name: administration administration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administration
    ADD CONSTRAINT administration_pkey PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 19053)
-- Name: admins_notification admins_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3702 (class 2606 OID 19055)
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);


--
-- TOC entry 3704 (class 2606 OID 19057)
-- Name: api_weather api_weather_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather
    ADD CONSTRAINT api_weather_key UNIQUE (city);


--
-- TOC entry 3706 (class 2606 OID 19059)
-- Name: api_weather api_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_weather
    ADD CONSTRAINT api_weather_pkey PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 19061)
-- Name: bill bill_code_bill_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_code_bill_key UNIQUE (code_bill);


--
-- TOC entry 3710 (class 2606 OID 19063)
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);


--
-- TOC entry 3712 (class 2606 OID 19065)
-- Name: branch branch_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_name_key UNIQUE (name);


--
-- TOC entry 3714 (class 2606 OID 19067)
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- TOC entry 3716 (class 2606 OID 19069)
-- Name: comments_news comments_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT comments_news_pkey PRIMARY KEY (id);


--
-- TOC entry 3718 (class 2606 OID 19071)
-- Name: comments_product comments_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT comments_product_pkey PRIMARY KEY (id);


--
-- TOC entry 3720 (class 2606 OID 19073)
-- Name: contact_support contact_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_support
    ADD CONSTRAINT contact_support_pkey PRIMARY KEY (id);


--
-- TOC entry 3722 (class 2606 OID 19075)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 3728 (class 2606 OID 19077)
-- Name: customers_notification customers_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3724 (class 2606 OID 19079)
-- Name: customers customers_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_number_key UNIQUE (phone_number);


--
-- TOC entry 3726 (class 2606 OID 19081)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3730 (class 2606 OID 19083)
-- Name: depot_ticket depot_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT depot_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3732 (class 2606 OID 19085)
-- Name: event_ads event_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads
    ADD CONSTRAINT event_ads_pkey PRIMARY KEY (id);


--
-- TOC entry 3734 (class 2606 OID 19087)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3736 (class 2606 OID 19089)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3738 (class 2606 OID 19091)
-- Name: giftcode giftcode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT giftcode_pkey PRIMARY KEY (id);


--
-- TOC entry 3740 (class 2606 OID 19093)
-- Name: history_payment history_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT history_payment_pkey PRIMARY KEY (id);


--
-- TOC entry 3742 (class 2606 OID 19095)
-- Name: img_news img_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news
    ADD CONSTRAINT img_news_pkey PRIMARY KEY (id);


--
-- TOC entry 3744 (class 2606 OID 19097)
-- Name: img_products img_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products
    ADD CONSTRAINT img_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3746 (class 2606 OID 19099)
-- Name: intermediary_account_service intermediary_account_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service
    ADD CONSTRAINT intermediary_account_service_pkey PRIMARY KEY (id);


--
-- TOC entry 3748 (class 2606 OID 19101)
-- Name: intermediary_account_service intermediary_account_service_servive_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediary_account_service
    ADD CONSTRAINT intermediary_account_service_servive_name_key UNIQUE (servive_name);


--
-- TOC entry 3750 (class 2606 OID 19103)
-- Name: list_giftcodes list_giftcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes
    ADD CONSTRAINT list_giftcodes_pkey PRIMARY KEY (id);


--
-- TOC entry 3752 (class 2606 OID 19105)
-- Name: list_products_by_bill list_products_by_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT list_products_by_bill_pkey PRIMARY KEY (id);


--
-- TOC entry 3754 (class 2606 OID 19107)
-- Name: log_deletes log_deletes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes
    ADD CONSTRAINT log_deletes_pkey PRIMARY KEY (id);


--
-- TOC entry 3756 (class 2606 OID 19109)
-- Name: log_login log_login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_login
    ADD CONSTRAINT log_login_pkey PRIMARY KEY (id);


--
-- TOC entry 3758 (class 2606 OID 19111)
-- Name: log_updates log_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates
    ADD CONSTRAINT log_updates_pkey PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 19113)
-- Name: menu_main menu_main_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main
    ADD CONSTRAINT menu_main_name_key UNIQUE (name);


--
-- TOC entry 3762 (class 2606 OID 19115)
-- Name: menu_main menu_main_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_main
    ADD CONSTRAINT menu_main_pkey PRIMARY KEY (id);


--
-- TOC entry 3764 (class 2606 OID 19117)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 19119)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 3768 (class 2606 OID 19121)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3770 (class 2606 OID 19123)
-- Name: payment_methods payment_methods_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_name_key UNIQUE (name);


--
-- TOC entry 3772 (class 2606 OID 19125)
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 3774 (class 2606 OID 19127)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3776 (class 2606 OID 19129)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3779 (class 2606 OID 19131)
-- Name: policy policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy
    ADD CONSTRAINT policy_pkey PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 19133)
-- Name: position position_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_name_key UNIQUE (name);


--
-- TOC entry 3783 (class 2606 OID 19135)
-- Name: position position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);


--
-- TOC entry 3785 (class 2606 OID 19137)
-- Name: price_difference price_difference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT price_difference_pkey PRIMARY KEY (id);


--
-- TOC entry 3787 (class 2606 OID 19139)
-- Name: products products_code_products_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_code_products_key UNIQUE (code_products);


--
-- TOC entry 3793 (class 2606 OID 19141)
-- Name: products_in_stock products_in_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT products_in_stock_pkey PRIMARY KEY (id);


--
-- TOC entry 3789 (class 2606 OID 19143)
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- TOC entry 3791 (class 2606 OID 19145)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3795 (class 2606 OID 19147)
-- Name: promotion promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_pkey PRIMARY KEY (id);


--
-- TOC entry 3797 (class 2606 OID 19149)
-- Name: rank rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rank
    ADD CONSTRAINT rank_pkey PRIMARY KEY (id);


--
-- TOC entry 3799 (class 2606 OID 19151)
-- Name: report_source report_source_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source
    ADD CONSTRAINT report_source_name_key UNIQUE (name);


--
-- TOC entry 3801 (class 2606 OID 19153)
-- Name: report_source report_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_source
    ADD CONSTRAINT report_source_pkey PRIMARY KEY (id);


--
-- TOC entry 3803 (class 2606 OID 19155)
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3805 (class 2606 OID 19157)
-- Name: service_by_product service_by_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT service_by_product_pkey PRIMARY KEY (id);


--
-- TOC entry 3807 (class 2606 OID 19159)
-- Name: shipping_method shipping_method_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_name_key UNIQUE (name);


--
-- TOC entry 3809 (class 2606 OID 19161)
-- Name: shipping_method shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_pkey PRIMARY KEY (id);


--
-- TOC entry 3817 (class 2606 OID 19163)
-- Name: staff_account staff_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT staff_account_pkey PRIMARY KEY (id);


--
-- TOC entry 3819 (class 2606 OID 19165)
-- Name: staff_account staff_account_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT staff_account_user_name_key UNIQUE (user_name);


--
-- TOC entry 3811 (class 2606 OID 19167)
-- Name: staff staff_code_staff_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_code_staff_key UNIQUE (code_staff);


--
-- TOC entry 3813 (class 2606 OID 19169)
-- Name: staff staff_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_phone_number_key UNIQUE (phone_number);


--
-- TOC entry 3815 (class 2606 OID 19171)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- TOC entry 3823 (class 2606 OID 19173)
-- Name: sub_menu sub_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT sub_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 3825 (class 2606 OID 19175)
-- Name: transfer_providers transfer_providers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers
    ADD CONSTRAINT transfer_providers_name_key UNIQUE (name);


--
-- TOC entry 3827 (class 2606 OID 19177)
-- Name: transfer_providers transfer_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_providers
    ADD CONSTRAINT transfer_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3829 (class 2606 OID 19179)
-- Name: type_notification type_notification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification
    ADD CONSTRAINT type_notification_pk PRIMARY KEY (id);


--
-- TOC entry 3831 (class 2606 OID 19181)
-- Name: type_notification type_notification_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_notification
    ADD CONSTRAINT type_notification_un UNIQUE (name);


--
-- TOC entry 3833 (class 2606 OID 19183)
-- Name: type_promotion type_promotion_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion
    ADD CONSTRAINT type_promotion_name_key UNIQUE (name);


--
-- TOC entry 3835 (class 2606 OID 19185)
-- Name: type_promotion type_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_promotion
    ADD CONSTRAINT type_promotion_pkey PRIMARY KEY (id);


--
-- TOC entry 3837 (class 2606 OID 19187)
-- Name: type_report type_report_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report
    ADD CONSTRAINT type_report_name_key UNIQUE (name);


--
-- TOC entry 3839 (class 2606 OID 19189)
-- Name: type_report type_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_report
    ADD CONSTRAINT type_report_pkey PRIMARY KEY (id);


--
-- TOC entry 3841 (class 2606 OID 19191)
-- Name: type_ticket type_ticket_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket
    ADD CONSTRAINT type_ticket_name_key UNIQUE (name);


--
-- TOC entry 3843 (class 2606 OID 19193)
-- Name: type_ticket type_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_ticket
    ADD CONSTRAINT type_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3845 (class 2606 OID 19195)
-- Name: type_update type_update_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update
    ADD CONSTRAINT type_update_name_key UNIQUE (name);


--
-- TOC entry 3847 (class 2606 OID 19197)
-- Name: type_update type_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_update
    ADD CONSTRAINT type_update_pkey PRIMARY KEY (id);


--
-- TOC entry 3821 (class 2606 OID 19199)
-- Name: staff_account unique_column_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT unique_column_constraint UNIQUE (staff_id);


--
-- TOC entry 3849 (class 2606 OID 19201)
-- Name: warehouse warehouse_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_name_key UNIQUE (name);


--
-- TOC entry 3851 (class 2606 OID 19203)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);


--
-- TOC entry 3853 (class 2606 OID 19205)
-- Name: websockets_statistics_entries websockets_statistics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3698 (class 1259 OID 19206)
-- Name: admins_notification_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admins_notification_id_idx ON public.admins_notification USING btree (id);


--
-- TOC entry 3777 (class 1259 OID 19207)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3918 (class 2620 OID 19208)
-- Name: account_admin_action update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.account_admin_action FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3919 (class 2620 OID 19209)
-- Name: account_customers update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.account_customers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3920 (class 2620 OID 19210)
-- Name: action update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.action FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3921 (class 2620 OID 19211)
-- Name: administration update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.administration FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3922 (class 2620 OID 19212)
-- Name: admins_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.admins_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3923 (class 2620 OID 19213)
-- Name: ads update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.ads FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3924 (class 2620 OID 19214)
-- Name: api_weather update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.api_weather FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3925 (class 2620 OID 19215)
-- Name: bill update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.bill FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3926 (class 2620 OID 19216)
-- Name: branch update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.branch FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3927 (class 2620 OID 19217)
-- Name: comments_news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.comments_news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3928 (class 2620 OID 19218)
-- Name: comments_product update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.comments_product FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3929 (class 2620 OID 19219)
-- Name: contact_support update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.contact_support FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3930 (class 2620 OID 19220)
-- Name: customers update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.customers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3931 (class 2620 OID 19221)
-- Name: customers_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.customers_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3932 (class 2620 OID 19222)
-- Name: depot_ticket update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.depot_ticket FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3933 (class 2620 OID 19223)
-- Name: event_ads update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.event_ads FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3934 (class 2620 OID 19224)
-- Name: failed_jobs update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.failed_jobs FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3935 (class 2620 OID 19225)
-- Name: giftcode update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.giftcode FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3936 (class 2620 OID 19226)
-- Name: history_payment update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.history_payment FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3937 (class 2620 OID 19227)
-- Name: img_news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.img_news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3938 (class 2620 OID 19228)
-- Name: img_products update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.img_products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3939 (class 2620 OID 19229)
-- Name: intermediary_account_service update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.intermediary_account_service FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3940 (class 2620 OID 19230)
-- Name: list_codes_received update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_codes_received FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3941 (class 2620 OID 19231)
-- Name: list_giftcodes update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_giftcodes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3942 (class 2620 OID 19232)
-- Name: list_products_by_bill update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_products_by_bill FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3943 (class 2620 OID 19233)
-- Name: log_deletes update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_deletes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3944 (class 2620 OID 19234)
-- Name: log_login update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_login FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3945 (class 2620 OID 19235)
-- Name: log_updates update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_updates FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3946 (class 2620 OID 19236)
-- Name: menu_main update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.menu_main FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3947 (class 2620 OID 19237)
-- Name: migrations update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.migrations FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3948 (class 2620 OID 19238)
-- Name: news update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3949 (class 2620 OID 19239)
-- Name: password_reset_tokens update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.password_reset_tokens FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3950 (class 2620 OID 19240)
-- Name: payment_methods update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.payment_methods FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3951 (class 2620 OID 19241)
-- Name: personal_access_tokens update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.personal_access_tokens FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3952 (class 2620 OID 19242)
-- Name: policy update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.policy FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3953 (class 2620 OID 19243)
-- Name: position update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3954 (class 2620 OID 19244)
-- Name: price_difference update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.price_difference FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3955 (class 2620 OID 19245)
-- Name: products update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3956 (class 2620 OID 19246)
-- Name: products_in_stock update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.products_in_stock FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3957 (class 2620 OID 19247)
-- Name: promotion update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.promotion FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3958 (class 2620 OID 19248)
-- Name: rank update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.rank FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3959 (class 2620 OID 19249)
-- Name: report_source update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.report_source FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3960 (class 2620 OID 19250)
-- Name: reports update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.reports FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3961 (class 2620 OID 19251)
-- Name: service_by_product update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.service_by_product FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3962 (class 2620 OID 19252)
-- Name: shipping_method update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.shipping_method FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3963 (class 2620 OID 19253)
-- Name: staff update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.staff FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3964 (class 2620 OID 19254)
-- Name: staff_account update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.staff_account FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3965 (class 2620 OID 19255)
-- Name: sub_menu update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.sub_menu FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3966 (class 2620 OID 19256)
-- Name: transfer_providers update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.transfer_providers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3967 (class 2620 OID 19257)
-- Name: type_notification update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3968 (class 2620 OID 19258)
-- Name: type_promotion update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_promotion FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3969 (class 2620 OID 19259)
-- Name: type_report update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_report FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3970 (class 2620 OID 19260)
-- Name: type_ticket update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_ticket FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3971 (class 2620 OID 19261)
-- Name: type_update update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_update FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3972 (class 2620 OID 19262)
-- Name: warehouse update_table_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.warehouse FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- TOC entry 3856 (class 2606 OID 19263)
-- Name: account_customers FK1_account_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT "FK1_account_customers" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3854 (class 2606 OID 19268)
-- Name: account_admin_action FK1_action_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT "FK1_action_admin" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE;


--
-- TOC entry 3859 (class 2606 OID 19273)
-- Name: ads FK1_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "FK1_ads" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE;


--
-- TOC entry 3861 (class 2606 OID 19278)
-- Name: bill FK1_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK1_bill" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3870 (class 2606 OID 19283)
-- Name: comments_product FK1_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK1_comment_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3867 (class 2606 OID 19288)
-- Name: comments_news FK1_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK1_comments_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE;


--
-- TOC entry 3873 (class 2606 OID 19293)
-- Name: customers FK1_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT "FK1_customers" FOREIGN KEY (rank_id) REFERENCES public.rank(id) ON UPDATE CASCADE;


--
-- TOC entry 3876 (class 2606 OID 19298)
-- Name: depot_ticket FK1_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK1_depot_ticket" FOREIGN KEY (ticket_id) REFERENCES public.type_ticket(id) ON UPDATE CASCADE;


--
-- TOC entry 3880 (class 2606 OID 19303)
-- Name: event_ads FK1_event_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ads
    ADD CONSTRAINT "FK1_event_ads" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3881 (class 2606 OID 19308)
-- Name: giftcode FK1_giftcode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT "FK1_giftcode" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE;


--
-- TOC entry 3883 (class 2606 OID 19313)
-- Name: history_payment FK1_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK1_history_payment" FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE;


--
-- TOC entry 3886 (class 2606 OID 19318)
-- Name: img_news FK1_img_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_news
    ADD CONSTRAINT "FK1_img_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE;


--
-- TOC entry 3887 (class 2606 OID 19323)
-- Name: img_products FK1_img_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.img_products
    ADD CONSTRAINT "FK1_img_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3888 (class 2606 OID 19328)
-- Name: list_codes_received FK1_list_codes_received; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received
    ADD CONSTRAINT "FK1_list_codes_received" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3890 (class 2606 OID 19333)
-- Name: list_giftcodes FK1_list_giftcodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_giftcodes
    ADD CONSTRAINT "FK1_list_giftcodes" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE;


--
-- TOC entry 3891 (class 2606 OID 19338)
-- Name: list_products_by_bill FK1_list_products_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT "FK1_list_products_by" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE;


--
-- TOC entry 3893 (class 2606 OID 19343)
-- Name: log_deletes FK1_log_delete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_deletes
    ADD CONSTRAINT "FK1_log_delete" FOREIGN KEY (type_delete_id) REFERENCES public.type_update(id) ON UPDATE CASCADE;


--
-- TOC entry 3894 (class 2606 OID 19348)
-- Name: log_updates FK1_log_update; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_updates
    ADD CONSTRAINT "FK1_log_update" FOREIGN KEY (type_update_id) REFERENCES public.type_update(id) ON UPDATE CASCADE;


--
-- TOC entry 3895 (class 2606 OID 19353)
-- Name: news FK1_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK1_news" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3897 (class 2606 OID 19358)
-- Name: policy FK1_policy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy
    ADD CONSTRAINT "FK1_policy" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3898 (class 2606 OID 19363)
-- Name: price_difference FK1_price_difference; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT "FK1_price_difference" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3900 (class 2606 OID 19368)
-- Name: products FK1_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK1_products" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3901 (class 2606 OID 19373)
-- Name: products_in_stock FK1_products_in_stock; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT "FK1_products_in_stock" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3903 (class 2606 OID 19378)
-- Name: promotion FK1_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK1_promotion" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3905 (class 2606 OID 19383)
-- Name: reports FK1_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK1_reports" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3910 (class 2606 OID 19388)
-- Name: service_by_product FK1_service_by_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT "FK1_service_by_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3912 (class 2606 OID 19393)
-- Name: staff FK1_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT "FK1_staff" FOREIGN KEY (position_id) REFERENCES public."position"(id) ON UPDATE CASCADE;


--
-- TOC entry 3914 (class 2606 OID 19398)
-- Name: staff_account FK1_staff_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT "FK1_staff_account" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3916 (class 2606 OID 19403)
-- Name: sub_menu FK1_sub_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT "FK1_sub_menu" FOREIGN KEY (menu_main_id) REFERENCES public.menu_main(id) ON UPDATE CASCADE;


--
-- TOC entry 3917 (class 2606 OID 19408)
-- Name: warehouse FK1_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK1_warehouse" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3855 (class 2606 OID 19413)
-- Name: account_admin_action FK2_action_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT "FK2_action_admin" FOREIGN KEY (action_id) REFERENCES public.action(id) ON UPDATE CASCADE;


--
-- TOC entry 3860 (class 2606 OID 19418)
-- Name: ads FK2_ads; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "FK2_ads" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;


--
-- TOC entry 3862 (class 2606 OID 19423)
-- Name: bill FK2_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK2_bill" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3871 (class 2606 OID 19428)
-- Name: comments_product FK2_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK2_comment_product" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3868 (class 2606 OID 19433)
-- Name: comments_news FK2_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK2_comments_news" FOREIGN KEY (comment_id) REFERENCES public.comments_news(id) ON UPDATE CASCADE;


--
-- TOC entry 3877 (class 2606 OID 19438)
-- Name: depot_ticket FK2_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK2_depot_ticket" FOREIGN KEY (staff_id_export) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3882 (class 2606 OID 19443)
-- Name: giftcode FK2_giftcode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT "FK2_giftcode" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3884 (class 2606 OID 19448)
-- Name: history_payment FK2_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK2_history_payment" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3889 (class 2606 OID 19453)
-- Name: list_codes_received FK2_list_codes_received; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_codes_received
    ADD CONSTRAINT "FK2_list_codes_received" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE;


--
-- TOC entry 3892 (class 2606 OID 19458)
-- Name: list_products_by_bill FK2_list_products_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT "FK2_list_products_by" FOREIGN KEY (products_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3896 (class 2606 OID 19463)
-- Name: news FK2_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK2_news" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3899 (class 2606 OID 19468)
-- Name: price_difference FK2_price_difference; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT "FK2_price_difference" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3902 (class 2606 OID 19473)
-- Name: products_in_stock FK2_products_in_stock; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT "FK2_products_in_stock" FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id) ON UPDATE CASCADE;


--
-- TOC entry 3904 (class 2606 OID 19478)
-- Name: promotion FK2_promotion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK2_promotion" FOREIGN KEY (type_promotion_id) REFERENCES public.type_promotion(id);


--
-- TOC entry 3906 (class 2606 OID 19483)
-- Name: reports FK2_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK2_reports" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3911 (class 2606 OID 19488)
-- Name: service_by_product FK2_service_by_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT "FK2_service_by_product" FOREIGN KEY (policy_id) REFERENCES public.policy(id) ON UPDATE CASCADE;


--
-- TOC entry 3915 (class 2606 OID 19493)
-- Name: staff_account FK2_staff_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT "FK2_staff_account" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE;


--
-- TOC entry 3863 (class 2606 OID 19498)
-- Name: bill FK3_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK3_bill" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3872 (class 2606 OID 19503)
-- Name: comments_product FK3_comment_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK3_comment_product" FOREIGN KEY (comments_product_id) REFERENCES public.comments_product(id) ON UPDATE CASCADE;


--
-- TOC entry 3869 (class 2606 OID 19508)
-- Name: comments_news FK3_comments_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK3_comments_news" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


--
-- TOC entry 3878 (class 2606 OID 19513)
-- Name: depot_ticket FK3_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK3_depot_ticket" FOREIGN KEY (staff_id_receive) REFERENCES public.staff(id) ON UPDATE CASCADE;


--
-- TOC entry 3885 (class 2606 OID 19518)
-- Name: history_payment FK3_history_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK3_history_payment" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE;


--
-- TOC entry 3907 (class 2606 OID 19523)
-- Name: reports FK3_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK3_reports" FOREIGN KEY (sub_report) REFERENCES public.reports(id) ON UPDATE CASCADE;


--
-- TOC entry 3913 (class 2606 OID 19528)
-- Name: staff FK3_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT "FK3_staff" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- TOC entry 3864 (class 2606 OID 19533)
-- Name: bill FK4_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK4_bill" FOREIGN KEY (payment_methods_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE;


--
-- TOC entry 3879 (class 2606 OID 19538)
-- Name: depot_ticket FK4_depot_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK4_depot_ticket" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;


--
-- TOC entry 3908 (class 2606 OID 19543)
-- Name: reports FK4_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK4_reports" FOREIGN KEY (type_report_id) REFERENCES public.type_report(id) ON UPDATE CASCADE;


--
-- TOC entry 3865 (class 2606 OID 19548)
-- Name: bill FK5_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK5_bill" FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_method(id) ON UPDATE CASCADE;


--
-- TOC entry 3909 (class 2606 OID 19553)
-- Name: reports FK5_reports; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK5_reports" FOREIGN KEY (report_source_id) REFERENCES public.report_source(id) ON UPDATE CASCADE;


--
-- TOC entry 3866 (class 2606 OID 19558)
-- Name: bill FK6_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK6_bill" FOREIGN KEY (transfer_providers_id) REFERENCES public.transfer_providers(id) ON UPDATE CASCADE;


--
-- TOC entry 3857 (class 2606 OID 19563)
-- Name: admins_notification admins_notification_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_fk FOREIGN KEY (type_notification) REFERENCES public.type_notification(id) ON UPDATE CASCADE;


--
-- TOC entry 3858 (class 2606 OID 19568)
-- Name: admins_notification admins_notification_staff_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_staff_fk FOREIGN KEY (staff_id) REFERENCES public.staff(id);


--
-- TOC entry 3874 (class 2606 OID 19573)
-- Name: customers_notification customers_notification_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_fk FOREIGN KEY (type_notification) REFERENCES public.type_notification(id) ON UPDATE CASCADE;


--
-- TOC entry 3875 (class 2606 OID 19578)
-- Name: customers_notification customers_notification_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_fk_1 FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE;


-- Completed on 2024-02-29 20:36:06

--
-- PostgreSQL database dump complete
--

--
-- Database "test_back_up" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-29 20:36:06

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

--
-- TOC entry 3315 (class 1262 OID 27806)
-- Name: test_back_up; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test_back_up WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE test_back_up OWNER TO postgres;

\connect test_back_up

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

-- Completed on 2024-02-29 20:36:07

--
-- PostgreSQL database dump complete
--

--
-- Database "test_backup_v2" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-29 20:36:07

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

--
-- TOC entry 3315 (class 1262 OID 27807)
-- Name: test_backup_v2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test_backup_v2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE test_backup_v2 OWNER TO postgres;

\connect test_backup_v2

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

-- Completed on 2024-02-29 20:36:07

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-02-29 20:36:07

--
-- PostgreSQL database cluster dump complete
--

