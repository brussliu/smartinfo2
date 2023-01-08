drop table public."IPT_返送所有権放棄依頼詳細情報";

create table public."IPT_返送所有権放棄依頼詳細情報" (
  "依頼日" character varying(50)
  , "依頼番号" character varying(50)
  , "依頼のタイプ" character varying(50)
  , "依頼のステータス" character varying(50)
  , "更新日" character varying(50)
  , "出品者SKU" character varying(50)
  , "FNSKU" character varying(50)
  , "商品のステータス" character varying(50)
  , "依頼した数" character varying(50)
  , "キャンセルした数" character varying(50)
  , "廃棄した数" character varying(50)
  , "発送した数" character varying(50)
  , "処理中の数" character varying(50)
  , "返送/廃棄手数料" character varying(50)
  , "通貨" character varying(50)
  , "店舗ID" character varying(20)
  , "登録日時" character varying(20)
  , "更新日時" character varying(20)
);