drop table public."STY_単語テスト詳細情報";

create table public."STY_単語テスト詳細情報" (
    "テスト番号" character varying(20) 
  , "枝番号" integer

  , "書籍" character varying(50)
  , "分類" character varying(20)
  , "単語SEQ" integer

  , "ステータス" character varying(1)

  , "誤り回数_単語" integer
  , "誤り回数_例句1" integer
  , "誤り回数_例句2" integer

  , "手書き内容_単語" text
  , "手書き内容_例句1" text
  , "手書き内容_例句2" text

  , "判定結果_単語" character varying(10)
  , "判定結果_例句1" character varying(10)
  , "判定結果_例句2" character varying(10)

  , "時間" integer

  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
  
  , primary key("テスト番号","枝番号")
);
