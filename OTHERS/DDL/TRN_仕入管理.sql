drop table public."TRN_仕入管理";

create table public."TRN_仕入管理" (
  "仕入NO" character varying(20)
  , "仕入名称" character varying(100)
  , "仕入区分" character varying(20)
  , "仕入内容" character varying(200)
  , "数量" integer
  , "金額" numeric(10,2)
  , "ステータス" character varying(20)
  , "登録日" timestamp(6) without time zone
  , "発送日①" timestamp(6) without time zone
  , "発送日②" timestamp(6) without time zone
  , "完了日" timestamp(6) without time zone
  , "発送方式" character varying(40)
  , "為替レート" numeric(10,2)
  , "商品費用" numeric(10,2)
  , "商品費用（円）" integer
  , "物流費用" numeric(10,2)
  , "物流費用（円）" integer
  , "税金" numeric(10,2)
  , "税金（円）" integer
  , "合計" numeric(10,2)
  , "合計（円）" integer
  , "追跡番号" character varying(20)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);