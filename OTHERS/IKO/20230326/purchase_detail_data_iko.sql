delete from "TRN_�d������";

insert into "TRN_�d������"
SELECT
	T."�d��NO",
	T."SKU�ԍ�",
	T."ASIN�ԍ�",
to_number(T."�P��",'999999.99'),
to_number(T."����",'999999'),
to_number(T."���z",'999999.99'),

0,
 'Smart-Bear',
current_timestamp,
current_timestamp
FROM
	"ZZZ_�d������" T
	
;