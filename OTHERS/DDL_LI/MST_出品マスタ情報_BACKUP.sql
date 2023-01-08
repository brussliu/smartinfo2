drop table public."MST_出品マスタ情報_BACKUP";

create table public."MST_出品マスタ情報_BACKUP" (
    "BACKUP日時" timestamp(6) without time zone
  , "SKU番号" character varying(12)
  , "ASIN番号" character varying(20)
  , "LABEL番号" character varying(20)
  , "商品管理番号" character varying(20)
  , "親子区分" character varying(20)
  , "商品種別" character varying(50)
  , "分類１" character varying(100)
  , "分類２" character varying(100)
  , "仕入価格" money
  , "FBA発送方式" character varying(50)
  , "商品名称" character varying(500)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
