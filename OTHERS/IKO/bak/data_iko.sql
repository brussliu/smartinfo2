delete from "MST_�o�i�}�X�^���_BACKUP";

insert into "MST_�o�i�}�X�^���_BACKUP"
select
current_timestamp,
T."SKU�ԍ�",
T."ASIN�ԍ�",
null,
T."���i�Ǘ��ԍ�",
T."���i���",
T."���i����",
T."�F",
T."�T�C�Y",
to_number(T."�d�����i",'999999.99'),
null,
null,
'0',
'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_NEW_�o�i�}�X�^���" T;