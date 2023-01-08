drop table public."IPT_返送推奨情報";

create table public."IPT_返送推奨情報" (
  "日付" character varying(50)
  , "出品者SKU" character varying(50)
  , "FNSKU" character varying(50)
  , "ASIN" character varying(50)
  , "商品名" character varying(200)
  , "コンディション" character varying(50)
  , "販売可能な在庫の合計" character varying(50)
  , "保管日数271-365日の販売可能な在庫数" character varying(50)
  , "保管日数365日以上の販売可能な在庫数" character varying(50)
  , "販売可能商品を削除" character varying(50)
  , "販売不可在庫の合計" character varying(50)
  , "7日間が経過した出荷不可在庫" character varying(50)
  , "8-60日間が経過した出荷不可在庫" character varying(50)
  , "61-90日間が経過した出荷不可在庫" character varying(50)
  , "121～180日が経過した販売可能な在庫数" character varying(50)
  , "181～270日が経過した販売可能な在庫数" character varying(50)
  , "店舗ID" character varying(20)
  , "登録日時" character varying(20)
  , "更新日時" character varying(20)
);