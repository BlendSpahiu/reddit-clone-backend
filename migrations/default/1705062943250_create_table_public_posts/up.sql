CREATE TABLE "public"."posts" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "title" text NOT NULL, "content" text NOT NULL, "image" text NOT NULL, "upvotes" integer NOT NULL DEFAULT 0, "downvotes" integer NOT NULL DEFAULT 0, "link" text NOT NULL, "comment_id" uuid NOT NULL, "user_id" uuid NOT NULL, "community_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_posts_updated_at"
BEFORE UPDATE ON "public"."posts"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_posts_updated_at" ON "public"."posts" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
