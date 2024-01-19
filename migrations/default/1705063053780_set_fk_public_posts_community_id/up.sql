alter table "public"."posts"
  add constraint "posts_community_id_fkey"
  foreign key ("community_id")
  references "public"."communities"
  ("id") on update cascade on delete cascade;
