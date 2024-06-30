drop table public."STY_単語情報";

create table public."STY_単語情報" (
    "書籍" character varying(50) not null
  , "分類" character varying(20) not null
  , "単語SEQ" integer not null

  , "単語_英語" character varying(200)
  , "単語_日本語" character varying(200)
  , "単語_中国語" character varying(200)

  , "例句1_英語" character varying(200)
  , "例句1_日本語" character varying(200)
  , "例句1_中国語" character varying(200)
  
  , "例句2_英語" character varying(200)
  , "例句2_日本語" character varying(200)
  , "例句2_中国語" character varying(200)

  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
  , primary key ("書籍", "分類", "単語SEQ")
);