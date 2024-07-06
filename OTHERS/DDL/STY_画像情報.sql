drop table public."STY_画像情報";

create table public."STY_画像情報" (

    "SEQ" character varying(20) primary key
  , "分類" character varying(1)
  , "SUB-SEQ" integer

  , "元ファイル" text
  , "縮略ファイル" text

  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
