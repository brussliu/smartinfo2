delete from "TRN_�d���Ǘ�";

insert into "TRN_�d���Ǘ�"
select
T."�d��NO",
T."�d������",
'A:���ʎd��',
null,
to_number(T."��搔��",'999999'),
to_number(T."�����z",'999999.99'),
case 
	when T."�X�e�[�^�X" = '0�F�V�K�o�^' then '1.�V�@�K'
    when T."�X�e�[�^�X" = '2�F�����ς�' then '2.������'
	when T."�X�e�[�^�X" = '4�F���ς�' then '3.�d����'
end ,

to_timestamp(T."�V�K�o�^��",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."������",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."������",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."����",'yyyy-MM-dd hh24:mi:ss'),

T."��������",
to_number(T."�בփ��[�g",'999999.99'),

to_number(T."���i��p",'999999.99'),
to_number(T."���i��p",'999999.99')/to_number(T."�בփ��[�g",'999999.99')*100,
to_number(T."������p",'999999.99'),
to_number(T."������p",'999999.99')/to_number(T."�בփ��[�g",'999999.99')*100,
to_number(T."�ŋ��~��",'999999.99'),
to_number(T."�ŋ��~��",'999999.99')/to_number(T."�בփ��[�g",'999999.99')*100,

to_number(T."���v�d����p",'999999.99'),
to_number(T."���v�d����p�~��",'999999'),
null,
'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_�d���Ǘ�" T;

update "TRN_�d���Ǘ�" K
set "�d�����e" = F."no"
from 
(
SELECT distinct
        T."�d��NO", 
		string_agg(distinct A."���i�Ǘ��ԍ�", '�A' order by "���i�Ǘ��ԍ�" ) as no
	FROM
		"TRN_�d������" T,
		"MST_�o�i�}�X�^���" A
	WHERE
		A."ASIN�ԍ�" = T."ASIN�ԍ�" 
		AND A."SKU�ԍ�" = T."SKU�ԍ�" 
		AND A."�X��ID" = T."�X��ID" 
		AND A."�b��t���O" = T."�b��t���O" 
group by T."�d��NO"
) F where F."�d��NO" = K."�d��NO";
