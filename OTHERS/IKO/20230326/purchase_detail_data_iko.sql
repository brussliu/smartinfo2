delete from "TRN_仕入明細";

insert into "TRN_仕入明細"
SELECT
	T."仕入NO",
	T."SKU番号",
	T."ASIN番号",
to_number(T."単価",'999999.99'),
to_number(T."数量",'999999'),
to_number(T."金額",'999999.99'),

0,
 'Smart-Bear',
current_timestamp,
current_timestamp
FROM
	"ZZZ_仕入明細" T
	
;