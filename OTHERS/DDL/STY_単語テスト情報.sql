drop table public."STY_単語テスト情報";

create table public."STY_単語テスト情報" (
    "テスト番号" character varying(20) primary key

  , "書籍" character varying(50)
  , "分類" character varying(200)

  , "テスト方式1" character varying(20)
  , "テスト方式2" character varying(20)
  , "テスト方式3" character varying(20)

  , "数量" integer

  , "開始時間" timestamp(6) without time zone
  , "終了時間" timestamp(6) without time zone

  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
