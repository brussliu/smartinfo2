delete from "TRN_�[�i�Ǘ�";

insert into "TRN_�[�i�Ǘ�"
select
T."�[�iNO",
T."�[�i����",
null,
to_number(T."�m�萔��",'999999'),
to_number(T."��̐���",'999999'),
to_number(T."�ŏI�[�i����",'999999'),

case 
	when T."�X�e�[�^�X" = '0�F�V�K�o�^' then '1.�V�@�K'
    when T."�X�e�[�^�X" = '2�F�[�i����' then '2.������'
	when T."�X�e�[�^�X" = '3�F�[�i���' then '3.��̒�'
	when T."�X�e�[�^�X" = '4�F�[�i����' then '4.�[�i��'
end ,

to_timestamp(T."�V�K�o�^��",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."������",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."��̓�",'yyyy-MM-dd hh24:mi:ss'),
to_timestamp(T."������",'yyyy-MM-dd hh24:mi:ss'),

T."AMZ-�[�i�ԍ�",
T."AMZ-�[�i��",
T."AMZ-�[�i�v�����ԍ�",
T."AMZ-�[�i��",
to_number(T."AMZ-SKU���v",'999999'),
to_number(T."AMZ-���i���v��",'999999'),

'Smart-Bear',
current_timestamp,
current_timestamp
from
"ZZZ_�[�i�Ǘ�" T;