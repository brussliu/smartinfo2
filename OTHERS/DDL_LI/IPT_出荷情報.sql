drop table public."IPT_出荷情報";

create table public."IPT_出荷情報" (
  "出荷日" character varying(50)
  , "出品者SKU" character varying(50)
  , "FNSKU" character varying(50)
  , "ASIN" character varying(50)
  , "FC" character varying(50)
  , "数量" character varying(50)
  , "Amazon注文番号" character varying(50)
  , "通貨" character varying(50)
  , "商品金額（商品1点ごと）" character varying(50)
  , "配送料" character varying(50)
  , "ギフト包装手数料" character varying(50)
  , "配送先（市区町村）" character varying(200)
  , "都道府県名" character varying(200)
  , "配送先（郵便番号）" character varying(50)
  , "付与されたAmazon ポイント" character varying(50)
  , "店舗ID" character varying(20)
  , "登録日時" character varying(20)
  , "更新日時" character varying(20)
);