drop table public."TRN_仕入明細";

create table public."TRN_仕入明細" (
  "仕入NO" character varying(20)
  , "SKU番号" character varying(50)
  , "ASIN番号" character varying(50)
  , "商品管理番号" character varying(20)
  , "親子区分" character varying(20)
  , "商品種別" character varying(50)
  , "分類１" character varying(100)
  , "分類２" character varying(100)
  , "単価" numeric(10,2)
  , "数量" integer
  , "金額" numeric(10,2)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);