create table public."RES_注文情報" (
  "Amazon注文番号" character varying(19)
  , "SKU番号" character varying(12)
  , "ORDER_最終更新日時" timestamp(6) without time zone
  , "ORDER_注文ステータス" character varying(50)
  , "ORDER_出荷方式" character varying(50)
  , "ORDER_配送方式" character varying(50)
  , "ORDER_ASIN番号" character varying(50)
  , "ORDER_数量" integer
  , "ORDER_通貨" character varying(6)
  , "ORDER_価格" money
  , "ORDER_税金" money
  , "ORDER_配送料" money
  , "ORDER_配送料税金" money
  , "ORDER_包装料" money
  , "ORDER_包装料税金" money
  , "ORDER_注文プロモーション用割引額" money
  , "ORDER_配送プロモーション用割引額" money
  , "ORDER_配送住所-市区町村" character varying(50)
  , "ORDER_配送住所-都道府県" character varying(50)
  , "ORDER_配送住所-郵便番号" character varying(50)
  , "ORDER_配送住所-国" character varying(50)
  , "ORDER_プロモーション内容" character varying(200)
  , "PAYMENT_日付/時間" timestamp(6) without time zone
  , "PAYMENT_決済番号" character varying(50)
  , "PAYMENT_トランザクションの種類" character varying(50)
  , "PAYMENT_説明" character varying(200)
  , "PAYMENT_数量" integer
  , "PAYMENT_Amazon 出品サービス" character varying(50)
  , "PAYMENT_フルフィルメント" character varying(50)
  , "PAYMENT_市町村" character varying(50)
  , "PAYMENT_都道府県" character varying(50)
  , "PAYMENT_郵便番号" character varying(50)
  , "PAYMENT_税金徴収型" character varying(50)
  , "PAYMENT_商品売上" money
  , "PAYMENT_商品の売上税" money
  , "PAYMENT_配送料" money
  , "PAYMENT_配送料の税金" money
  , "PAYMENT_ギフト包装手数料" money
  , "PAYMENT_ギフト包装クレジットの税金" money
  , "PAYMENT_Amazonポイントの費用" money
  , "PAYMENT_プロモーション割引額" money
  , "PAYMENT_プロモーション割引の税金" money
  , "PAYMENT_源泉徴収税を伴うマーケットプレイス" character varying(99)
  , "PAYMENT_手数料" money
  , "PAYMENT_FBA 手数料" money
  , "PAYMENT_トランザクションに関するその他の手数" money
  , "PAYMENT_その他" money
  , "PAYMENT_合計" money
  , "SHIP_注文受付日" timestamp(6) without time zone
  , "SHIP_支払日" timestamp(6) without time zone
  , "SHIP_発送日" timestamp(6) without time zone
  , "SHIP_配送サービスレベル" character varying(50)
  , "SHIP_受取人" character varying(50)
  , "SHIP_お届け先1" character varying(50)
  , "SHIP_お届け先2" character varying(50)
  , "SHIP_お届け先3" character varying(50)
  , "SHIP_市区町村" character varying(50)
  , "SHIP_都道府県" character varying(50)
  , "SHIP_発送先郵便番号" character varying(50)
  , "SHIP_国" character varying(50)
  , "SHIP_お届け先電話番号" character varying(50)
  , "SHIP_請求先の住所1" character varying(50)
  , "SHIP_請求先の住所2" character varying(50)
  , "SHIP_請求先の住所3" character varying(50)
  , "SHIP_請求先の市区町村" character varying(50)
  , "SHIP_請求先の都道府県" character varying(50)
  , "SHIP_請求先の郵便番号" character varying(50)
  , "SHIP_請求先の国" character varying(50)
  , "SHIP_配送業者" character varying(50)
  , "SHIP_問い合わせ番号" character varying(50)
  , "SHIP_配送予定日" timestamp(6) without time zone
  , "SHIP_FC" character varying(50)
  , "SHIP_出荷経路" character varying(50)
  , "SHIP_販売経路" character varying(50)
  , "SHIP_出荷日" timestamp(6) without time zone
);