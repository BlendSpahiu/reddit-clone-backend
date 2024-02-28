alter table "public"."communities" alter column "post_id" drop not null;
alter table "public"."communities" add column "post_id" uuid;
