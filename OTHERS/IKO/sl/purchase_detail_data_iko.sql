delete from "TRN_�d������";

insert into "TRN_�d������"
select
T."�d��NO",
T."SKU�ԍ�",
T."ASIN�ԍ�",
T."���i�Ǘ��ԍ�",
T."�e�q�敪",
T."���i���",
T."���ނP",
T."���ނQ",
to_number(T."�P��",'999999.99'),
to_number(T."����",'999999'),
to_number(T."���z",'999999.99'),
 null,
 
'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_�d������" T;