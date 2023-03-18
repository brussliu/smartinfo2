drop table public."RES_コスト情報";

create table public."RES_コスト情報" (
    "登録日" timestamp(6) without time zone
  , "発生日" timestamp(6) without time zone
  , "ステータス" character varying(20)
  , "分類" character varying(50)
  , "タイトル" character varying(200)
  , "金額（元）" numeric(10,2)
  , "金額（円）" numeric(10,2)
  , "為替レート" numeric(6,2)
  , "備考" character varying(200)
  , "店舗ID" character varying(50)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);