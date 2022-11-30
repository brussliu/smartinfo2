create table public."RES_長期在庫保管手数料請求額情報" (
  "日付" timestamp(6) without time zone
  , "出品者SKU" character varying(50)
  , "FNSKU" character varying(50)
  , "ASIN" character varying(50)
  , "商品名" character varying(500)
  , "コンディション" character varying(50)
  , "qty-charged-long-time-range-long-term-storage-fee" integer
  , "商品サイズ" character varying(50)
  , "通貨" character varying(50)
  , "long-time-range-long-term-storage-fee" numeric(7, 2)
  , "qty-charged-short-time-range-long-term-storage-fee" integer
  , "short-time-range-long-term-storage-fee" numeric(7, 2)
  , "volume-unit" character varying(50)
  , "国" character varying(50)
  , "enrolled-in-small-and-light" character varying(50)
  , "店舗ID" character varying(20)
  , "登録日時" character varying(20)
  , "更新日時" character varying(20)
);
