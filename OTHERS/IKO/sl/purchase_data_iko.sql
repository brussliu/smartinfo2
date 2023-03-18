delete from "TRN_仕入管理";

insert into "TRN_仕入管理"
select
T."仕入NO",
T."仕入名称",
null,
to_number(T."受取数量",'999999'),
to_number(T."受取金額",'999999.99'),
 

case 
	when T."ステータス" = '0：新規登録' then '1.新　規'
    when T."ステータス" = '2：発送済み' then '2.発送済'
	when T."ステータス" = '4：受取済み' then '3.仕入済'
end ,

to_timestamp(T."新規登録日",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."発送日",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."到着日",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."受取日",'yyyy-MM-dd hh24:mi:ss'),

T."物流方式",
to_number(T."為替レート",'999999.99'),

to_number(T."商品費用",'999999.99'),
null,
to_number(T."物流費用",'999999.99'),
null,
to_number(T."税金円貨",'999999.99'),
null,
to_number(T."合計仕入費用",'999999.99'),
to_number(T."合計仕入費用円貨",'999999'),

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_仕入管理" T;