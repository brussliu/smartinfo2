delete from "TRN_�d������";

insert into "TRN_�d������"
SELECT
	T."�d��NO",
	T."SKU�ԍ�",
	T."ASIN�ԍ�",
	b."���i�Ǘ��ԍ�",
	b."�e�q�敪",
	b."���i���",
	b."���ނP",
	b."���ނQ",
	
to_number(T."�P��",'999999.99'),
to_number(T."����",'999999'),
to_number(T."���z",'999999.99'),

b."�b��t���O",
 'Smart-Bear',
current_timestamp,
current_timestamp
FROM
	"ZZZ_�d������" T LEFT JOIN "MST_�o�i�}�X�^���" b 
	ON T."ASIN�ԍ�" = b."ASIN�ԍ�" 
	AND T."SKU�ԍ�" = b."SKU�ԍ�" 
	
;