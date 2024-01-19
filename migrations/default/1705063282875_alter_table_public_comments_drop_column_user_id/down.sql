alter table "public"."comments" alter column "user_id" drop not null;
alter table "public"."comments" add column "user_id" uuid;
