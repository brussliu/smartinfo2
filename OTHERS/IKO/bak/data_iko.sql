delete from "MST_出品マスタ情報_BACKUP";

insert into "MST_出品マスタ情報_BACKUP"
select
current_timestamp,
T."SKU番号",
T."ASIN番号",
null,
T."商品管理番号",
T."商品種別",
T."商品分類",
T."色",
T."サイズ",
to_number(T."仕入価格",'999999.99'),
null,
null,
'0',
'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_NEW_出品マスタ情報" T;