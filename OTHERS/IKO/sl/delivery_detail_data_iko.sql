delete from "TRN_�[�i����";

insert into "TRN_�[�i����"
select
T."�[�iNO",
T."SKU�ԍ�",
T."ASIN�ԍ�",
to_number(T."����",'999999'),
to_number(T."��̐���",'999999'),

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_�[�i����" T;