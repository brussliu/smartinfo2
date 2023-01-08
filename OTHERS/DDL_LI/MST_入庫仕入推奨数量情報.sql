drop table public."MST_入庫仕入推奨数量情報";

create table public."MST_入庫仕入推奨数量情報" (
    "SKU番号" character varying(12)
  , "ASIN番号" character varying(20)
  , "在庫販売可能日数" int
  , "保有数量販売可能日数" int
  , "推奨納品数量" int
  , "推奨仕入数量" int
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);