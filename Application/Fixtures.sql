

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at, updated_at) VALUES ('82a30003-cdf9-49d4-add2-1b6e5a15bc32', 'sdfa', 'sdf', '2023-01-03 00:50:01.673837+00', '2023-01-03 00:50:01.673837+00');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1672701435);
INSERT INTO public.schema_migrations (revision) VALUES (1672766389);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


