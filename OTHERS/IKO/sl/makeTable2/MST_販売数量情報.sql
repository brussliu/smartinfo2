drop table public."MST_販売数量情報";

create table public."MST_販売数量情報" (
    "SKU番号" character varying(12)
  , "ASIN番号" character varying(20)
  , "販売数量（直近３日間）" int
  , "販売数量（直近７日間）" int
  , "販売数量（直近３０日間）" int
  , "販売数量（直近６０日間）" int
  , "販売数量（直近９０日間）" int
  , "販売数量（直近１８０日間）" int
  , "販売数量（直近３６０日間）" int
  , "販売数量（日平均値）" numeric(10,5)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);