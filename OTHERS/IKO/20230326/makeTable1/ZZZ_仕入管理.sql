drop table public."ZZZ_仕入管理";

create table public."ZZZ_仕入管理" (
  "店舗名" character varying(20)
  , "仕入NO" character varying(20)
  , "仕入名称" character varying(100)
  , "確定数量" character varying(10)
  , "確定金額" character varying(10)
  , "受取数量" character varying(10)
  , "受取金額" character varying(10)
  , "ステータス" character varying(20)
  , "新規登録日" character varying(20)
  , "仕入確定日" character varying(20)
  , "発送日" character varying(20)
  , "到着日" character varying(20)
  , "受取日" character varying(20)
  , "物流方式" character varying(40)
  , "為替レート" character varying(20)
  , "商品費用" character varying(20)
  , "物流費用" character varying(20)
  , "税金円貨" character varying(20)
  , "合計仕入費用" character varying(20)
  , "合計仕入費用円貨" character varying(20)
);
