--
-- PostgreSQL database dump
--

\restrict CZIFWDV1cKlJzX0CF5WcJkngKdIVv4925JasUWa64tx2Djt8C1y3xYJNOfWIyqn

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-12 01:50:33

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

--
-- TOC entry 5089 (class 0 OID 16410)
-- Dependencies: 222
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accounts OVERRIDING SYSTEM VALUE VALUES (2, 1, '1000000002', 'Current', 'NGN', 500000.00, 'Active', '2026-11-05 15:34:53.093514');
INSERT INTO public.accounts OVERRIDING SYSTEM VALUE VALUES (4, 3, '1000000004', 'Savings', 'NGN', 300000.00, 'Active', '2026-11-05 15:34:53.093514');
INSERT INTO public.accounts OVERRIDING SYSTEM VALUE VALUES (1, 1, '1000000001', 'Savings', 'NGN', 300000.00, 'Active', '2026-11-05 15:34:53.093514');
INSERT INTO public.accounts OVERRIDING SYSTEM VALUE VALUES (3, 2, '1000000003', 'Savings', 'NGN', 200000.00, 'Active', '2026-11-05 15:34:53.093514');


--
-- TOC entry 5099 (class 0 OID 16515)
-- Dependencies: 232
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.audit_logs OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Profile Update', 'Customer updated personal information', '2026-11-05 15:40:29.020193');
INSERT INTO public.audit_logs OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Login', 'Customer logged into NovaBank', '2026-11-05 15:40:29.020193');
INSERT INTO public.audit_logs OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Account Review', 'Customer viewed account details', '2026-11-05 15:40:29.020193');


--
-- TOC entry 5095 (class 0 OID 16477)
-- Dependencies: 228
-- Data for Name: beneficiaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.beneficiaries OVERRIDING SYSTEM VALUE VALUES (1, 1, 'John Doe', '2000000001', 'Access Bank', '2026-11-05 15:36:42.081779');
INSERT INTO public.beneficiaries OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Grace Smith', '2000000002', 'GTBank', '2026-11-05 15:36:42.081779');
INSERT INTO public.beneficiaries OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Peter James', '2000000003', 'Zenith Bank', '2026-11-05 15:36:42.081779');


--
-- TOC entry 5097 (class 0 OID 16496)
-- Dependencies: 230
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (1, 1, '**** **** **** 1234', 'Debit', '2028-12-31', 'Active');
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (2, 3, '**** **** **** 5678', 'Debit', '2029-06-30', 'Active');
INSERT INTO public.cards OVERRIDING SYSTEM VALUE VALUES (3, 4, '**** **** **** 9012', 'Debit', '2028-09-30', 'Active');


--
-- TOC entry 5087 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers OVERRIDING SYSTEM VALUE VALUES (1, 'Ada', 'Okafor', 'ada@example.com', '08011111111', '1995-04-12', 'Lagos, Nigeria', '2026-11-05 15:32:49.789471', 'Active');
INSERT INTO public.customers OVERRIDING SYSTEM VALUE VALUES (2, 'David', 'James', 'david@example.com', '08022222222', '1992-08-20', 'Abuja, Nigeria', '2026-11-05 15:32:49.789471', 'Active');
INSERT INTO public.customers OVERRIDING SYSTEM VALUE VALUES (3, 'Mary', 'Bello', 'mary@example.com', '08033333333', '1998-01-15', 'Ibadan, Nigeria', '2026-11-05 15:32:49.789471', 'Active');


--
-- TOC entry 5093 (class 0 OID 16453)
-- Dependencies: 226
-- Data for Name: transaction_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction_entries OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 'Credit', 100000.00, '2026-11-05 15:44:22.393711');
INSERT INTO public.transaction_entries OVERRIDING SYSTEM VALUE VALUES (2, 2, 1, 'Debit', 50000.00, '2026-11-05 15:53:31.464974');
INSERT INTO public.transaction_entries OVERRIDING SYSTEM VALUE VALUES (3, 2, 3, 'Credit', 50000.00, '2026-11-05 15:53:31.464974');


--
-- TOC entry 5091 (class 0 OID 16434)
-- Dependencies: 224
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transactions OVERRIDING SYSTEM VALUE VALUES (1, 'NVB-TRX-001', 'Deposit', 100000.00, 'Cash deposit into Ada Okafor savings account', '2026-11-05 15:42:46.219278', 'Successful');
INSERT INTO public.transactions OVERRIDING SYSTEM VALUE VALUES (2, 'NVB-TRX-002', 'Transfer', 50000.00, 'Transfer from Ada Okafor to David James', '2026-11-05 15:50:46.229238', 'Successful');


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 221
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 4, true);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 231
-- Name: audit_logs_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_logs_audit_id_seq', 3, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 227
-- Name: beneficiaries_beneficiary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beneficiaries_beneficiary_id_seq', 3, true);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 229
-- Name: cards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_card_id_seq', 3, true);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 3, true);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 225
-- Name: transaction_entries_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_entries_entry_id_seq', 3, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 223
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 3, true);


-- Completed on 2026-11-12 01:50:33

--
-- PostgreSQL database dump complete
--

\unrestrict CZIFWDV1cKlJzX0CF5WcJkngKdIVv4925JasUWa64tx2Djt8C1y3xYJNOfWIyqn

