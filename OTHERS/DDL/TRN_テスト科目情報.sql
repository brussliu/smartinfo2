drop table public."TRN_テスト科目情報";

create table public."TRN_テスト科目情報" (
    "テストSEQ" character varying(20) primary key
  , "テスト科目" character varying(20) primary key

  , "内容SEQ" character varying(20)
  , "内容クリアSEQ" character varying(20)

  , "満点" integer
  , "得点" integer

  , "学級-順位" integer
  , "学級-人数" integer
  , "学級-平均点" numeric(6,2)
  , "学年-順位" integer
  , "学年-人数" integer
  , "学年-平均点" numeric(6,2)

  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
