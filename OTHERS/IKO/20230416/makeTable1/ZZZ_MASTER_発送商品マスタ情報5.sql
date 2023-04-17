drop table public."ZZZ_MASTER_発送商品マスタ情報5";

create table public."ZZZ_MASTER_発送商品マスタ情報5" (
  "P_ID" serial primary key
  , "DIV" character varying(50) default NULL
  , "NAME_CN" character varying(50) default NULL
  , "NAME_JP" character varying(50) default NULL
  , "COLOR" character varying(50) default NULL
  , "SIZE" character varying(50) default NULL
  , "COUNT" integer
  , "BIKO" character varying(500) default NULL
  , "PIC" character varying(99999) default NULL
  , "DEL_FLG" character varying(1) default '0'
);
