delete from "TRN_仕入明細";

insert into "TRN_仕入明細"
SELECT
	T."仕入NO",
	T."SKU番号",
	T."ASIN番号",
	b."商品管理番号",
	b."親子区分",
	b."商品種別",
	b."分類１",
	b."分類２",
	
to_number(T."単価",'999999.99'),
to_number(T."数量",'999999'),
to_number(T."金額",'999999.99'),

b."暫定フラグ",
 'Smart-Bear',
current_timestamp,
current_timestamp
FROM
	"ZZZ_仕入明細" T LEFT JOIN "MST_出品マスタ情報" b 
	ON T."ASIN番号" = b."ASIN番号" 
	AND T."SKU番号" = b."SKU番号" 
	
;