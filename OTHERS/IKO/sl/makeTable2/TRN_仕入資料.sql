drop table public."TRN_仕入資料";

create table public."TRN_仕入資料" (
  "仕入NO" character varying(20)
  , "枝番" int
  , "ファイル名称" character varying(100)
  , "資料名称" character varying(100)
  , "拡張子" character varying(5)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);