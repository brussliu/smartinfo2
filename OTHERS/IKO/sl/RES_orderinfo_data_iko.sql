delete from "RES_注文情報";

insert into "RES_注文情報"
select
T."Amazon注文番号",
T."SKU番号",
to_timestamp(T."注文日時",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."最終更新日時",'yyyy-MM-dd hh24:mi:ss'),
T."注文状態",
T."運営方",
T."配送レベル",
T."ASIN番号",
to_number(T."数量",'999999'),
T."通貨",

cast(T."価格" as decimal(10,2)::money,
cast(T."税金" as decimal(10,2)::money,
cast(T."配送料" as decimal(10,2)::money,
cast(T."配送料税金" as decimal(10,2)::money,
cast(T."ギフト料" as decimal(10,2)::money,
cast(T."ギフト料税金" as decimal(10,2)::money,
cast(T."販売割引" as decimal(10,2)::money,
cast(T."配送割引" as decimal(10,2)::money,
 
T."配送-市区町村",
T."配送-都道府県",
T."郵便番号",
T."配送国",
T."割引コメント",

null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,

T."配送-市区町村",
T."配送-都道府県",
T."郵便番号",
null,
null,
null,
null,
null,
null,
null,
null,

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_INPUT_注文情報" T;