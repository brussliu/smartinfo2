drop table public."TRN_商品スキャン明細";

create table public."TRN_商品スキャン明細" (
	"リストNO" character varying(20)
  , "LABEL番号" character varying(50)
  , "数量" integer
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);