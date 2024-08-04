drop table public."CON_操作キー";

create table public."CON_操作キー" (
    "連番" serial primary key
  , "区分" character varying(1)
  , "キー" character varying(3)
  , "結果" character varying(1)
  , "登録ID" character varying(20)
  , "更新ID" character varying(20)
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);