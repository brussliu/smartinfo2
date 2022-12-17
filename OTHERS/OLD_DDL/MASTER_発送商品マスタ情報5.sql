create table public."MASTER_発送商品マスタ情報5" (
  "P_ID" smallint default nextval('"MASTER_発送商品マスタ情報5_P_ID_seq"'::regclass) not null
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
