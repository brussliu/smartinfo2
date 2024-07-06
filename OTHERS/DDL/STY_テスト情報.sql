drop table public."STY_テスト情報";

create table public."STY_テスト情報" (
    "テストSEQ" character varying(20) primary key

  , "テスト学年" character varying(20)
  , "テスト名称" character varying(100)

  , "期間FROM" timestamp(6) without time zone
  , "期間TO" timestamp(6) without time zone

  , "内容SEQ" character varying(20)

  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
