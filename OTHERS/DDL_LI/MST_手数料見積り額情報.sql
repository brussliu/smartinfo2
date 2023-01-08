drop table public."MST_手数料見積り額情報";

create table public."MST_手数料見積り額情報" (
  "sku"character varying(12)
  , "fnsku" character varying(20)
  , "asin" character varying(20)
  , "商品名" character varying(500)
  , "商品グループ" character varying(50)
  , "ブランド" character varying(50)
  , "フルフィルメント" character varying(50)
  , "一番長い辺" numeric(7, 2)
  , "中間の辺" numeric(7, 2)
  , "一番短い辺" numeric(7, 2)
  , "長さと周囲の寸法" numeric(7, 2)
  , "商品の寸法" character varying(50)
  , "商品パッケージの重量" numeric(7, 2)
  , "商品重量" character varying(50)
  , "通貨" character varying(50)
  , "手数料見積り額" money
  , "販売手数料見積り額(個数あたり)" money
  , "カテゴリー別成約料見積り額" money
  , "出荷作業手数料見積り額（個数あたり）" character varying(50)
  , "発送重量手数料の見積り額（個数あたり）" character varying(50)
  , "配送代行手数料見積り額（個数あたり）" money
  , "今後の手数料見積り額（現在のAmazon出品サービ" character varying(50)
  , "今後の出荷作業手数料の見積り額（個数あたり" character varying(50)
  , "今後の発送重量手数料見積り額（個数あたり）" character varying(50)
  , "今後の配送代行手数料（個数あたり）" character varying(50)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);