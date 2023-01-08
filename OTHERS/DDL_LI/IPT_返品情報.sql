drop table public."IPT_返品情報";

create table public."IPT_返品情報" (
  "返品日" character varying(50)
  , "注文番号" character varying(50)
  , "出品者SKU" character varying(50)
  , "ASIN" character varying(50)
  , "FNSKU" character varying(50)
  , "商品名" character varying(200)
  , "数量" character varying(50)
  , "FC" character varying(50)
  , "商品の状態" character varying(50)
  , "理由" character varying(50)
  , "lpn" character varying(50)
  , "お客様のコメント" character varying(200)
  , "店舗ID" character varying(20)
  , "登録日時" character varying(20)
  , "更新日時" character varying(20)
);