delete from "TRN_düÇ";

insert into "TRN_düÇ"
select
T."düNO",
T."dü¼Ì",
'A:Êdü',
null,
to_number(T."óæÊ",'999999'),
to_number(T."óæàz",'999999.99'),
case 
	when T."Xe[^X" = '0FVKo^' then '1.V@K'
    when T."Xe[^X" = '2F­ÏÝ' then '2.­Ï'
	when T."Xe[^X" = '4FóæÏÝ' then '3.düÏ'
end ,

to_timestamp(T."VKo^ú",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."­ú",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."ú",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."óæú",'yyyy-MM-dd hh24:mi:ss'),

T."¨¬û®",
to_number(T."×Ö[g",'999999.99'),

to_number(T."¤iïp",'999999.99'),
to_number(T."¤iïp",'999999.99')/to_number(T."×Ö[g",'999999.99')*100,
to_number(T."¨¬ïp",'999999.99'),
to_number(T."¨¬ïp",'999999.99')/to_number(T."×Ö[g",'999999.99')*100,
to_number(T."Åà~Ý",'999999.99'),
to_number(T."Åà~Ý",'999999.99')/to_number(T."×Ö[g",'999999.99')*100,

to_number(T."vdüïp",'999999.99'),
to_number(T."vdüïp~Ý",'999999'),
null,
'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_düÇ" T;

update "TRN_düÇ" K
set "düàe" = F."no"
from 
(
SELECT distinct
        T."düNO", 
		string_agg(distinct A."¤iÇÔ", 'A' order by "¤iÇÔ" ) as no
	FROM
		"TRN_dü¾×" T,
		"MST_oi}X^îñ" A
	WHERE
		A."ASINÔ" = T."ASINÔ" 
		AND A."SKUÔ" = T."SKUÔ" 
		AND A."XÜID" = T."XÜID" 
		AND A."bètO" = T."bètO" 
group by T."düNO"
) F where F."düNO" = K."düNO";
