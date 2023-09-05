drop table public."IPT_長期在庫保管手数料請求額情報";

create table public."IPT_長期在庫保管手数料請求額情報" (
    "日付" character varying(50)
  , "出品者SKU" character varying(50)
  , "FNSKU" character varying(50)
  , "ASIN" character varying(50)
  , "商品名" character varying(500)
  , "コンディション" character varying(50)
  , "商品サイズ" character varying(50)
  , "通貨" character varying(50)
  , "volume-unit" character varying(50)
  , "国" character varying(50)
  , "請求対象の在庫数" character varying(50)
  , "請求金額" character varying(50)
  , "追加手数料の対象期間" character varying(50)
  , "追加手数料率" character varying(50)
  , "店舗ID" character varying(20)
  , "登録日時" character varying(20)
  , "更新日時" character varying(20)
);