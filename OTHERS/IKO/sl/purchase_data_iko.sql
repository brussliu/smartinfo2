delete from "TRN_�d���Ǘ�";

insert into "TRN_�d���Ǘ�"
select
T."�d��NO",
T."�d������",
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
null,
to_number(T."������p",'999999.99'),
null,
to_number(T."�ŋ��~��",'999999.99'),
null,
to_number(T."���v�d����p",'999999.99'),
to_number(T."���v�d����p�~��",'999999'),

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_�d���Ǘ�" T;