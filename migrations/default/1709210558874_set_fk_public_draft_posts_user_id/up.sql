alter table "public"."draft_posts" drop constraint "draft_posts_user_id_fkey",
  add constraint "draft_posts_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("id") on update cascade on delete cascade;
