/*
 Navicat Premium Data Transfer

 Source Server         : postgreSqlLocal
 Source Server Type    : PostgreSQL
 Source Server Version : 130004
 Source Host           : localhost:5432
 Source Catalog        : lanbiraaakcom
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130004
 File Encoding         : 65001

 Date: 31/10/2021 18:02:36
*/


-- ----------------------------
-- Sequence structure for post_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."post_id_seq";
CREATE SEQUENCE "public"."post_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."post_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for doctrine_migration_versions
-- ----------------------------
DROP TABLE IF EXISTS "public"."doctrine_migration_versions";
CREATE TABLE "public"."doctrine_migration_versions" (
  "version" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "executed_at" timestamp(0) DEFAULT NULL::timestamp without time zone,
  "execution_time" int4
)
;
ALTER TABLE "public"."doctrine_migration_versions" OWNER TO "postgres";

-- ----------------------------
-- Records of doctrine_migration_versions
-- ----------------------------
BEGIN;
INSERT INTO "public"."doctrine_migration_versions" VALUES ('DoctrineMigrations\Version20211031150042', '2021-10-31 15:00:45', 38);
COMMIT;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS "public"."post";
CREATE TABLE "public"."post" (
  "id" int4 NOT NULL,
  "photo" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "created_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp(0) DEFAULT NULL::timestamp without time zone,
  "is_deleted" bool NOT NULL DEFAULT false
)
;
ALTER TABLE "public"."post" OWNER TO "postgres";

-- ----------------------------
-- Records of post
-- ----------------------------
BEGIN;
INSERT INTO "public"."post" VALUES (1, '1.png', '2021-07-21 17:46:05', NULL, 'f');
INSERT INTO "public"."post" VALUES (2, '2.png', '2021-07-21 17:46:09', NULL, 'f');
INSERT INTO "public"."post" VALUES (3, '3.png', '2021-07-22 00:50:45', NULL, 'f');
INSERT INTO "public"."post" VALUES (4, '2.png', '2021-07-23 12:17:53', NULL, 'f');
INSERT INTO "public"."post" VALUES (5, '1.png', '2021-07-23 12:20:50', NULL, 'f');
INSERT INTO "public"."post" VALUES (6, '3.png', '2021-07-23 12:20:54', NULL, 'f');
INSERT INTO "public"."post" VALUES (7, '2.png', '2021-07-23 12:20:59', NULL, 'f');
INSERT INTO "public"."post" VALUES (8, '1.png', '2021-07-23 19:13:19', NULL, 'f');
INSERT INTO "public"."post" VALUES (9, '2.png', '2021-07-23 19:13:34', NULL, 'f');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."post_id_seq"', 10, false);

-- ----------------------------
-- Primary Key structure for table doctrine_migration_versions
-- ----------------------------
ALTER TABLE "public"."doctrine_migration_versions" ADD CONSTRAINT "doctrine_migration_versions_pkey" PRIMARY KEY ("version");

-- ----------------------------
-- Primary Key structure for table post
-- ----------------------------
ALTER TABLE "public"."post" ADD CONSTRAINT "post_pkey" PRIMARY KEY ("id");
