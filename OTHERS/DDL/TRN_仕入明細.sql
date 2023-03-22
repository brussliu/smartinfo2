drop table public."TRN_仕入明細";

create table public."TRN_仕入明細" (
  "仕入NO" character varying(20)
  , "SKU番号" character varying(50)
  , "ASIN番号" character varying(50)
  , "単価" numeric(10,2)
  , "数量" integer
  , "金額" numeric(10,2)
  , "暫定フラグ" int
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone

  , PRIMARY KEY ("仕入NO", "SKU番号", "ASIN番号", "暫定フラグ", "店舗ID")
);