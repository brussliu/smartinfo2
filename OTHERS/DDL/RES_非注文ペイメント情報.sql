drop table public."RES_非注文ペイメント情報";

create table public."RES_非注文ペイメント情報" (
    "日付/時間" timestamp(6) without time zone
  , "決済番号" character varying(50)
  , "トランザクションの種類" character varying(50)
  , "注文番号" character varying(50)
  , "SKU" character varying(12)
  , "説明" character varying(200)
  , "合計" money
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
