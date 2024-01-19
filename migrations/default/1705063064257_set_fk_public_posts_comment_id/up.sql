alter table "public"."posts"
  add constraint "posts_comment_id_fkey"
  foreign key ("comment_id")
  references "public"."comments"
  ("id") on update cascade on delete cascade;
