-- -------------------------------------------------------------
-- TablePlus 5.9.2(542)
--
-- https://tableplus.com/
--
-- Database: railz_development
-- Generation Time: 2024-04-01 17:54:29.4160
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."spina_navigations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS spina_navigations_id_seq;

-- Table Definition
CREATE TABLE "public"."spina_navigations" (
    "id" int4 NOT NULL DEFAULT nextval('spina_navigations_id_seq'::regclass),
    "name" varchar NOT NULL,
    "label" varchar NOT NULL,
    "auto_add_pages" bool NOT NULL DEFAULT false,
    "position" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp,
    "updated_at" timestamp,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."spina_navigations" ("id", "name", "label", "auto_add_pages", "position", "created_at", "updated_at") VALUES
(2, 'main', 'Main navigation', 'f', 0, '2024-04-01 16:24:45.397314', '2024-04-01 16:24:45.397314');
