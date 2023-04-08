drop table public."TRN_発送情報";

create table public."TRN_発送情報" (
    "orderno" serial primary key
  , "Amazon注文番号" character varying(50)
  , "Qoo10注文番号" character varying(50)
  , "代行発送管理番号" character varying(20)
  , "自行発送管理番号" character varying(20)

  , "受注日時" timestamp(6) without time zone
  , "支払日時" timestamp(6) without time zone
  , "出荷期限日時" timestamp(6) without time zone
  , "期限日数" integer

  , "ASIN番号" character varying(20)
  , "SKU番号" character varying(12)
  , "商品管理番号" character varying(20)
  , "商品種別" character varying(50)
  , "分類１" character varying(100)
  , "分類２" character varying(100)
  , "商品名称" character varying(500)
  , "オプション内容" character varying(200)
  , "数量" integer

  , "購入者メール" character varying(200)
  , "購入者氏名" character varying(50)
  , "購入者電話番号" character varying(50)

  , "お届け先-国" character varying(20)
  , "お届け先-郵便番号" character varying(20)
  , "お届け先-都道府県" character varying(50)
  , "お届け先-市区町村" character varying(50)
  , "お届け先-住所1" character varying(200)
  , "お届け先-住所2" character varying(200)
  , "お届け先-住所3" character varying(200)
  , "お届け先-住所全部" character varying(400)
  , "お届け先-名前" character varying(50)
  , "情報整備フラグ" character varying(1)

  , "区分" character varying(50)
  , "発送方法" character varying(50)
  , "ステータス" character varying(20)
  , "備考" character varying(400)
  , "追跡番号" character varying(20)
  , "発送内容" character varying(100)
  , "発送日時" timestamp(6) without time zone
  
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
