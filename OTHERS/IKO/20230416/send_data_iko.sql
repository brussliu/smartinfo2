delete from "TRN_�������" where "�敪" = 'C.��s����';
insert into "TRN_�������"
	(
	   "Amazon�����ԍ�" 
	  , "Qoo10�����ԍ�" 
	  , "��s�����Ǘ��ԍ�" 
	  , "���s�����Ǘ��ԍ�" 

	  , "�󒍓���" 
	  , "�x������" 
	  , "�o�׊�������" 
	  , "��������" 

	  , "ASIN�ԍ�" 
	  , "SKU�ԍ�" 
	  , "���i�Ǘ��ԍ�" 
	  , "���i���" 
	  , "���ނP" 
	  , "���ނQ" 
	  , "���i����" 
	  , "�I�v�V�������e" 
	  , "����" 

	  , "�w���҃��[��" 
	  , "�w���Ҏ���" 
	  , "�w���ғd�b�ԍ�" 

	  , "���͂���-��" 
	  , "���͂���-�X�֔ԍ�" 
	  , "���͂���-�s���{��" 
	  , "���͂���-�s�撬��" 
	  , "���͂���-�Z��1" 
	  , "���͂���-�Z��2" 
	  , "���͂���-�Z��3" 
	  , "���͂���-�Z���S��" 
	  , "���͂���-���O" 
	  
	  , "��񐮔��t���O" 
	  , "�敪" 
	  , "�������@" 
	  , "�X�e�[�^�X" 
	  , "���l" 
	  , "�ǐՔԍ�" 
	  , "�������e" 
	  , "��������"
	  
	  , "�X��ID" 
	  , "�o�^����" 
	  , "�X�V����" 
		) 
 SELECT 
	NULL,
	NULL,
	T."NO",
	NULL,
	
	NULL,
	NULL,
	NULL,
	NULL,
	
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	(select "NAME_CN" from "ZZZ_MASTER_�������i�}�X�^���5" WHERE  "P_ID" = cast (T."SHIP_CONTENT" as int)),
	NULL,
	cast (T."SHIP_COUNT" as int),
	
	NULL,
	T."NAME",
	T."TEL",
	
	NULL,
	T."POST_NO",
	(select "�s���{��"  from "MST_�Z�����" where "�X�֔ԍ�" = T."POST_NO" ),
	(select "�s�撬��"  from "MST_�Z�����" where "�X�֔ԍ�" = T."POST_NO" ),
	T."ADDRESS1",
	T."ADDRESS2",
	T."ADDRESS3",
	NULL,
	T."NAME",
	
	'1',
	'C.��s����',
	case	 when T."SHIP_DIV" = 'C' then '01.�N���b�N�|�X�g'
			 when T."SHIP_DIV" = 'Y' then '03.�䂤�p�P�b�g'
			 when T."SHIP_DIV" = 'S' then '02.���ʕ�' end ,
	case 	when T."STATUS" = '0' then '1.������'
			when T."STATUS" = '5' then '1.������'
			when T."STATUS" = '8' then '2.������' end ,
	T."BIKO",
	T."TRACKING_NO",
	(select "NAME_JP" from "ZZZ_MASTER_�������i�}�X�^���5" WHERE  "P_ID" = cast (T."SHIP_CONTENT" as int)),
	NULL,

	'Smart-Bear',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_TEMP_�������" T
 where
	T."STATUS" in ('0','5','8');