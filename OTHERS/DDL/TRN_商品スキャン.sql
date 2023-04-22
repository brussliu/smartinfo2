drop table public."TRN_商品スキャン";

create table public."TRN_商品スキャン" (
	"リストNO" character varying(20)
  , "リスト名称" character varying(50)
  , "ステータス" character varying(20)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone

  , PRIMARY KEY ("リストNO")
);