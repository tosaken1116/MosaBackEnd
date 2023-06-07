

CREATE TABLE "users" (
  "id" varchar PRIMARY KEY,
  "image_url" varchar,
  "name" varchar,
  "email" varchar NOT NULL
);

CREATE TABLE "rooms" (
  "id" varchar PRIMARY KEY,
  "owner_id" varchar,
  "title" varchar NOT NULL,
  "desc" varchar NOT NULL,
  "is_public" bool DEFAULT true,
  "group_id" varchar,
  "start_time" timestamp,
  "end_time" timestamp,
  "count" int DEFAULT 0
);

CREATE TABLE "groups" (
  "id" varchar PRIMARY KEY,
  "owner_id" varchar,
  "name" varchar NOT NULL,
  "disc" varchar NOT NULL,
  "created_at" timestamp,
  "is_public" bool DEFAULT true
);

CREATE TABLE "invite_groups" (
  "user_id" varchar,
  "group_id" varchar
);

CREATE TABLE "users_groups" (
  "user_id" varchar,
  "group_id" varchar
);

CREATE TABLE "following" (
  "user_id" varchar,
  "target_id" varchar
);

CREATE TABLE "posts" (
  "id" varchar PRIMARY KEY,
  "user_id" varchar,
  "content" varchar NOT NULL,
  "created_at" varchar,
  "updata_at" varchar
);

CREATE TABLE "reply" (
  "id" varchar PRIMARY KEY,
  "posts_id" varchar,
  "user_id" varchar,
  "content" varchar NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "likes" (
  "posts_id" varchar,
  "user_id" varchar
);

ALTER TABLE "rooms" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "rooms" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "groups" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "invite_groups" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "invite_groups" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "users_groups" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_groups" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "following" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "following" ADD FOREIGN KEY ("target_id") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reply" ADD FOREIGN KEY ("posts_id") REFERENCES "posts" ("id");

ALTER TABLE "reply" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("posts_id") REFERENCES "posts" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
