alter table "public"."posts" add column "isOriginalContent" boolean
 not null default 'false';
