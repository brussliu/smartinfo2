drop table public."MST_代行発送商品マスタ情報";

create table public."MST_代行発送商品マスタ情報" (
	"管理番号" serial primary key
  , "商品分類" character varying(50)
  , "商品名" character varying(50)
  , "分類１" character varying(50)
  , "分類２" character varying(50)
  , "商品名称_CN" character varying(100)
  , "商品名称_JP" character varying(50)
  , "数量" integer
  , "備考" character varying(500)
  , "PIC" character varying(99999)
  , "廃止フラグ" character varying(1)
  , "所有者店舗ID" character varying(20)
  , "店舗ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);