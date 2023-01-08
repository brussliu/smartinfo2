drop table public."TRN_データ導入履歴";

create table public."TRN_データ導入履歴" (
  "店舗ID" character varying(20)
  , "データ種別" character varying(20)
  , "導入日時" timestamp(6) without time zone
  , "導入件数" integer
);