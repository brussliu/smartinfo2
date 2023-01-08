drop table public."MST_在庫情報";

create table public."MST_在庫情報" (
    "SKU番号" character varying(12)
  , "ASIN番号" character varying(20)
  , "FBA在庫" int
  , "FBM在庫" int
  , "LOCAL在庫" int
  , "途中在庫_入庫" int
  , "途中在庫_仕入" int
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);