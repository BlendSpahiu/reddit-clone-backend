alter table "public"."communities_users" add column "user_role" text
 not null default 'user';
