alter table "public"."upvoted_posts"
  add constraint "upvoted_posts_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("id") on update cascade on delete cascade;
