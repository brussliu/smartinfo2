delete from "RES_�������";

insert into "RES_�������"
select
T."Amazon�����ԍ�",
T."SKU�ԍ�",
to_timestamp(T."��������",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."�ŏI�X�V����",'yyyy-MM-dd hh24:mi:ss'),
T."�������",
T."�^�c��",
T."�z�����x��",
T."ASIN�ԍ�",
to_number(T."����",'999999'),
T."�ʉ�",

cast(T."���i" as decimal(10,2)::money,
cast(T."�ŋ�" as decimal(10,2)::money,
cast(T."�z����" as decimal(10,2)::money,
cast(T."�z�����ŋ�" as decimal(10,2)::money,
cast(T."�M�t�g��" as decimal(10,2)::money,
cast(T."�M�t�g���ŋ�" as decimal(10,2)::money,
cast(T."�̔�����" as decimal(10,2)::money,
cast(T."�z������" as decimal(10,2)::money,
 
T."�z��-�s�撬��",
T."�z��-�s���{��",
T."�X�֔ԍ�",
T."�z����",
T."�����R�����g",

null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,

T."�z��-�s�撬��",
T."�z��-�s���{��",
T."�X�֔ԍ�",
null,
null,
null,
null,
null,
null,
null,
null,

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_INPUT_�������" T;