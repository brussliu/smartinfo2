delete from "MST_��s�������";

insert into "MST_��s�������"
	(
	   "�Ǘ��ԍ�" 
	  , "���͂���-�X�֔ԍ�" 
	  , "���͂���-�Z��1" 
	  , "���͂���-�Z��2" 
	  , "���͂���-�Z��3" 
	  , "���͂���-���O" 
	  , "���͂���-�d�b�ԍ�" 
	  , "���l" 

	  , "���i�Ǘ��ԍ�" 
	  , "���i����" 
	  , "�������@" 
	  , "�X�e�[�^�X" 
	  , "�ǐՔԍ�" 
	  , "�x�����" 
	  , "������p�i�~�j" 
	  , "������p�i���j" 
	  , "������X��ID" 
	  
	  , "�X��ID" 
	  , "�o�^����" 
	  , "�X�V����" 
		)
 SELECT 
	T."NO",
	T."POST_NO",
	T."ADDRESS1",
	T."ADDRESS2",
	T."ADDRESS3",
	T."NAME",
	T."TEL",
	T."BIKO",
	
	to_number(T."SHIP_CONTENT",'999999'),
	T."SHIP_COUNT",
	case	 when T."SHIP_DIV" = 'C' then '01.�N���b�N�|�X�g'
			 when T."SHIP_DIV" = 'Y' then '03.�䂤�p�P�b�g'
			 when T."SHIP_DIV" = 'S' then '02.���ʕ�' end ,
	case 	when T."STATUS" = '0' then '1.�V�@�K'
			when T."STATUS" = '5' then '2.�����'
			when T."STATUS" = '8' then '3.������' end ,
	T."TRACKING_NO",
	case 	when T."PAY_STATUS" = '1' then '2.�x����'
			else  '1.���x��' end ,
	T."FEE",
	T."AMOUNT",
	'Smart-Bear',
	'zhixun',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_TEMP_�������" T 
 WHERE
	T."STATUS" in ('0','5','8');
