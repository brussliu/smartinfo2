drop table public."MST_代行発送情報";

create table public."MST_代行発送情報" (
    "管理番号" character varying(20)
  , "お届け先-郵便番号" character varying(20)
  , "お届け先-住所1" character varying(200)
  , "お届け先-住所2" character varying(200)
  , "お届け先-住所3" character varying(200)
  , "お届け先-名前" character varying(50)
  , "お届け先-電話番号" character varying(50)
  , "備考" character varying(500)
  , "商品管理番号" integer
  , "商品数量" integer
  , "発送方法" character varying(50)
  , "ステータス" character varying(20)
  , "追跡番号" character varying(20)
  , "支払状態" character varying(20)
  , "発送費用（円）" integer
  , "発送費用（元）" numeric(10,2)
  , "請求先店舗ID" character varying(20)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
