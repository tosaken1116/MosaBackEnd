

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

INSERT INTO "users" ("id", "image_url", "name", "email")
VALUES ('1', 'https://example.com/user1.jpg', 'User 1', 'user1@example.com');

INSERT INTO "users" ("id", "image_url", "name", "email")
VALUES ('2', 'https://example.com/user2.jpg', 'User 2', 'user2@example.com');

INSERT INTO "rooms" ("id", "owner_id", "title", "desc", "is_public", "group_id", "start_time", "end_time", "count")
VALUES ('1', '1', 'Room 1', 'Description for Room 1', true, NULL, '2023-06-08 09:00:00', '2023-06-08 10:00:00', 0);

INSERT INTO "rooms" ("id", "owner_id", "title", "desc", "is_public", "group_id", "start_time", "end_time", "count")
VALUES ('2', '2', 'Room 2', 'Description for Room 2', true, NULL, '2023-06-08 14:00:00', '2023-06-08 15:00:00', 0);

INSERT INTO "groups" ("id", "owner_id", "name", "disc", "created_at", "is_public")
VALUES ('1', '1', 'Group 1', 'Description for Group 1', '2023-06-08 10:00:00', true);

INSERT INTO "invite_groups" ("user_id", "group_id")
VALUES ('1', '1');

INSERT INTO "users_groups" ("user_id", "group_id")
VALUES ('1', '1');

INSERT INTO "following" ("user_id", "target_id")
VALUES ('1', '2');

INSERT INTO "posts" ("id", "user_id", "content", "created_at", "updata_at")
VALUES ('1', '1', 'Post 1', '2023-06-08 12:00:00', '2023-06-08 12:30:00');

INSERT INTO "reply" ("id", "posts_id", "user_id", "content", "created_at")
VALUES ('1', '1', '2', 'Reply to Post 1', '2023-06-08 12:15:00');

INSERT INTO "likes" ("posts_id", "user_id")
VALUES ('1', '2');
