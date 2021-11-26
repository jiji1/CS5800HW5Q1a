-- Table: customer

-- DROP TABLE public.customer;

CREATE TABLE public.customer
(
  id serial NOT NULL,
  name character varying(50) NOT NULL,
  address character varying(128) NOT NULL,
  CONSTRAINT customer_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.customer
  OWNER TO postgres;

-- Table: public.professor

-- DROP TABLE public.professor;

CREATE TABLE public.professor
(
  id serial NOT NULL,
  office_number character varying(50) NOT NULL,
  research_area character varying(50) NOT NULL,
  customer_id integer,
  CONSTRAINT professor_pkey PRIMARY KEY (id),
  CONSTRAINT professor_customer_id_fkey FOREIGN KEY (customer_id)
      REFERENCES public.customer (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.professor
  OWNER TO postgres;

-- Index: public.professor_customer_id_idx

-- DROP INDEX public.professor_customer_id_idx;

CREATE UNIQUE INDEX professor_customer_id_idx
  ON public.professor
  USING btree
  (customer_id);