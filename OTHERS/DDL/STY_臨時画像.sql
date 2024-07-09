drop table public."STY_臨時画像";

create table public."STY_臨時画像" (
    "連番" serial primary key
  , "区分" character varying(1)
  , "元ファイル" text
  , "縮略ファイル" text
  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);