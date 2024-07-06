drop table public."STY_不正解情報";

create table public."STY_不正解情報" (
    "問題SEQ" character varying(20) primary key
  , "問題区分" character varying(1)

  , "テストSEQ" character varying(20)
  , "テスト科目" character varying(20)
  , "テスト番号" character varying(20)

  , "問題出所" character varying(20)
  , "問題科目" character varying(20)

  , "内容SEQ" character varying(20)

  , "誤った答えSEQ" character varying(20)
  , "誤った答えTEXT" character varying(20)

  , "誤った原因" character varying(999)
  , "深い原因" character varying(999)

  , "正しい答えSEQ" character varying(20)
  , "正しい答えTEXT" character varying(20)

  , "再計算内容SEQ" character varying(20)

  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
