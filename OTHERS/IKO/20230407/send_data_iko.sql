delete from "TRN_�������";

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
	T."�����ԍ�",
	NULL,
	NULL,
	NULL,
	
	to_timestamp(T."��������",'yyyy-MM-dd hh24:mi:ss'),
	to_timestamp(T."�x������",'yyyy-MM-dd hh24:mi:ss'),
	case when T."��������" = '' then null else to_timestamp(T."��������",'yyyy-MM-dd hh24:mi:ss') end,
	case when T."�c�����" = '' then null else to_number(T."�c�����",'999999') end,
	
	n."ASIN�ԍ�",
	n."SKU�ԍ�",
	n."���i�Ǘ��ԍ�",
	n."���i���",
	n."���ނP",
	n."���ނQ",
	n."���i����",
	NULL,
	to_number(T."���i����",'999999'),
	T."�w���҃��[��",
	T."�w���Җ���",
	T."�w���ғd�b�ԍ�",
	
	T."���捑",
	T."����X�֔ԍ�" ,
	T."����s���{��",
	T."����Z���s",
	T."����Z���P",
	T."����Z���Q",
	T."����Z���R",
	T."����X�֔ԍ�" || ' ' ||T."����s���{��" || ' ' ||T."����Z���s" || ' ' ||T."����Z���P" || ' ' ||T."����Z���Q" || ' ' ||T."����Z���R" ,
	T."���於��",
	
	'1',
	'A.AmazonFBM',
	NULL,
	CASE WHEN T."�������" = '������' THEN '2.������' ELSE'1.������'  END,
	NULL,
	NULL,
	substr( N."���i���", 4 ),
	to_timestamp(T."��������",'yyyy-MM-dd hh24:mi:ss'),
	
	'Smart-Bear',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_INPUT_�������_AMAZON" T LEFT JOIN "MST_�o�i�}�X�^���" N ON N."SKU�ԍ�" = T."SKU�ԍ�";

 
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
	T."�����ԍ�",
	NULL,
	NULL,
	
	NULL,
	NULL,
	NULL,
	NULL,
	
	NULL,
	NULL,
	T."�̔��ҏ��i�R�[�h",
	NULL,
	NULL,
	NULL,
	T."���i��",
	NULL,
	cast (T."����" as int),
	
	NULL,
	T."�w���Җ�",
	T."�d�b�ԍ�",
	
	NULL,
	T."�X�֔ԍ�" ,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	T."���͂���",
	T."���l��",
	
	'1',
	'B.Qoo10����',
	NULL,
	CASE WHEN T."�������" = '������' THEN '2.������' ELSE'1.������'  END,
	NULL,
	NULL,
	NULL,
	to_timestamp(T."������",'yyyyMMdd'),
	'Smart-Bear',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_INPUT_�������_QOO10" T;