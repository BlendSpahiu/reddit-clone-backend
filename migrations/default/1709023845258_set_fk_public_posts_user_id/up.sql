alter table "public"."posts" drop constraint "posts_user_id_fkey",
  add constraint "posts_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("id") on update no action on delete no action;
