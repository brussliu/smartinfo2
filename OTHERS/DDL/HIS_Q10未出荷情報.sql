drop table public."HIS_Q10未出荷情報";

create table public."HIS_Q10未出荷情報" (
    "配送状態" character varying(20)
  , "注文番号" character varying(50)
  , "カート番号" character varying(20)
  , "配送会社" character varying(50)
  , "送り状番号" character varying(50)
  , "発送日" character varying(50)
  , "発送予定日" character varying(50)
  , "商品名" character varying(500)
  , "数量" character varying(10)
  , "オプション情報" character varying(100)
  , "オプションコード" character varying(20)
  , "受取人名" character varying(50)
  , "販売者商品コード" character varying(10)
  , "外部広告" character varying(100)
  , "決済サイト" character varying(10)
  , "ギフト注文" character varying(10)
  , "購入者名" character varying(50)
  , "購入者電話番号" character varying(50)
  , "郵便番号" character varying(10)
  , "お届け先" character varying(500)
  , "電話番号" character varying(50)
  , "携帯電話" character varying(50)
  , "店舗ID" character varying(50)
  , "登録日時" character varying(50)
  , "更新日時" character varying(50)
);