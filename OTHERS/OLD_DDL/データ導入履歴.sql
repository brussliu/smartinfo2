create table public."データ導入履歴" (
  "店舗名" character varying(20)
  , "データ種別" character varying(20)
  , "導入日時" timestamp(6) without time zone
  , "基準日時" character varying(20)
  , "導入件数" character varying(20)
);
