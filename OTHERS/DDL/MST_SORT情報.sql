drop table public."MST_ソート情報";

create table public."MST_ソート情報" (
    "商品種別" character varying(50)
  , "分類" character varying(50)
  , "内容" character varying(50)
  , "ソート" int
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone

  , PRIMARY KEY ("商品種別", "分類", "内容", "店舗ID")
);