alter table "public"."users"
  add constraint "users_commumity_id_fkey"
  foreign key ("commumity_id")
  references "public"."communities"
  ("id") on update cascade on delete cascade;
