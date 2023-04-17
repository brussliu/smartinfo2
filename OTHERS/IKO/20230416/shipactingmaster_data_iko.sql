delete from "MST_代行発送商品マスタ情報";

insert into "MST_代行発送商品マスタ情報"
	(
	   "管理番号" 
	  , "商品分類" 
	  , "商品名" 
	  , "分類１" 
	  , "分類２" 
	  , "商品名称_CN" 
	  , "商品名称_JP" 
	  , "数量" 

	  , "備考" 
	  , "PIC" 
	  , "廃止フラグ" 
	  ,  "所有者店舗ID"
	  , "店舗ID" 
	  , "登録日時" 
	  , "更新日時" 
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
	"ZZZ_MASTER_発送商品マスタ情報5" T ;
