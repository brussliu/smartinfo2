drop table public."MST_ユーザー情報";

create table public."MST_ユーザー情報" (
    "ユーザーID" character varying(20)
  , "パスワード" character varying(20)
  , "SmartID" character varying(20)
  , "店舗ID" character varying(20)
  , "ロール" character varying(20)
  , "廃止フラグ" character varying(1)
  , "使用開始日付" timestamp(6) without time zone
  , "使用終了日付" timestamp(6) without time zone
  , "登録日時" timestamp(6) without time zone
  , "更新日時" timestamp(6) without time zone
);