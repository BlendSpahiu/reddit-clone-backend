CREATE TABLE "public"."draft_posts" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "title" text NOT NULL, "content" text, "image" text, "upvotes" integer NOT NULL DEFAULT 0, "downvotes" integer NOT NULL DEFAULT 0, "link" text, "user_id" uuid NOT NULL, "community_id" uuid NOT NULL, "isNSFW" boolean NOT NULL DEFAULT false, "isSpoiler" boolean NOT NULL DEFAULT false, "isOriginalContent" boolean NOT NULL DEFAULT false, "flair" text, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("community_id") REFERENCES "public"."communities"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON UPDATE no action ON DELETE no action);
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
CREATE TRIGGER "set_public_draft_posts_updated_at"
BEFORE UPDATE ON "public"."draft_posts"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_draft_posts_updated_at" ON "public"."draft_posts" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
