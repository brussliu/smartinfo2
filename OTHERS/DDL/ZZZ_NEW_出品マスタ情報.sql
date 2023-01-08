drop table public."ZZZ_NEW_出品マスタ情報";

create table public."ZZZ_NEW_出品マスタ情報" (
  req_no character varying(6)
  , "店舗名" character varying(20)
  , "商品管理番号" character varying(50)
  , "商品分類" character varying(50)
  , "商品種別" character varying(50)
  , "色" character varying(50)
  , "サイズ" character varying(50)
  , "SKU番号" character varying(20)
  , "ASIN番号" character varying(20)
  , "仕入価格" character varying(20)
);
