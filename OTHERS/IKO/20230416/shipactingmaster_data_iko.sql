delete from "MST_��s�������i�}�X�^���";

insert into "MST_��s�������i�}�X�^���"
	(
	   "�Ǘ��ԍ�" 
	  , "���i����" 
	  , "���i��" 
	  , "���ނP" 
	  , "���ނQ" 
	  , "���i����_CN" 
	  , "���i����_JP" 
	  , "����" 

	  , "���l" 
	  , "PIC" 
	  , "�p�~�t���O" 
	  ,  "���L�ғX��ID"
	  , "�X��ID" 
	  , "�o�^����" 
	  , "�X�V����" 
		)
 SELECT 
	T."P_ID",
	T."DIV",
	T."NAME_CN",
	T."COLOR",
	T."SIZE",
	COALESCE(T."NAME_CN",'') || '/' || COALESCE(T."COLOR",'') || '/' || COALESCE(T."SIZE",'') ,
	T."NAME_JP",
	T."COUNT",
	
	T."BIKO",
	T."PIC",
	T."DEL_FLG",
	'zhixun',
	'Smart-Bear',
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP 
 FROM
	"ZZZ_MASTER_�������i�}�X�^���5" T ;
