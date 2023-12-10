drop table public."RES_商品別広告明細費用";

create table public."RES_商品別広告明細費用" (
    "年月" character varying(20)
  , "SKU番号" character varying(12)
  , "ASIN番号" character varying(20)
  , "ステータス" character varying(10)
  , "タイプ" character varying(10)
  , "スポンサープロダクト広告の利用資格" character varying(20)
  , "売上(JPY)" integer
  , "ROAS" numeric(10,2)
  , "コンバージョン率" numeric(10,4)
  , "インプレッション数" integer
  , "クリック数" integer
  , "クリック率(CTR)" numeric(10,4)
  , "広告費(JPY)" numeric(10,2)
  , "平均クリック単価(CPC)(JPY)" numeric(10,2)
  , "注文" integer
  , "ACOS" numeric(10,4)
  , "新規顧客の注文" integer
  , "新規顧客の注文比率" numeric(10,2)
  , "新規顧客の売上(JPY)" integer
  , "新規顧客の売上比率" numeric(10,2)
  , "ビューアブルインプレッション" integer
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
  , PRIMARY KEY ("年月", "SKU番号", "ASIN番号", "店舗ID")
);