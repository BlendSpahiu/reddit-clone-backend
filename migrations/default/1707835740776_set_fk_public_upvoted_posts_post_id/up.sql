alter table "public"."upvoted_posts"
  add constraint "upvoted_posts_post_id_fkey"
  foreign key ("post_id")
  references "public"."posts"
  ("id") on update cascade on delete cascade;
