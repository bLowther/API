DROP SCHEMA IF EXISTS "study" CASCADE;

CREATE SCHEMA "study";

CREATE TABLE "study"."topics" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar,
  "url" varchar
);

CREATE TABLE "study"."rooms" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar,
  "topic_id" int,
  "created_at" timestamp default now(),
  "thumbnail" varchar,
  "max_users" int,
  "is_private" boolean,
  "is_archived" boolean default false,
  "admin_id" int
);

CREATE TABLE "study"."messages" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "room_id" int,
  "user_id" int,
  "body" varchar,
  "created_at" timestamp default now()
);

CREATE TABLE "study"."users/rooms" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "user_id" int,
  "room_id" int,
  "created_at" timestamp default now()
);

CREATE TABLE "study"."users" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "username" varchar,
  "avatar" varchar,
  "created_at" timestamp default now()
);

CREATE TABLE "study"."files" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "url" varchar,
  "name" varchar,
  "room_id" int,
  "user_id" int,
  "created_at" timestamp default now()
);

CREATE TABLE "study"."events" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar,
  "description" varchar,
  "user_id" int,
  "room_id" int,
  "created_at" timestamp default now(),
  "event_date" timestamp
);

CREATE TABLE "study"."goals" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar,
  "description" varchar,
  "created_at" timestamp default now(),
  "goal_date" timestamp default null,
  "creator_id" int,
  "room_id" int
);

CREATE TABLE "study"."users/goals" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "user_id" int,
  "goal_id" int,
  "created_at" timestamp default now()
);

ALTER TABLE "study"."rooms" ADD FOREIGN KEY ("topic_id") REFERENCES "study"."topics" ("id");

ALTER TABLE "study"."messages" ADD FOREIGN KEY ("room_id") REFERENCES "study"."rooms" ("id");

ALTER TABLE "study"."messages" ADD FOREIGN KEY ("user_id") REFERENCES "study"."users" ("id");

ALTER TABLE "study"."rooms" ADD FOREIGN KEY ("admin_id") REFERENCES "study"."users" ("id");

ALTER TABLE "study"."events" ADD FOREIGN KEY ("user_id") REFERENCES "study"."users" ("id");

ALTER TABLE "study"."events" ADD FOREIGN KEY ("room_id") REFERENCES "study"."rooms" ("id");

ALTER TABLE "study"."goals" ADD FOREIGN KEY ("creator_id") REFERENCES "study"."users" ("id");

ALTER TABLE "study"."goals" ADD FOREIGN KEY ("room_id") REFERENCES "study"."rooms" ("id");

ALTER TABLE "study"."users/rooms" ADD FOREIGN KEY ("room_id") REFERENCES "study"."rooms" ("id");

ALTER TABLE "study"."users/rooms" ADD FOREIGN KEY ("user_id") REFERENCES "study"."users" ("id");

ALTER TABLE "study"."users/goals" ADD FOREIGN KEY ("user_id") REFERENCES "study"."users" ("id");

ALTER TABLE "study"."users/goals" ADD FOREIGN KEY ("goal_id") REFERENCES "study"."goals" ("id");

ALTER TABLE "study"."files" ADD FOREIGN KEY ("user_id") REFERENCES "study"."users" ("id");

ALTER TABLE "study"."files" ADD FOREIGN KEY ("room_id") REFERENCES "study"."rooms" ("id");


-- to create schema, run:
-- psql -h localhost -f schema.sql
-- in terminal

-- change filepath for .csv files below:

COPY "study"."topics"("name", "url")
FROM '/Users/taite510/work/API/csv/topics.csv'
DELIMITER ','
CSV HEADER;

COPY "study"."users"("username", "avatar")
FROM '/Users/taite510/work/API/csv/users.csv'
DELIMITER ','
CSV HEADER;

COPY "study"."rooms"("name", "topic_id", "created_at", "thumbnail", "max_users", "is_private", "admin_id", "is_archived")
FROM '/Users/taite510/work/API/csv/rooms.csv'
DELIMITER ','
CSV HEADER;

COPY "study"."users/rooms"("user_id", "room_id")
FROM '/Users/taite510/work/API/csv/users_rooms.csv'
DELIMITER ','
CSV HEADER;

COPY "study"."messages"("room_id", "user_id", "body", "created_at")
FROM '/Users/taite510/work/API/csv/messages.csv'
DELIMITER ','
CSV HEADER;

COPY "study"."events"("name", "description", "user_id", "room_id", "created_at", "event_date")
FROM '/Users/taite510/work/API/csv/events.csv'
DELIMITER ','
CSV HEADER;

COPY "study"."goals"("name", "description", "created_at", "goal_date", "creator_id", "room_id")
FROM '/Users/taite510/work/API/csv/goals.csv'
DELIMITER ','
CSV HEADER;

COPY "study"."users/goals"("user_id", "goal_id")
FROM '/Users/taite510/work/API/csv/users_goals.csv'
DELIMITER ','
CSV HEADER;

COPY "study"."files"("url", "name", "room_id", "user_id")
FROM '/Users/taite510/work/API/csv/files.csv'
DELIMITER ','
CSV HEADER;

