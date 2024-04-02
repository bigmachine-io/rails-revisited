-- -------------------------------------------------------------
-- TablePlus 5.9.2(542)
--
-- https://tableplus.com/
--
-- Database: railz_development
-- Generation Time: 2024-04-01 17:54:02.4040
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."spina_accounts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS spina_accounts_id_seq;

-- Table Definition
CREATE TABLE "public"."spina_accounts" (
    "id" int4 NOT NULL DEFAULT nextval('spina_accounts_id_seq'::regclass),
    "name" varchar,
    "address" varchar,
    "postal_code" varchar,
    "city" varchar,
    "phone" varchar,
    "email" varchar,
    "preferences" text,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "robots_allowed" bool DEFAULT false,
    "json_attributes" jsonb,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."spina_accounts" ("id", "name", "address", "postal_code", "city", "phone", "email", "preferences", "created_at", "updated_at", "robots_allowed", "json_attributes") VALUES
(2, 'Railz', NULL, NULL, NULL, NULL, NULL, '---
theme: default
', '2024-04-01 16:24:43.537309', '2024-04-01 16:24:45.376544', 'f', '{"en_content": []}');
