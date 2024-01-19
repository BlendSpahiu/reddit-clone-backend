alter table "public"."posts"
  add constraint "posts_comment_id_fkey"
  foreign key (comment_id)
  references "public"."comments"
  (id) on update cascade on delete cascade;
alter table "public"."posts" alter column "comment_id" drop not null;
alter table "public"."posts" add column "comment_id" uuid;
