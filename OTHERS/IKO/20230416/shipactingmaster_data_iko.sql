delete from "MST_ãs­¤i}X^îñ";

insert into "MST_ãs­¤i}X^îñ"
	(
	   "ÇÔ" 
	  , "¤iªÞ" 
	  , "¤i¼" 
	  , "ªÞP" 
	  , "ªÞQ" 
	  , "¤i¼Ì_CN" 
	  , "¤i¼Ì_JP" 
	  , "Ê" 

	  , "õl" 
	  , "PIC" 
	  , "p~tO" 
	  ,  "LÒXÜID"
	  , "XÜID" 
	  , "o^ú" 
	  , "XVú" 
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
	"ZZZ_MASTER_­¤i}X^îñ5" T ;
