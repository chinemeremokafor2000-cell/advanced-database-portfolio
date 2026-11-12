--
-- PostgreSQL database dump
--

\restrict udZP14mh6yq4JOHEZvlfq4tChLkL2esU5Yp7XBjMwDWKq2kkUqRylbVhUax5HhQ

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-12 02:08:37

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
-- TOC entry 222 (class 1259 OID 16410)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    account_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    account_number character varying(20) NOT NULL,
    account_type character varying(20) NOT NULL,
    currency character(3) DEFAULT 'NGN'::bpchar,
    current_balance numeric(15,2) DEFAULT 0.00,
    account_status character varying(20) DEFAULT 'Active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT accounts_account_status_check CHECK (((account_status)::text = ANY ((ARRAY['Active'::character varying, 'Inactive'::character varying, 'Frozen'::character varying, 'Closed'::character varying])::text[]))),
    CONSTRAINT accounts_account_type_check CHECK (((account_type)::text = ANY ((ARRAY['Savings'::character varying, 'Current'::character varying])::text[]))),
    CONSTRAINT accounts_current_balance_check CHECK ((current_balance >= (0)::numeric))
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16409)
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.accounts ALTER COLUMN account_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16515)
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    audit_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    action character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16514)
-- Name: audit_logs_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.audit_logs ALTER COLUMN audit_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.audit_logs_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16477)
-- Name: beneficiaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficiaries (
    beneficiary_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    beneficiary_name character varying(150) NOT NULL,
    beneficiary_account_number character varying(20) NOT NULL,
    bank_name character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.beneficiaries OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16476)
-- Name: beneficiaries_beneficiary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.beneficiaries ALTER COLUMN beneficiary_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.beneficiaries_beneficiary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16496)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    card_id bigint NOT NULL,
    account_id bigint NOT NULL,
    masked_card_number character varying(25) NOT NULL,
    card_type character varying(20) NOT NULL,
    expiry_date date NOT NULL,
    card_status character varying(20) DEFAULT 'Active'::character varying,
    CONSTRAINT cards_card_status_check CHECK (((card_status)::text = ANY ((ARRAY['Active'::character varying, 'Blocked'::character varying, 'Expired'::character varying])::text[]))),
    CONSTRAINT cards_card_type_check CHECK (((card_type)::text = ANY ((ARRAY['Debit'::character varying, 'Credit'::character varying])::text[])))
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16495)
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cards ALTER COLUMN card_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cards_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    phone character varying(20) NOT NULL,
    date_of_birth date,
    address text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    customer_status character varying(20) DEFAULT 'Active'::character varying,
    CONSTRAINT customers_customer_status_check CHECK (((customer_status)::text = ANY ((ARRAY['Active'::character varying, 'Inactive'::character varying, 'Suspended'::character varying])::text[])))
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16453)
-- Name: transaction_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_entries (
    entry_id bigint NOT NULL,
    transaction_id bigint NOT NULL,
    account_id bigint NOT NULL,
    entry_type character varying(10) NOT NULL,
    amount numeric(15,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT transaction_entries_amount_check CHECK ((amount > (0)::numeric)),
    CONSTRAINT transaction_entries_entry_type_check CHECK (((entry_type)::text = ANY ((ARRAY['Debit'::character varying, 'Credit'::character varying])::text[])))
);


ALTER TABLE public.transaction_entries OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16452)
-- Name: transaction_entries_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transaction_entries ALTER COLUMN entry_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transaction_entries_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16434)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    transaction_id bigint NOT NULL,
    transaction_reference character varying(50) NOT NULL,
    transaction_type character varying(20) NOT NULL,
    amount numeric(15,2) NOT NULL,
    description text,
    transaction_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    transaction_status character varying(20) DEFAULT 'Pending'::character varying,
    CONSTRAINT transactions_amount_check CHECK ((amount > (0)::numeric)),
    CONSTRAINT transactions_transaction_status_check CHECK (((transaction_status)::text = ANY ((ARRAY['Pending'::character varying, 'Successful'::character varying, 'Failed'::character varying, 'Reversed'::character varying])::text[]))),
    CONSTRAINT transactions_transaction_type_check CHECK (((transaction_type)::text = ANY ((ARRAY['Deposit'::character varying, 'Withdrawal'::character varying, 'Transfer'::character varying])::text[])))
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16433)
-- Name: transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transactions ALTER COLUMN transaction_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transactions_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4916 (class 2606 OID 16427)
-- Name: accounts accounts_account_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_account_number_key UNIQUE (account_number);


--
-- TOC entry 4918 (class 2606 OID 16425)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);


--
-- TOC entry 4932 (class 2606 OID 16525)
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 4926 (class 2606 OID 16487)
-- Name: beneficiaries beneficiaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiaries
    ADD CONSTRAINT beneficiaries_pkey PRIMARY KEY (beneficiary_id);


--
-- TOC entry 4930 (class 2606 OID 16508)
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_id);


--
-- TOC entry 4910 (class 2606 OID 16406)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 4912 (class 2606 OID 16408)
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- TOC entry 4914 (class 2606 OID 16404)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4924 (class 2606 OID 16465)
-- Name: transaction_entries transaction_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_entries
    ADD CONSTRAINT transaction_entries_pkey PRIMARY KEY (entry_id);


--
-- TOC entry 4920 (class 2606 OID 16449)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 4922 (class 2606 OID 16451)
-- Name: transactions transactions_transaction_reference_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_transaction_reference_key UNIQUE (transaction_reference);


--
-- TOC entry 4928 (class 2606 OID 16489)
-- Name: beneficiaries unique_customer_beneficiary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiaries
    ADD CONSTRAINT unique_customer_beneficiary UNIQUE (customer_id, beneficiary_account_number, bank_name);


--
-- TOC entry 4933 (class 2606 OID 16428)
-- Name: accounts fk_account_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_account_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4938 (class 2606 OID 16526)
-- Name: audit_logs fk_audit_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT fk_audit_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4936 (class 2606 OID 16490)
-- Name: beneficiaries fk_beneficiary_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiaries
    ADD CONSTRAINT fk_beneficiary_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4937 (class 2606 OID 16509)
-- Name: cards fk_card_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT fk_card_account FOREIGN KEY (account_id) REFERENCES public.accounts(account_id);


--
-- TOC entry 4934 (class 2606 OID 16471)
-- Name: transaction_entries fk_entry_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_entries
    ADD CONSTRAINT fk_entry_account FOREIGN KEY (account_id) REFERENCES public.accounts(account_id);


--
-- TOC entry 4935 (class 2606 OID 16466)
-- Name: transaction_entries fk_entry_transaction; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_entries
    ADD CONSTRAINT fk_entry_transaction FOREIGN KEY (transaction_id) REFERENCES public.transactions(transaction_id);


-- Completed on 2026-11-12 02:08:37

--
-- PostgreSQL database dump complete
--

\unrestrict udZP14mh6yq4JOHEZvlfq4tChLkL2esU5Yp7XBjMwDWKq2kkUqRylbVhUax5HhQ

