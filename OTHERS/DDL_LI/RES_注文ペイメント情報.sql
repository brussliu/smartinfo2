drop table public."RES_注文ペイメント情報";

create table public."RES_注文ペイメント情報" (
    "日付/時間" timestamp(6) without time zone
  , "決済番号" character varying(50)
  , "トランザクションの種類" character varying(50)
  , "注文番号" character varying(19)
  , "SKU" character varying(12)
  , "説明" character varying(200)
  , "数量" integer
  , "Amazon 出品サービス" character varying(50)
  , "フルフィルメント" character varying(50)
  , "市町村" character varying(50)
  , "都道府県" character varying(50)
  , "郵便番号" character varying(50)
  , "税金徴収型" character varying(50)
  , "商品売上" money
  , "商品の売上税" money
  , "配送料" money
  , "配送料の税金" money
  , "ギフト包装手数料" money
  , "ギフト包装クレジットの税金" money
  , "Amazonポイントの費用" money
  , "プロモーション割引額" money
  , "プロモーション割引の税金" money
  , "源泉徴収税を伴うマーケットプレイス" character varying(99)
  , "手数料" money
  , "FBA 手数料" money
  , "トランザクションに関するその他の手数" money
  , "その他" money
  , "合計" money
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);
