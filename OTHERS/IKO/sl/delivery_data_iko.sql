delete from "TRN_[iÇ";

insert into "TRN_[iÇ"
select
T."[iNO",
T."[i¼Ì",
null,
to_number(T."mèÊ",'999999'),
to_number(T."mèÊ",'999999'),
to_number(T."óÌÊ",'999999'),
to_number(T."ÅI[iÊ",'999999'),

case 
	when T."Xe[^X" = '0FVKo^' then '1.V@K'
    when T."Xe[^X" = '2F[i­' then '2.­Ï'
	when T."Xe[^X" = '3F[ióÌ' then '3.óÌ'
	when T."Xe[^X" = '4F[i®¹' then '4.[iÏ'
end ,

to_timestamp(T."VKo^ú",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."­ú",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."óÌú",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."®¹ú",'yyyy-MM-dd hh24:mi:ss'),

T."AMZ-[iÔ",
T."AMZ-[i¼",
T."AMZ-[ivÔ",
T."AMZ-[iæ",
to_number(T."AMZ-SKUv",'999999'),
to_number(T."AMZ-¤iv",'999999'),

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_[iÇ" T;

update "TRN_[iÇ" K
set "[iàe" = F."no"
from 
(
SELECT distinct
        T."[iNO", 
		string_agg(distinct A."¤iÇÔ", 'A' order by "¤iÇÔ" ) as no
	FROM
		"TRN_[i¾×" T,
		"MST_oi}X^îñ" A
	WHERE
		A."ASINÔ" = T."ASINÔ" 
		AND A."SKUÔ" = T."SKUÔ" 
		AND A."XÜID" = T."XÜID" 
group by T."[iNO"
) F where F."[iNO" = K."[iNO";