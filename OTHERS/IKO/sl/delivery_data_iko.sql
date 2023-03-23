delete from "TRN_納品管理";

insert into "TRN_納品管理"
select
T."納品NO",
T."納品名称",
null,
to_number(T."確定数量",'999999'),
to_number(T."確定数量",'999999'),
to_number(T."受領数量",'999999'),
to_number(T."最終納品数量",'999999'),

case 
	when T."ステータス" = '0：新規登録' then '1.新　規'
    when T."ステータス" = '2：納品発送' then '2.発送済'
	when T."ステータス" = '3：納品受領' then '3.受領中'
	when T."ステータス" = '4：納品完了' then '4.納品済'
end ,

to_timestamp(T."新規登録日",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."発送日",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."受領日",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."完了日",'yyyy-MM-dd hh24:mi:ss'),

T."AMZ-納品番号",
T."AMZ-納品名",
T."AMZ-納品プラン番号",
T."AMZ-納品先",
to_number(T."AMZ-SKU合計",'999999'),
to_number(T."AMZ-商品合計数",'999999'),

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_納品管理" T;

update "TRN_納品管理" K
set "納品内容" = F."no"
from 
(
SELECT distinct
        T."納品NO", 
		string_agg(distinct A."商品管理番号", '、' order by "商品管理番号" ) as no
	FROM
		"TRN_納品明細" T,
		"MST_出品マスタ情報" A
	WHERE
		A."ASIN番号" = T."ASIN番号" 
		AND A."SKU番号" = T."SKU番号" 
		AND A."店舗ID" = T."店舗ID" 
group by T."納品NO"
) F where F."納品NO" = K."納品NO";