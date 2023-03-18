delete from "TRN_仕入明細";

insert into "TRN_仕入明細"
select
T."仕入NO",
T."SKU番号",
T."ASIN番号",
T."商品管理番号",
T."親子区分",
T."商品種別",
T."分類１",
T."分類２",
to_number(T."単価",'999999.99'),
to_number(T."数量",'999999'),
to_number(T."金額",'999999.99'),
 null,
 
'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_仕入明細" T;